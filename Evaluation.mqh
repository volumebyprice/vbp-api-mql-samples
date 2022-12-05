
#include <Volume by Price Indicator\\Data Environment API Client.mqh>

CEnvironment Environment1;

#define eq 0
#define lt -1
#define gt 1

bool Evaluation() 
{

	const double bid = SymbolInfoDouble(Symbol(),SYMBOL_BID);

	//input_api_env_name=default
	Environment1.NameSet("VBP");

	////input_api_env_name=Name1?filter=TIME,VP_VA
	//Environment1.NameSet("VBP_NAME1");         

	const ENUM_VBP_ENV metric = VBP_ENV_VP_VA_HIGH;

	if (Environment1.Condition(bid,lt,metric)) {

		Alert(GlobalVariableGet(Environment1.VariableNameFormat(metric))); 

		//Print(...); //SendMail(...); //SendNotification(...); //SendFTP(...); //PlaySound(...); //WebRequest(...); //OrderSend(...); //OrderClose(...);

		return true;

	}

	return false;

}
//+------------------------------------------------------------------+



