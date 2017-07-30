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
end
