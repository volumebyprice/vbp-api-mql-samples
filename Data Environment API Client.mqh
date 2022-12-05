
enum ENUM_VBP_ENV {

 VBP_ENV_TIME_START = 0,
 VBP_ENV_TIME_END = 1,
 VBP_ENV_CSIZE = 2,
 VBP_ENV_CTIME = 3,
 VBP_ENV_CPRICE = 4,
 VBP_ENV_VOLUME_TOTAL = 5,
 VBP_ENV_VOLUME_DELTA = 6,
 VBP_ENV_VOLUME_DELTA_N = 7,
 VBP_ENV_VOLUME_POSITIVE = 8,
 VBP_ENV_VOLUME_NEGATIVE = 9,
 VBP_ENV_PRICE_SET = 10,
 VBP_ENV_VP_LOW = 11,
 VBP_ENV_VP_HIGH = 12,
 VBP_ENV_VP_RANGE = 13,
 VBP_ENV_VP_MEDIAN = 14,
 VBP_ENV_VP_BALANCE = 15,
 VBP_ENV_VP_POC_MEDIAN = 16,
 VBP_ENV_VP_POC_LOW = 17,
 VBP_ENV_VP_POC_HIGH = 18,
 VBP_ENV_VP_VA_LOW = 19,
 VBP_ENV_VP_VA_HIGH = 20,
 VBP_ENV_VP_VA_RANGE = 21,
 VBP_ENV_VP_VOLUME_COUNT_DELTA = 22,
 VBP_ENV_VP_VOLUME_COUNT_DELTA_N = 23,
 VBP_ENV_VP_VOLUME_COUNT_POSITIVE = 24,
 VBP_ENV_VP_VOLUME_COUNT_NEGATIVE = 25,
 VBP_ENV_MP_LOW = 26,
 VBP_ENV_MP_HIGH = 27,
 VBP_ENV_MP_RANGE = 28,
 VBP_ENV_MP_MEDIAN = 29,
 VBP_ENV_MP_BALANCE = 30,
 VBP_ENV_MP_POC_MEDIAN = 31,
 VBP_ENV_MP_POC_LOW = 32,
 VBP_ENV_MP_POC_HIGH = 33,
 VBP_ENV_MP_VA_LOW = 34,
 VBP_ENV_MP_VA_HIGH = 35,
 VBP_ENV_MP_VA_RANGE = 36,
 VBP_ENV_MP_TPO_COUNT_DELTA = 37,
 VBP_ENV_MP_TPO_COUNT_DELTA_N = 38,
 VBP_ENV_MP_TPO_COUNT_POSITIVE = 39,
 VBP_ENV_MP_TPO_COUNT_NEGATIVE = 40,
 VBP_ENV_IB_LOW = 41,
 VBP_ENV_IB_HIGH = 42,
 VBP_ENV_IB_RANGE = 43,
 VBP_ENV_MP_TPO_SET = 44,
 VBP_ENV_MP_TPO_TIME = 45,
 VBP_ENV_MP_TPO_TOTAL = 46,
 VBP_ENV_VWAP = 47,

};

class CEnvironment {

   private:

      string name_prefix;
      string variable_prefix;
   
   public:
      
      CEnvironment(const string prefix = "VBP") : name_prefix(prefix), variable_prefix("VBP_ENV") {} ~CEnvironment() {}

      void NameSet(const string prefix) {
      
         name_prefix = prefix;
      
      }
      
      int SegmentsTotal() {
      
         int segments = 0;
      
         for (int i=0;GlobalVariableCheck(VariableNameFormat(VBP_ENV_TIME_START,i));i++) segments = i+1;
         
         return segments;
      
      }
      
      template<typename T> string VariableNameFormat(const T tname, int segment = -1) {
      
         string name = (string)tname;
         
         if (typename(tname)==StringFormat("ENUM_%s",variable_prefix)) name = EnumToString((ENUM_VBP_ENV)tname);
      
         StringReplace(name,StringFormat("%s_",variable_prefix),NULL);
      
         if (segment==-1) segment = SegmentsTotal()-1;
      
         return StringFormat("%s%s_%s",name_prefix,segment>0?StringFormat("[%i]",segment):"",name);
         
      }

      template<typename T1,typename T2> bool Condition(const T1 t1, const int c, const T2 t2, const int segment = -1, const int digits = -1) {
      
         const bool r1 = typename(t1)==StringFormat("ENUM_%s",variable_prefix) || typename(t1)=="string";
         const bool r2 = typename(t2)==StringFormat("ENUM_%s",variable_prefix) || typename(t2)=="string";
         
         if (r1) if (!GlobalVariableCheck(VariableNameFormat(t1,segment))) return false;
         if (r2) if (!GlobalVariableCheck(VariableNameFormat(t2,segment))) return false;
      
         const double l = r1?GlobalVariableGet(VariableNameFormat(t1,segment)):(double)t1;
         const double r = r2?GlobalVariableGet(VariableNameFormat(t2,segment)):(double)t2;  
      
         if (c==0 && NormalizeDouble(l-r,digits>-1?digits:(int)SymbolInfoInteger(Symbol(),SYMBOL_DIGITS))==0) return true;  
         else if (c<0 && l<r) return true;  
         else if (c>0 && l>r) return true;  
         
         return false;
      
      }

};