//+------------------------------------------------------------------+
//|                                                      iCustom.mq4 |
//|                                        Volume by Price Indicator |
//|                                    https://www.volumebyprice.com |
//+------------------------------------------------------------------+
#property copyright ""
#property link      ""
#property version   "1.00"

#include <Volume by Price Indicator\\Data Environment\\iCustom.mqh>
double metric1[1];

//+------------------------------------------------------------------+
//| Expert initialization function                                   |
//+------------------------------------------------------------------+
int OnInit()
  {
//---

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
   metric1[0] = iCustom(Symbol(),Period(),VBP_EXT_TRACING,"{ID}",VBP_EXT_TRACING_MODE_NORMAL,"default",MEnvironment,VariableNameIndex(VBP_ENV_VP_POC_MEDIAN),0);
   Print(metric1[0]);
   //Alert(...); //SendMail(...); //SendNotification(...); //SendFTP(...); //PlaySound(...); //WebRequest(...); //OrderSend(...); //OrderClose(...);        
  }
//+------------------------------------------------------------------+
