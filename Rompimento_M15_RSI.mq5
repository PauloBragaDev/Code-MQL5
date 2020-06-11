//+------------------------------------------------------------------+
//|                                                        Masha.mq5 |
//|                                                      Paulo Braga |
//|                                             https://www.mql5.com |
//+------------------------------------------------------------------+
#property copyright "Paulo Braga"
#property link      "https://www.mql5.com"
#property version   "1.00"
#property indicator_chart_window
#property indicator_buffers 5
#property indicator_plots   5
//--- plot COMPRA
#property indicator_label1  "COMPRA"
#property indicator_type1   DRAW_ARROW
#property indicator_color1  clrLime
#property indicator_style1  STYLE_SOLID
#property indicator_width1  1
//--- plot VENDA
#property indicator_label2  "VENDA"
#property indicator_type2   DRAW_ARROW
#property indicator_color2  clrRed
#property indicator_style2  STYLE_SOLID
#property indicator_width2  1
//--- plot GAIN
#property indicator_label3  "GAIN"
#property indicator_type3   DRAW_ARROW
#property indicator_color3  clrLime 
#property indicator_style3  STYLE_SOLID
#property indicator_width3  1
//--- plot LOSS
#property indicator_label4  "LOSS"
#property indicator_type4   DRAW_ARROW
#property indicator_color4  clrRed
#property indicator_style4  STYLE_SOLID
#property indicator_width4  1
//--- plot IFR
#property indicator_label5  "IFR"
#property indicator_type5   DRAW_NONE
#property indicator_color5  clrRed
#property indicator_style5  STYLE_SOLID
#property indicator_width5  1
//--- input parameters
input int      Periodo=14;
//--- indicator buffers
double         COMPRABuffer[];
double         VENDABuffer[];
double         GAINBuffer[];
double         LOSSBuffer[];
double         IFRBuffer[];
//+------------------------------------------------------------------+
//| Custom indicator initialization function                         |
//+------------------------------------------------------------------+
int OnInit()
  {
//--- indicator buffers mapping
   SetIndexBuffer(0,COMPRABuffer,INDICATOR_DATA);
   SetIndexBuffer(1,VENDABuffer,INDICATOR_DATA);
   SetIndexBuffer(2,GAINBuffer,INDICATOR_DATA);
   SetIndexBuffer(3,LOSSBuffer,INDICATOR_DATA);
   SetIndexBuffer(4,IFRBuffer,INDICATOR_DATA);
//--- setting a code from the Wingdings charset as the property of PLOT_ARROW
   PlotIndexSetInteger(0,PLOT_ARROW,224);
   PlotIndexSetInteger(1,PLOT_ARROW,224);
   PlotIndexSetInteger(2,PLOT_ARROW,224);
   PlotIndexSetInteger(3,PLOT_ARROW,224);
   
//---
   return(INIT_SUCCEEDED);
  }
//+------------------------------------------------------------------+
//| Custom indicator iteration function                              |
//+------------------------------------------------------------------+
int OnCalculate(const int rates_total,
                const int prev_calculated,
                const datetime &time[],
                const double &open[],
                const double &high[],
                const double &low[],
                const double &close[],
                const long &tick_volume[],
                const long &volume[],
                const int &spread[])
  {
//---
   CopyBuffer(iRSI(_Symbol,_Period,Periodo,PRICE_CLOSE),0,0,rates_total,IFRBuffer);
   double entrada = 60;
   double gain = 360;
   double loss= 290;
//--- return value of prev_calculated for next call
   for(int i=1; i<rates_total; i++){
      if(low[i]<low[i-1] && IFRBuffer[i]<50 && close[i]<open[i]){
         
         VENDABuffer[i]= low[i]-entrada;
         LOSSBuffer[i]= low[i]+loss;
         GAINBuffer[i]= low[i]-gain;
       
      }
      else{
         VENDABuffer[i]=0; 
      }
      
      if(high[i]>high[i-1] && IFRBuffer[i]>50 && open[i]<close[i]){
         COMPRABuffer[i]=high[i]+entrada;
         LOSSBuffer[i] = high[i]-loss;
         GAINBuffer[i] = high[i]+gain;
      }
      else{
         COMPRABuffer[i]=0;
      }
   
   }

   return(rates_total);
  }
//+------------------------------------------------------------------+
