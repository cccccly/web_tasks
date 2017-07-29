'''
Created on 2017年7月7日

@author: 91934
'''
from baike_spider import url_manager, html_downloader, html_parser,\
    html_outputer


class SpiderMain(object):
    def __init__(self):             #构造函数初始化各个对象
        self.urls=url_manager.UrlManager()
        self.downloader=html_downloader.HtmlDownloader()
        self.parser=html_parser.HtmlParser()
        self.outputer=html_outputer.HtmlOutputer()
        
        
    def craw(self, root_url):
        count = 1
       
        self.urls.add_new_url(root_url)          #将入口URL添加到URL管理器
        while self.urls.has_new_url():           #如果有待爬取的URL
            try:
                new_url=self.urls.get_new_url()          #取出一个
                print ('craw %d:%s' %(count,new_url))         
                html_cont=self.downloader.download(new_url) #下载页面
                new_urls,new_data=self.parser.parse(new_url,html_cont)      #解析
                self.urls.add_new_urls(new_urls)
                self.outputer.collect_data(new_data)  #收集数据
                count = count + 1
                print(count)
                if count == 1000:                    #控制循环次数 来控制所爬取的数量
                    break
            except:
                print('craw failed')
        self.outputer.output_html()
if __name__=="__main__":
    root_url = "http://baike.baidu.com/item/Python" #设置入口
    obj_spider = SpiderMain()
    obj_spider.craw(root_url) #启动爬虫
    