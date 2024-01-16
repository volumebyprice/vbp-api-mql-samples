
enum ENUM_VBP_ENV {
   
   VBP_ENV_TIME_START = 0,
   VBP_ENV_TIME_END = 1,
   VBP_ENV_RSIZE = 2,
   VBP_ENV_CTIME = 3,
   VBP_ENV_CPRICE = 4,
   VBP_ENV_CVOLUME_TOTAL = 5,
   VBP_ENV_CVOLUME_DELTA = 6,
   VBP_ENV_CVOLUME_DELTA_N = 7,
   VBP_ENV_CVOLUME_BUY = 8,
   VBP_ENV_CVOLUME_SELL = 9,    
   VBP_ENV_BVOLUME_TOTAL = 10,
   VBP_ENV_BVOLUME_DELTA = 11,
   VBP_ENV_BVOLUME_DELTA_N = 12,
   VBP_ENV_BVOLUME_DELTA_AVG = 13,
   VBP_ENV_BVOLUME_BUY = 14,
   VBP_ENV_BVOLUME_SELL = 15,    
   VBP_ENV_VOLUME_TOTAL = 16,
   VBP_ENV_VOLUME_DELTA = 17,
   VBP_ENV_VOLUME_DELTA_N = 18,
   VBP_ENV_VOLUME_DELTA_PCT = 19,      
   VBP_ENV_VOLUME_BUY = 20,
   VBP_ENV_VOLUME_SELL = 21, 
   VBP_ENV_VOLUME_COUNT = 22,
   VBP_ENV_VOLUME_COUNT_N = 23,
   VBP_ENV_VOLUME_COUNT_PCT = 24,
   VBP_ENV_VOLUME_COUNT_BUY = 25,
   VBP_ENV_VOLUME_COUNT_SELL = 26,   
   VBP_ENV_PRICE_SET = 27,
   VBP_ENV_VP_LOW = 28,
   VBP_ENV_VP_HIGH = 29,
   VBP_ENV_VP_RANGE = 30,
   VBP_ENV_VP_MEDIAN = 31,
   VBP_ENV_VP_BALANCE = 32,
   VBP_ENV_VP_POC_MEDIAN = 33,
   VBP_ENV_VP_POC_LOW = 34,
   VBP_ENV_VP_POC_HIGH = 35,
   VBP_ENV_VP_VA_LOW = 36,
   VBP_ENV_VP_VA_HIGH = 37,
   VBP_ENV_VP_VA_RANGE = 38,
   VBP_ENV_MP_LOW = 39,
   VBP_ENV_MP_HIGH = 40,
   VBP_ENV_MP_RANGE = 41,
   VBP_ENV_MP_MEDIAN = 42,
   VBP_ENV_MP_BALANCE = 43,
   VBP_ENV_MP_BODY_LOW = 44,
   VBP_ENV_MP_BODY_HIGH = 45,
   VBP_ENV_MP_POC_MEDIAN = 46,
   VBP_ENV_MP_POC_LOW = 47,
   VBP_ENV_MP_POC_HIGH = 48,
   VBP_ENV_MP_VA_LOW = 49,
   VBP_ENV_MP_VA_HIGH = 50,
   VBP_ENV_MP_VA_RANGE = 51,
   VBP_ENV_TPO_SET = 52,
   VBP_ENV_TPO_TIME = 53,   
   VBP_ENV_TPO_TOTAL = 54,
   VBP_ENV_TPO_COUNT = 55,
   VBP_ENV_TPO_COUNT_N = 56,
   VBP_ENV_TPO_COUNT_PCT = 57,
   VBP_ENV_TPO_COUNT_BUY = 58,
   VBP_ENV_TPO_COUNT_SELL = 59,
   VBP_ENV_IB_LOW = 60,
   VBP_ENV_IB_HIGH = 61,
   VBP_ENV_IB_RANGE = 62,
   VBP_ENV_VWAP = 63,

};

#define typename_enum "enum "

class CEnvironment {

   private:

      string env_prefix;
      string enum_prefix;
   
   public:
      
      CEnvironment(const string prefix = "default") : env_prefix(NameSet(prefix)), enum_prefix("VBP_ENV") {} ~CEnvironment() {}

      string NameSet(string prefix) {
      
         StringToUpper(prefix);
         
         if (prefix=="DEFAULT") env_prefix = "VBP";
      
         else env_prefix = "VBP_"+prefix;
         
         return env_prefix;
      
      }
      
      int SegmentsTotal() {
      
         int segments = 0;
      
         for (int i=0;GlobalVariableCheck(VariableNameFormat(VBP_ENV_TIME_START,i));i++) segments = i+1;
         
         return segments;
      
      }
      
      template<typename T> string VariableNameFormat(const T tname, int segment = -1) {
  
         string name = (string)tname;
         
         if (typename(tname)==StringFormat(typename_enum+"ENUM_%s",enum_prefix)) name = EnumToString((ENUM_VBP_ENV)tname);
      
         StringReplace(name,StringFormat("%s_",enum_prefix),NULL);
      
         if (segment==-1) segment = SegmentsTotal()-1;
      
         return StringFormat("%s%s_%s",env_prefix,segment>0?StringFormat("[%i]",segment):"",name);
         
      }

};