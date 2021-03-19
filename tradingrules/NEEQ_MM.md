## 特殊行情

```
/** 输出做市十档行情数据 */
struct STK_NQ_ZSXX
{
  char szStkCode[8 + 1];      //!< 证券代码    fengwc alter 1.18 证券代码长度要统一        
  char szStkName[16];         //!< 证券简称           
  double dMMDishPri[2][10];   //!< 行情做市买卖十档价格：0-买；1-卖
  int nMMDishVol[2][10];      //!< 行情做市买卖十档数量：0-买；1-卖
  double dMDDishPri[2][10];   //!< 行情投资买卖十档价格：0-买；1-卖
  int nMDDishVol[2][10];      //!< 行情投资买卖十档数量：0-买；1-卖
  int nMMDishNum[2];          //!< 做市行情档数：0-买档数；1-卖档数
  int nMDDishNum[2];          //!< 投资行情档数：0-买档数；1-卖档数
  char cMMDataType[2];        //!< 做市数据类型：0-档位；1-笔数
  char szWtTime[10 + 1];      //!< 行情时间
};
```


## 规则信息

- 证券信息查询（同步)  `int GetStkInfo(const char* szCodes, STK_INFO_S* pstStkInfo, int* iCount, int iDataType = 0)`

```
/** 证券信息出参 */
struct STK_INFO_S
{
  int iIntOrg;                                 //内部机构
  char szStkbd[LEN_STKBD];                                //市场类别
  char szStkCode[LEN_STK_CODE];                              //证券代码
  char szStkName[LEN_STK_NAME];                              //证券名称
  char  chCodeBizAction;                        //交易类别
  char chStopFlag;                             //停牌标志
  int iEachLmt;                              //每笔限量
  int iMinWtVol;                             //最小申报数量
  int iBuyVolSize;                           //最小买单位
  int iSellVolSize;                          //最小卖单位
  double dPriceDish;                            //价格档位
  int iMmMaxSpread;                          //报价买卖最大价差
  double dClosePrice;                           //昨收盘价
  double dStkUpLmtPrice;                        //涨停价
  double dStkLwLmtPrice;                        //跌停价
  long long llCirculation;                          //总股本
  long long llFloatNum;                             //流通股本
  char chStkHmBiz;                             //豁免信息
  int iMmNum;                                //做市商数量
  char chCqcxFlag;                             //除权除息标志
  char szLevelType[LEN_LVL_TYPE];                            //分层信息
};
```

- 获取持仓表股票信息(异步) 收费版  `int GetAssetShare(int nAssetID, char *pCode)`

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
