5.1概要:资产管理系统中，账户体系分账户，资产单元，组合三层，结构如下:

账户表示一个产品或一个基金，

资产单元关联一个资金账号,用于资金和资产管理，根据不同的投资目的，

在资产单元下划分不同的组合，用于管理不同的持仓。

```
AssetUnit -- Account(Capital)
AssetUnit -- Asset (Position)
AssetUnit *-- Portfolio *-- Asset (Position)
资产单元，投资组合，资产

AssetUnit *-- Portfolio *-- TradeRule ( of Security )

同一个证券，在不同的投资组合中可能有不同的交易目的/规则



TradingRule 1---* Security 
Project 1--* AssetUnit 1--* Portfolio 1--* Security
```

## 金证



Portfilo?
交易类型/交易目的

```
ASSET_CODE. chCodeBizAction(股票交易类型)
字典项代码	字典项名称	字典项说明
0	股转协议申报	协议投资股票
1	股转做市申报	做市商做市股票
2	限价申报	非做市商做市股票
3	新股到账	
4	异常	
5	退市 	
6	集合竞价	
7	集合竞价+连续竞价	
8	公开发行	
9	精算层做市	

```

- 获取可操作股票（同步） `int InitAlgo(ASSET_CODE ** pCodeInfo, int &nCodeItems)`

```
/** 输出所属股票数据 */
struct ASSET_CODE
{
  int nProjectID;               //!< 项目ID
  int nAssetID;                 //!< 资产单元ID
  int nEachLmt;                 //!< 单笔限量  fengwc 0121 alter
  int nBuyVolSize;              //!< 买数量单位
  int nSellVolSize;             //!< 卖数量单位
  char szAssetName[64 + 1];     //!< 资产单元名称
  int nCombiID;                 //!< 组合ID
  char szCombiName[64 + 1];     //!< 组合名称
  char chCodeBizAction[2 + 1];  //!< 股票类型
  char szStkCode[8 + 1];        //!< 证券代码
  char chStkEx[1 + 1];          //!< 证券交易所
  char szStkBd[2 + 1];          //!< 证券板块
  char szStkName[16 + 1];       //!< 证券名称
  int nMinWtVol;                //!< 最小申报数量
  double dPriceDish;            //!< 价格档位
  int iCheckOem;                //!< OEM标志
};
```


- 收费版,获取持仓表股票信息 `int GetAssetShare(int nAssetID, char *pCode)`

```


//L3014026返回内容
struct ST_AssetShareInfo
{
  int nAssetID;                 //!< 资产单元ID
  char szAssetName[64 + 1];     //!< 资产单元名称
  char szStkCode[8 + 1];        //!< 证券代码
  char szStkName[16 + 1];       //!< 证券名称
  char szStkBd[2 + 1];          //!< 交易板块
  char chCodeBizAction[2 + 1];  //!< 股票类型
  long long llMM_Num;           //!< 做市商数量
  long long llCirculation;      //!< 总发行量
  long long llFloatNum;         //!< 流通股数
                                
  char chTurnStatus[1 + 1];     //!< 转让状态
  double dStkUplmtPrice;        //!< 涨停价
  double dStkLwlmtPrice;        //!< 跌停价

  long long llEachLmt;          //!< 每笔报价限量
  long long llBuyVolSize;       //!< 买数量单位
  long long llSellVolSize;      //!< 卖数量单位
  long long llMmMaxSpread;      //!< 股转做市报价买卖最大价差(%)
  long long llMinWtVol;         //!< 股转做市报价最小委托数量
  double dPriceDish;            //!< 最小价格单位(NQ_INFO.PRICE_DISH*MM_MIN_PRICE_UNIT)
  long long llQuoteValidVol;    //!< 股转做市报价有效挂单量
  int iCheckOem;                //!< OEM标志

};
```