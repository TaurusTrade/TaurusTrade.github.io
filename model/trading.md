```uml
[include](trading.uml)
```

All security fit for general trading rules by default. but it can be aditionally add one or many other specific rules.

There can be various trading rules that are up to difenent purpose. For example, 
a _Normal_ trading is used for general transaction, while ETF market-making means you are 
a maket-maker for ETFs, and, NEEQ market-making fits the rules of NEEQ.

When connect to a gateway, it may notice which trading rules should every securities use.

Then the platform will bind securities to specific tradeing rule. If gateway doesn't give 
out such information, every securities are binded to Normal trading by default, 
but trader can specify another rule to every securities, and its individual parameters under 
this rule.


As for implementation, a trading rule includes a series of view-models, services, etc.


## 金证

- 获取投资组合和交易规则

```
[函数原型]
/**
	* 获取可操作股票
	* @param[out] pCodeInfo 可操作的股票信息[这部分内存由系统回收，请勿删除]
	* @param[out] nCodeItems 可操作股票数量
	* @return 获取可操作股票成功或失败
	*/
	int InitAlgo(ASSET_CODE ** pCodeInfo, int &nCodeItems);[参数]
无
[返回值]
所有可操作股票详情
操作股票详情结构体说明
结构体成员	含义	说明
nProjectID	项目ID	
nAssetID	资产单元ID	
szAssetName	资产单元名称	
nCombiID	组合ID	
szCombiName	组合名称	
chCodeBizAction	股票类型	参考第一章的ASSET_CODE. chCodeBizAction定义
szStkCode	证券代码	
chStkEx	证券交易所	参考第一章的ASSET_CODE. chStkEx定义
szStkBd	证券板块	参考第一章的ASSET_CODE.szStkBd定义
szStkName	证券名称	
[示例]
m_pLBMPlugin->InitAlgo(&m_pCodeInfo, m_nCodeItems);

```