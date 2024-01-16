//+------------------------------------------------------------------+
//|                                              GlobalVariables.mq5 |
//|                                        Volume by Price Indicator |
//|                                    https://www.volumebyprice.com |
//+------------------------------------------------------------------+
#property copyright ""
#property link      ""
#property version   "1.00"

#include <Volume by Price Indicator\\Data Environment\\GlobalVariables.mqh>
CEnvironment Environment1;
double metric1[1];

//+------------------------------------------------------------------+
//| Expert initialization function                                   |
//+------------------------------------------------------------------+
int OnInit()
  {
//---
   Environment1.NameSet("default");
   if (Environment1.SegmentsTotal()<1) return(INIT_FAILED);
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
   metric1[0] = GlobalVariableGet(Environment1.VariableNameFormat(VBP_ENV_VP_POC_MEDIAN,Environment1.SegmentsTotal()-1));
   Print(metric1[0]);
   //Alert(...); //SendMail(...); //SendNotification(...); //SendFTP(...); //PlaySound(...); //WebRequest(...); //OrderSend(...); //OrderClose(...);
  }
//+------------------------------------------------------------------+
