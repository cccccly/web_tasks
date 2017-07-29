'''
Created on 2017年7月7日

@author: 91934
'''


import urllib.request

class HtmlDownloader(object):#下载网页内容
    def download(self,url):
        if url is None:
            return None

        response=urllib.request.urlopen(url)

        if response.getcode()!=200:#判断是否请求成功
            return None
        
        return response.read()