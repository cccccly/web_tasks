'''
Created on 2017年7月7日

@author: 91934
'''


class UrlManager(object):
    def __init__(self):#初始化
        self.new_urls=set()
        self.old_urls=set()

    #向URL管理器中添加一个新的URL
    def add_new_url(self,url):
        if url is None:
            return
        if url not in self.new_urls and url not in self.old_urls :
            self.new_urls.add(url)
    
    #向URL管理器中批量添加新的URL
    def add_new_urls(self,urls):
        if urls is None or len(urls)==0:
            return
        for url in urls:
            self.add_new_url(url)#调用单条添加方法
    
    #判断URL管理器中是否有新的待爬取的URL
    def has_new_url(self):
        return len(self.new_urls)!=0
    
    
    #从URL管理器中获取一个新的带爬取的URL
    def get_new_url(self):
        new_url=self.new_urls.pop()#返回一个URL并从中移除这条URL
        self.old_urls.add(new_url)#添加到 self.old_urls中 
        return new_url
    
    
    
    



