TODO: 市场和证券类型， 用 Gemini 中的扩展机制 定义， 包括代码规则

it's easy:  [ImportMany] MenuItemGroupDefinition[] menuItemGroups,  and [Export]

TODO: RegisterableMessage  可以通过注册扩展的对象
	根据证券类型?

# 交易市场/板块

## 恒生

```
market_no	交易市场
"1"	上交所
"2"	深交所
"3"	上期所
"4"	郑商所
"5"	银行间
"6"	场外
"7"	中金所
"9"	大商所
"k"	能源期货交易所
"10"	股转市场
"35"	港股通（沪）
"o"	港股通（深）
"8"	境外场外

... (一系列境外交易所)

```

## 金证

```
ASSET_CODE. chStkEx(交易市场)
字典项代码	字典项名称	字典项说明
0	深圳交易所	
1	上海交易所	
2	北京交易所	

ASSET_CODE.szStkBd(交易板块)
字典项代码	字典项名称	字典项说明
00	深圳A股	
01	深圳B股	
02	三板(A)	
03	三板B	对接Win版集中时有效
10	上海A股	
11	上海B股	
12	上海个股期权	
20	北京股转	

```

## vnpy

```
class Exchange(Enum):
    """
    Exchange.
    """
    # Chinese
    CFFEX = "CFFEX"         # China Financial Futures Exchange
    SHFE = "SHFE"           # Shanghai Futures Exchange
    CZCE = "CZCE"           # Zhengzhou Commodity Exchange
    DCE = "DCE"             # Dalian Commodity Exchange
    INE = "INE"             # Shanghai International Energy Exchange
    SSE = "SSE"             # Shanghai Stock Exchange
    SZSE = "SZSE"           # Shenzhen Stock Exchange
    SGE = "SGE"             # Shanghai Gold Exchange
    WXE = "WXE"             # Wuxi Steel Exchange
    CFETS = "CFETS"         # China Foreign Exchange Trade System

    # Global
    SMART = "SMART"         # Smart Router for US stocks
    NYSE = "NYSE"           # New York Stock Exchnage
    NASDAQ = "NASDAQ"       # Nasdaq Exchange
    ......

    # CryptoCurrency
    BITMEX = "BITMEX"
    OKEX = "OKEX"
    HUOBI = "HUOBI"
    ......

    # Special Function
    LOCAL = "LOCAL"         # For local generated data
```
