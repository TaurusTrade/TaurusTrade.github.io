## vnpy

```
@dataclass
class TickData(BaseData):
    """
    Tick data contains information about:
        * last trade in market
        * orderbook snapshot
        * intraday market statistics.
    """

    symbol: str
    exchange: Exchange
    datetime: datetime

    name: str = ""
    volume: float = 0
    open_interest: float = 0
    last_price: float = 0
    last_volume: float = 0
    limit_up: float = 0
    limit_down: float = 0

    open_price: float = 0
    high_price: float = 0
    low_price: float = 0
    pre_close: float = 0
    pre_settlement: float = 0

    bid_price_1: float = 0
    bid_price_2: float = 0
    bid_price_3: float = 0
    bid_price_4: float = 0
    bid_price_5: float = 0

    ask_price_1: float = 0
    ask_price_2: float = 0
    ask_price_3: float = 0
    ask_price_4: float = 0
    ask_price_5: float = 0

    bid_volume_1: float = 0
    bid_volume_2: float = 0
    bid_volume_3: float = 0
    bid_volume_4: float = 0
    bid_volume_5: float = 0

    ask_volume_1: float = 0
    ask_volume_2: float = 0
    ask_volume_3: float = 0
    ask_volume_4: float = 0
    ask_volume_5: float = 0

    WAP: float = 0

    def __post_init__(self):
        """"""
        self.vt_symbol = f"{self.symbol}.{self.exchange.value}"

```

## 根网

```
classCTSlib.ApiStruct.MsgSubQuoteReturn
Bases: object

quotaInfo 行情信息

Fieldmembers:	
exchId : 市场
stkId : 证券代码
newPrice : 最新价
highPrice : 今日最高价
lowPrice : 今日最低价
closePrice : 昨收盘
buy : 买盘价
buyAmt : 买盘量
sell : 卖盘价
sellAmt : 卖盘量
referencePrice : 参考价格
openPosition : 持仓量
exchTotalKnockQty : 成交量
exchTotalKnockAmt : 成交金额
lastModifyTime : 行情时间
```

## 金证

- 普通接口

```
/** 输出普通成交行情数据 */
struct STK_NQ_TICK
{
  char szStkCode[8 + 1];    //!< 证券代码    fengwc alter 1.18 证券代码长度要统一       
  char szStkName[16 + 1];       //!< 证券简称           
  int nDate;                //!< 行情日期           
  int nTime;                //!< 行情时间           
  short nStatus;            //!< 行情状态
  int nSvrTime;             //!< 转发时间        fengwc alter 1.18 增加转发时间
  double dClosePrice;       //!< 昨日收盘转让价     
  double dRClosePrice;      //!< 昨日实际收盘转让价 
  double dOpenPrice;        //!< 今日开盘转让价     
  double dLastPrice;        //!< 最近转让价         
  double dHighPrice;        //!< 最高成交价         
  double dLowPrice;         //!< 最低成交价         
  long long llMatchedVol;   //!< 成交数量           
  double dMatchedMoney;     //!< 成交金额           
  long long llMatchedNum;   //!< 成交笔数           
  double dPeRatio[2];       //!< 市盈率1、2                      
  double dPriceRise[2];     //!< 价格升跌1、2          
  long long llStkVolume;    //!< 合约持仓量
  double dNQDishPri[2][5];  //!< 普通行情买卖五档价格：0-买；1-卖
  int nNQDishVol[2][5];     //!< 普通行情买卖五档数量：0-买；1-卖
  int nRemitFlag;           //!< 豁免状态
};

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

- 收费版接口

```
//L3015200返回内容
struct ST_NQInfo_Codes
{
  char szStkCode[8 + 1];    //!< 证券代码           
  char szStkName[16];       //!< 证券简称           
  int nDate;                //!< 行情日期           
  int nTime;                //!< 行情时间           
  short nStatus;            //!< 行情状态
  int nSvrTime;             //!< 转发时间
  double dClosePrice;       //!< 昨日收盘转让价     
  double dRClosePrice;      //!< 昨日实际收盘转让价
  double dOpenPrice;        //!< 今日开盘转让价     
  double dLastPrice;        //!< 最近转让价         
  double dHighPrice;        //!< 最高成交价         
  double dLowPrice;         //!< 最低成交价   
  long long llMatchedVol;   //!< 成交数量           
  double dMatchedMoney;     //!< 成交金额           
  long long llMatchedNum;   //!< 成交笔数           
  double dPeRatio[2];       //!< 市盈率1、2                      
  double dPriceRise[2];     //!< 价格升跌1、2          
  long long llStkVolume;    //!< 合约持仓量
  double dNQDishPri[2][5];  //!< 普通行情买卖五档价格：0-买；1-卖
  int nNQDishVol[2][5];     //!< 普通行情买卖五档数量：0-买；1-卖

  __int64 llStkAvl;         //!< 证券可用数量
  double dMktVal;           //!< 市值
  double dStkIncome;        //!< 今日实际盈亏金额
  double dStkIncomePre;     //!< 昨日实际盈亏金额
  double dStkBcostRlt;      //!< 证券买入成本（实时）
  __int64 llStkTrdBln;      //!< 证券交易轧差数量
  int nStkHmBiz;            //!< 证券豁免状态
  __int64 llStkBln;         //!< 证券余额
  double dBidAvgPrice;      //!< 当日买入均价
  double dAskAvgPrice;      //!< 当日卖出均价
  int nBidVol;              //!< 当日买入数量
  int nAskVol;              //!< 当日卖出数量
  char chStkCls[1 + 1];     //!< 证券类别
};
//L3015201返回内容
struct ST_ZSInfo_Codes
{
  char szStkCode[8 + 1];
  char szWtTime[10 + 1];
  double dMM_BP[10];      //!< 做市买价
  int nMM_BV[10];         //!< 做市买量
  double dMM_SP[10];      //!< 做市卖价
  int nMM_SV[10];         //!< 做市卖量
  double dST_BP[10];      //!< 投资买价
  int nST_BV[10];         //!< 投资买量
  double dST_SP[10];      //!< 投资卖价
  int nST_SV[10];         //!< 投资卖量
};

```