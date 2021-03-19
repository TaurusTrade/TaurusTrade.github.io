

# 证券类型

## 恒生

```
stock_type	证券类型
'01'	股票
'02'	封闭式基金
'03'	国债
'04'	企债
'05'	可转债
'06'	政策性金融债
'08'	债券回购
'09'	股票回购
'0a'	申购
'0A'	企债标准券
'0b'	申购款
'0B'	债转股
'0c'	配号
'0C'	配债
'0D'	央行票据
'0d'	增发
'0e'	增发款
'0E'	存款
'0f'	配售
'0F'	开放式基金
'0g'	关联配售
'0G'	非政策性金融债
'0h'	配股
'0H'	通用配售权证
'0i'	关联配股
'0I'	买断式回购
'0J'	投票
'0j'	债券承销
'0k'	债券申购
'0K'	次级债
'0l'	债券申购款
'0L'	次级债务
'0M'	认购权证
'0m'	类信托
'0N'	认沽权证
'0n'	债券增发
'0o'	债券增发款
'0O'	认购行权
'0P'	认沽行权
'0p'	指定登记
'0q'	撤销指定
'0Q'	债券质押
'0r'	回购登记
'0R'	股指期货
'0S'	公司债
'0s'	回购撤销
'0T'	地方债
'0t'	利率互换
'0U'	理财产品
'0V'	存托凭证
'0v'	商品期货
'0W'	国债期货
'0w'	指数
'0x'	国债标准券
'0X'	项目投资
'0Y'	现金
'0y'	债回售
'0Z'	债券认购
'0z'	信用拆借
'0?'	债券ETF质押
'0='	占用
'0|'	占用
'0～'	占用
'0['	信托计划
'0]'	债券预发行
'0('	认购期权
'0)'	认沽期权
'0{'	优先股
'0}'	优先股回售
'0<'	优先股转股
'11'	供股权
'12'	配售权
'13'	股票红利选择权
'14'	公司收购
'15'	供股权益
'16'	配售权益
'0!'	其他
'0+'	债券借贷
'23'	存托凭证申购
'24'	存托凭证配号
'25'	存托凭证配股
'26'	存托凭证投票


```

## 金证

```
STK_NQINFO. chStkCls(证券类别)
字典项代码	字典项名称	字典项说明
A	股票	
B	基金	
C	投资基金	
D	ETF基金	
E	LOF基金	
F	报价回购	
G	权证	
H	国债	
I	实物国债	
J	企业债券	
K	实物企债	
L	转换债券	
M	公司债	
N	报价转让证券	
O	国债回购	
P	企债回购	
Q	买断回购	
R	质押回购	
U	个股期权	
S	企债质押	
T	标准券	
V	股票(三板美)	
W	指数统计	
X	议案投票	
Y	指定交易	
Z	密码服务	
a	私募债券	

```

## vnpy

```
class Product(Enum):
    """
    Product class.
    """
    EQUITY = "股票"
    FUTURES = "期货"
    OPTION = "期权"
    INDEX = "指数"
    FOREX = "外汇"
    SPOT = "现货"
    ETF = "ETF"
    BOND = "债券"
    WARRANT = "权证"
    SPREAD = "价差"
    FUND = "基金"
 ```

# 证券信息

| prop | 金证            | 恒生               | 根网              | vnpy
|------| -------------- 
| 代码 |

## 恒生

```
输出参数	参数名	类型	说明	操作符	备注
	business_date	N8	业务日期		
	listing_date	N8	网上上市日期		
	market_no	C3	交易市场		参见数据字典4。
	stock_code	C20	证券代码		
	stock_name	C128	证券名称		
	stock_type	C4	证券类型		参见数据字典25。
	total_share	N20.4	总股本		
	circulate_amount	N20.4	流通股本		
	uplimited_price	N11.4	涨停板价格		
	downlimited_price	N11.4	跌停板价格		
	buy_unit	N20.4	最小买单位		
	sale_unit	N20.4	最小卖单位		
	yesterday_close_price	N11.4	昨收盘价
	stop_flag	C1	停牌标志		1:停牌;2:正常交易
	position_str	C32	定位串		"返回记录中值最大的定位串，做为所有记录的定位串，下
次查询时可取本次查询返回的定位串作为查询条件传入。"

```

## 金证

- 获取股票基础信息  int GetNQInfo(char * pStkCode)

```

/** 输出股票基本信息 */
struct STK_NQINFO
{
  char szStkCode[8 + 1];        //!< 证券代码
  char szStkName[16 + 1];       //!< 证券简称 
  char chStkCls[1 + 1];         //!< 证券类别
  char szBaseCode[8 + 1];       //!< 基础证券
  char szStkIsin[16 + 1];       //!< ISIN编码
  int nTurnSize;                //!< 转让单位
  char szStkBD[2 + 1];          //!< 交易板块
  char chCurrenCy[1 + 1];       //!< 货币种类
  double dStkFaceVal;           //!< 证券面值
  long long llCirculation;      //!< 总发行量
  long long llFloatNum;         //!< 流通股数
  double dLastYearMgsy;         //!< 上年每股收益
  double dThisYearMgsy;         //!< 本年每股收益
  double dHandingFee;           //!< 经手费率
  double dStampTax;             //!< 印花税率
  double dTransFer;             //!< 过户费率
  int nPutupDate;               //!< 挂牌日期
  int nZqqxDate;                //!< 债券起息日
  int nPromptDate;              //!< 到期/交割日
  int nEachLmt;                 //!< 每笔限量
  int nBuyVolSize;              //!< 买数量单位
  int nSellVolSize;             //!< 卖数量单位
  int nMinWtVol;                //!< 最小申报数量
  double dPriceDish;            //!< 价格档位
  double dFirstTurnLmt;         //!< 首笔转让限价参数
  double dLaterTurnLmt;         //!< 后续转让限价参数
  char chLmtPriceParam[1 + 1];  //!< 限价参数性质
  double dStkUpLmtPrice;        //!< 涨停价格
  double dStkLwLmtPrice;        //!< 跌停价格
  double dLargeUpPrice;         //!< 大宗转让价格上限
  double dLargeLwPrice;         //!< 大宗转让价格下限
  char chConstituent[1 + 1];    //!< 成分股标志
  int nConversion;              //!< 折合比例
  char chTurnStatus[1 + 1];     //!< 转让状态
  char chStkLevel[1 + 1];       //!< 证券级别
  char chTurnType[1 + 1];       //!< 转让类型
  int nMMNum;                   //!< 做市商数量
  char chStopFlag[1 + 1];       //!< 停牌标志
  char chCqcxFlag[1 + 1];       //!< 除权除息标志
};
```




## 根网

1. python

```
classCTSlib.ApiStruct.MsgStkInfo
Bases: object

stkInfo 证券信息

Fieldmembers:	
exchId : 交易市场
stkId : 证券代码
stkName : 证券名称
newPrice : 最新价格
openPrice : 开盘价格
closePrice : 昨收盘价
buyPrice : 买盘价格
sellPrice : 卖盘价格
buyAmt : 买盘数量
sellAmt : 卖盘数量
closeFlag : 停牌标记
highPrice : 今日最高
lowPrice : 今日最低
maxOrderPrice : 价格上限
minOrderPrice : 价格下限
knockQty : 成交数量
knockAmt : 成交金额
preClosePrice : 昨收盘价格
preSettlementPrice : 昨日结算价
F_productId : 产品内部编码
basicExchId : 标的证券所在市场
basicStkId : 标的证券代码
F_BasisPrice : 挂牌基准价
settleGrp : 结算组
settleID : 结算编号
stkOrderStatus : 合约交易状态
preOpenPosition : 市场昨持仓量
highestPrice : 最高价
lowestPrice : 最低价
exchTotalKnockQty : 当天交易所总成交数量
exchTotalKnockAmt : 当天交易所总成交金额
openPosition : 市场持仓量
settlementPrice : 结算价
preDelta : 昨虚实度
delta : 今虚实度
lastModifyTime : 最后修改时间
mseconds : 最后修改毫秒
contractTimes : 合约乘数
deliveryDate : 交割日
endDays : 计息截止天
estimate : 约用资金
beginPrice : 开始价格
endPrice : 结束价格
stkType : 证券类别
lastTrdDate : 最后交易日
orderPriceUnit : 价格单位
qtyPerHand : 每手数量
strikePrice : 行权价格
optionType : 期权类型(P-看涨期权，C-看跌期权)
optExecType : 期权执行方式(0-欧式，1-美式)
optionStkId : 期权证券代码
stkStatus : 合约状态
stkStatusDesc : 合约状态描述
deliveryType : 交割方式
deliveryYear : 交割年份
deliveryMonth : 交割月
listDate : 上市日
firstTrdDate : 首交易日
matureDate : 到期日
lastSettleDate : 最后结算日
stkOrderStatusDesc : 合约交易状态描述
maxLimitOrderQty : 限价委托上限数量
maxMarketOrderQty : 市价委托上限数量
upPercent : 涨幅比例
downPercent : 跌幅比例
tradeUnit : 交易单位
basicStkType : 标的证券类型(EBS-ETF，ASH-A股,IDX-指数)
basicPreClosePrice : 标的证券昨收盘
strikeStyle : 行权方式欧式美式(欧式-E,美式-A)
exerciseDate : 行权日(T+1)
currMargin : 个股期权持空仓单位保证金
referencePrice : 参考价格
```

## vnpy

```
@dataclass
class ContractData(BaseData):
    """
    Contract data contains basic information about each contract traded.
    """

    symbol: str
    exchange: Exchange
    name: str
    product: Product
    size: int
    pricetick: float

    min_volume: float = 1           # minimum trading volume of the contract
    stop_supported: bool = False    # whether server supports stop order
    net_position: bool = False      # whether gateway uses net position volume
    history_data: bool = False      # whether gateway provides bar history data

    option_strike: float = 0
    option_underlying: str = ""     # vt_symbol of underlying contract
    option_type: OptionType = None
    option_expiry: datetime = None
    option_portfolio: str = ""
    option_index: str = ""          # for identifying options with same strike price

    def __post_init__(self):
        """"""
        self.vt_symbol = f"{self.symbol}.{self.exchange.value}"

```

- 宏汇

- wind

- ricequant

- joinquant



