一.确定目标
	1.确定爬取的目标为百度百科Python词条页面以及它相关的词条页面的标题和简介
二.分析目标
	1.URL格式 用来限定抓取的范围 以求资源利用率
	2.数据格式 分析每个词条页面中标题和简介这两个数据所在的格式
	3.页面的编码 分析正确的编码以正常解析
三.编写代码
	1.使用前面的分析结果
四.执行爬虫
	1.执行写好的爬虫 观察效果

********************************************************************************

对分析目标具体记录
	1.目标：百度百科Python词条页面以及它相关的词条页面的标题和简介
	2.入口页：http://baike.baidu.com/item/Python
	3.URL：/item/sdsd
	4.数据格式：
		标签：lemmaWgt-lemmaTitle-title
		简介：lemma-summary
	5.编码：UTF-8