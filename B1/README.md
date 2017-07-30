# web开发 B1

## 任务要求
  - [任务链接](https://github.com/pujiaxun/web_2017/blob/master/back-end/1.md)

## 完成情况
  - 实现了留言的 添加 删除 查询的基本功能

## 心得体会
  - 初步了解了在一个网页中数据如何传输，然后在服务器段进行一些简单的判断以及操作

## 问题和解决方案 [issue1](https://github.com/cccccly/web_tasks/issues/1)
  - 在用户删除时 通过在路由中设置一个 @find 变量用来表示是否能在总留言中找到用户输入的ID
  返回true或false 然后在delete模板中修改成了两种分支 以显示是否找到该留言并能正确删除
  - 莫名其妙的代码已经删除…………
  - 将功能类单独放入一个源文件 operation.rb 以方便管理
  - 不用 to_i 将 储存的ID用 to_s 转换成字符串比较 避免用户输入非数字出现可能的错误
  - [代码风格](https://github.com/JuanitoFatas/ruby-style-guide/blob/master/README-zhCN.md)
