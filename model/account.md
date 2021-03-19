


## 金证

```
/** 资产单元资金查询结果 */
struct ASSET_FUND
{
  int nProjectId;              //!< 项目ID
  char szProjectName[64 + 1];  //!< 项目名称
  int nAssetId;                //!< 资产单元ID
  char szAssetName[64 + 1];    //!< 资产单元名称
  short siIntOrg;              //!< 内部机构
  char chCurrency[1 + 1];      //!< 货币代码
  double dMaxMoney;            //!< 资金上限
  double dMinMoney;            //!< 资金下限
  double dFundPrebln;          //!< 资金昨日余额
  double dFundBln;             //!< 资金当前余额
  double dFundAvl;             //!< 资金可用金额
  double dFundFrz;             //!< 资金冻结金额
  double dFundUfz;             //!< 资金解冻金额
  double dFundTrdFrz;          //!< 资金交易冻结金额
  double dFundTrdUfz;          //!< 资金交易解冻金额
  double dFundTrdOtd;          //!< 资金交易在途金额
  double dFundTrdBln;          //!< 资金交易轧差金额
  double dFundClrFrz;          //!< 资金清算冻结金额
  double dFundClrUfz;          //!< 资金清算解冻金额
  double dFundClrOtd;          //!< 资金清算在途金额
  double dFundClrCtf;          //!< 资金清算保付金额
  double dFundTrnFrz;          //!< 资金转帐冻结金额
  double dFundTrnUfz;          //!< 资金转账解冻金额
  double dFundDebt;            //!< 资金负债金额
  double dFundCredit;          //!< 资金债权金额
  short siIntRateSn;           //!< 利率编码
  short siDrRateSn;            //!< 负债利率编码
  double dIntCalBln;           //!< 计息余额
  double dIntBlnAccu;          //!< 利息积数
  int iIntCalDate;             //!< 计息日期
  double dInterest;            //!< 利息
  double dIntTax;              //!< 利息税
  double dDrInt;               //!< 负债利息
  double dMktVal;              //!< 市值
  double dCashAccu;            //!< 现金积数
  double dChequeAccu;          //!< 支票积数
  double dLastFundClr;         //!< 上次清算金额
  double dLwlmtFund;           //!< 资金下限
  double dLwlmtAsset;          //!< 资产下限
  char szUpdTime[32 + 1];      //!< 修改时间
  char chFundStatus[1 + 1];    //!< 资金状态
  char szMac[255 + 1];         //!< 校验码    fengwc 0121 alter
  double dPaylater;            //!< 垫付资金
};
```