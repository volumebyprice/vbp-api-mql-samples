//+------------------------------------------------------------------+
//|                                                      iCustom.mq5 |
//|                                        Volume by Price Indicator |
//|                                    https://www.volumebyprice.com |
//+------------------------------------------------------------------+
#property copyright ""
#property link      ""
#property version   "1.00"

#include <Volume by Price Indicator\\Data Environment\\iCustom.mqh>
int Environment1;
double metric1[1];

//+------------------------------------------------------------------+
//| Expert initialization function                                   |
//+------------------------------------------------------------------+
int OnInit()
  {
//---
   Environment1 = iCustom(Symbol(),Period(),VBP_EXT_TRACING,"{ID}",VBP_EXT_TRACING_MODE_NORMAL,"default",MEnvironment);
   if (Environment1==INVALID_HANDLE) return(INIT_FAILED);
//---
   return(INIT_SUCCEEDED);
  }
//+------------------------------------------------------------------+
//| Expert deinitialization function                                 |
//+------------------------------------------------------------------+
void OnDeinit(const int reason)
  {
//---

  }
//+------------------------------------------------------------------+
//| Expert tick function                                             |
//+------------------------------------------------------------------+
void OnTick()
  {
//---
   CopyBuffer(Environment1,VariableNameIndex(VBP_ENV_VP_POC_MEDIAN),0,1,metric1);
   Print(metric1[0]);
   //Alert(...); //SendMail(...); //SendNotification(...); //SendFTP(...); //PlaySound(...); //WebRequest(...); //OrderSend(...); //OrderClose(...);        
  }
//+------------------------------------------------------------------+
