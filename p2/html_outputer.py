'''
Created on 2017年7月7日

@author: 91934
'''


class HtmlOutputer(object):
    def __init__(self):
        self.datas=[]#列表
    
    #收集数据
    def collect_data(self,data):
        if data is None:
            return
        self.datas.append(data)
    
    #输出HTML内容
    def output_html(self):
        fout=open('output.html','w')#输出到output.html中,w为写模式
    
        fout.write("<html>")
        fout.write("<body>")
        fout.write("<table>")
        
        #ASCI
        for data in self.datas:
            fout.write("<tr>")
            fout.write("<td>s%</td>" % data["url"])
            fout.write("<td>s%</td>" % data["title"].encode("UTF-8"))
            fout.write("<td>s%</td>" % data["summary"].encode("UTF-8"))
            fout.write("</tr>")
        
        
        fout.write("</table>")
        fout.write("</body>")
        fout.write("</html>")



