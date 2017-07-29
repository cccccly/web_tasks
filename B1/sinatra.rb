require 'sinatra'

class Message
  attr_accessor :Mes_id            #记录id
  attr_accessor :Mes_text          #记录文本
  attr_accessor :Mes_author        #记录作者
  attr_accessor :Mes_time          #记录时间
  def initialize
    if $store.length == 0
      @Mes_id = 1
    else
      @Mes_id = $store.at(0).Mes_id + 1
    end
  end
end

class Operation
  def add(text , author)
    time = Time.new
    mes = Message.new
    mes.Mes_text = text
    mes.Mes_author = author
    mes.Mes_time = time.strftime("%Y-%m-%d %H:%M:%S")
    $store.unshift(mes)
    return mes.Mes_id
  end

  def delete(id)
    $store.delete_if{|e| e.Mes_id == id}
    $del_num += 1
  end
  def search

  end
end

time = Time.new
$store = Array.new                      #储存全部留言
m1 = Message.new
m1.Mes_id = 1
m1.Mes_text = "i see"
m1.Mes_author = "god"
m1.Mes_time = time.strftime("%Y-%m-%d %H:%M:%S")
$store.push(m1)
$del_num = 0
$search_1 = Array.new                    #储存筛选作者后的记录数组
$search_2 = Message.new                  #储存筛选ID后的记录



get'/'do
  if params['Ser_id'] =="" && params['Ser_author'] == ""  #查询所有
    @info = "无搜索条件 查寻所有"
    @messages = $store
    @search_1 = $store
    erb :index
  elsif params['Ser_author'] == ""                        #按ID查询
    @info = ""
    @search_1 = Array.new
    $store.each do |c|
      if c.Mes_id == params['Ser_id'].to_i
        @search_1.push(c)
      end
    end
    @messages = $store
    erb :index
  elsif params['Ser_id'] == ""                            #按author查询
    @search_1 = Array.new
    $store.each do |c|
      if c.Mes_author == params['Ser_author']
        @search_1.push(c)
      end
    end
    @messages = $store
    erb :index
  else
    @search_1 = 1
    @messages = $store
    erb :index
  end
end

post '/add' do                                                       #增加留言
  if params['Mes_text'].length < 10 || params['Mes_author'] == ""
    @tip = "输入内容不少于10字，作者不能为空."
    erb :error
  else
    operation = Operation.new
    operation.add(params['Mes_text'],params['Mes_author'])
    @messages = $store
    @del_info = "删除成功 已删除#{$del_num}条留言"
    redirect to('/')
  end
end

get '/delete/:id' do                                            #不能大写…………
  operation = Operation.new
  operation.delete(params['id'].to_i)
  erb :delete
end
