//|                               Tamizh, Mobile: +919487929983 |
//|                            https://www.forextamil.com |
//+------------------------------------------------------------------+
#property copyright "Tamizh, Mobile: +919487929983"
#property link      "https://www.forextamil.com"
#property version     "8.00"

#property indicator_separate_window
#property indicator_buffers 23


#property indicator_minimum 0
#property indicator_maximum 100
#include <WinUser32.mqh>
#include <hash.mqh>
#include <json.mqh>
enum ADX_mod
  {
   Upwards=0,Downwards=1, Both=2
  };

input string                DivergenceSettings_______________="DivergenceSettings_______________";
input int                    Magic_Number=123456;
extern string                bool_Input_EA                  ="";
extern string                 FIBB="";
extern string                 FIBBL="";
extern string                 PNFIBB="";
extern string                 PNFIBBL="";
extern string                 PCIN1="";
extern string                 PCIN2="";
extern string                 PCIN3="";
extern string                 PCINL1="";
extern string                 PCINL2="";
extern string                 PCINL3="";
extern bool                  Show_Graphic_Object              =true;
extern bool                  Using_IN_EA                     =false;
extern bool                  Candle_Patterns_Enable          =true;
extern bool                  Enable_Hidden_Divergence          =true;
extern bool                  Enable_Normal_Divergence          =true;
extern int                  Maximum_Bars=2000;
input int                   Risk_Table_Entry1_Risk_Amount=200;
input int                   Risk_Table_Entry2_Risk_Amount=100;
input int                Chart_Refresh_Time_min=15;
input string                Normal_Divergence_Settings_______________="Normal Divergence Settings_______________";
extern bool                  Show_Shortly_Divergence              = true;
extern bool                  Show_Long_Divergence              = true;
extern bool                  Show_Short_Divergence              = true;
input  string               Fibonacci_Setting                     ="  Fibonacci_Setting_Setting ---------------------------------------------------------";
extern double                 Entry_2_LONG                     =38.2;
extern int                   Stop_Loss_Pips_GAP_LONG                     =0;
extern int                   Entery_Point_GAP_LONG                        =0;
extern int                   Entery2_Point_GAP_LONG                        =0;
extern int                   Take_Profit_GAP_161_8_LONG                          =0;
extern int                   Take_Profit_GAP_261_8_LONG                         =0;
extern int                   Take_Profit_GAP_423_6_LONG                          =0;
extern int                   Take_Profit_GAP_847_0_LONG                          =0;
extern double                Entry_2_SHORT                     =38.2;
extern int                   Stop_Loss_Pips_GAP_SHORT                      =0;
extern int                   Entery_Point_GAP_SHORT                       =0;
extern int                   Entery2_Point_GAP_SHORT                       =0;
extern int                   Take_Profit_GAP_161_8_SHORT                         =0;
extern int                   Take_Profit_GAP_261_8_SHORT                        =0;
extern int                   Take_Profit_GAP_423_6_SHORT                         =0;
extern int                   Take_Profit_GAP_847_0_SHORT                         =0;
extern bool                  Fibonacci                                 =True;
input  string               Fibonacci_Setting_Lengthy                      ="  Fibonacci_Setting_Lengthy  ---------------------------------------------------------";
extern double                Entry_2_Lengthy_LONG                      =38.2;
extern int                   Stop_Loss_Pips_GAP_Lengthy_LONG                      =0;
extern int                   Entery_Point_GAP_Lengthy_LONG                       =0;
extern int                   Entery2_Point_GAP_Lengthy_LONG                       =0;
extern int                   Take_Profit_GAP_161_8_Lengthy_LONG                         =0;
extern int                   Take_Profit_GAP_261_8_Lengthy_LONG                        =0;
extern int                   Take_Profit_GAP_423_6_Lengthy_LONG                         =0;
extern int                   Take_Profit_GAP_847_0_Lengthy_LONG                         =0;
extern double                Entry_2_Lengthy_SHORT                      =38.2;
extern int                   Stop_Loss_Pips_GAP_Lengthy_SHORT                      =0;
extern int                   Entery_Point_GAP_Lengthy_SHORT                       =0;
extern int                   Entery2_Point_GAP_Lengthy_SHORT                       =0;
extern int                   Take_Profit_GAP_161_8_Lengthy_SHORT                         =0;
extern int                   Take_Profit_GAP_261_8_Lengthy_SHORT                        =0;
extern int                   Take_Profit_GAP_423_6_Lengthy_SHORT                         =0;
extern int                   Take_Profit_GAP_847_0_Lengthy_SHORT                         =0;
extern bool                  Fibonacci_Lengthy                                  =True;
input string                RSI_settings                     = "RSI_settings---------------------------------------------------------";
input int                   RSI_period                       = 14;
input ENUM_APPLIED_PRICE    RSI_applied_price                = 0;
extern bool                  RSI_Filter                       = false;
input int                   bearish_Level                    = 70;
input int                   bulish_Level                     = 30;
extern int                   Signal_Bar                       = 2;
input  string               Graphic_Setting                     ="Graphic_Setting ---------------------------------------------------------";
input bool                  DrawIndicatorTrendLines          = true;
input bool                  DrawPriceTrendLines              = true;
input color                 LongColour                       = clrLimeGreen;
input color                 ShortColour                      = clrDeepPink;
input color                 Arrow_LongColour                       = clrLimeGreen;
input color                  Arrow_ShortColour                      = clrDeepPink;
input uchar                 LongArrowCode                    = 251;
input uchar                 ShortArrowCode                   = 251;
input int                   ArrowSize                        = 0;
input int                   Divergence_Line_Width            =1;
input color                 RSIColour                        = clrGoldenrod;
input ENUM_LINE_STYLE       RSIStyle                         = 0;
input int                   RSIWidth                         = 1;
input bool                  DisplayCard                =True;
input  string               Alarm_Setting                     ="Alert_Setting---------------------------------------------------------";
input bool                 Alert_With_Candle_Pattern_LONG                    =false;
input bool                 Alert_With_Candle_Pattern_SHORT                    =false;
input bool                  DisplayAlert_Divergence_LONG                     = false;
input bool                  DisplayAlert_Divergence_SHORT                     = false;
input string                  Sound_Divergence_LONG                     = "alert.wav";
input bool                  Sound_Enable_Divergence_LONG                     = false;
input string                  Sound_Divergence_SHORT                     = "alert.wav";
input bool                  Sound_Enable_Divergence_SHORT                     = false;
input bool                 DisplayAlert                     = false;
input bool                  DisplayNotification              = false;
input bool                  Send_eMail                       = false;
input  string               Candle_Confirmations_Setting                     =" Candle_Confirmations_Setting ---------------------------------------------------------";
extern bool                  Candle_Confirmations_LONG             =True;
extern bool                  Candle_Confirmations_SHORT             =True;
extern bool                  Candle_Confirmations_Alert_LONG              =false;
extern bool                  Candle_Confirmations_Alert_SHORT             =false;
input string                  Candle_Confirmations_Alert_Sound_SHORT                     = "alert.wav";
input bool                  Candle_Confirmations_Alert_Sound_Enable_SHORT                      = false;
input string                  Candle_Confirmations_Alert_Sound_LONG                     = "alert.wav";
input bool                  Candle_Confirmations_Alert_Sound_Enable_LONG                      = false;
input  string               Confirmation_candle_Breakout_Setting                     =" Confirmation_candle_Breakout_Setting ---------------------------------------------------------";
extern bool                  Confirmation_candle_Breakout_LONG  =True;
extern bool                  Confirmation_candle_Breakout_SHORT  =True;
input bool                  Confirmation_candle_Breakout_Alert_LONG  =false;
input bool                  Confirmation_candle_Breakout_Alert_SHORT  =false;
input string                  Confirmation_candle_Breakout_Alert_Sound_SHORT                     = "alert.wav";
input bool                  Confirmation_candle_Breakout_Alert_Sound_Enable_SHORT                      = false;
input string                  Confirmation_candle_Breakout_Alert_Sound_LONG                     = "alert.wav";
input bool                  Confirmation_candle_Breakout_Alert_Sound_Enable_LONG                      = false;

extern  string               Candle_Pattern_Setting                     ="   Candle_Pattern_Setting ---------------------------------------------------------";
extern bool                  Bullish_Hammer                   =True;
extern bool                  Bullish_Inverted_Hammer          =True;
extern bool                  Bearish_Hammer                   =True;
extern bool                  Bearish_Inverted_Hammer          =True;
extern bool                  Bullish_Engulfing                   =True;
extern bool                  Bearish_Engulfing          =True;
extern bool                  Piercing_Candle                   =True;
extern bool                  Dark_Cloud_Cover          =True;
extern bool                  Bullish_Sash                   =True;
extern bool                  Bearish_Sash          =True;
extern bool                  Morning_Star                   =True;
extern bool                  Evening_Star          =True;

extern double                Morning_Star_Candle_1_Body_Size_Minimum=3/1;
extern double                Morning_Star_Candle_2_Body_Size_Maximum=0.33;
extern double                Morning_Star_Candle_2_Body_Top_Wick_Size_Maximum=10;
extern double                Morning_Star_Candle_2_Body_Bottom_Wick_Size_Maximum=10;
extern double                Morning_Star_Candle_3_Body_Size_Minimum =0.66;

extern double                Evening_Star_Candle_1_Body_Size_Minimum=3/1;
extern double                Evening_Star_Candle_2_Body_Size_Maximum=0.33;
extern double                Evening_Star_Candle_2_Body_Top_Wick_Size_Maximum=10;
extern double                Evening_Star_Candle_2_Body_Bottom_Wick_Size_Maximum=10;
extern double                Evening_Star_Candle_3_Body_Size_Minimum =0.66;

extern double               Bullish_Sash_Bottom_Wick_Size_Maximum_1_Time     =10;
extern double                Bearish_Sash_Top_Wick_Size_Maximum_1_Time     =10;
extern double                Bullish_Engulfing_Top_Wick_Size_Maximum_1_Time     =10;
extern double                Bullish_Engulfing_Bottom_Wick_Size_Maximum_1_Time     =10;
extern double                Bearish_Engulfing_Top_Wick_Size_Maximum_1_Time     =10;
extern double                Bearish_Engulfing_Bottom_Wick_Size_Maximum_1_Time     =10;
extern double                Piercing_Candle_Top_Wick_Size_Maximum_1_Time     =10;
extern double                Piercing_Candle_Bottom_Wick_Size_Maximum_1_Time     =10;
extern double                Piercing_Candle_Pierce_Factor_Minimum_100_Percentage     =50;
extern double               Dark_Cloud_Cover_Top_Wick_Size_Maximum_1_Time     =10;
extern double                Dark_Cloud_Cover_Bottom_Wick_Size_Maximum_1_Time     =10;
extern double                Dark_Cloud_Cover_Pierce_Factor_Minimum_100_Percentage     =50;
extern double                Bullish_Hammer_Bottom_Wick_Size_Minimum_2_Time =2;
extern double               Bullish_Hammer_Top_Wick_Size_Maximum_1_Time     =100;
extern double                Bearish_Hammer_Bottom_Wick_Size_Maximum_1_Time  =100;
extern double                Bearish_Hammer_Top_Wick_Size_Minimum_2_Time     =2;
extern double                Bullish_Inverted_Hammer_Bottom_Wick_Size_Maximum_1_Time  =100;
extern double               Bullish_Inverted_Hammer_Top_Wick_Size_Minimum_2_Time     =2;
extern double                Bearish_Inverted_Hammer_Bottom_Wick_Size_Minimum_2_Time  =2;
extern double               Bearish_Inverted_Hammer_Top_Wick_Size_Maximum_1_Time     =100;

input string                LengthyDivergenceSettings_______________="LengthyDivergence_______________";
extern bool                  Show_Lengthy_Divergence              = true;
extern bool                  Show_Long_Lengthy_Divergence              = true;
extern bool                  Show_Short_Lengthy_Divergence              = true;

input string                RSI_settings_Lengthy                     = "RSI_Settings_Lengthy ---------------------------------------------------------";
input int                   RSI_period_Lengthy                        = 14;
input ENUM_APPLIED_PRICE    RSI_applied_price_Lengthy                 = 0;
extern bool                  RSI_Filter_Lengthy                        = false;
input int                   bearish_Level_Lengthy                     = 70;
input int                   bulish_Level_Lengthy                      = 30;
input int                   Signal_Bar_Lengthy                        = 2;
input string               Graphic_Setting_Lengthy                      ="Graphic_Setting_Lengthy  ---------------------------------------------------------";
input bool                  DrawIndicatorTrendLines_Lengthy          = true;
input bool                  DrawPriceTrendLines_Lengthy               = true;
input color                 LongColour_Lengthy                        = clrLimeGreen;
input color                 ShortColour_Lengthy                       = clrDeepPink;
input color                 Arrow_LongColour_Lengthy                        = clrLimeGreen;
input color                  Arrow_ShortColour_Lengthy                       = clrDeepPink;
input uchar                 LongArrowCode_Lengthy                     = 251;
input uchar                 ShortArrowCode_Lengthy                    = 251;
input int                   ArrowSize_Lengthy                         = 0;
input int                   Divergence_Line_Width_Lengthy             =1;
input color                 RSIColour_Lengthy                         = clrGoldenrod;
input ENUM_LINE_STYLE       RSIStyle_Lengthy                          = 0;
input int                   RSIWidth_Lengthy                          = 1;
input bool                  DisplayCard_Lengthy                 =True;
input  string               Alarm_Setting_Lengthy                      ="Alarm_Setting_Lengthy ---------------------------------------------------------";
input bool                 Alert_With_Candle_Pattern_LONG_Lengthy                    =false;
input bool                 Alert_With_Candle_Pattern_SHORT_Lengthy                    =false;
input bool                  DisplayAlert_Divergence_LONG_Lengthy                      = false;
input bool                  DisplayAlert_Divergence_SHORT_Lengthy                      = false;
input string                  Sound_Divergence_LONG_Lengthy                     = "alert.wav";
input bool                  Sound_Enable_Divergence_LONG_Lengthy                     =false;
input string                  Sound_Divergence_SHORT_Lengthy                     = "alert.wav";
input bool                  Sound_Enable_Divergence_SHORT_Lengthy                     = false;
input bool                 DisplayAlert_Lengthy                       = false;
input bool                  DisplayNotification_Lengthy               = false;
input bool                  Send_eMail_Lengthy                        = true;
input  string               Candle_Confirmations_Setting_Lengthy                      =" Candle_Confirmations_Setting_Lengthy  ---------------------------------------------------------";
extern bool                  Candle_Confirmations_LONG_Lengthy              =True;
extern bool                  Candle_Confirmations_SHORT_Lengthy              =True;
input bool                  Candle_Confirmations_Alert_LONG_Lengthy               =false;
input bool                  Candle_Confirmations_Alert_SHORT_Lengthy              =false;
input string                  Candle_Confirmations_Alert_Sound_SHORT_Lengthy                     = "alert.wav";
input bool                  Candle_Confirmations_Alert_Sound_Enable_SHORT_Lengthy                      = false;
input string                  Candle_Confirmations_Alert_Sound_LONG_Lengthy                     = "alert.wav";
input bool                  Candle_Confirmations_Alert_Sound_Enable_LONG_Lengthy                      = false;
input  string               Confirmation_candle_Breakout_Setting_Lengthy                      =" Confirmation_candle_Breakout_Setting_Lengthy  ---------------------------------------------------------";
extern bool                  Confirmation_candle_Breakout_LONG_Lengthy   =True;
extern bool                  Confirmation_candle_Breakout_SHORT_Lengthy   =True;
input bool                  Confirmation_candle_Breakout_Alert_LONG_Lengthy   =false;
input bool                  Confirmation_candle_Breakout_Alert_SHORT_Lengthy   =false;
input string                  Confirmation_candle_Breakout_Alert_Sound_SHORT_Lengthy                     = "alert.wav";
input bool                  Confirmation_candle_Breakout_Alert_Sound_Enable_SHORT_Lengthy                      = false;
input string                  Confirmation_candle_Breakout_Alert_Sound_LONG_Lengthy                     = "alert.wav";
input bool                  Confirmation_candle_Breakout_Alert_Sound_Enable_LONG_Lengthy                      = false;

input  string               Candle_Pattern_Setting_Lengthy                      ="   Candle_Pattern_Setting_Lengthy  ---------------------------------------------------------";
extern bool                  Bullish_Hammer_Lengthy                    =True;
extern bool                  Bullish_Inverted_Hammer_Lengthy           =True;
extern bool                  Bearish_Hammer_Lengthy                    =True;
extern bool                  Bearish_Inverted_Hammer_Lengthy           =True;
extern bool                  Bullish_Engulfing_Lengthy                   =True;
extern bool                  Bearish_Engulfing_Lengthy          =True;
extern bool                  Piercing_Candle_Lengthy                   =True;
extern bool                  Dark_Cloud_Cover_Lengthy          =True;
extern bool                  Bullish_Sash_Lengthy                   =True;
extern bool                  Bearish_Sash_Lengthy          =True;
extern bool                  Morning_Star_Lengthy                    =True;
extern bool                  Evening_Star_Lengthy           =True;
extern double                Morning_Star_Candle_1_Body_Size_Minimum_Lengthy=3/1;
extern double               Morning_Star_Candle_2_Body_Size_Maximum_Lengthy=0.33;
extern double                Morning_Star_Candle_2_Body_Top_Wick_Size_Maximum_Lengthy=10;
extern double                Morning_Star_Candle_2_Body_Bottom_Wick_Size_Maximum_Lengthy=10;
extern double                Morning_Star_Candle_3_Body_Size_Minimum_Lengthy =0.66;

extern double                Evening_Star_Candle_1_Body_Size_Minimum_Lengthy=3/1;
extern double               Evening_Star_Candle_2_Body_Size_Maximum_Lengthy=0.33;
extern double                Evening_Star_Candle_2_Body_Top_Wick_Size_Maximum_Lengthy=10;
extern double                Evening_Star_Candle_2_Body_Bottom_Wick_Size_Maximum_Lengthy=10;
extern double                Evening_Star_Candle_3_Body_Size_Minimum_Lengthy =0.66;
extern double                Bullish_Sash_Bottom_Wick_Size_Maximum_1_Time_Lengthy     =10;
extern double                Bearish_Sash_Top_Wick_Size_Maximum_1_Time_Lengthy     =10;
extern double                Bullish_Engulfing_Top_Wick_Size_Maximum_1_Time_Lengthy      =10;
extern double                Bullish_Engulfing_Bottom_Wick_Size_Maximum_1_Time_Lengthy      =10;
extern double                Bearish_Engulfing_Top_Wick_Size_Maximum_1_Time_Lengthy      =10;
extern double                Bearish_Engulfing_Bottom_Wick_Size_Maximum_1_Time_Lengthy      =10;
extern double                Piercing_Candle_Top_Wick_Size_Maximum_1_Time_Lengthy      =10;
extern double                Piercing_Candle_Bottom_Wick_Size_Maximum_1_Time_Lengthy      =10;
extern double                Piercing_Candle_Pierce_Factor_Minimum_100_Percentage_Lengthy      =50;
extern double                Dark_Cloud_Cover_Top_Wick_Size_Maximum_1_Time_Lengthy      =10;
extern double                Dark_Cloud_Cover_Bottom_Wick_Size_Maximum_1_Time_Lengthy      =10;
extern double                Dark_Cloud_Cover_Pierce_Factor_Minimum_100_Percentage_Lengthy      =50;
extern double                Bullish_Hammer_Bottom_Wick_Size_Minimum_2_Time_Lengthy  =2;
extern double                Bullish_Hammer_Top_Wick_Size_Maximum_1_Time_Lengthy      =100;
extern double                Bearish_Hammer_Bottom_Wick_Size_Maximum_1_Time_Lengthy   =100;
extern double                Bearish_Hammer_Top_Wick_Size_Minimum_2_Time_Lengthy      =2;
extern double                Bullish_Inverted_Hammer_Bottom_Wick_Size_Maximum_1_Time_Lengthy   =100;
extern double                Bullish_Inverted_Hammer_Top_Wick_Size_Minimum_2_Time_Lengthy      =2;
extern double                Bearish_Inverted_Hammer_Bottom_Wick_Size_Minimum_2_Time_Lengthy   =2;
extern double                Bearish_Inverted_Hammer_Top_Wick_Size_Maximum_1_Time_Lengthy      =100;
input string                Hidden_Divergence_Settings_______________="Hidden Divergence Settings_______________";
extern bool                  H_Show_Shortly_Divergence              = true;
extern bool                  H_Show_Long_Divergence              = true;
extern bool                  H_Show_Short_Divergence              = true;
input  string               H_Fibonacci_Setting                     ="  H_Fibonacci_Setting_Setting ---------------------------------------------------------";
extern double                 H_Entry_2_LONG                     =38.2;
extern int                   H_Stop_Loss_Pips_GAP_LONG                     =0;
extern int                   H_Entery_Point_GAP_LONG                        =0;
extern int                   H_Entery2_Point_GAP_LONG                        =0;
extern int                   H_Take_Profit_GAP_161_8_LONG                          =0;
extern int                   H_Take_Profit_GAP_261_8_LONG                         =0;
extern int                   H_Take_Profit_GAP_423_6_LONG                          =00;
extern int                   H_Take_Profit_GAP_847_0_LONG                          =0;
extern double                H_Entry_2_SHORT                     =38.2;
extern int                   H_Stop_Loss_Pips_GAP_SHORT                      =0;
extern int                   H_Entery_Point_GAP_SHORT                       =0;
extern int                   H_Entery2_Point_GAP_SHORT                       =0;
extern int                   H_Take_Profit_GAP_161_8_SHORT                         =0;
extern int                   H_Take_Profit_GAP_261_8_SHORT                        =0;
extern int                   H_Take_Profit_GAP_423_6_SHORT                         =0;
extern int                   H_Take_Profit_GAP_847_0_SHORT                         =0;
extern bool                  H_Fibonacci                                 =True;
input  string               H_Fibonacci_Setting_Lengthy                      ="  H_Fibonacci_Setting_Lengthy  ---------------------------------------------------------";
extern double                H_Entry_2_Lengthy_LONG                      =38.2;
extern int                   H_Stop_Loss_Pips_GAP_Lengthy_LONG                      =0;
extern int                   H_Entery_Point_GAP_Lengthy_LONG                       =0;
extern int                   H_Entery2_Point_GAP_Lengthy_LONG                       =0;
extern int                   H_Take_Profit_GAP_161_8_Lengthy_LONG                         =0;
extern int                   H_Take_Profit_GAP_261_8_Lengthy_LONG                        =0;
extern int                   H_Take_Profit_GAP_423_6_Lengthy_LONG                         =0;
extern int                   H_Take_Profit_GAP_847_0_Lengthy_LONG                         =0;
extern double               H_Entry_2_Lengthy_SHORT                      =38.2;
extern int                   H_Stop_Loss_Pips_GAP_Lengthy_SHORT                      =0;
extern int                   H_Entery_Point_GAP_Lengthy_SHORT                       =0;
extern int                   H_Entery2_Point_GAP_Lengthy_SHORT                       =0;
extern int                   H_Take_Profit_GAP_161_8_Lengthy_SHORT                         =0;
extern int                   H_Take_Profit_GAP_261_8_Lengthy_SHORT                        =0;
extern int                   H_Take_Profit_GAP_423_6_Lengthy_SHORT                         =0;
extern int                   H_Take_Profit_GAP_847_0_Lengthy_SHORT                         =0;
extern bool                  H_Fibonacci_Lengthy                                  =True;
input string                H_RSI_settings                     = "H_RSI_settings---------------------------------------------------------";
input int                   H_RSI_period                       = 14;
input ENUM_APPLIED_PRICE    H_RSI_applied_price                = 0;
extern bool                  H_RSI_Filter                       = false;
input int                   H_bearish_Level                    = 70;
input int                   H_bulish_Level                     = 30;
extern int                   H_Signal_Bar                       = 2;
input  string               H_Graphic_Setting                     ="H_Graphic_Setting ---------------------------------------------------------";
input bool                  H_DrawIndicatorTrendLines          = true;
input bool                  H_DrawPriceTrendLines              = true;
input color                 H_LongColour                       = clrBlue;
input color                 H_ShortColour                      = clrRed;
input color                 H_Arrow_LongColour                       = clrBlue;
input color                  H_Arrow_ShortColour                      = clrRed;
input uchar                 H_LongArrowCode                    = 251;
input uchar                 H_ShortArrowCode                   = 251;
input int                   H_ArrowSize                        = 0;
input int                   H_Divergence_Line_Width            =1;
input color                 H_RSIColour                        = clrGoldenrod;
input ENUM_LINE_STYLE       H_RSIStyle                         = 0;
input int                   H_RSIWidth                         = 1;
input bool                  H_DisplayCard                =True;
input  string               H_Alarm_Setting                     ="H_Alert_Setting---------------------------------------------------------";
input bool                 H_Alert_With_Candle_Pattern_LONG                    =false;
input bool                 H_Alert_With_Candle_Pattern_SHORT                    =false;
input bool                  H_DisplayAlert_Divergence_LONG                     = false;
input bool                  H_DisplayAlert_Divergence_SHORT                     = false;
input string                  H_Sound_Divergence_LONG                     = "alert.wav";
input bool                  H_Sound_Enable_Divergence_LONG                     = false;
input string                  H_Sound_Divergence_SHORT                     = "alert.wav";
input bool                  H_Sound_Enable_Divergence_SHORT                     = false;
input bool                 H_DisplayAlert                     = false;
input bool                  H_DisplayNotification              = false;
input bool                  H_Send_eMail                       = false;
input  string               H_Candle_Confirmations_Setting                     =" H_Candle_Confirmations_Setting ---------------------------------------------------------";
extern bool                  H_Candle_Confirmations_LONG             =True;
extern bool                  H_Candle_Confirmations_SHORT             =True;
extern bool                  H_Candle_Confirmations_Alert_LONG              =false;
extern bool                  H_Candle_Confirmations_Alert_SHORT             =false;
input string                  H_Candle_Confirmations_Alert_Sound_SHORT                     = "alert.wav";
input bool                  H_Candle_Confirmations_Alert_Sound_Enable_SHORT                      = false;
input string                  H_Candle_Confirmations_Alert_Sound_LONG                     = "alert.wav";
input bool                  H_Candle_Confirmations_Alert_Sound_Enable_LONG                      = false;
input  string               H_Confirmation_candle_Breakout_Setting                     =" H_Confirmation_candle_Breakout_Setting ---------------------------------------------------------";
extern bool                  H_Confirmation_candle_Breakout_LONG  =True;
extern bool                  H_Confirmation_candle_Breakout_SHORT  =True;
input bool                  H_Confirmation_candle_Breakout_Alert_LONG  =false;
input bool                  H_Confirmation_candle_Breakout_Alert_SHORT  =false;
input string                  H_Confirmation_candle_Breakout_Alert_Sound_SHORT                     = "alert.wav";
input bool                  H_Confirmation_candle_Breakout_Alert_Sound_Enable_SHORT                      = false;
input string                  H_Confirmation_candle_Breakout_Alert_Sound_LONG                     = "alert.wav";
input bool                  H_Confirmation_candle_Breakout_Alert_Sound_Enable_LONG                      = false;

extern  string               H_Candle_Pattern_Setting                     ="  H_ Candle_Pattern_Setting ---------------------------------------------------------";
extern bool                  H_Bullish_Hammer                   =True;
extern bool                  H_Bullish_Inverted_Hammer          =True;
extern bool                  H_Bearish_Hammer                   =True;
extern bool                  H_Bearish_Inverted_Hammer          =True;
extern bool                  H_Bullish_Engulfing                   =True;
extern bool                  H_Bearish_Engulfing          =True;
extern bool                  H_Piercing_Candle                   =True;
extern bool                  H_Dark_Cloud_Cover          =True;
extern bool                  H_Bullish_Sash                   =True;
extern bool                  H_Bearish_Sash          =True;
extern bool                  H_Morning_Star                   =True;
extern bool                  H_Evening_Star          =True;

extern double                H_Morning_Star_Candle_1_Body_Size_Minimum=3/1;
extern double                H_Morning_Star_Candle_2_Body_Size_Maximum=0.33;
extern double                H_Morning_Star_Candle_2_Body_Top_Wick_Size_Maximum=10;
extern double                H_Morning_Star_Candle_2_Body_Bottom_Wick_Size_Maximum=10;
extern double                H_Morning_Star_Candle_3_Body_Size_Minimum =0.66;

extern double                H_Evening_Star_Candle_1_Body_Size_Minimum=3/1;
extern double                H_Evening_Star_Candle_2_Body_Size_Maximum=0.33;
extern double                H_Evening_Star_Candle_2_Body_Top_Wick_Size_Maximum=10;
extern double                H_Evening_Star_Candle_2_Body_Bottom_Wick_Size_Maximum=10;
extern double                H_Evening_Star_Candle_3_Body_Size_Minimum =0.66;

extern double               H_Bullish_Sash_Bottom_Wick_Size_Maximum_1_Time     =10;
extern double                H_Bearish_Sash_Top_Wick_Size_Maximum_1_Time     =10;
extern double                H_Bullish_Engulfing_Top_Wick_Size_Maximum_1_Time     =10;
extern double                H_Bullish_Engulfing_Bottom_Wick_Size_Maximum_1_Time     =10;
extern double                H_Bearish_Engulfing_Top_Wick_Size_Maximum_1_Time     =1;
extern double                H_Bearish_Engulfing_Bottom_Wick_Size_Maximum_1_Time     =10;
extern double               H_Piercing_Candle_Top_Wick_Size_Maximum_1_Time     =10;
extern double                H_Piercing_Candle_Bottom_Wick_Size_Maximum_1_Time     =10;
extern double                H_Piercing_Candle_Pierce_Factor_Minimum_100_Percentage     =50;
extern double               H_Dark_Cloud_Cover_Top_Wick_Size_Maximum_1_Time     =10;
extern double                H_Dark_Cloud_Cover_Bottom_Wick_Size_Maximum_1_Time     =10;
extern double                H_Dark_Cloud_Cover_Pierce_Factor_Minimum_100_Percentage     =50;
extern double                H_Bullish_Hammer_Bottom_Wick_Size_Minimum_2_Time =2;
extern double               H_Bullish_Hammer_Top_Wick_Size_Maximum_1_Time     =100;
extern double                H_Bearish_Hammer_Bottom_Wick_Size_Maximum_1_Time  =100;
extern double                H_Bearish_Hammer_Top_Wick_Size_Minimum_2_Time     =2;
extern double                H_Bullish_Inverted_Hammer_Bottom_Wick_Size_Maximum_1_Time  =100;
extern double               H_Bullish_Inverted_Hammer_Top_Wick_Size_Minimum_2_Time     =2;
extern double                H_Bearish_Inverted_Hammer_Bottom_Wick_Size_Minimum_2_Time  =2;
extern double               H_Bearish_Inverted_Hammer_Top_Wick_Size_Maximum_1_Time     =100;
input string                H_LengthyDivergenceSettings_______________="H_LengthyDivergence_______________";
extern bool                  H_Show_Lengthy_Divergence              = true;
extern bool                  H_Show_Long_Lengthy_Divergence              = true;
extern bool                  H_Show_Short_Lengthy_Divergence              = true;
input string                H_RSI_settings_Lengthy                     = "H_RSI_Settings_Lengthy ---------------------------------------------------------";
input int                   H_RSI_period_Lengthy                        = 14;
input ENUM_APPLIED_PRICE    H_RSI_applied_price_Lengthy                 = 0;
extern bool                  H_RSI_Filter_Lengthy                        = false;
input int                   H_bearish_Level_Lengthy                     = 70;
input int                   H_bulish_Level_Lengthy                      = 30;
input int                   H_Signal_Bar_Lengthy                        = 2;
input string               H_Graphic_Setting_Lengthy                      ="H_Graphic_Setting_Lengthy  ---------------------------------------------------------";
input bool                  H_DrawIndicatorTrendLines_Lengthy          = true;
input bool                  H_DrawPriceTrendLines_Lengthy               = true;
input color                 H_LongColour_Lengthy                        = clrBlue;
input color                 H_ShortColour_Lengthy                       = clrRed;
input color                H_Arrow_LongColour_Lengthy                        = clrBlue;
input color                  H_Arrow_ShortColour_Lengthy                       = clrRed;
input uchar                 H_LongArrowCode_Lengthy                     = 251;
input uchar                 H_ShortArrowCode_Lengthy                    = 251;
input int                   H_ArrowSize_Lengthy                         = 0;
input int                   H_Divergence_Line_Width_Lengthy             =1;
input color                 H_RSIColour_Lengthy                         = clrGoldenrod;
input ENUM_LINE_STYLE       H_RSIStyle_Lengthy                          = 0;
input int                   H_RSIWidth_Lengthy                          = 1;
input bool                  H_DisplayCard_Lengthy                 =True;
input  string               H_Alarm_Setting_Lengthy                      ="H_Alarm_Setting_Lengthy ---------------------------------------------------------";
input bool                 H_Alert_With_Candle_Pattern_LONG_Lengthy                    =false;
input bool                 H_Alert_With_Candle_Pattern_SHORT_Lengthy                    =false;
input bool                  H_DisplayAlert_Divergence_LONG_Lengthy                      =false;
input bool                  H_DisplayAlert_Divergence_SHORT_Lengthy                      = false;
input string                  H_Sound_Divergence_LONG_Lengthy                     = "alert.wav";
input bool                  H_Sound_Enable_Divergence_LONG_Lengthy                     = false;
input string                  H_Sound_Divergence_SHORT_Lengthy                     = "alert.wav";
input bool                  H_Sound_Enable_Divergence_SHORT_Lengthy                     = false;
input bool                 H_DisplayAlert_Lengthy                       = false;
input bool                  H_DisplayNotification_Lengthy               = false;
input bool                  H_Send_eMail_Lengthy                        = true;
input  string               H_Candle_Confirmations_Setting_Lengthy                      =" H_Candle_Confirmations_Setting_Lengthy  ---------------------------------------------------------";
extern bool                  H_Candle_Confirmations_LONG_Lengthy              =True;
extern bool                  H_Candle_Confirmations_SHORT_Lengthy              =True;
input bool                  H_Candle_Confirmations_Alert_LONG_Lengthy               =false;
input bool                  H_Candle_Confirmations_Alert_SHORT_Lengthy              =false;
input string                  H_Candle_Confirmations_Alert_Sound_SHORT_Lengthy                     = "alert.wav";
input bool                  H_Candle_Confirmations_Alert_Sound_Enable_SHORT_Lengthy                      = false;
input string                  H_Candle_Confirmations_Alert_Sound_LONG_Lengthy                     = "alert.wav";
input bool                  H_Candle_Confirmations_Alert_Sound_Enable_LONG_Lengthy                      = false;
input  string               H_Confirmation_candle_Breakout_Setting_Lengthy                      =" H_Confirmation_candle_Breakout_Setting_Lengthy  ---------------------------------------------------------";
extern bool                  H_Confirmation_candle_Breakout_LONG_Lengthy   =True;
extern bool                  H_Confirmation_candle_Breakout_SHORT_Lengthy   =True;
input bool                  H_Confirmation_candle_Breakout_Alert_LONG_Lengthy   =false;
input bool                  H_Confirmation_candle_Breakout_Alert_SHORT_Lengthy   =false;
input string                  H_Confirmation_candle_Breakout_Alert_Sound_SHORT_Lengthy                     = "alert.wav";
input bool                  H_Confirmation_candle_Breakout_Alert_Sound_Enable_SHORT_Lengthy                      =false;
input string                  H_Confirmation_candle_Breakout_Alert_Sound_LONG_Lengthy                     = "alert.wav";
input bool                  H_Confirmation_candle_Breakout_Alert_Sound_Enable_LONG_Lengthy                      = false;

input  string               H_Candle_Pattern_Setting_Lengthy                      ="   H_Candle_Pattern_Setting_Lengthy  ---------------------------------------------------------";
extern bool                  H_Bullish_Hammer_Lengthy                    =True;
extern bool                  H_Bullish_Inverted_Hammer_Lengthy           =True;
extern bool                  H_Bearish_Hammer_Lengthy                    =True;
extern bool                  H_Bearish_Inverted_Hammer_Lengthy           =True;
extern bool                  H_Bullish_Engulfing_Lengthy                   =True;
extern bool                  H_Bearish_Engulfing_Lengthy          =True;
extern bool                  H_Piercing_Candle_Lengthy                   =True;
extern bool                  H_Dark_Cloud_Cover_Lengthy          =True;
extern bool                  H_Bullish_Sash_Lengthy                   =True;
extern bool                  H_Bearish_Sash_Lengthy          =True;
extern bool                  H_Morning_Star_Lengthy                    =True;
extern bool                  H_Evening_Star_Lengthy           =True;
extern double                H_Morning_Star_Candle_1_Body_Size_Minimum_Lengthy=3/1;
extern double               H_Morning_Star_Candle_2_Body_Size_Maximum_Lengthy=0.33;
extern double                H_Morning_Star_Candle_2_Body_Top_Wick_Size_Maximum_Lengthy=10;
extern double                H_Morning_Star_Candle_2_Body_Bottom_Wick_Size_Maximum_Lengthy=10;
extern double                H_Morning_Star_Candle_3_Body_Size_Minimum_Lengthy =0.66;

extern double                H_Evening_Star_Candle_1_Body_Size_Minimum_Lengthy=3/1;
extern double               H_Evening_Star_Candle_2_Body_Size_Maximum_Lengthy=0.33;
extern double                H_Evening_Star_Candle_2_Body_Top_Wick_Size_Maximum_Lengthy=10;
extern double                H_Evening_Star_Candle_2_Body_Bottom_Wick_Size_Maximum_Lengthy=10;
extern double                H_Evening_Star_Candle_3_Body_Size_Minimum_Lengthy =0.66;
extern double                H_Bullish_Sash_Bottom_Wick_Size_Maximum_1_Time_Lengthy     =10;
extern double                H_Bearish_Sash_Top_Wick_Size_Maximum_1_Time_Lengthy     =10;
extern double                H_Bullish_Engulfing_Top_Wick_Size_Maximum_1_Time_Lengthy      =10;
extern double                H_Bullish_Engulfing_Bottom_Wick_Size_Maximum_1_Time_Lengthy      =10;
extern double                H_Bearish_Engulfing_Top_Wick_Size_Maximum_1_Time_Lengthy      =10;
extern double                H_Bearish_Engulfing_Bottom_Wick_Size_Maximum_1_Time_Lengthy      =10;
extern double                H_Piercing_Candle_Top_Wick_Size_Maximum_1_Time_Lengthy      =10;
extern double                H_Piercing_Candle_Bottom_Wick_Size_Maximum_1_Time_Lengthy      =10;
extern double                H_Piercing_Candle_Pierce_Factor_Minimum_100_Percentage_Lengthy      =50;
extern double                H_Dark_Cloud_Cover_Top_Wick_Size_Maximum_1_Time_Lengthy      =10;
extern double                H_Dark_Cloud_Cover_Bottom_Wick_Size_Maximum_1_Time_Lengthy      =10;
extern double                H_Dark_Cloud_Cover_Pierce_Factor_Minimum_100_Percentage_Lengthy      =50;
extern double                H_Bullish_Hammer_Bottom_Wick_Size_Minimum_2_Time_Lengthy  =2;
extern double                H_Bullish_Hammer_Top_Wick_Size_Maximum_1_Time_Lengthy      =100;
extern double                H_Bearish_Hammer_Bottom_Wick_Size_Maximum_1_Time_Lengthy   =100;
extern double                H_Bearish_Hammer_Top_Wick_Size_Minimum_2_Time_Lengthy      =2;
extern double                H_Bullish_Inverted_Hammer_Bottom_Wick_Size_Maximum_1_Time_L   =100;
extern double                H_Bullish_Inverted_Hammer_Top_Wick_Size_Minimum_2_Time_Lengthy      =2;
extern double                H_Bearish_Inverted_Hammer_Bottom_Wick_Size_Minimum_2_Time_L   =2;
extern double                H_Bearish_Inverted_Hammer_Top_Wick_Size_Maximum_1_Time_Lengthy      =100;
input string                Tables_Setting_______________="Tables Setting_______________";
input string                Fibbo_Table_______________="Fibbo_Table Setting_______________";
input bool                  Fibbo_Table_Enable        =true;
input color                 Fibbo_Table_Borader_Color=clrMediumBlue;
input color                 Fibbo_Table_BackGround_Color=clrWhite;
input color                 Fibbo_Table_Text_Color=clrMediumBlue;
input color                 Fibbo_Table_vlaue_Color=clrMediumBlue;
input color                 Fibbo_Table_color_Box_Neutral=clrDarkGray;
input color                 Fibbo_Table_color_Box_Entry=clrBlue;
input color                 Fibbo_Table_color_Box_Stop_Loss=clrRed;
input color                 Fibbo_Table_color_Box_Take_Profit=clrGreen;
input string                Display_Table_______________="Display_Table_______________";
input bool                  Display_Table_Enable        =true;
input color                 Display_Table_Borader_Color=clrMediumBlue;
input color                 Display_Table_BackGround_Color=clrWhite;
input color                 Display_Table_Text_Color=clrMediumBlue;
input color                 Display_Table_vlaue_Color=clrMediumBlue;
input string                Difference_Table_______________="Difference_Table Setting_______________";
input bool                  Difference_Table_Enable        =true;
input color                 Difference_Table_Borader_Color=clrMediumBlue;
input color                 Difference_Table_BackGround_Color=clrWhite;
input color                 Difference_Table_Text_Color=clrMediumBlue;
input color                 Difference_Table_vlaue_Color=clrMediumBlue;
input string                Risk_Table_______________="Risk_Table Setting_______________";
input bool                  Risk_Table_Enable        =true;
input color                 Risk_Table_Borader_Color=clrMediumBlue;
input color                 Risk_Table_BackGround_Color=clrWhite;
input color                 Risk_Table_Text_Color=clrMediumBlue;
input color                 Risk_Table_vlaue_Color=clrMediumBlue;
extern string              ADX_Setting        =" =========== ADX_Setting ===========";
input ADX_mod              ADX_Strength=Both;
extern int                 ADX_Period   =14;
extern ENUM_APPLIED_PRICE  ADX_Price    =0;
extern ENUM_TIMEFRAMES TF_Zone=PERIOD_H4;
extern int                 ADX_Percentage=20;
extern int                 DI_Plus_Percentage=20;
extern int                DI_Negative_Percentage=20;
extern bool             Buy_Zone_Enable=true;
extern bool             Sell_Zone_Enable=true;
extern bool             Neutral_Zone_Enable=true;
color             Buy_Color=clrGreen;
color             Sell_Color=clrRed;
color             Neutral_Color=clrYellow;
extern string              Filter_Setting        =" =========== Filter_Setting ===========";
extern bool                Filters_Enable=true;
extern bool                Filter_Enable_Normal_Divergence=true;
extern bool                Filter_Enable_Hidden_Divergence=true;
extern string              ADX_Filter_Setting        =" =========== ADX_Filter_Setting ===========";
extern bool ADX_Filter_Enable  =true;
extern bool                ADX_Filter_Enable_Normal_Divergence=true;
extern bool                 ADX_Filter_Enable_Hidden_Divergence=true;
extern bool Without_Zone=true;
extern bool Neutral_Zone=true;
input bool  Arrow_Candle_Zone_Filter=true;
input bool  Confirmation_Candle_Breakout_Zone =true;
extern string              MA_Filter_Setting        =" =========== MA_Filter_Setting ===========";
extern bool               MA_Filert_Enable=true;
extern bool                MA_Filter_Enable_Normal_Divergence=true;
extern bool                 MA_Filter_Enable_Hidden_Divergence=true;
extern bool               fastMA_Filter=true;
extern bool               slowMA_Filter=true;
extern int                 fastMAPeriod   =40;//Fast MA Period
extern int                 fastMAShift    =0;//Fast MA Shift
extern ENUM_MA_METHOD      fastMAMethod   =0;//Fast MA Method
extern ENUM_APPLIED_PRICE  fastMAPrice    =0;//Fast MA Applied Price
extern int                 slowMAPeriod   =110;//Slow MA Period
extern int                 slowMAShift    =0;//Slow MA Shift
extern ENUM_MA_METHOD      slowMAMethod   =0;//Slow MA Method
extern ENUM_APPLIED_PRICE  slowMAPrice    =0;//Slow MA Applied Price



double rsi_L[],rsi[];
double dType[];
double dUnvalid[];
double dValid[];
double dCandlePatren[];
double dRSId[];
double dRSIdp[];
double Dopen[];
double Dclose[];
double Ddiff[];
double dType2[];
double dEn2 [];
double dEn1[];
double dSL[];
double dTr4[];
double dTr3[];
double dTr2[];
double dTr1[];
double dLot2[];
double dLot1[];
double dDelete[];
double dLD[];
double dAD[];
double dTD[];
double dRD[];
double long_BE_div_Vali_level;
double long_BE_div_UnVali_level;
double long_BU_div_Vali_level;
double long_BU_div_UnVali_level;
double Dir_BE_div_Vali_level;
double Dir_BE_div_UnVali_level;
double Dir_BU_div_Vali_level;
double Dir_BU_div_UnVali_level;
double H_long_BE_div_Vali_level;
double H_long_BE_div_UnVali_level;
double H_long_BU_div_Vali_level;
double H_long_BU_div_UnVali_level;
double H_Dir_BE_div_Vali_level;
double H_Dir_BE_div_UnVali_level;
double H_Dir_BU_div_Vali_level;
double H_Dir_BU_div_UnVali_level;

datetime last_vali_dive_t;
bool  Dir_BU_div_CCB_trig=false;
bool Long_BU_div_CCB_trig=false;
bool Dir_BE_div_CCB_trig=false;
bool Long_BE_div_CCB_trig=false;

bool  H_Dir_BU_div_CCB_trig=false;
bool H_Long_BU_div_CCB_trig=false;
bool H_Dir_BE_div_CCB_trig=false;
bool H_Long_BE_div_CCB_trig=false;

bool Dir_BU_div_CC_trig=false;
bool Dir_BE_div_CC_trig=false;
bool Long_BU_div_CC_trig=false;
bool Long_BE_div_CC_trig=false;

bool H_Dir_BU_div_CC_trig=false;
bool H_Dir_BE_div_CC_trig=false;
bool H_Long_BU_div_CC_trig=false;
bool H_Long_BE_div_CC_trig=false;

bool Dir_BU_div_CP_trig=false;
bool Long_BU_div_CP_trig=false;
bool Dir_BE_div_CP_trig=false;
bool Long_BE_div_CP_trig=false;



bool H_Dir_BU_div_CP_trig=false;
bool H_Long_BU_div_CP_trig=false;
bool H_Dir_BE_div_CP_trig=false;
bool H_Long_BE_div_CP_trig=false;


bool Dir_BU_div_del_trig=false;
bool Dir_BE_div_del_trig=false;
bool Long_BU_div_del_trig=false;
bool Long_BE_div_del_trig=false;

bool H_Dir_BU_div_del_trig=false;
bool H_Dir_BE_div_del_trig=false;
bool H_Long_BU_div_del_trig=false;
bool H_Long_BE_div_del_trig=false;
string ArroUP_NAME="";
string ArroDn_NAME="";
int                   Max_Bars= 15;
int                   Max_Bars_Lengthy= 100;
int                   H_Max_Bars= 15;
int                   H_Max_Bars_Lengthy= 100;
static datetime lastAlertTime;
static datetime lastAlertTime_LCCB;
static datetime  lastAlertTime_CCB2;
static datetime  lastAlertTime_LCCB2;
static string   indicatorName;
string RSILine,PriceLine;
double point,range,range2;
string TextNAME_U="";
string TextNAME_D="";
string RECNAME_U="";
string RECNAME_D="";
bool CC_valid_state=false;
bool CP_valid_state=false;
bool CCB_valid_state=false;
int BUH_state_long_div=0;
int BUIH_state_long_div=0;
int BEH_state_long_div=0;
int BEIH_state_long_div=0;
int BUE_state_long_div=0;
int BEE_state_long_div=0;
int PC_state_long_div=0;
int DCC_state_long_div=0;
int BUS_state_long_div=0;
int BES_state_long_div=0;
int MS_state_long_div=0;
int ES_state_long_div=0;
int BUH_state_Dir_div=0;
int BUIH_state_Dir_div=0;
int BEH_state_Dir_div=0;
int BEIH_state_Dir_div=0;
int BUE_state_Dir_div=0;
int BEE_state_Dir_div=0;
int PC_state_Dir_div=0;
int DCC_state_Dir_div=0;
int BUS_state_Dir_div=0;
int BES_state_Dir_div=0;
int MS_state_Dir_div=0;
int ES_state_Dir_div=0;
int H_BUH_state_long_div=0;
int H_BUIH_state_long_div=0;
int H_BEH_state_long_div=0;
int H_BEIH_state_long_div=0;
int H_BUE_state_long_div=0;
int H_BEE_state_long_div=0;
int H_PC_state_long_div=0;
int H_DCC_state_long_div=0;
int H_BUS_state_long_div=0;
int H_BES_state_long_div=0;
int H_MS_state_long_div=0;
int H_ES_state_long_div=0;
int H_BUH_state_Dir_div=0;
int H_BUIH_state_Dir_div=0;
int H_BEH_state_Dir_div=0;
int H_BEIH_state_Dir_div=0;
int H_BUE_state_Dir_div=0;
int H_BEE_state_Dir_div=0;
int H_PC_state_Dir_div=0;
int H_DCC_state_Dir_div=0;
int H_BUS_state_Dir_div=0;
int H_BES_state_Dir_div=0;
int H_MS_state_Dir_div=0;
int H_ES_state_Dir_div=0;
int long_BU_dive_CC_state=0;
int long_BE_dive_CC_state=0;
int Dir_BU_dive_CC_state=0;
int Dir_BE_dive_CC_state=0;
int H_long_BU_dive_CC_state=0;
int H_long_BE_dive_CC_state=0;
int H_Dir_BU_dive_CC_state=0;
int H_Dir_BE_dive_CC_state=0;

double EP_N=0;
double EP2_N=0;
double SL_N=0;
double tr1_N=0;
double tr2_N=0;
double tr3_N=0;
double tr4_N=0;
datetime TD_N;
double EP_S=0;
double EP2_S=0;
double SL_S=0;
double tr1_S=0;
double tr2_S=0;
double tr3_S=0;
double tr4_S=0;
string Pattern_S="";
datetime TD_S;
string Sig_S;
string Sig_N;
string CC_STATE;
string CCB_STATE;
bool Long_dive_CCB_OA_state=false;
bool Long_dive_CC_OA_state=false;
bool Long_dive_CP_OA_state=false;
bool Dir_dive_CCB_OA_state=false;
bool Dir_dive_CC_OA_state=false;
int Dir_dive_CP_OA_state=false;
bool H_Long_dive_CCB_OA_state=false;
bool H_Long_dive_CC_OA_state=false;
bool H_Long_dive_CP_OA_state=false;
bool H_Dir_dive_CCB_OA_state=false;
bool H_Dir_dive_CC_OA_state=false;
int H_Dir_dive_CP_OA_state=false;
string TF_NOW;
bool Un_Switch=true;
bool Va_Switch=true;
bool Fib_Switch=false;
bool Fib_Switch_Lengthy=false;
string Pattern_Name="";
color cl_EN_N;
color cl_EN2_N;
color cl_SL_N;
color cl_TR1_N;
color cl_TR2_N;
color cl_TR3_N;
color cl_EN_S;
color cl_EN2_S;
color cl_SL_S;
color cl_TR1_S;
color cl_TR2_S;
color cl_TR3_S=clrDarkOliveGreen;
datetime TS;
bool U_USE=false;
bool V_USE=false;
bool Dir_BU_div_alarm_trig=false;
bool Dir_BE_div_alarm_trig=false;
bool Long_BU_div_alarm_trig=false;
bool Long_BE_div_alarm_trig=false;

bool H_Dir_BU_div_alarm_trig=false;
bool H_Dir_BE_div_alarm_trig=false;
bool H_Long_BU_div_alarm_trig=false;
bool H_Long_BE_div_alarm_trig=false;

bool EN2BA=false;
bool EN2SA=false;
datetime LastD;
bool OnButton=true;
bool OffButton=true;
bool CCB_Alert_BU_Dir_trig=false;
bool CCB_Alert_BE_Dir_trig=false;
bool CCB_Alert_BU_Long_trig=false;
bool CCB_Alert_BE_Long_trig=false;

bool H_CCB_Alert_BU_Dir_trig=false;
bool H_CCB_Alert_BE_Dir_trig=false;
bool H_CCB_Alert_BU_Long_trig=false;
bool H_CCB_Alert_BE_Long_trig=false;

string r6n;
string r6s;
int x1n;
int x1s;
datetime x6n;
datetime x6s;
double f6n;
double f6s;
datetime x7n;
datetime x7s;
double f7n;
double f7s;
color x3n;
color x3s;
int x4n;
int x4s;
int x5n;
int x5s;
string Rr6n;
string Rr6s;
int Rx1n;
int Rx1s;
datetime Rx6n;
datetime Rx6s;
double Rf6n;
double Rf6s;
datetime Rx7n;
datetime Rx7s;
double Rf7n;
double Rf7s;
color Rx3n;
color Rx3s;
int Rx4n;
int Rx4s;
int Rx5n;
int Rx5s;

double SE1D;
double SE2D;
double T1E1D;
double T1E2D;
double T2E1D;
double T2E2D;
double T3E1D;
double T3E2D;
double T4E1D;
double T4E2D;
double lot_En1;
double lot_En2;
string Longmsg;
double MMOVE=5000;
bool mfirst=true;
bool last_dive_deleted=false;
int Lshift;
int  KLONG=0;
string Massage_BOX;
string Email_BOX;
string Alert_BOX;
string PN="";
bool CP_del_Dir_div=true;
bool CP_del_Long_div=true;
bool H_CP_del_Dir_div=true;
bool H_CP_del_Long_div=true;
bool Dir_BU_div_trig=false;
bool Long_BU_div_trig=false;
bool Dir_BE_div_trig=false;
bool Long_BE_div_trig=false;
datetime Trefresh;
double MAA=0;
bool GState=false;
bool YState=false;
bool RState=false;
bool NZ=false;
int PSD=0;
datetime CST=0;
double CH=0;
double CL=0;
double Buy_Z[];
double Sell_Z[];
double Neutral_Z[];
double White_Z[];
int CBar=0;
bool Long_dive_Zone_State=true;
bool Dir_dive_Zone_State=true;
bool Long_Arrow_Zone_trig=false;
bool Dir_Arrow_Zone_trig=false;
bool Long_fast_MA_trig=false;
bool Long_slow_MA_trig=false;
bool Dir_fast_MA_trig=false;
bool Dir_slow_MA_trig=false;
bool Long_CCB_Zone_trig=false;
bool Dir_CCB_Zone_trig=false;

string DIV_TYPE;
double window_width;

void Cal_i(int countedBars)
  {
   for(int i =Bars-countedBars; i>=0; i--)
     {
      if(i<Bars-RSI_period && i<Bars-RSI_period_Lengthy && i<=Maximum_Bars)
        {

         ADX_ZONE_Maker(i,Bars-countedBars);
         ChartRedraw();
         Dclose[i]=Close[i+3];
         Dopen[i]=Open[i+2];
         MAA=iMA(NULL,0,40,0,MODE_EMA,PRICE_CLOSE,i);
         if(Show_Graphic_Object)
           {
          
            DeleteMachine(i);
           }
         Divergence_Alert_Maker(i);


         TRSI(i);
         if(Show_Lengthy_Divergence)
           {
            if(Enable_Normal_Divergence)
              {

               if(Show_Long_Lengthy_Divergence)
                  Long_BU_div_detec(i+Signal_Bar_Lengthy);
               if(Show_Short_Lengthy_Divergence)
                  Long_BE_div_detec(i+Signal_Bar_Lengthy);


             
               if((dType[i+3]==2 || dType[i+3]==4)  &&Long_Arrow_Zone_trig && Arrow_Candle_Zone_Filter && ADX_Filter_Enable && Filters_Enable && Filter_Enable_Normal_Divergence && ADX_Filter_Enable_Normal_Divergence)
                 {
                  ADX_ZONE_Arrow_Filter(i+3);

                  Long_Arrow_Zone_trig=false;

                 }
               if((dType[i+3]==2 || dType[i+3]==4)  &&Long_fast_MA_trig && fastMA_Filter && MA_Filert_Enable && Filters_Enable&& Filter_Enable_Normal_Divergence&& MA_Filter_Enable_Normal_Divergence)
                 {
                  fast_MA_Filter(i+3);

                  Long_fast_MA_trig=false;

                 }
               if((dType[i+3]==2 || dType[i+3]==4)  &&Long_slow_MA_trig && slowMA_Filter && MA_Filert_Enable && Filters_Enable&& Filter_Enable_Normal_Divergence&& MA_Filter_Enable_Normal_Divergence)
                 {
                  slow_MA_Filter(i+3);

                  Long_slow_MA_trig=false;

                 }





               if(dType[i+3]==2 &&  Candle_Confirmations_LONG_Lengthy && Long_BU_div_CC_trig  && LastD==Time[i+3])
                 {
                  long_BU_dive_CC_state=Long_BU_div_CC_detec(i); 


                 }
               else


                  if(dType[i+3]==4 &&   Candle_Confirmations_SHORT_Lengthy    &&  Long_BE_div_CC_trig  && LastD==Time[i+3])
                    {
                     long_BE_dive_CC_state=Long_BE_div_CC_detec(i); 

                    }

               if(dType[i+3]==2 && Bullish_Hammer_Lengthy && (Long_BU_div_CP_trig))
                 {

                  BUH_state_long_div=Bullish_Hammer_Detection(0,1,i, Bullish_Hammer_Bottom_Wick_Size_Minimum_2_Time_Lengthy,Bearish_Hammer_Top_Wick_Size_Minimum_2_Time_Lengthy);
                 }
               if(dType[i+3]==2 && Bullish_Hammer_Lengthy && (Long_BU_div_CP_trig) && BUH_state_long_div==1)
                 {

                  CP_del_Long_div=false;
                 }


               if(dType[i+3]==2 &&Bullish_Inverted_Hammer_Lengthy && (Long_BU_div_CP_trig)) 
                 {

                  BUIH_state_long_div= Bullish_Inverted_Hammer_Detection(0,1,i,  Bullish_Inverted_Hammer_Bottom_Wick_Size_Maximum_1_Time_Lengthy,  Bullish_Inverted_Hammer_Top_Wick_Size_Minimum_2_Time_Lengthy);
                 }
               if(dType[i+3]==2 &&Bullish_Inverted_Hammer_Lengthy && (Long_BU_div_CP_trig) && BUIH_state_long_div==1)
                 {
                  CP_del_Long_div=false;
                 }

               if(dType[i+3]==4 &&Bearish_Hammer_Lengthy&& (Long_BE_div_CP_trig)) 
                 {

                  BEH_state_long_div=Bearish_Hammer_Detection(0,1,i,Bearish_Hammer_Bottom_Wick_Size_Maximum_1_Time_Lengthy, Bearish_Hammer_Top_Wick_Size_Minimum_2_Time_Lengthy);
                 }
               if(dType[i+3]==4 &&Bearish_Hammer_Lengthy&& (Long_BE_div_CP_trig) && BEH_state_long_div==1)
                 {
                  CP_del_Long_div=false;
                 }


               if(dType[i+3]==4 && Bearish_Inverted_Hammer_Lengthy && (Long_BE_div_CP_trig)) 
                 {

                  BEIH_state_long_div=Bearish_Inverted_Hammer_Detection(0,1,i,    Bearish_Inverted_Hammer_Bottom_Wick_Size_Minimum_2_Time_Lengthy, Bearish_Inverted_Hammer_Top_Wick_Size_Maximum_1_Time_Lengthy);

                 }
               if(dType[i+3]==4 && Bearish_Inverted_Hammer_Lengthy && (Long_BE_div_CP_trig) && BEIH_state_long_div==1)
                 {

                  CP_del_Long_div=false;

                 }
               if(dType[i+3]==2 && Bullish_Engulfing_Lengthy && (Long_BU_div_CP_trig))
                 {

                  BUE_state_long_div=Bullish_Engulfing_Detection(0,1,i, Bullish_Engulfing_Bottom_Wick_Size_Maximum_1_Time_Lengthy,Bullish_Engulfing_Top_Wick_Size_Maximum_1_Time_Lengthy);
                 }
               if(dType[i+3]==2 && Bullish_Engulfing_Lengthy && (Long_BU_div_CP_trig) && BUE_state_long_div==1)
                 {
                  CP_del_Long_div=false;

                 }
               if(dType[i+3]==4 && Bearish_Engulfing_Lengthy && (Long_BE_div_CP_trig))
                 {

                  BEE_state_long_div=Bearish_Engulfing_Detection(0,1,i, Bearish_Engulfing_Bottom_Wick_Size_Maximum_1_Time_Lengthy,Bearish_Engulfing_Top_Wick_Size_Maximum_1_Time_Lengthy);
                 }
               if(dType[i+3]==4 && Bearish_Engulfing_Lengthy && (Long_BE_div_CP_trig) && BEE_state_long_div==1)
                 {

                  CP_del_Long_div=false;
                 }


               if(dType[i+3]==2 && Piercing_Candle_Lengthy && (Long_BU_div_CP_trig))
                 {

                  PC_state_long_div=Piercing_Candle_Detection(0,1,i, Piercing_Candle_Bottom_Wick_Size_Maximum_1_Time_Lengthy, Piercing_Candle_Top_Wick_Size_Maximum_1_Time_Lengthy, Piercing_Candle_Pierce_Factor_Minimum_100_Percentage_Lengthy);
                 }
               if(dType[i+3]==2 && Piercing_Candle_Lengthy && (Long_BU_div_CP_trig) &&PC_state_long_div==1)
                 {

                  CP_del_Long_div=false;
                 }

               if(dType[i+3]==4 && Dark_Cloud_Cover_Lengthy && (Long_BE_div_CP_trig))
                 {

                  DCC_state_long_div=Dark_Cloud_Cover_Detection(0,1,i, Dark_Cloud_Cover_Bottom_Wick_Size_Maximum_1_Time_Lengthy,Dark_Cloud_Cover_Top_Wick_Size_Maximum_1_Time_Lengthy,Dark_Cloud_Cover_Pierce_Factor_Minimum_100_Percentage_Lengthy);
                 }
               if(dType[i+3]==4 && Dark_Cloud_Cover_Lengthy && (Long_BE_div_CP_trig) && DCC_state_long_div==1)
                 {
                  CP_del_Long_div=false;
                 }
               if(dType[i+3]==2 && Bullish_Sash_Lengthy && (Long_BU_div_CP_trig))
                 {

                  BUS_state_long_div=Bullish_Sash_Detection(0,1,i,Bullish_Sash_Bottom_Wick_Size_Maximum_1_Time_Lengthy);
                 }
               if(dType[i+3]==2 && Bullish_Sash_Lengthy && (Long_BU_div_CP_trig) && BUS_state_long_div==1)
                  CP_del_Long_div=false;
               if(dType[i+3]==4 && Bearish_Sash_Lengthy && (Long_BE_div_CP_trig))
                 {

                  BES_state_long_div=Bearish_Sash_Detection(0,1,i,Bearish_Sash_Top_Wick_Size_Maximum_1_Time_Lengthy);
                 }
               if(dType[i+3]==4 &&  Bearish_Sash_Lengthy && (Long_BE_div_CP_trig) && BES_state_long_div==1)
                  CP_del_Long_div=false;

               if(dType[i+3]==2 && Morning_Star_Lengthy && (Long_BU_div_CP_trig))
                 {

                  MS_state_long_div=Morning_Star_Detection(0,1,i, Morning_Star_Candle_2_Body_Bottom_Wick_Size_Maximum_Lengthy,Morning_Star_Candle_2_Body_Top_Wick_Size_Maximum_Lengthy,
                                    Morning_Star_Candle_3_Body_Size_Minimum_Lengthy,Morning_Star_Candle_1_Body_Size_Minimum_Lengthy,Morning_Star_Candle_2_Body_Size_Maximum_Lengthy);
                 }
               if(dType[i+3]==2 && Morning_Star_Lengthy && (Long_BU_div_CP_trig) &&  MS_state_long_div==1)
                  CP_del_Long_div=false;
               if(dType[i+3]==4 && Evening_Star_Lengthy && (Long_BE_div_CP_trig))
                 {

                  ES_state_long_div=Evening_Star_Detection(0,1,i, Evening_Star_Candle_2_Body_Bottom_Wick_Size_Maximum_Lengthy,Evening_Star_Candle_2_Body_Top_Wick_Size_Maximum_Lengthy,
                                    Evening_Star_Candle_3_Body_Size_Minimum_Lengthy,Evening_Star_Candle_1_Body_Size_Minimum_Lengthy,Evening_Star_Candle_2_Body_Size_Maximum_Lengthy);
                 }
               if(dType[i+3]==4 &&  Evening_Star_Lengthy && (Long_BE_div_CP_trig) && ES_state_long_div==1)
                  CP_del_Long_div=false;
              }
            if(Enable_Hidden_Divergence && H_Show_Lengthy_Divergence)
              {


               if(H_Show_Long_Lengthy_Divergence)
                  H_Long_BU_div_detec(i+H_Signal_Bar_Lengthy);
               if(H_Show_Short_Lengthy_Divergence)
                  H_Long_BE_div_detec(i+H_Signal_Bar_Lengthy);
               // dType[i]>9 && dType[i+1]<9 &&
               if((dType[i+3]==6 || dType[i+3]==8)  && Long_Arrow_Zone_trig && Arrow_Candle_Zone_Filter&& ADX_Filter_Enable&& Filters_Enable&& Filter_Enable_Hidden_Divergence && ADX_Filter_Enable_Hidden_Divergence)
                 {
                  ADX_ZONE_Arrow_Filter(i+3);

                  Long_Arrow_Zone_trig =false;

                 }
               if((dType[i+3]==6 || dType[i+3]==8)  &&Long_fast_MA_trig && fastMA_Filter&& MA_Filert_Enable&& Filters_Enable&& Filter_Enable_Hidden_Divergence&& MA_Filter_Enable_Hidden_Divergence)
                 {
                  fast_MA_Filter(i+3);

                  Long_fast_MA_trig=false;

                 }
               if((dType[i+3]==6 || dType[i+3]==8)  &&Long_slow_MA_trig && slowMA_Filter&& MA_Filert_Enable&& Filters_Enable&& Filter_Enable_Hidden_Divergence&& MA_Filter_Enable_Hidden_Divergence)
                 {
                  slow_MA_Filter(i+3);

                  Long_slow_MA_trig=false;

                 }




               if(dType[i+3]==6 &&  H_Candle_Confirmations_LONG_Lengthy && H_Long_BU_div_CC_trig  && LastD==Time[i+3])//Cecking for enableing bulish-CC key and also divergence must happened 3 candle before
                 {

                  H_long_BU_dive_CC_state=H_Long_BU_div_CC_detec(i); 


                 }



               if(dType[i+3]==8 &&   H_Candle_Confirmations_SHORT_Lengthy    &&  H_Long_BE_div_CC_trig  && LastD==Time[i+3]) //Cecking for enableing bearish-CC key and also divergence must happened 3 candle before
                 {
                  H_long_BE_dive_CC_state=H_Long_BE_div_CC_detec(i); 

                 }

               if(dType[i+3]==6 && H_Bullish_Hammer_Lengthy && (H_Long_BU_div_CP_trig))
                 {

                  H_BUH_state_long_div=Bullish_Hammer_Detection(1,1,i, H_Bullish_Hammer_Bottom_Wick_Size_Minimum_2_Time_Lengthy,H_Bearish_Hammer_Top_Wick_Size_Minimum_2_Time_Lengthy);
                 }
               if(dType[i+3]==6 && H_Bullish_Hammer_Lengthy && (H_Long_BU_div_CP_trig) && H_BUH_state_long_div==1)
                 {

                  CP_del_Long_div=false;
                 }


               if(dType[i+3]==6 &&H_Bullish_Inverted_Hammer_Lengthy && (H_Long_BU_div_CP_trig)) 
                 {

                  H_BUIH_state_long_div= Bullish_Inverted_Hammer_Detection(1,1,i,  H_Bullish_Inverted_Hammer_Bottom_Wick_Size_Maximum_1_Time_L,  H_Bullish_Inverted_Hammer_Top_Wick_Size_Minimum_2_Time_Lengthy);
                 }
               if(dType[i+3]==6 &&H_Bullish_Inverted_Hammer_Lengthy && (H_Long_BU_div_CP_trig) && H_BUIH_state_long_div==1)
                 {
                  CP_del_Long_div=false;
                 }

               if(dType[i+3]==8 &&H_Bearish_Hammer_Lengthy&& (H_Long_BE_div_CP_trig)) 
                 {

                  H_BEH_state_long_div=Bearish_Hammer_Detection(1,1,i,H_Bearish_Hammer_Bottom_Wick_Size_Maximum_1_Time_Lengthy, H_Bearish_Hammer_Top_Wick_Size_Minimum_2_Time_Lengthy);
                 }
               if(dType[i+3]==8 &&H_Bearish_Hammer_Lengthy&& (H_Long_BE_div_CP_trig) && H_BEH_state_long_div==1)
                 {
                  CP_del_Long_div=false;
                 }


               if(dType[i+3]==8 && H_Bearish_Inverted_Hammer_Lengthy && (H_Long_BE_div_CP_trig)) 
                 {

                  H_BEIH_state_long_div=Bearish_Inverted_Hammer_Detection(1,1,i,    H_Bearish_Inverted_Hammer_Bottom_Wick_Size_Minimum_2_Time_L, H_Bearish_Inverted_Hammer_Top_Wick_Size_Maximum_1_Time_Lengthy);

                 }
               if(dType[i+3]==8 && H_Bearish_Inverted_Hammer_Lengthy && (H_Long_BE_div_CP_trig) && H_BEIH_state_long_div==1)
                 {

                  CP_del_Long_div=false;

                 }
               if(dType[i+3]==6 && H_Bullish_Engulfing_Lengthy && (H_Long_BU_div_CP_trig))
                 {

                  H_BUE_state_long_div=Bullish_Engulfing_Detection(1,1,i, H_Bullish_Engulfing_Bottom_Wick_Size_Maximum_1_Time_Lengthy,H_Bullish_Engulfing_Top_Wick_Size_Maximum_1_Time_Lengthy);
                 }
               if(dType[i+3]==6 && H_Bullish_Engulfing_Lengthy && (H_Long_BU_div_CP_trig) && H_BUE_state_long_div==1)
                 {
                  CP_del_Long_div=false;

                 }
               if(dType[i+3]==8 && H_Bearish_Engulfing_Lengthy && (H_Long_BE_div_CP_trig))
                 {

                  H_BEE_state_long_div=Bearish_Engulfing_Detection(1,1,i, H_Bearish_Engulfing_Bottom_Wick_Size_Maximum_1_Time_Lengthy,H_Bearish_Engulfing_Top_Wick_Size_Maximum_1_Time_Lengthy);
                 }
               if(dType[i+3]==8 && H_Bearish_Engulfing_Lengthy && (H_Long_BE_div_CP_trig) && H_BEE_state_long_div==1)
                 {

                  CP_del_Long_div=false;
                 }


               if(dType[i+3]==6 && H_Piercing_Candle_Lengthy && (H_Long_BU_div_CP_trig))
                 {

                  H_PC_state_long_div=Piercing_Candle_Detection(1,1,i, H_Piercing_Candle_Bottom_Wick_Size_Maximum_1_Time_Lengthy, H_Piercing_Candle_Top_Wick_Size_Maximum_1_Time_Lengthy, H_Piercing_Candle_Pierce_Factor_Minimum_100_Percentage_Lengthy);
                 }
               if(dType[i+3]==6 && H_Piercing_Candle_Lengthy && (H_Long_BU_div_CP_trig) &&H_PC_state_long_div==1)
                 {

                  CP_del_Long_div=false;
                 }

               if(dType[i+3]==8 && H_Dark_Cloud_Cover_Lengthy && (H_Long_BE_div_CP_trig))
                 {

                  H_DCC_state_long_div=Dark_Cloud_Cover_Detection(1,1,i, H_Dark_Cloud_Cover_Bottom_Wick_Size_Maximum_1_Time_Lengthy,H_Dark_Cloud_Cover_Top_Wick_Size_Maximum_1_Time_Lengthy,H_Dark_Cloud_Cover_Pierce_Factor_Minimum_100_Percentage_Lengthy);
                 }
               if(dType[i+3]==8 && H_Dark_Cloud_Cover_Lengthy && (H_Long_BE_div_CP_trig) && H_DCC_state_long_div==1)
                 {
                  CP_del_Long_div=false;
                 }
               if(dType[i+3]==6 && H_Bullish_Sash_Lengthy && (H_Long_BU_div_CP_trig))
                 {

                  H_BUS_state_long_div=Bullish_Sash_Detection(1,1,i,H_Bullish_Sash_Bottom_Wick_Size_Maximum_1_Time_Lengthy);
                 }
               if(dType[i+3]==6 && H_Bullish_Sash_Lengthy && (H_Long_BU_div_CP_trig) && H_BUS_state_long_div==1)
                  CP_del_Long_div=false;
               if(dType[i+3]==8 && H_Bearish_Sash_Lengthy && (H_Long_BE_div_CP_trig))
                 {

                  H_BES_state_long_div=Bearish_Sash_Detection(1,1,i,H_Bearish_Sash_Top_Wick_Size_Maximum_1_Time_Lengthy);
                 }
               if(dType[i+3]==8 &&  H_Bearish_Sash_Lengthy && (H_Long_BE_div_CP_trig) && H_BES_state_long_div==1)
                  CP_del_Long_div=false;

               if(dType[i+3]==6 && H_Morning_Star_Lengthy && (H_Long_BU_div_CP_trig))
                 {

                  H_MS_state_long_div=Morning_Star_Detection(1,1,i, H_Morning_Star_Candle_2_Body_Bottom_Wick_Size_Maximum_Lengthy,H_Morning_Star_Candle_2_Body_Top_Wick_Size_Maximum_Lengthy,
                                      H_Morning_Star_Candle_3_Body_Size_Minimum_Lengthy,H_Morning_Star_Candle_1_Body_Size_Minimum_Lengthy,H_Morning_Star_Candle_2_Body_Size_Maximum_Lengthy);
                 }
               if(dType[i+3]==6 && H_Morning_Star_Lengthy && (H_Long_BU_div_CP_trig) &&  H_MS_state_long_div==1)
                  CP_del_Long_div=false;
               if(dType[i+3]==8 && H_Evening_Star_Lengthy && (H_Long_BE_div_CP_trig))
                 {

                  H_ES_state_long_div=Evening_Star_Detection(1,1,i, H_Evening_Star_Candle_2_Body_Bottom_Wick_Size_Maximum_Lengthy,H_Evening_Star_Candle_2_Body_Top_Wick_Size_Maximum_Lengthy,
                                      H_Evening_Star_Candle_3_Body_Size_Minimum_Lengthy,H_Evening_Star_Candle_1_Body_Size_Minimum_Lengthy,H_Evening_Star_Candle_2_Body_Size_Maximum_Lengthy);
                 }
               if(dType[i+3]==8 &&  H_Evening_Star_Lengthy && (H_Long_BE_div_CP_trig) && H_ES_state_long_div==1)
                  CP_del_Long_div=false;






              }

            if(!Bullish_Hammer_Lengthy && !Bullish_Inverted_Hammer_Lengthy &&!Bearish_Hammer_Lengthy && !Bearish_Inverted_Hammer_Lengthy  && !Bullish_Engulfing_Lengthy &&
               !Bearish_Engulfing_Lengthy &&  !Piercing_Candle_Lengthy && !Dark_Cloud_Cover_Lengthy && !Bullish_Sash_Lengthy && !Bearish_Sash_Lengthy&& !Morning_Star_Lengthy &&!Evening_Star_Lengthy
               &&!H_Bullish_Hammer_Lengthy && !H_Bullish_Inverted_Hammer_Lengthy &&!H_Bearish_Hammer_Lengthy && !H_Bearish_Inverted_Hammer_Lengthy  && !H_Bullish_Engulfing_Lengthy &&
               !H_Bearish_Engulfing_Lengthy &&  !H_Piercing_Candle_Lengthy && !H_Dark_Cloud_Cover_Lengthy && !H_Bullish_Sash_Lengthy && !H_Bearish_Sash_Lengthy&& !H_Morning_Star_Lengthy &&!H_Evening_Star_Lengthy)
               CP_del_Long_div=false;


            if(CC_valid_state)
               Divergence_Long_CC_Alert_Maker(i);






            if(CP_del_Long_div&&(dType[i+3]==2|| dType[i+3]==4 || dType[i+3]==6|| dType[i+3]==8)&& LastD==Time[i+3])
              {
              
               Dive_Delete(long_BU_dive_CC_state,long_BE_dive_CC_state,i);
               Long_BU_div_CCB_trig=false;
               Long_BE_div_CCB_trig=false;
               H_Long_BU_div_CCB_trig=false;
               H_Long_BE_div_CCB_trig=false;
               CP_valid_state=false;
               CP_del_Long_div=false;
              }
            if(Enable_Normal_Divergence)
              {
               if(Long_BU_div_CCB_trig && Confirmation_candle_Breakout_LONG_Lengthy)
                  Long_BU_div_CCB_detec(i);
               if(Long_BE_div_CCB_trig &&  Confirmation_candle_Breakout_SHORT_Lengthy) 
                 {
                  Long_BE_div_CCB_detec(i);

                 }
               if(Confirmation_Candle_Breakout_Zone &&Long_CCB_Zone_trig && ADX_Filter_Enable&& Filters_Enable && Filter_Enable_Normal_Divergence&& ADX_Filter_Enable_Normal_Divergence)
                 {
                  ADX_ZONE_CCB_Filter(i);
                  Long_CCB_Zone_trig=false;

                 }
              }
            if(Enable_Hidden_Divergence)
              {
               if(H_Long_BU_div_CCB_trig && H_Confirmation_candle_Breakout_LONG_Lengthy)
                  H_Long_BU_div_CCB_detec(i);
               if(H_Long_BE_div_CCB_trig &&  H_Confirmation_candle_Breakout_SHORT_Lengthy) 
                 {
                  H_Long_BE_div_CCB_detec(i);

                 }
               if(Confirmation_Candle_Breakout_Zone &&Long_CCB_Zone_trig &&  ADX_Filter_Enable&& Filters_Enable &&  Filter_Enable_Hidden_Divergence&& ADX_Filter_Enable_Hidden_Divergence)
                 {
                  ADX_ZONE_CCB_Filter(i);
                  Long_CCB_Zone_trig=false;

                 }




              }

            if(CCB_valid_state && (CCB_Alert_BU_Long_trig ||CCB_Alert_BE_Long_trig || H_CCB_Alert_BU_Long_trig ||H_CCB_Alert_BE_Long_trig))
               Divergence_Long_CCB_Alert_Maker(i);

            if((long_BU_dive_CC_state==0 && Candle_Confirmations_LONG_Lengthy) && (long_BE_dive_CC_state==0 &&  Candle_Confirmations_SHORT_Lengthy)&& (H_long_BU_dive_CC_state==0 && H_Candle_Confirmations_LONG_Lengthy) && (H_long_BE_dive_CC_state==0 &&  H_Candle_Confirmations_SHORT_Lengthy)&&
               (dType[i+3]==4 || dType[i+3]==2 || dType[i+3]==8 || dType[i+3]==6))
              {
            
               ObjectSetText("XXDType",Sig_S);
              }


            if((Candle_Confirmations_LONG_Lengthy &&  ObjectDescription("XXsignal_Value")=="BUY") || (Candle_Confirmations_SHORT_Lengthy  &&  ObjectDescription("XXsignal_Value")=="SELL")
               ||(H_Candle_Confirmations_LONG_Lengthy &&  ObjectDescription("XXsignal_Value")=="BUY") || (H_Candle_Confirmations_SHORT_Lengthy  &&  ObjectDescription("XXsignal_Value")=="SELL"))
              {
               if(CC_valid_state==true)
                  Long_dive_CC_OA_state=false;

               else
                  Long_dive_CC_OA_state=false;
              }
            else
               Long_dive_CC_OA_state=true;
            if(Bullish_Hammer_Lengthy || Bullish_Inverted_Hammer_Lengthy ||Bearish_Hammer_Lengthy || Bearish_Inverted_Hammer_Lengthy
               ||Bullish_Engulfing_Lengthy ||Bearish_Engulfing_Lengthy ||Piercing_Candle_Lengthy || Dark_Cloud_Cover_Lengthy || Bullish_Sash_Lengthy || Bearish_Sash_Lengthy  || Morning_Star_Lengthy ||Evening_Star_Lengthy
               || H_Bullish_Hammer_Lengthy || H_Bullish_Inverted_Hammer_Lengthy ||H_Bearish_Hammer_Lengthy || H_Bearish_Inverted_Hammer_Lengthy
               ||H_Bullish_Engulfing_Lengthy ||H_Bearish_Engulfing_Lengthy ||H_Piercing_Candle_Lengthy || H_Dark_Cloud_Cover_Lengthy || H_Bullish_Sash_Lengthy || H_Bearish_Sash_Lengthy  || H_Morning_Star_Lengthy ||H_Evening_Star_Lengthy)
              {
               if(CP_valid_state==true)
                  Long_dive_CP_OA_state=true;
               else
                  Long_dive_CP_OA_state=false;
              }
            else
               Long_dive_CP_OA_state=true;

            if((Confirmation_candle_Breakout_LONG_Lengthy &&  ObjectDescription("XXsignal_Value")=="BUY") || (Confirmation_candle_Breakout_SHORT_Lengthy   &&  ObjectDescription("XXsignal_Value")=="SELL")
               || (H_Confirmation_candle_Breakout_LONG_Lengthy &&  ObjectDescription("XXsignal_Value")=="BUY") || (H_Confirmation_candle_Breakout_SHORT_Lengthy   &&  ObjectDescription("XXsignal_Value")=="SELL"))
              {

               if(CCB_valid_state==true)
                  Long_dive_CCB_OA_state=true;
               else
                  Long_dive_CCB_OA_state=false;

              }
            else
               Long_dive_CCB_OA_state=true;

            if(Long_dive_CC_OA_state==true&& Long_dive_CCB_OA_state==true && Long_dive_CP_OA_state==true) 
              {

               FibCAl(long_BU_dive_CC_state,long_BE_dive_CC_state,1,i);
               ValidD(i);
               if(!Using_IN_EA)
                 {
                  if(! IsTesting())
                     alert_LCCB(0, Longmsg, i,Confirmation_candle_Breakout_Alert_Sound_Enable_LONG_Lengthy,Confirmation_candle_Breakout_Alert_Sound_LONG_Lengthy,Longmsg,"New Valid Divergence");
                  KLONG=0;
                 }
               CC_valid_state=false;
               CCB_valid_state=false;
               CP_valid_state=false;
               Long_dive_CCB_OA_state=false;
               Long_dive_CC_OA_state=false;
               Long_dive_CP_OA_state=false;
               Long_dive_Zone_State=false;

              }

           }
         if(Enable_Normal_Divergence)
           {
            if(Show_Shortly_Divergence)
              {
               if(Show_Short_Divergence)
                  Dir_BE_div_detec(i+Signal_Bar);  
               if(Show_Long_Divergence)
                  Dir_BU_div_detec(i+Signal_Bar);  
              }
            //&& dType[i]>9 dType[i+1]<9  &&
            if((dType[i+3]==1 || dType[i+3]==3)  && Dir_Arrow_Zone_trig &&  Arrow_Candle_Zone_Filter&& ADX_Filter_Enable&& Filters_Enable&& Filter_Enable_Normal_Divergence&& ADX_Filter_Enable_Normal_Divergence)
              {
               ADX_ZONE_Arrow_Filter(i+3);

               Dir_Arrow_Zone_trig=false;

              }
            if((dType[i+3]==1 || dType[i+3]==3)  &&Dir_fast_MA_trig && fastMA_Filter&& MA_Filert_Enable&& Filters_Enable&& Filter_Enable_Normal_Divergence&& MA_Filter_Enable_Normal_Divergence)
              {
               fast_MA_Filter(i+3);

               Dir_fast_MA_trig=false;

              }
            if((dType[i+3]==1 || dType[i+3]==3)  &&Dir_slow_MA_trig && slowMA_Filter&& MA_Filert_Enable&& Filters_Enable&& Filter_Enable_Normal_Divergence&& MA_Filter_Enable_Normal_Divergence)
              {
               slow_MA_Filter(i+3);

               Dir_slow_MA_trig=false;

              }



            if(dType[i+3]==1 && Candle_Confirmations_LONG && Dir_BU_div_CC_trig && LastD==Time[i+3]) 
              {

               Dir_BU_dive_CC_state=Dir_BU_div_CC_detec(i);
              }

            if(dType[i+3]==3 &&  Candle_Confirmations_SHORT && Dir_BE_div_CC_trig  && LastD==Time[i+3]) 
              {

               Dir_BE_dive_CC_state=Dir_BE_div_CC_detec(i);
              }

            if(dType[i+3]==1 &&Bullish_Hammer &&  Dir_BU_div_CP_trig)
              {

               BUH_state_Dir_div=Bullish_Hammer_Detection(0,0,i, Bullish_Hammer_Bottom_Wick_Size_Minimum_2_Time, Bullish_Hammer_Top_Wick_Size_Maximum_1_Time);
              }
            if(dType[i+3]==1 &&Bullish_Hammer &&  Dir_BU_div_CP_trig && BUH_state_Dir_div==1)
              {
               CP_del_Dir_div=false;
              }

            if(dType[i+3]==1 && Bullish_Inverted_Hammer && Dir_BU_div_CP_trig) 
              {

               BUIH_state_Dir_div= Bullish_Inverted_Hammer_Detection(0,0,i, Bullish_Inverted_Hammer_Bottom_Wick_Size_Maximum_1_Time,Bullish_Inverted_Hammer_Top_Wick_Size_Minimum_2_Time);

              }
            if(dType[i+3]==1 && Bullish_Inverted_Hammer && Dir_BU_div_CP_trig && BUIH_state_Dir_div==1)
              {

               CP_del_Dir_div=false;
              }

            if(dType[i+3]==3 && Bearish_Hammer&& (Dir_BE_div_CP_trig)) 
              {

               BEH_state_Dir_div=Bearish_Hammer_Detection(0,0,i,  Bearish_Inverted_Hammer_Bottom_Wick_Size_Minimum_2_Time, Bearish_Hammer_Top_Wick_Size_Minimum_2_Time);
              }
            if(dType[i+3]==3 && Bearish_Hammer&& (Dir_BE_div_CP_trig) &&   BEH_state_Dir_div==1)
              {

               CP_del_Dir_div=false;
              }
            if(dType[i+3]==3 && Bearish_Inverted_Hammer && (Dir_BE_div_CP_trig)) 
              {

               BEIH_state_Dir_div=Bearish_Inverted_Hammer_Detection(0,0,i, Bearish_Inverted_Hammer_Bottom_Wick_Size_Minimum_2_Time,Bearish_Inverted_Hammer_Top_Wick_Size_Maximum_1_Time);
              }
            if(dType[i+3]==3 && Bearish_Inverted_Hammer && (Dir_BE_div_CP_trig)&&BEIH_state_Dir_div==1)
              {

               CP_del_Dir_div=false;
              }



            if(dType[i+3]==1 && Bullish_Engulfing && (Dir_BU_div_CP_trig))
              {

               BUE_state_Dir_div=Bullish_Engulfing_Detection(0,0,i, Bullish_Engulfing_Bottom_Wick_Size_Maximum_1_Time,Bullish_Engulfing_Top_Wick_Size_Maximum_1_Time);
              }
            if(dType[i+3]==1 && Bullish_Engulfing && (Dir_BU_div_CP_trig)&&BUE_state_Dir_div==1)
              {

               CP_del_Dir_div=false;
              }

            if(dType[i+3]==3 && Bearish_Engulfing && (Dir_BE_div_CP_trig))
              {

               BEE_state_Dir_div=Bearish_Engulfing_Detection(0,0,i, Bearish_Engulfing_Bottom_Wick_Size_Maximum_1_Time,Bearish_Engulfing_Top_Wick_Size_Maximum_1_Time);

              }
            if(dType[i+3]==3 && Bearish_Engulfing && (Dir_BE_div_CP_trig)&& BEE_state_Dir_div==1)
              {

               CP_del_Dir_div=false;
              }
            if(dType[i+3]==1 && Piercing_Candle && (Dir_BU_div_CP_trig))
              {

               PC_state_long_div=Piercing_Candle_Detection(0,0,i, Piercing_Candle_Bottom_Wick_Size_Maximum_1_Time, Piercing_Candle_Top_Wick_Size_Maximum_1_Time, Piercing_Candle_Pierce_Factor_Minimum_100_Percentage);
              }
            if(dType[i+3]==1 && Piercing_Candle && (Dir_BU_div_CP_trig)&& PC_state_long_div==1)
              {

               CP_del_Dir_div=false;
              }
            if(dType[i+3]==3 && Dark_Cloud_Cover && (Dir_BE_div_CP_trig))
              {

               DCC_state_Dir_div=Dark_Cloud_Cover_Detection(0,0,i, Dark_Cloud_Cover_Bottom_Wick_Size_Maximum_1_Time,Dark_Cloud_Cover_Top_Wick_Size_Maximum_1_Time,Dark_Cloud_Cover_Pierce_Factor_Minimum_100_Percentage);
              }
            if(dType[i+3]==3 && Dark_Cloud_Cover && (Dir_BE_div_CP_trig)&&DCC_state_Dir_div==1)
              {

               CP_del_Dir_div=false;
              }


            if(dType[i+3]==1 && Bullish_Sash && (Dir_BU_div_CP_trig))
              {

               BUS_state_Dir_div=Bullish_Sash_Detection(0,0,i,Bullish_Sash_Bottom_Wick_Size_Maximum_1_Time);
              }
            if(dType[i+3]==1 && Bullish_Sash && (Dir_BU_div_CP_trig) && BUS_state_Dir_div==1)
               CP_del_Dir_div=false;
            if(dType[i+3]==3 && Bearish_Sash && (Dir_BE_div_CP_trig))
              {

               BES_state_Dir_div=Bearish_Sash_Detection(0,0,i,Bearish_Sash_Top_Wick_Size_Maximum_1_Time);

              }
            if(dType[i+3]==3 &&  Bearish_Sash && (Dir_BE_div_CP_trig) && BES_state_Dir_div==1)
              {

               CP_del_Dir_div=false;
              }

            if(dType[i+3]==1 && Morning_Star && (Dir_BU_div_CP_trig))
              {

               MS_state_Dir_div=Morning_Star_Detection(0,0,i, Morning_Star_Candle_2_Body_Bottom_Wick_Size_Maximum,Morning_Star_Candle_2_Body_Top_Wick_Size_Maximum,
                                                       Morning_Star_Candle_3_Body_Size_Minimum,Morning_Star_Candle_1_Body_Size_Minimum,Morning_Star_Candle_2_Body_Size_Maximum);
              }
            if(dType[i+3]==1 && Morning_Star && (Dir_BU_div_CP_trig) &&  MS_state_Dir_div==1)
               CP_del_Dir_div=false;
            if(dType[i+3]==3 && Evening_Star && (Dir_BE_div_CP_trig))
              {

               ES_state_Dir_div=Evening_Star_Detection(0,0,i, Evening_Star_Candle_2_Body_Bottom_Wick_Size_Maximum,Evening_Star_Candle_2_Body_Top_Wick_Size_Maximum,
                                                       Evening_Star_Candle_3_Body_Size_Minimum,Evening_Star_Candle_1_Body_Size_Minimum,Evening_Star_Candle_2_Body_Size_Maximum);
              }
            if(dType[i+3]==3 &&  Evening_Star && (Dir_BE_div_CP_trig) && ES_state_Dir_div==1)
               CP_del_Dir_div=false;
           }
         if(Enable_Hidden_Divergence)
           {
            if(H_Show_Shortly_Divergence)
              {
               if(H_Show_Short_Divergence)
                  H_Dir_BE_div_detec(i+H_Signal_Bar); 
               if(H_Show_Long_Divergence)
                  H_Dir_BU_div_detec(i+H_Signal_Bar); 
              }
            //&& dType[i]>9 dType[i+1]<9  &&
            if((dType[i+3]==5 || dType[i+3]==7)  && Dir_Arrow_Zone_trig &&  Arrow_Candle_Zone_Filter && ADX_Filter_Enable&& Filters_Enable&& Filter_Enable_Hidden_Divergence && ADX_Filter_Enable_Hidden_Divergence)
              {
               ADX_ZONE_Arrow_Filter(i+3);

               Dir_Arrow_Zone_trig=false;
              }
            if((dType[i+3]==5 || dType[i+3]==7)  &&Dir_fast_MA_trig && fastMA_Filter&& MA_Filert_Enable&& Filters_Enable&& Filter_Enable_Hidden_Divergence&& MA_Filter_Enable_Hidden_Divergence)
              {
               fast_MA_Filter(i+3);

               Dir_fast_MA_trig=false;

              }
            if((dType[i+3]==5 || dType[i+3]==7)  &&Dir_slow_MA_trig && slowMA_Filter&& MA_Filert_Enable&& Filters_Enable &&  Filter_Enable_Hidden_Divergence&& MA_Filter_Enable_Hidden_Divergence)
              {
               slow_MA_Filter(i+3);

               Dir_slow_MA_trig=false;

              }




            if(dType[i+3]==5 && H_Candle_Confirmations_LONG && H_Dir_BU_div_CC_trig && LastD==Time[i+3]) 
              {

               H_Dir_BU_dive_CC_state=H_Dir_BU_div_CC_detec(i);
              }

            if(dType[i+3]==7 &&  H_Candle_Confirmations_SHORT && H_Dir_BE_div_CC_trig  && LastD==Time[i+3])
              {

               H_Dir_BE_dive_CC_state=H_Dir_BE_div_CC_detec(i);
              }

            if(dType[i+3]==5 && H_Bullish_Hammer &&  H_Dir_BU_div_CP_trig)
              {

               H_BUH_state_Dir_div=Bullish_Hammer_Detection(1,0,i, H_Bullish_Hammer_Bottom_Wick_Size_Minimum_2_Time, H_Bullish_Hammer_Top_Wick_Size_Maximum_1_Time);
              }
            if(dType[i+3]==5 &&H_Bullish_Hammer &&  H_Dir_BU_div_CP_trig && H_BUH_state_Dir_div==1)
              {
               CP_del_Dir_div=false;
              }

            if(dType[i+3]==5 && H_Bullish_Inverted_Hammer && H_Dir_BU_div_CP_trig) 
              {

               H_BUIH_state_Dir_div= Bullish_Inverted_Hammer_Detection(1,0,i, H_Bullish_Inverted_Hammer_Bottom_Wick_Size_Maximum_1_Time,H_Bullish_Inverted_Hammer_Top_Wick_Size_Minimum_2_Time);

              }
            if(dType[i+3]==5 && H_Bullish_Inverted_Hammer && H_Dir_BU_div_CP_trig && H_BUIH_state_Dir_div==1)
              {

               CP_del_Dir_div=false;
              }

            if(dType[i+3]==7 && H_Bearish_Hammer&& (H_Dir_BE_div_CP_trig)) 
              {

               H_BEH_state_Dir_div=Bearish_Hammer_Detection(1,0,i,  H_Bearish_Inverted_Hammer_Bottom_Wick_Size_Minimum_2_Time, H_Bearish_Hammer_Top_Wick_Size_Minimum_2_Time);
              }
            if(dType[i+3]==7 && H_Bearish_Hammer&& (H_Dir_BE_div_CP_trig) &&   H_BEH_state_Dir_div==1)
              {

               CP_del_Dir_div=false;
              }
            if(dType[i+3]==7 && H_Bearish_Inverted_Hammer && (H_Dir_BE_div_CP_trig)) 
              {

               H_BEIH_state_Dir_div=Bearish_Inverted_Hammer_Detection(1,0,i, H_Bearish_Inverted_Hammer_Bottom_Wick_Size_Minimum_2_Time,H_Bearish_Inverted_Hammer_Top_Wick_Size_Maximum_1_Time);
              }
            if(dType[i+3]==7 && H_Bearish_Inverted_Hammer && (H_Dir_BE_div_CP_trig)&&H_BEIH_state_Dir_div==1)
              {

               CP_del_Dir_div=false;
              }



            if(dType[i+3]==5 && H_Bullish_Engulfing && (H_Dir_BU_div_CP_trig))
              {

               H_BUE_state_Dir_div=Bullish_Engulfing_Detection(1,0,i, H_Bullish_Engulfing_Bottom_Wick_Size_Maximum_1_Time,H_Bullish_Engulfing_Top_Wick_Size_Maximum_1_Time);
              }
            if(dType[i+3]==5 && H_Bullish_Engulfing && (H_Dir_BU_div_CP_trig)&&H_BUE_state_Dir_div==1)
              {

               CP_del_Dir_div=false;
              }

            if(dType[i+3]==7 && H_Bearish_Engulfing && (H_Dir_BE_div_CP_trig))
              {

               H_BEE_state_Dir_div=Bearish_Engulfing_Detection(1,0,i, H_Bearish_Engulfing_Bottom_Wick_Size_Maximum_1_Time,H_Bearish_Engulfing_Top_Wick_Size_Maximum_1_Time);

              }
            if(dType[i+3]==7 && H_Bearish_Engulfing && (H_Dir_BE_div_CP_trig)&& H_BEE_state_Dir_div==1)
              {

               CP_del_Dir_div=false;
              }
            if(dType[i+3]==5 && H_Piercing_Candle && (H_Dir_BU_div_CP_trig))
              {

               H_PC_state_long_div=Piercing_Candle_Detection(1,0,i, H_Piercing_Candle_Bottom_Wick_Size_Maximum_1_Time, H_Piercing_Candle_Top_Wick_Size_Maximum_1_Time, H_Piercing_Candle_Pierce_Factor_Minimum_100_Percentage);
              }
            if(dType[i+3]==5 && H_Piercing_Candle && (H_Dir_BU_div_CP_trig)&& H_PC_state_long_div==1)
              {

               CP_del_Dir_div=false;
              }
            if(dType[i+3]==7 && H_Dark_Cloud_Cover && (H_Dir_BE_div_CP_trig))
              {

               H_DCC_state_Dir_div=Dark_Cloud_Cover_Detection(1,0,i, H_Dark_Cloud_Cover_Bottom_Wick_Size_Maximum_1_Time,H_Dark_Cloud_Cover_Top_Wick_Size_Maximum_1_Time,H_Dark_Cloud_Cover_Pierce_Factor_Minimum_100_Percentage);
              }
            if(dType[i+3]==7 && H_Dark_Cloud_Cover && (H_Dir_BE_div_CP_trig)&&H_DCC_state_Dir_div==1)
              {

               CP_del_Dir_div=false;
              }


            if(dType[i+3]==5 && H_Bullish_Sash && (H_Dir_BU_div_CP_trig))
              {

               H_BUS_state_Dir_div=Bullish_Sash_Detection(1,0,i,H_Bullish_Sash_Bottom_Wick_Size_Maximum_1_Time);
              }
            if(dType[i+3]==5 && H_Bullish_Sash && (H_Dir_BU_div_CP_trig) && H_BUS_state_Dir_div==1)
               CP_del_Dir_div=false;
            if(dType[i+3]==7 && H_Bearish_Sash && (H_Dir_BE_div_CP_trig))
              {

               H_BES_state_Dir_div=Bearish_Sash_Detection(1,0,i,H_Bearish_Sash_Top_Wick_Size_Maximum_1_Time);

              }
            if(dType[i+3]==7 &&  H_Bearish_Sash && (H_Dir_BE_div_CP_trig) && H_BES_state_Dir_div==1)
              {

               CP_del_Dir_div=false;
              }

            if(dType[i+3]==5 && H_Morning_Star && (H_Dir_BU_div_CP_trig))
              {

               H_MS_state_Dir_div=Morning_Star_Detection(1,0,i, H_Morning_Star_Candle_2_Body_Bottom_Wick_Size_Maximum,H_Morning_Star_Candle_2_Body_Top_Wick_Size_Maximum,
                                  H_Morning_Star_Candle_3_Body_Size_Minimum,H_Morning_Star_Candle_1_Body_Size_Minimum,H_Morning_Star_Candle_2_Body_Size_Maximum);
              }
            if(dType[i+3]==5 && H_Morning_Star && (H_Dir_BU_div_CP_trig) &&  H_MS_state_Dir_div==1)
               CP_del_Dir_div=false;
            if(dType[i+3]==7 && H_Evening_Star && (H_Dir_BE_div_CP_trig))
              {

               H_ES_state_Dir_div=Evening_Star_Detection(1,0,i, H_Evening_Star_Candle_2_Body_Bottom_Wick_Size_Maximum,H_Evening_Star_Candle_2_Body_Top_Wick_Size_Maximum,
                                  H_Evening_Star_Candle_3_Body_Size_Minimum,H_Evening_Star_Candle_1_Body_Size_Minimum,H_Evening_Star_Candle_2_Body_Size_Maximum);
              }
            if(dType[i+3]==7 &&  H_Evening_Star && (H_Dir_BE_div_CP_trig) && H_ES_state_Dir_div==1)
               CP_del_Dir_div=false;







           }




         if(!Bullish_Hammer && !Bullish_Inverted_Hammer &&!Bearish_Hammer && !Bearish_Inverted_Hammer  && !Bullish_Engulfing &&
            !Bearish_Engulfing &&  !Piercing_Candle && !Dark_Cloud_Cover && !Bullish_Sash && !Bearish_Sash && !Morning_Star && !Evening_Star
            && !H_Bullish_Hammer && !H_Bullish_Inverted_Hammer &&!H_Bearish_Hammer && !H_Bearish_Inverted_Hammer  && !H_Bullish_Engulfing &&
            !H_Bearish_Engulfing &&  !H_Piercing_Candle && !H_Dark_Cloud_Cover && !H_Bullish_Sash && !H_Bearish_Sash && !H_Morning_Star && !H_Evening_Star)
            CP_del_Dir_div=false;
         if(CC_valid_state)
            Divergence_Dir_CC_Alert_Maker(i);

        


         if(CP_del_Dir_div &&(dType[i+3]==1|| dType[i+3]==3 || dType[i+3]==5|| dType[i+3]==7)&& LastD==Time[i+3])
           {
          
            Dive_Delete(Dir_BU_dive_CC_state,Dir_BE_dive_CC_state,i);
            Long_BU_div_CCB_trig=false;
            Long_BE_div_CCB_trig=false;
            H_Long_BU_div_CCB_trig=false;
            H_Long_BE_div_CCB_trig=false;
            CP_valid_state=false;
            CP_del_Dir_div=false;
           }

         if(Enable_Normal_Divergence)
           {
            if(Dir_BU_div_CCB_trig &&   Confirmation_candle_Breakout_LONG) 
              {
               Dir_BU_div_CCB_detec(i);


              }
            if(Dir_BE_div_CCB_trig &&  Confirmation_candle_Breakout_SHORT) 
               Dir_BE_div_CCB_detec(i);
            if(Confirmation_Candle_Breakout_Zone &&Dir_CCB_Zone_trig &&  ADX_Filter_Enable&& Filters_Enable && Filter_Enable_Normal_Divergence&& ADX_Filter_Enable_Normal_Divergence)
              {
               ADX_ZONE_CCB_Filter(i);
               Dir_CCB_Zone_trig=false;

              }
           }
         if(Enable_Hidden_Divergence)
           {
            if(H_Dir_BU_div_CCB_trig &&   H_Confirmation_candle_Breakout_LONG) 
              {

               H_Dir_BU_div_CCB_detec(i);


              }
            if(H_Dir_BE_div_CCB_trig &&  H_Confirmation_candle_Breakout_SHORT) 
               H_Dir_BE_div_CCB_detec(i);
            if(Confirmation_Candle_Breakout_Zone &&Dir_CCB_Zone_trig &&  ADX_Filter_Enable&& Filters_Enable&&  Filter_Enable_Hidden_Divergence&& ADX_Filter_Enable_Hidden_Divergence)
              {
               ADX_ZONE_CCB_Filter(i);
               Dir_CCB_Zone_trig=false;

              }




           }


         if(CCB_valid_state &&(CCB_Alert_BU_Dir_trig || CCB_Alert_BE_Dir_trig || H_CCB_Alert_BU_Dir_trig ||  H_CCB_Alert_BE_Dir_trig))
            Divergence_Dir_CCB_Alert_Maker(i);
  


         if((Dir_BU_dive_CC_state==0 && Candle_Confirmations_LONG) && (Dir_BE_dive_CC_state==0 &&  Candle_Confirmations_SHORT)&& (dType[i+3]==1|| dType[i+3]==3|| dType[i+3]==5|| dType[i+3]==7))
           {
            ObjectSetText("XXDType",Sig_S);//same as length
           }
         if((Candle_Confirmations_LONG &&  ObjectDescription("XXsignal_Value")=="BUY") || (Candle_Confirmations_SHORT  &&  ObjectDescription("XXsignal_Value")=="SELL")
            || (H_Candle_Confirmations_LONG &&  ObjectDescription("XXsignal_Value")=="BUY") || (H_Candle_Confirmations_SHORT  &&  ObjectDescription("XXsignal_Value")=="SELL"))
           {
            if(CC_valid_state==true)
               Dir_dive_CC_OA_state=true;
            else
               Dir_dive_CC_OA_state=false;


           }
         else
            Dir_dive_CC_OA_state=true;



         if(Bullish_Hammer || Bullish_Inverted_Hammer ||Bearish_Hammer || Bearish_Inverted_Hammer  ||Bullish_Engulfing ||Bearish_Engulfing ||Piercing_Candle || Dark_Cloud_Cover || Bullish_Sash || Bearish_Sash || Morning_Star ||Evening_Star
            ||H_Bullish_Hammer || H_Bullish_Inverted_Hammer ||H_Bearish_Hammer || H_Bearish_Inverted_Hammer  ||H_Bullish_Engulfing ||H_Bearish_Engulfing ||H_Piercing_Candle || H_Dark_Cloud_Cover || H_Bullish_Sash || H_Bearish_Sash || H_Morning_Star ||H_Evening_Star)
           {
            if(CP_valid_state==true)
               Dir_dive_CP_OA_state=true;
            else
               Dir_dive_CP_OA_state=false;
           }
         else
            Dir_dive_CP_OA_state=true;


         if((Confirmation_candle_Breakout_LONG &&  ObjectDescription("XXsignal_Value")=="BUY") || (Confirmation_candle_Breakout_SHORT  &&  ObjectDescription("XXsignal_Value")=="SELL")
            ||(H_Confirmation_candle_Breakout_LONG &&  ObjectDescription("XXsignal_Value")=="BUY") || (H_Confirmation_candle_Breakout_SHORT  &&  ObjectDescription("XXsignal_Value")=="SELL"))

           {
            if(CCB_valid_state==true)
               Dir_dive_CCB_OA_state=true;
            else
               Dir_dive_CCB_OA_state=false;

           }
         else
            Dir_dive_CCB_OA_state=true;


         if(Dir_dive_CC_OA_state==true && Dir_dive_CCB_OA_state==true  && Dir_dive_CP_OA_state==true)   // if CC-CCB-patterns was enable and valid this divergence is valid and the display and fibbo value save as valid

           {

            FibCAl(Dir_BU_dive_CC_state,Dir_BE_dive_CC_state,1,i);
            ValidD(i);
            if(!Using_IN_EA)
              {
               if(! IsTesting())
                  alert_LCCB(0, Longmsg, i,Confirmation_candle_Breakout_Alert_Sound_Enable_LONG_Lengthy,Confirmation_candle_Breakout_Alert_Sound_LONG_Lengthy,Longmsg,"New Valid Divergence");
               KLONG=0;
              }
            CC_valid_state=false;
            CCB_valid_state=false;
            CP_valid_state=false;
            Dir_dive_CC_OA_state=false;
            Dir_dive_CCB_OA_state=false;
            Dir_dive_CP_OA_state=false;
            Dir_dive_Zone_State=false;
           }
         Fibbreach(i);
        }
     }
  }
int sip;
//+------------------------------------------------------------------+
void TRSI(int x1)
  {
   sip = x1;
   rsi_L[x1] = iRSI(Symbol(),PERIOD_CURRENT,RSI_period,RSI_applied_price,x1);
   rsi[x1] = iRSI(_Symbol,PERIOD_CURRENT,RSI_period_Lengthy,RSI_applied_price_Lengthy,x1);
  }
//+------------------------------------------------------------------+
int OnInit()
  {
     {
      Trefresh=TimeCurrent();
      if(Using_IN_EA)
        {
         if(StringLen(bool_Input_EA)!=0)
           {
     
            Bool_Input_Set();
           }

         if(StringLen(FIBB)!=0 && StringLen(FIBBL)!=0)
           {
     
            FIB_EA_INPUT();
           }
         if(StringLen(PNFIBB)!=0 && StringLen(PNFIBBL)!=0)
           {
      
            PNFIB_EA_INPUT();
            PNFIBL_EA_INPUT();
           }


         if(StringLen(PCIN1)!=0 && StringLen(PCIN2)!=0 && StringLen(PCIN3)!=0 && StringLen(PCINL1)!=0 && StringLen(PCINL2)!=0 && StringLen(PCINL3)!=0)
           {
           
            CANDLE_PATTERN_EA_INPUT();
           }
        }
      if(!Candle_Patterns_Enable)
        {

         Bullish_Hammer                   =false;
         Bullish_Inverted_Hammer          =false;
         Bearish_Hammer                   =false;
         Bearish_Inverted_Hammer          =false;
         Bullish_Engulfing                   =false;
         Bearish_Engulfing          =false;
         Piercing_Candle                   =false;
         Dark_Cloud_Cover          =false;
         Bullish_Sash                   =false;
         Bearish_Sash          =false;
         Morning_Star                   =false;
         Evening_Star          =false;
         Bullish_Hammer_Lengthy                    =false;
         Bullish_Inverted_Hammer_Lengthy           =false;
         Bearish_Hammer_Lengthy                    =false;
         Bearish_Inverted_Hammer_Lengthy           =false;
         Bullish_Engulfing_Lengthy                    =false;
         Bearish_Engulfing_Lengthy           =false;
         Piercing_Candle_Lengthy                    =false;
         Dark_Cloud_Cover_Lengthy           =false;
         Bullish_Sash_Lengthy                    =false;
         Bearish_Sash_Lengthy           =false;
         Morning_Star_Lengthy                    =false;
         Evening_Star_Lengthy           =false;
      
         H_Bullish_Hammer                   =false;
         H_Bullish_Inverted_Hammer          =false;
         H_Bearish_Hammer                   =false;
         H_Bearish_Inverted_Hammer          =false;
         H_Bullish_Engulfing                   =false;
         H_Bearish_Engulfing          =false;
         H_Piercing_Candle                   =false;
         H_Dark_Cloud_Cover          =false;
         H_Bullish_Sash                   =false;
         H_Bearish_Sash          =false;
         H_Morning_Star                   =false;
         H_Evening_Star          =false;
         H_Bullish_Hammer_Lengthy                    =false;
         H_Bullish_Inverted_Hammer_Lengthy           =false;
         H_Bearish_Hammer_Lengthy                    =false;
         H_Bearish_Inverted_Hammer_Lengthy           =false;
         H_Bullish_Engulfing_Lengthy                    =false;
         H_Bearish_Engulfing_Lengthy           =false;
         H_Piercing_Candle_Lengthy                    =false;
         H_Dark_Cloud_Cover_Lengthy           =false;
         H_Bullish_Sash_Lengthy                    =false;
         H_Bearish_Sash_Lengthy           =false;
         H_Morning_Star_Lengthy                    =false;
         H_Evening_Star_Lengthy           =false;





        }
      if(!Enable_Hidden_Divergence)
        {

         H_Bullish_Hammer                   =false;
         H_Bullish_Inverted_Hammer          =false;
         H_Bearish_Hammer                   =false;
         H_Bearish_Inverted_Hammer          =false;
         H_Bullish_Engulfing                   =false;
         H_Bearish_Engulfing          =false;
         H_Piercing_Candle                   =false;
         H_Dark_Cloud_Cover          =false;
         H_Bullish_Sash                   =false;
         H_Bearish_Sash          =false;
         H_Morning_Star                   =false;
         H_Evening_Star          =false;
         H_Bullish_Hammer_Lengthy                    =false;
         H_Bullish_Inverted_Hammer_Lengthy           =false;
         H_Bearish_Hammer_Lengthy                    =false;
         H_Bearish_Inverted_Hammer_Lengthy           =false;
         H_Bullish_Engulfing_Lengthy                    =false;
         H_Bearish_Engulfing_Lengthy           =false;
         H_Piercing_Candle_Lengthy                    =false;
         H_Dark_Cloud_Cover_Lengthy           =false;
         H_Bullish_Sash_Lengthy                    =false;
         H_Bearish_Sash_Lengthy           =false;
         H_Morning_Star_Lengthy                    =false;
         H_Evening_Star_Lengthy           =false;
        }
      if(!Enable_Normal_Divergence)
        {
         Bullish_Hammer                   =false;
         Bullish_Inverted_Hammer          =false;
         Bearish_Hammer                   =false;
         Bearish_Inverted_Hammer          =false;
         Bullish_Engulfing                   =false;
         Bearish_Engulfing          =false;
         Piercing_Candle                   =false;
         Dark_Cloud_Cover          =false;
         Bullish_Sash                   =false;
         Bearish_Sash          =false;
         Morning_Star                   =false;
         Evening_Star          =false;
         Bullish_Hammer_Lengthy                    =false;
         Bullish_Inverted_Hammer_Lengthy           =false;
         Bearish_Hammer_Lengthy                    =false;
         Bearish_Inverted_Hammer_Lengthy           =false;
         Bullish_Engulfing_Lengthy                    =false;
         Bearish_Engulfing_Lengthy           =false;
         Piercing_Candle_Lengthy                    =false;
         Dark_Cloud_Cover_Lengthy           =false;
         Bullish_Sash_Lengthy                    =false;
         Bearish_Sash_Lengthy           =false;
         Morning_Star_Lengthy                    =false;
         Evening_Star_Lengthy           =false;




        }


     
      if(Period()<60)
         TF_NOW=IntegerToString(Period())+"min";
      if(59<Period() && Period()<241)
         TF_NOW=IntegerToString(Period()/60)+"hour";
      if(Period()==1440)
         TF_NOW="Daily";
      if(Period()==10080)
         TF_NOW="Weekly";
      if(Period()==43200)
         TF_NOW="Monthly";
      point=Point;

      point*=10;

      TS=TimeCurrent();
      IndicatorSetInteger(INDICATOR_LEVELS,4);
      IndicatorSetDouble(INDICATOR_LEVELVALUE,0,bearish_Level);
      IndicatorSetDouble(INDICATOR_LEVELVALUE,1,bulish_Level);
      IndicatorSetDouble(INDICATOR_LEVELVALUE,2,bearish_Level_Lengthy);
      IndicatorSetDouble(INDICATOR_LEVELVALUE,3,bulish_Level_Lengthy);

      SetIndexBuffer(0, rsi_L);
      SetIndexBuffer(1, dType);
      SetIndexBuffer(2, dRSId);
      SetIndexBuffer(3, dRSIdp);
      SetIndexBuffer(4, rsi);
      SetIndexBuffer(5, dUnvalid);
      SetIndexBuffer(6, dValid);
      SetIndexBuffer(7,  dCandlePatren);
      SetIndexBuffer(8,  Dopen);
      SetIndexBuffer(9,  Dclose);
      SetIndexBuffer(10,  dType2);
      SetIndexBuffer(11,  dEn2 );
      SetIndexBuffer(12,  dEn1);
      SetIndexBuffer(13,  dSL);
      SetIndexBuffer(14,  dTr4);
      SetIndexBuffer(15,  dTr3);
      SetIndexBuffer(16,  dTr2);
      SetIndexBuffer(17,  dTr1);
      SetIndexBuffer(18, dLot2);
      SetIndexBuffer(19, dLot1);

      SetIndexBuffer(20,  Buy_Z);
      SetIndexBuffer(21, Sell_Z);
      SetIndexBuffer(22, Neutral_Z);
      SetIndexStyle(1,DRAW_NONE);
      SetIndexStyle(2,DRAW_NONE);
      SetIndexStyle(3,DRAW_NONE);

      SetIndexStyle(0,DRAW_LINE,RSIStyle,RSIWidth,RSIColour);
      SetIndexStyle(4,DRAW_LINE,RSIStyle_Lengthy,RSIWidth_Lengthy,RSIColour_Lengthy);

      indicatorName=StringConcatenate("RSI Divergence (",RSI_period,", ",RSI_applied_price,")");
      SetIndexDrawBegin(0,RSI_period);
      SetIndexDrawBegin(5,RSI_period_Lengthy);
      IndicatorDigits(Digits() + 2);
      IndicatorShortName(indicatorName);

      RSILine="RSIDiv RSI ";
      PriceLine="RSIDiv Price ";
      switch(Period())
        {
         case 1:
            range=1*point;
            break;
         case 5:
            range=2*point;
            break;
         case 15:
            range=3*point;
            break;
         case 30:
            range=4*point;
            break;
         case 60:
            range=5*point;
            break;
         case 240:
            range=6*point;
            break;
         case 1440:
            range=7*point;
            break;
         case 10080:
            range=8*point;
            break;
         case 43200:
            range=9*point;
            break;
         default:
            range=10*point;
            break;
        }
      switch(Period())
        {
         case 1:
            range2=2*point;
            break;
         case 5:
            range2=4*point;
            break;
         case 15:
            range2=6*point;
            break;
         case 30:
            range2=8*point;
            break;
         case 60:
            range2=10*point;
            break;
         case 240:
            range2=12*point;
            break;
         case 1440:
            range2=14*point;
            break;
         case 10080:
            range2=16*point;
            break;
         case 43200:
            range2=18*point;
            break;
         default:
            range2=20*point;
            break;
        }

  
      if(Show_Graphic_Object && ! Using_IN_EA)
        {
         if(ObjectFind(0,"Bt1")!=0)
           {
            Button(0,"Bt1",0,20,20,75,18,0,"Tables OFF","Times New Roman");
            ObjectSetInteger(0,"Bt1",OBJPROP_BGCOLOR,clrRed);
           }
         if(ObjectFind(0,"Bt2")!=0)
           {
            Button(0,"Bt2",0,100,20,75,18,0,"Refresh","Times New Roman");
            ObjectSetInteger(0,"Bt2",OBJPROP_BGCOLOR,clrBlue);
            ObjectSetInteger(0,"Bt2",OBJPROP_STATE,false);
           }
        }

     
      if(Fibbo_Table_Enable)
         TableMaking();
      if(Display_Table_Enable)
         DisplayCardMaking();
      if(Difference_Table_Enable)
         DifferenceTable();
      if(Risk_Table_Enable)
         RiskTable();
     }

   return(INIT_SUCCEEDED);
  }

void OnDeinit(const int reason)
  {


   ObjectsDeleteAll(0);
   RobJ("RSIDiv ");
   RobJ("Arrow");
   RobJ("cond");
   ObjectsDeleteAll(0,OBJ_TREND);
   ObjectsDeleteAll(0,OBJ_RECTANGLE_LABEL);
   ObjectsDeleteAll(0,OBJ_LABEL);
   ObjectDelete(0,"Bt1");
   ObjectsDeleteAll(0);

   for(int i1=ObjectsTotal(0,-1,-1); i1>=0; i1--)
     {

      if(StringFind(ObjectName(i1), "XX")!=-1)
         ObjectDelete(0,ObjectName(i1));
     }
   for(int i=ObjectsTotal(0,-1,-1); i>=0; i--)
     {
      ObjectDelete(0,ObjectName(i));
     }



  }

void OnChartEvent(const int id,
                  const long &lparam,
                  const double &dparam,
                  const string &sparam)
  {

   if(Show_Graphic_Object && ! Using_IN_EA)
     {
      if(OffButton && ObjectGetInteger(0,"Bt1",OBJPROP_STATE)==false)
        {
         ObjectSetString(0,"Bt1",OBJPROP_TEXT,"Tables Off");
         ObjectSetInteger(0,"Bt1",OBJPROP_BGCOLOR,clrRed);
         OnButton=true;
         OffButton=false;
         OBJECTMOVEIN(mfirst);
         mfirst=false;
         ChartRedraw();
        }

      if(OnButton && ObjectGetInteger(0,"Bt1",OBJPROP_STATE)==true)
        {
         ObjectSetString(0,"Bt1",OBJPROP_TEXT,"Tables On");
         ObjectSetInteger(0,"Bt1",OBJPROP_BGCOLOR,clrGreen);
         OnButton=false;
         OffButton=true;
         OBJECTMOVEOUT();
         ChartRedraw();
        }
      if(ObjectGetInteger(0,"Bt2",OBJPROP_STATE)==true)
        {
         
         string str="{    \"Name\": \"Signal\",\"Symbol\": \"EURUSD\",\"Period\": \"00:05:00\",\"Mode\": \"Buy\",\"SL\": 1.1,\"EN1\": 1.2,\"EN1_Lot\": 1.3,\"EN2\": 1.4,\"EN2_Lot\": 1.5,\"TP1\": 1.6,\"TP2\": 1.7,\"TP3\": 1.8,\"TP4\": 1.8,\"SL_EN1\": 1.9,\"SL_EN2\": 2.0,\"TP1_EN1\": 2.1,\"TP1_EN2\": 2.2,\"TP2_EN1\": 2.3,\"TP2_EN2\": 2.4,\"TP3_EN1\": 2.5,\"TP3_EN2\": 2.6,\"TP4_EN1\": 2.7,\"TP4_EN2\": 2.8}";
         
         RefreshObject();
         ChartRedraw();
         WindowRedraw();
         ObjectSetInteger(0,"Bt2",OBJPROP_STATE,false);
        }
      if(((WindowPriceMax(0)-WindowPriceMin(0))!=window_width))
        {
         window_width=(WindowPriceMax(0)-WindowPriceMin(0));
         for(int j=WindowFirstVisibleBar()-1000; j<=WindowFirstVisibleBar()+1000+WindowBarsPerChart(); j++)
           {
            if(ObjectFind(0,"texmaker_up"+Time[j])==0)
              {
               ObjectMove("texmaker_up"+Time[j],ANCHOR_LEFT_UPPER,Time[j],Low[j]-window_width*0.125);
              }
            if(ObjectFind(0,"Arrow_Up"+Time[j])==0)
              {
               ObjectMove("Arrow_Up"+Time[j],ANCHOR_LEFT_UPPER,Time[j],Low[j]-window_width*0.055);
              }
            if(ObjectFind(0,"texmaker_down"+Time[j])==0)
              {
               ObjectMove("texmaker_down"+Time[j],ANCHOR_LEFT_UPPER,Time[j],High[j]+window_width*0.125);
              }
            if(ObjectFind(0,"Arrow_Dn"+Time[j])==0)
              {
               ObjectMove("Arrow_Dn"+Time[j],ANCHOR_LEFT_UPPER,Time[j],High[j]+window_width*0.055);
              }
            window_width=(WindowPriceMax(0)-WindowPriceMin(0));

           }


        }
     }

  }

void Dir_BU_div_detec(int shift) 
  {
   int t4;
   datetime h1,h2;
   string s7;
   if(IsdTgh(shift) == false)
      return;
   int cTgh = shift;
   int lTgh = GiLTgh(shift);
   if(rsi_L[cTgh] >= rsi_L[lTgh] && Close[cTgh]<=Close[lTgh] && Close[cTgh]<Open[cTgh] && Close[lTgh]<Open[lTgh] && BuC(lTgh,cTgh) && BuCr(lTgh,cTgh)&&((RSI_Filter&&rsi_L[cTgh]<bulish_Level)||RSI_Filter==0))
     {

      LastD=Time[cTgh];
      Dir_BU_div_alarm_trig=true;
      Dir_BU_div_trig=true;
      Long_BU_div_trig=false;
      Dir_BE_div_trig=false;
      Long_BU_div_trig=false;


  
      if((!U_USE && !V_USE)  && (Dir_BU_div_CCB_trig || Dir_BU_div_CC_trig) && !last_dive_deleted && Lshift!=shift)
         Dir_BU_div_incomp_del(shift);
      if((!U_USE && !V_USE)  && (Long_BU_div_CCB_trig  || Long_BU_div_CC_trig)&& !last_dive_deleted && Lshift!=shift)
        {

         Long_BU_div_incomp_del(shift);

        }
      if((!U_USE && !V_USE)  && (Dir_BE_div_CCB_trig || Dir_BE_div_CCB_trig)&& !last_dive_deleted && Lshift!=shift)
         Dir_BE_div_incomp_del(shift);
      if((!U_USE && !V_USE) && (Long_BE_div_CCB_trig ||Long_BE_div_CC_trig)&& !last_dive_deleted && Lshift!=shift)
         Long_BE_div_incomp_del(shift);
      
      if((!U_USE && !V_USE)  && (H_Dir_BU_div_CCB_trig || H_Dir_BU_div_CC_trig) && !last_dive_deleted && Lshift!=shift)
         H_Dir_BU_div_incomp_del(shift);
      if((!U_USE && !V_USE)  && (H_Long_BU_div_CCB_trig  || H_Long_BU_div_CC_trig)&& !last_dive_deleted && Lshift!=shift)
        {

         H_Long_BU_div_incomp_del(shift);

        }
      if((!U_USE && !V_USE)  && (H_Dir_BE_div_CCB_trig || H_Dir_BE_div_CCB_trig)&& !last_dive_deleted && Lshift!=shift)
         H_Dir_BE_div_incomp_del(shift);
      if((!U_USE && !V_USE) && (H_Long_BE_div_CCB_trig ||H_Long_BE_div_CC_trig)&& !last_dive_deleted && Lshift!=shift)
         H_Long_BE_div_incomp_del(shift);



      Dir_Arrow_Zone_trig=true;
      Dir_fast_MA_trig=true;
      Dir_slow_MA_trig=true;
 
      U_USE=false;
      V_USE=false;
      Dir_BU_div_CCB_trig=false;
      Long_BU_div_CCB_trig=false;
      Dir_BE_div_CCB_trig=false;
      Long_BE_div_CCB_trig=false;
     
      Dir_BU_div_CC_trig=false;
      Dir_BE_div_CC_trig=false;
      Long_BU_div_CC_trig=false;
      Long_BE_div_CC_trig=false;
      
      Dir_BU_div_CP_trig=false;
      Long_BU_div_CP_trig=false;
      Dir_BE_div_CP_trig=false;
      Long_BE_div_CP_trig=false;
     
      H_Dir_BU_div_CCB_trig=false;
      H_Long_BU_div_CCB_trig=false;
      H_Dir_BE_div_CCB_trig=false;
      H_Long_BE_div_CCB_trig=false;

      H_Dir_BU_div_CC_trig=false;
      H_Dir_BE_div_CC_trig=false;
      H_Long_BU_div_CC_trig=false;
      H_Long_BE_div_CC_trig=false;

      H_Dir_BU_div_CP_trig=false;
      H_Long_BU_div_CP_trig=false;
      H_Dir_BE_div_CP_trig=false;
      H_Long_BE_div_CP_trig=false;
      CC_valid_state=false;
      CCB_valid_state=false;
      CP_valid_state=false;
      last_dive_deleted=false;
      CP_del_Dir_div=true;
      Lshift=shift;
      dType[shift] = 1;
      Dir_BU_div_CC_trig=true;
      Dir_BU_div_del_trig=true;
      Fib_Switch=false;
      Fib_Switch_Lengthy=false;
      Dir_BU_div_CCB_trig=false;
      dRSId[cTgh] = MathAbs(rsi_L[cTgh] - rsi_L[lTgh]);
      dRSIdp[cTgh] = MathAbs(Low[cTgh] - Low[lTgh]);
      if(Show_Graphic_Object)
        {
         ObjectSetText("XXDType","BUY");
         ObjectSetText("XXCCB_Value","Waiting");
         ObjectSetText("XXCC_Value","Waiting");
         if(DrawPriceTrendLines)
           {
            h1=Time[cTgh];
            h2=Time[lTgh];
            s7=StringConcatenate(PriceLine,h1," ",h2);

            t4=0;
            DTL(s7,t4,h1,Close[cTgh],h2,Close[lTgh],LongColour,STYLE_SOLID,Divergence_Line_Width);
            DA(0,0,cTgh-1,Low[cTgh-1]);


           }
         if(DrawIndicatorTrendLines)
           {
            h1=Time[cTgh];
            h2=Time[lTgh];
            s7=StringConcatenate(RSILine,h1," ",h2);

            t4=ChartWindowFind(0,indicatorName);
            DTL(s7,t4,h1,rsi_L[cTgh],h2,rsi_L[lTgh],LongColour,STYLE_SOLID,Divergence_Line_Width);


           }
        }

     }
  }

void H_Dir_BU_div_detec(int shift) 
  {
   int t4;
   datetime h1,h2;
   string s7;
   if(IsdTgh(shift) == false)
      return;
   int cTgh = shift;
   int lTgh = GiLTgh(shift);
   if(rsi_L[cTgh] <= rsi_L[lTgh] && Close[cTgh]>=Close[lTgh] && Close[cTgh]<Open[cTgh] && Close[lTgh]<Open[lTgh] && BuC(lTgh,cTgh) && BuCr(lTgh,cTgh)&&((RSI_Filter&&rsi_L[cTgh]<bulish_Level)||RSI_Filter==0))
     {

      LastD=Time[cTgh];
      Dir_BU_div_alarm_trig=true;
      Dir_BU_div_trig=true;
      Long_BU_div_trig=false;
      Dir_BE_div_trig=false;
      Long_BU_div_trig=false;


   
      if((!U_USE && !V_USE)  && (Dir_BU_div_CCB_trig || Dir_BU_div_CC_trig) && !last_dive_deleted && Lshift!=shift)
         Dir_BU_div_incomp_del(shift);
      if((!U_USE && !V_USE)  && (Long_BU_div_CCB_trig  || Long_BU_div_CC_trig)&& !last_dive_deleted && Lshift!=shift)
        {

         Long_BU_div_incomp_del(shift);

        }
      if((!U_USE && !V_USE)  && (Dir_BE_div_CCB_trig || Dir_BE_div_CCB_trig)&& !last_dive_deleted && Lshift!=shift)
         Dir_BE_div_incomp_del(shift);
      if((!U_USE && !V_USE) && (Long_BE_div_CCB_trig ||Long_BE_div_CC_trig)&& !last_dive_deleted && Lshift!=shift)
         Long_BE_div_incomp_del(shift);

      if((!U_USE && !V_USE)  && (H_Dir_BU_div_CCB_trig || H_Dir_BU_div_CC_trig) && !last_dive_deleted && Lshift!=shift)
         H_Dir_BU_div_incomp_del(shift);
      if((!U_USE && !V_USE)  && (H_Long_BU_div_CCB_trig  || H_Long_BU_div_CC_trig)&& !last_dive_deleted && Lshift!=shift)
        {

         H_Long_BU_div_incomp_del(shift);

        }
      if((!U_USE && !V_USE)  && (H_Dir_BE_div_CCB_trig || H_Dir_BE_div_CCB_trig)&& !last_dive_deleted && Lshift!=shift)
         H_Dir_BE_div_incomp_del(shift);
      if((!U_USE && !V_USE) && (H_Long_BE_div_CCB_trig ||H_Long_BE_div_CC_trig)&& !last_dive_deleted && Lshift!=shift)
         H_Long_BE_div_incomp_del(shift);



      Dir_Arrow_Zone_trig=true;
      Dir_fast_MA_trig=true;
      Dir_slow_MA_trig=true;

      U_USE=false;
      V_USE=false;
      Dir_BU_div_CCB_trig=false;
      Long_BU_div_CCB_trig=false;
      Dir_BE_div_CCB_trig=false;
      Long_BE_div_CCB_trig=false;

      Dir_BU_div_CC_trig=false;
      Dir_BE_div_CC_trig=false;
      Long_BU_div_CC_trig=false;
      Long_BE_div_CC_trig=false;

      Dir_BU_div_CP_trig=false;
      Long_BU_div_CP_trig=false;
      Dir_BE_div_CP_trig=false;
      Long_BE_div_CP_trig=false;

      H_Dir_BU_div_CCB_trig=false;
      H_Long_BU_div_CCB_trig=false;
      H_Dir_BE_div_CCB_trig=false;
      H_Long_BE_div_CCB_trig=false;

      H_Dir_BU_div_CC_trig=false;
      H_Dir_BE_div_CC_trig=false;
      H_Long_BU_div_CC_trig=false;
      H_Long_BE_div_CC_trig=false;

      H_Dir_BU_div_CP_trig=false;
      H_Long_BU_div_CP_trig=false;
      H_Dir_BE_div_CP_trig=false;
      H_Long_BE_div_CP_trig=false;
      CC_valid_state=false;
      CCB_valid_state=false;
      CP_valid_state=false;
      last_dive_deleted=false;
      CP_del_Dir_div=true;
      Lshift=shift;
      dType[shift] = 5;
      H_Dir_BU_div_CC_trig=true;
      H_Dir_BU_div_del_trig=true;
      Fib_Switch=false;
      Fib_Switch_Lengthy=false;
      Dir_BU_div_CCB_trig=false;
      dRSId[cTgh] = MathAbs(rsi_L[cTgh] - rsi_L[lTgh]);
      dRSIdp[cTgh] = MathAbs(Low[cTgh] - Low[lTgh]);
      if(Show_Graphic_Object)
        {
         ObjectSetText("XXDType","BUY");
         ObjectSetText("XXCCB_Value","Waiting");
         ObjectSetText("XXCC_Value","Waiting");
         if(DrawPriceTrendLines)
           {
            h1=Time[cTgh];
            h2=Time[lTgh];
            s7=StringConcatenate(PriceLine,h1," ",h2);

            t4=0;
            DTL(s7,t4,h1,Close[cTgh],h2,Close[lTgh],H_LongColour,STYLE_SOLID,H_Divergence_Line_Width);
            DA(1,0,cTgh-1,Low[cTgh-1]);


           }
         if(DrawIndicatorTrendLines)
           {
            h1=Time[cTgh];
            h2=Time[lTgh];
            s7=StringConcatenate(RSILine,h1," ",h2);

            t4=ChartWindowFind(0,indicatorName);
            DTL(s7,t4,h1,rsi_L[cTgh],h2,rsi_L[lTgh],H_LongColour,STYLE_SOLID,H_Divergence_Line_Width);


           }
        }

     }
  }

void Long_BU_div_detec(int shift) 
  {
   int t4;
   datetime h1,h2;
   string s7;
   if(IsdTgh(shift) == false)
      return;
   int cTgh = shift;
   for(int a=shift+2; a<=shift+Max_Bars_Lengthy; a++)
     {
      int lTgh = GiLTghp(a, shift+2);
      if(rsi_L[cTgh] >= rsi_L[lTgh] && Close[cTgh]<=Close[lTgh] && Close[cTgh]<Open[cTgh] && Close[lTgh]<Open[lTgh] && BuC(lTgh,cTgh) && BuCr(lTgh,cTgh)&&((RSI_Filter_Lengthy&&rsi_L[cTgh]<bulish_Level_Lengthy&&rsi_L[lTgh]<bulish_Level_Lengthy)||RSI_Filter_Lengthy==0))
        {
         dType[cTgh]= 2;

         LastD=Time[cTgh];
         Dir_BU_div_trig=false;
         Long_BU_div_trig=true;
         Dir_BE_div_trig=false;
         Long_BE_div_trig=false;


         Long_BU_div_alarm_trig=true;
    
         if((!U_USE && !V_USE)  && (Dir_BU_div_CCB_trig || Dir_BU_div_CC_trig) && !last_dive_deleted && Lshift!=shift)
            Dir_BU_div_incomp_del(shift);
         if((!U_USE && !V_USE)  && (Long_BU_div_CCB_trig  || Long_BU_div_CC_trig)&& !last_dive_deleted && Lshift!=shift)
           {

            Long_BU_div_incomp_del(shift);

           }
         if((!U_USE && !V_USE)  && (Dir_BE_div_CCB_trig || Dir_BE_div_CCB_trig)&& !last_dive_deleted && Lshift!=shift)
            Dir_BE_div_incomp_del(shift);
         if((!U_USE && !V_USE) && (Long_BE_div_CCB_trig ||Long_BE_div_CC_trig)&& !last_dive_deleted && Lshift!=shift)
            Long_BE_div_incomp_del(shift);
    
         if((!U_USE && !V_USE)  && (H_Dir_BU_div_CCB_trig || H_Dir_BU_div_CC_trig) && !last_dive_deleted && Lshift!=shift)
            H_Dir_BU_div_incomp_del(shift);
         if((!U_USE && !V_USE)  && (H_Long_BU_div_CCB_trig  || H_Long_BU_div_CC_trig)&& !last_dive_deleted && Lshift!=shift)
           {

            H_Long_BU_div_incomp_del(shift);

           }
         if((!U_USE && !V_USE)  && (H_Dir_BE_div_CCB_trig || H_Dir_BE_div_CCB_trig)&& !last_dive_deleted && Lshift!=shift)
            H_Dir_BE_div_incomp_del(shift);
         if((!U_USE && !V_USE) && (H_Long_BE_div_CCB_trig ||H_Long_BE_div_CC_trig)&& !last_dive_deleted && Lshift!=shift)
            H_Long_BE_div_incomp_del(shift);



         Long_Arrow_Zone_trig=true;
         Long_fast_MA_trig=true;
         Long_slow_MA_trig=true;

         U_USE=false;
         V_USE=false;
         Dir_BU_div_CCB_trig=false;
         Long_BU_div_CCB_trig=false;
         Dir_BE_div_CCB_trig=false;
         Long_BE_div_CCB_trig=false;

         Dir_BU_div_CC_trig=false;
         Dir_BE_div_CC_trig=false;
         Long_BU_div_CC_trig=false;
         Long_BE_div_CC_trig=false;
   
         Dir_BU_div_CP_trig=false;
         Long_BU_div_CP_trig=false;
         Dir_BE_div_CP_trig=false;
         Long_BE_div_CP_trig=false;
 
         H_Dir_BU_div_CCB_trig=false;
         H_Long_BU_div_CCB_trig=false;
         H_Dir_BE_div_CCB_trig=false;
         H_Long_BE_div_CCB_trig=false;

         H_Dir_BU_div_CC_trig=false;
         H_Dir_BE_div_CC_trig=false;
         H_Long_BU_div_CC_trig=false;
         H_Long_BE_div_CC_trig=false;

         H_Dir_BU_div_CP_trig=false;
         H_Long_BU_div_CP_trig=false;
         H_Dir_BE_div_CP_trig=false;
         H_Long_BE_div_CP_trig=false;
         CC_valid_state=false;
         CCB_valid_state=false;
         CP_valid_state=false;

         CP_del_Long_div=true;
         last_dive_deleted=false;
         Fib_Switch=false;
         Fib_Switch_Lengthy=false;
         Long_BU_div_CC_trig=true;
         Lshift=shift;
         KLONG=true;
         Long_BU_div_CCB_trig=false;
         Long_BU_div_del_trig=true;
         dRSId[cTgh] = MathAbs(rsi_L[cTgh] - rsi_L[lTgh]);
         dRSIdp[cTgh] = MathAbs(Low[cTgh] - Low[lTgh]);
         if(Show_Graphic_Object)
           {
            ObjectSetText("XXDType","BUY");
            ObjectSetText("XXCCB_Value","Waiting");
            ObjectSetText("XXCC_Value","Waiting");



            if(DrawPriceTrendLines_Lengthy)
              {
               h1=Time[cTgh];
               h2=Time[lTgh];
               s7=StringConcatenate(PriceLine,h1," ",h2);



               t4=0;
               DTL(s7,t4,h1,Close[cTgh],h2,Close[lTgh],LongColour_Lengthy,STYLE_SOLID,Divergence_Line_Width_Lengthy);
               DA_L(0,0,cTgh-1,Low[cTgh-1]);


              }
            if(DrawIndicatorTrendLines_Lengthy)
              {
               h1=Time[cTgh];
               h2=Time[lTgh];

               s7=StringConcatenate(RSILine,h1," ",h2);
       

               t4=ChartWindowFind(0,indicatorName);
               DTL(s7,t4,h1,rsi_L[cTgh],h2,rsi_L[lTgh],LongColour_Lengthy,STYLE_SOLID,1);

              }
           }


        }
     }
  }

void H_Long_BU_div_detec(int shift) 
  {
   int t4;
   datetime h1,h2;
   string s7;
   if(IsdTgh(shift) == false)
      return;
   int cTgh = shift;
   for(int a=shift+2; a<=shift+Max_Bars_Lengthy; a++)
     {
      int lTgh = GiLTghp(a, shift+2);
      if(rsi_L[cTgh] <= rsi_L[lTgh] && Close[cTgh]>=Close[lTgh] && Close[cTgh]<Open[cTgh] && Close[lTgh]<Open[lTgh] && BuC(lTgh,cTgh) && BuCr(lTgh,cTgh)&&((RSI_Filter_Lengthy&&rsi_L[cTgh]<bulish_Level_Lengthy&&rsi_L[lTgh]<bulish_Level_Lengthy)||RSI_Filter_Lengthy==0))
        {
         dType[cTgh]= 6;

         LastD=Time[cTgh];
         Dir_BU_div_trig=false;
         Long_BU_div_trig=true;
         Dir_BE_div_trig=false;
         Long_BE_div_trig=false;


         H_Long_BU_div_alarm_trig=true;
        
         if((!U_USE && !V_USE)  && (Dir_BU_div_CCB_trig || Dir_BU_div_CC_trig) && !last_dive_deleted && Lshift!=shift)
            Dir_BU_div_incomp_del(shift);
         if((!U_USE && !V_USE)  && (Long_BU_div_CCB_trig  || Long_BU_div_CC_trig)&& !last_dive_deleted && Lshift!=shift)
           {

            Long_BU_div_incomp_del(shift);

           }
         if((!U_USE && !V_USE)  && (Dir_BE_div_CCB_trig || Dir_BE_div_CCB_trig)&& !last_dive_deleted && Lshift!=shift)
            Dir_BE_div_incomp_del(shift);
         if((!U_USE && !V_USE) && (Long_BE_div_CCB_trig ||Long_BE_div_CC_trig)&& !last_dive_deleted && Lshift!=shift)
            Long_BE_div_incomp_del(shift);
   
         if((!U_USE && !V_USE)  && (H_Dir_BU_div_CCB_trig || H_Dir_BU_div_CC_trig) && !last_dive_deleted && Lshift!=shift)
            H_Dir_BU_div_incomp_del(shift);
         if((!U_USE && !V_USE)  && (H_Long_BU_div_CCB_trig  || H_Long_BU_div_CC_trig)&& !last_dive_deleted && Lshift!=shift)
           {

            H_Long_BU_div_incomp_del(shift);

           }
         if((!U_USE && !V_USE)  && (H_Dir_BE_div_CCB_trig || H_Dir_BE_div_CCB_trig)&& !last_dive_deleted && Lshift!=shift)
            H_Dir_BE_div_incomp_del(shift);
         if((!U_USE && !V_USE) && (H_Long_BE_div_CCB_trig ||H_Long_BE_div_CC_trig)&& !last_dive_deleted && Lshift!=shift)
            H_Long_BE_div_incomp_del(shift);



         Long_Arrow_Zone_trig=true;
         Long_fast_MA_trig=true;
         Long_slow_MA_trig=true;

         U_USE=false;
         V_USE=false;
         Dir_BU_div_CCB_trig=false;
         Long_BU_div_CCB_trig=false;
         Dir_BE_div_CCB_trig=false;
         Long_BE_div_CCB_trig=false;
     
         Dir_BU_div_CC_trig=false;
         Dir_BE_div_CC_trig=false;
         Long_BU_div_CC_trig=false;
         Long_BE_div_CC_trig=false;
      
         Dir_BU_div_CP_trig=false;
         Long_BU_div_CP_trig=false;
         Dir_BE_div_CP_trig=false;
         Long_BE_div_CP_trig=false;
   
         H_Dir_BU_div_CCB_trig=false;
         H_Long_BU_div_CCB_trig=false;
         H_Dir_BE_div_CCB_trig=false;
         H_Long_BE_div_CCB_trig=false;
 
         H_Dir_BU_div_CC_trig=false;
         H_Dir_BE_div_CC_trig=false;
         H_Long_BU_div_CC_trig=false;
         H_Long_BE_div_CC_trig=false;
      
         H_Dir_BU_div_CP_trig=false;
         H_Long_BU_div_CP_trig=false;
         H_Dir_BE_div_CP_trig=false;
         H_Long_BE_div_CP_trig=false;
         CC_valid_state=false;
         CCB_valid_state=false;
         CP_valid_state=false;

         CP_del_Long_div=true;
         last_dive_deleted=false;
         Fib_Switch=false;
         Fib_Switch_Lengthy=false;
         H_Long_BU_div_CC_trig=true;
         Lshift=shift;
         KLONG=true;
         H_Long_BU_div_CCB_trig=false;
         H_Long_BU_div_del_trig=true;
         dRSId[cTgh] = MathAbs(rsi_L[cTgh] - rsi_L[lTgh]);
         dRSIdp[cTgh] = MathAbs(Low[cTgh] - Low[lTgh]);
         if(Show_Graphic_Object)
           {
            ObjectSetText("XXDType","BUY");
            ObjectSetText("XXCCB_Value","Waiting");
            ObjectSetText("XXCC_Value","Waiting");



            if(DrawPriceTrendLines_Lengthy)
              {
               h1=Time[cTgh];
               h2=Time[lTgh];
               s7=StringConcatenate(PriceLine,h1," ",h2);



               t4=0;
               DTL(s7,t4,h1,Close[cTgh],h2,Close[lTgh],H_LongColour_Lengthy,STYLE_SOLID,H_Divergence_Line_Width_Lengthy);
               DA_L(1,0,cTgh-1,Low[cTgh-1]);


              }
            if(DrawIndicatorTrendLines_Lengthy)
              {
               h1=Time[cTgh];
               h2=Time[lTgh];

               s7=StringConcatenate(RSILine,h1," ",h2);
    

               t4=ChartWindowFind(0,indicatorName);
               DTL(s7,t4,h1,rsi_L[cTgh],h2,rsi_L[lTgh],H_LongColour_Lengthy,STYLE_SOLID,1);

              }
           }


        }
     }
  }

void Dir_BE_div_detec(int shift) 
  {
   int t4;
   datetime h1,h2;
   string s7;
   if(IsdPk(shift) == false)
      return;
   int cPk = shift;
   int lPk = GiLpK(shift);
   if(rsi_L[cPk] <= rsi_L[lPk] && Close[cPk]>=Close[lPk] && Close[cPk]>Open[cPk] && Close[lPk]>Open[lPk] && BeC(lPk,cPk) && BeCr(lPk,cPk)&&((RSI_Filter&&rsi_L[cPk]>bearish_Level)||RSI_Filter==0))
     {
      dType[shift]= 3; 
      LastD=Time[cPk];

      Dir_BE_div_alarm_trig=true;
   
      if((!U_USE && !V_USE)  && (Dir_BU_div_CCB_trig || Dir_BU_div_CC_trig) && !last_dive_deleted && Lshift!=shift)
         Dir_BU_div_incomp_del(shift);
      if((!U_USE && !V_USE)  && (Long_BU_div_CCB_trig  || Long_BU_div_CC_trig)&& !last_dive_deleted && Lshift!=shift)
        {

         Long_BU_div_incomp_del(shift);

        }
      if((!U_USE && !V_USE)  && (Dir_BE_div_CCB_trig || Dir_BE_div_CCB_trig)&& !last_dive_deleted && Lshift!=shift)
         Dir_BE_div_incomp_del(shift);
      if((!U_USE && !V_USE) && (Long_BE_div_CCB_trig ||Long_BE_div_CC_trig)&& !last_dive_deleted && Lshift!=shift)
         Long_BE_div_incomp_del(shift);

      if((!U_USE && !V_USE)  && (H_Dir_BU_div_CCB_trig || H_Dir_BU_div_CC_trig) && !last_dive_deleted && Lshift!=shift)
         H_Dir_BU_div_incomp_del(shift);
      if((!U_USE && !V_USE)  && (H_Long_BU_div_CCB_trig  || H_Long_BU_div_CC_trig)&& !last_dive_deleted && Lshift!=shift)
        {

         H_Long_BU_div_incomp_del(shift);

        }
      if((!U_USE && !V_USE)  && (H_Dir_BE_div_CCB_trig || H_Dir_BE_div_CCB_trig)&& !last_dive_deleted && Lshift!=shift)
         H_Dir_BE_div_incomp_del(shift);
      if((!U_USE && !V_USE) && (H_Long_BE_div_CCB_trig ||H_Long_BE_div_CC_trig)&& !last_dive_deleted && Lshift!=shift)
         H_Long_BE_div_incomp_del(shift);



      Dir_Arrow_Zone_trig=true;
      Dir_fast_MA_trig=true;
      Dir_slow_MA_trig=true;
 
      Dir_BU_div_trig=false;
      Long_BU_div_trig=false;
      Dir_BE_div_trig=true;
      Long_BE_div_trig=false;

      U_USE=false;
      V_USE=false;
      Dir_BU_div_CCB_trig=false;
      Long_BU_div_CCB_trig=false;
      Dir_BE_div_CCB_trig=false;
      Long_BE_div_CCB_trig=false;
  
      Dir_BU_div_CC_trig=false;
      Dir_BE_div_CC_trig=false;
      Long_BU_div_CC_trig=false;
      Long_BE_div_CC_trig=false;
  
      Dir_BU_div_CP_trig=false;
      Long_BU_div_CP_trig=false;
      Dir_BE_div_CP_trig=false;
      Long_BE_div_CP_trig=false;
  
      H_Dir_BU_div_CCB_trig=false;
      H_Long_BU_div_CCB_trig=false;
      H_Dir_BE_div_CCB_trig=false;
      H_Long_BE_div_CCB_trig=false;

      H_Dir_BU_div_CC_trig=false;
      H_Dir_BE_div_CC_trig=false;
      H_Long_BU_div_CC_trig=false;
      H_Long_BE_div_CC_trig=false;
   
      H_Dir_BU_div_CP_trig=false;
      H_Long_BU_div_CP_trig=false;
      H_Dir_BE_div_CP_trig=false;
      H_Long_BE_div_CP_trig=false;
      CC_valid_state=false;
      CCB_valid_state=false;
      CP_valid_state=false;
      Lshift=shift;
      KLONG=true;
      Dir_BE_div_del_trig=true;
      Dir_BE_div_CC_trig=true;
      last_dive_deleted=false;
      Dir_BE_div_CCB_trig=false;

      Fib_Switch=false;
      Fib_Switch_Lengthy=false;
      dRSId[cPk] = MathAbs(rsi_L[cPk] - rsi_L[lPk]);
      dRSIdp[cPk] = MathAbs(Low[cPk] - Low[lPk]);

      if(Show_Graphic_Object)
        {
         ObjectSetText("XXDType","SELL");
         ObjectSetText("XXCCB_Value","Waiting");
         ObjectSetText("XXCC_Value","Waiting");


         if(DrawPriceTrendLines)
           {
            h1=Time[cPk];
            h2=Time[lPk];
            s7=StringConcatenate(PriceLine,h1," ",h2);

            t4=0;
            DTL(s7,t4,h1,Close[cPk],h2,Close[lPk],ShortColour,STYLE_SOLID,Divergence_Line_Width);
            DA(0,1,cPk-1,High[cPk-1]);



           }
         if(DrawIndicatorTrendLines)
           {
            h1=Time[cPk];
            h2=Time[lPk];
            s7=StringConcatenate(RSILine,h1," ",h2);

            t4=ChartWindowFind(0,indicatorName);
            DTL(s7,t4,h1,rsi_L[cPk],h2,rsi_L[lPk],ShortColour,STYLE_SOLID,Divergence_Line_Width);


           }
        }

     }
  }

void H_Dir_BE_div_detec(int shift) 
  {
   int t4;
   datetime h1,h2;
   string s7;
   if(IsdPk(shift) == false)
      return;
   int cPk = shift;
   int lPk = GiLpK(shift);
   if(rsi_L[cPk] >= rsi_L[lPk] && Close[cPk]<=Close[lPk] && Close[cPk]>Open[cPk] && Close[lPk]>Open[lPk] && BeC(lPk,cPk) && BeCr(lPk,cPk)&&((RSI_Filter&&rsi_L[cPk]>bearish_Level)||RSI_Filter==0))
     {
      dType[shift]= 7;
      LastD=Time[cPk];

      H_Dir_BE_div_alarm_trig=true;
   
      if((!U_USE && !V_USE)  && (Dir_BU_div_CCB_trig || Dir_BU_div_CC_trig) && !last_dive_deleted && Lshift!=shift)
        {
         Dir_BU_div_incomp_del(shift);
         TextMaker(0,0,1,shift,"444");

        }
      if((!U_USE && !V_USE)  && (Long_BU_div_CCB_trig  || Long_BU_div_CC_trig)&& !last_dive_deleted && Lshift!=shift)
        {

         Long_BU_div_incomp_del(shift);

        }
      if((!U_USE && !V_USE)  && (Dir_BE_div_CCB_trig || Dir_BE_div_CCB_trig)&& !last_dive_deleted && Lshift!=shift)
         Dir_BE_div_incomp_del(shift);
      if((!U_USE && !V_USE) && (Long_BE_div_CCB_trig ||Long_BE_div_CC_trig)&& !last_dive_deleted && Lshift!=shift)
         Long_BE_div_incomp_del(shift);
    
      if((!U_USE && !V_USE)  && (H_Dir_BU_div_CCB_trig || H_Dir_BU_div_CC_trig) && !last_dive_deleted && Lshift!=shift)
         H_Dir_BU_div_incomp_del(shift);
      if((!U_USE && !V_USE)  && (H_Long_BU_div_CCB_trig  || H_Long_BU_div_CC_trig)&& !last_dive_deleted && Lshift!=shift)
        {

         H_Long_BU_div_incomp_del(shift);

        }
      if((!U_USE && !V_USE)  && (H_Dir_BE_div_CCB_trig || H_Dir_BE_div_CCB_trig)&& !last_dive_deleted && Lshift!=shift)
         H_Dir_BE_div_incomp_del(shift);
      if((!U_USE && !V_USE) && (H_Long_BE_div_CCB_trig ||H_Long_BE_div_CC_trig)&& !last_dive_deleted && Lshift!=shift)
         H_Long_BE_div_incomp_del(shift);



      Dir_Arrow_Zone_trig=true;
      Dir_fast_MA_trig=true;
      Dir_slow_MA_trig=true;
   
      Dir_BU_div_trig=false;
      Long_BU_div_trig=false;
      Dir_BE_div_trig=true;
      Long_BE_div_trig=false;

      U_USE=false;
      V_USE=false;
      Dir_BU_div_CCB_trig=false;
      Long_BU_div_CCB_trig=false;
      Dir_BE_div_CCB_trig=false;
      Long_BE_div_CCB_trig=false;
  
      Dir_BU_div_CC_trig=false;
      Dir_BE_div_CC_trig=false;
      Long_BU_div_CC_trig=false;
      Long_BE_div_CC_trig=false;
 
      Dir_BU_div_CP_trig=false;
      Long_BU_div_CP_trig=false;
      Dir_BE_div_CP_trig=false;
      Long_BE_div_CP_trig=false;
 
      H_Dir_BU_div_CCB_trig=false;
      H_Long_BU_div_CCB_trig=false;
      H_Dir_BE_div_CCB_trig=false;
      H_Long_BE_div_CCB_trig=false;
    
      H_Dir_BU_div_CC_trig=false;
      H_Dir_BE_div_CC_trig=false;
      H_Long_BU_div_CC_trig=false;
      H_Long_BE_div_CC_trig=false;

      H_Dir_BU_div_CP_trig=false;
      H_Long_BU_div_CP_trig=false;
      H_Dir_BE_div_CP_trig=false;
      H_Long_BE_div_CP_trig=false;
      CC_valid_state=false;
      CCB_valid_state=false;
      CP_valid_state=false;
      Lshift=shift;
      KLONG=true;
      H_Dir_BE_div_del_trig=true;
      H_Dir_BE_div_CC_trig=true;
      last_dive_deleted=false;
      H_Dir_BE_div_CCB_trig=false;

      Fib_Switch=false;
      Fib_Switch_Lengthy=false;
      dRSId[cPk] = MathAbs(rsi_L[cPk] - rsi_L[lPk]);
      dRSIdp[cPk] = MathAbs(Low[cPk] - Low[lPk]);

      if(Show_Graphic_Object)
        {
         ObjectSetText("XXDType","SELL");
         ObjectSetText("XXCCB_Value","Waiting");
         ObjectSetText("XXCC_Value","Waiting");


         if(DrawPriceTrendLines)
           {
            h1=Time[cPk];
            h2=Time[lPk];
            s7=StringConcatenate(PriceLine,h1," ",h2);

            t4=0;
            DTL(s7,t4,h1,Close[cPk],h2,Close[lPk],H_ShortColour,STYLE_SOLID,H_Divergence_Line_Width);
            DA(1,1,cPk-1,High[cPk-1]);



           }
         if(DrawIndicatorTrendLines)
           {
            h1=Time[cPk];
            h2=Time[lPk];
            s7=StringConcatenate(RSILine,h1," ",h2);

            t4=ChartWindowFind(0,indicatorName);
            DTL(s7,t4,h1,rsi_L[cPk],h2,rsi_L[lPk],H_ShortColour,STYLE_SOLID,H_Divergence_Line_Width);


           }
        }

     }
  }

void Long_BE_div_detec(int shift)
  {
   int t4;
   datetime h1,h2;
   string s7;
   if(IsdPk(shift) == false)
      return;
   int cPk = shift;
   for(int a=shift+2; a<=shift+Max_Bars_Lengthy; a++)
     {
      int lPk = GiLpKp(a, shift+2);
      if(rsi_L[cPk] <= rsi_L[lPk] && Close[cPk]>=Close[lPk] && Close[cPk]>Open[cPk] && Close[lPk]>Open[lPk] && BeC(lPk,cPk) && BeCr(lPk,cPk)&&((RSI_Filter_Lengthy&&rsi_L[cPk]>bearish_Level_Lengthy&&rsi_L[lPk]>bearish_Level_Lengthy)||RSI_Filter_Lengthy==0))
        {
         dType[shift]= 4; 

         LastD=Time[cPk];
         Dir_BU_div_trig=false;
         Long_BU_div_trig=false;
         Dir_BE_div_trig=false;
         Long_BE_div_trig=true;


         Long_BE_div_alarm_trig=true;
   
         if((!U_USE && !V_USE)  && (Dir_BU_div_CCB_trig || Dir_BU_div_CC_trig) && !last_dive_deleted && Lshift!=shift)
            Dir_BU_div_incomp_del(shift);
         if((!U_USE && !V_USE)  && (Long_BU_div_CCB_trig  || Long_BU_div_CC_trig)&& !last_dive_deleted && Lshift!=shift)
           {

            Long_BU_div_incomp_del(shift);

           }
         if((!U_USE && !V_USE)  && (Dir_BE_div_CCB_trig || Dir_BE_div_CCB_trig)&& !last_dive_deleted && Lshift!=shift)
            Dir_BE_div_incomp_del(shift);
         if((!U_USE && !V_USE) && (Long_BE_div_CCB_trig ||Long_BE_div_CC_trig)&& !last_dive_deleted && Lshift!=shift)
            Long_BE_div_incomp_del(shift);
  
         if((!U_USE && !V_USE)  && (H_Dir_BU_div_CCB_trig || H_Dir_BU_div_CC_trig) && !last_dive_deleted && Lshift!=shift)
            H_Dir_BU_div_incomp_del(shift);
         if((!U_USE && !V_USE)  && (H_Long_BU_div_CCB_trig  || H_Long_BU_div_CC_trig)&& !last_dive_deleted && Lshift!=shift)
           {

            H_Long_BU_div_incomp_del(shift);

           }
         if((!U_USE && !V_USE)  && (H_Dir_BE_div_CCB_trig || H_Dir_BE_div_CCB_trig)&& !last_dive_deleted && Lshift!=shift)
            H_Dir_BE_div_incomp_del(shift);
         if((!U_USE && !V_USE) && (H_Long_BE_div_CCB_trig ||H_Long_BE_div_CC_trig)&& !last_dive_deleted && Lshift!=shift)
            H_Long_BE_div_incomp_del(shift);



         Long_Arrow_Zone_trig=true;
         Long_fast_MA_trig=true;
         Long_slow_MA_trig=true;
    
         U_USE=false;
         V_USE=false;
         Dir_BU_div_CCB_trig=false;
         Long_BU_div_CCB_trig=false;
         Dir_BE_div_CCB_trig=false;
         Long_BE_div_CCB_trig=false;
       
         Dir_BU_div_CC_trig=false;
         Dir_BE_div_CC_trig=false;
         Long_BU_div_CC_trig=false;
         Long_BE_div_CC_trig=false;
       
         Dir_BU_div_CP_trig=false;
         Long_BU_div_CP_trig=false;
         Dir_BE_div_CP_trig=false;
         Long_BE_div_CP_trig=false;

         H_Dir_BU_div_CCB_trig=false;
         H_Long_BU_div_CCB_trig=false;
         H_Dir_BE_div_CCB_trig=false;
         H_Long_BE_div_CCB_trig=false;
   
         H_Dir_BU_div_CC_trig=false;
         H_Dir_BE_div_CC_trig=false;
         H_Long_BU_div_CC_trig=false;
         H_Long_BE_div_CC_trig=false;
    
         H_Dir_BU_div_CP_trig=false;
         H_Long_BU_div_CP_trig=false;
         H_Dir_BE_div_CP_trig=false;
         H_Long_BE_div_CP_trig=false;
         CC_valid_state=false;
         CCB_valid_state=false;
         CP_valid_state=false;


         Long_BE_div_del_trig=true;
         last_dive_deleted=false;
         Fib_Switch=false;
         Fib_Switch_Lengthy=false;
         Long_BE_div_CC_trig=true;
         Lshift=shift;
         KLONG=true;
         Long_BE_div_CCB_trig=false;
         dRSId[cPk] = MathAbs(rsi_L[cPk] - rsi_L[lPk]);
         dRSIdp[cPk] = MathAbs(Low[cPk] - Low[lPk]);
         if(Show_Graphic_Object)
           {
            ObjectSetText("XXDType","SELL");
            ObjectSetText("XXCCB_Value","Waiting");
            ObjectSetText("XXCC_Value","Waiting");

            if(DrawPriceTrendLines_Lengthy)
              {
               h1=Time[cPk];
               h2=Time[lPk];
               s7=StringConcatenate(PriceLine,h1," ",h2);

               t4=0;
               DTL(s7,t4,h1,Close[cPk],h2,Close[lPk],ShortColour_Lengthy,STYLE_SOLID,Divergence_Line_Width_Lengthy);
               DA_L(0,1,cPk-1,High[cPk-1]);

              }
            if(DrawIndicatorTrendLines_Lengthy)
              {
               h1=Time[cPk];
               h2=Time[lPk];
               s7=StringConcatenate(RSILine,h1," ",h2);

               t4=ChartWindowFind(0,indicatorName);
               DTL(s7,t4,h1,rsi_L[cPk],h2,rsi_L[lPk],ShortColour_Lengthy,STYLE_SOLID,Divergence_Line_Width_Lengthy);

              }
           }
        }
     }
  }

void H_Long_BE_div_detec(int shift) 
  {
   int t4;
   datetime h1,h2;
   string s7;
   if(IsdPk(shift) == false)
      return;
   int cPk = shift;
   for(int a=shift+2; a<=shift+Max_Bars_Lengthy; a++)
     {
      int lPk = GiLpKp(a, shift+2);
      if(rsi_L[cPk] >= rsi_L[lPk] && Close[cPk]<=Close[lPk] && Close[cPk]>Open[cPk] && Close[lPk]>Open[lPk] && BeC(lPk,cPk) && BeCr(lPk,cPk)&&((RSI_Filter_Lengthy&&rsi_L[cPk]>bearish_Level_Lengthy&&rsi_L[lPk]>bearish_Level_Lengthy)||RSI_Filter_Lengthy==0))
        {
         dType[shift]= 8; //"Classic H Bearish";

         LastD=Time[cPk];
         Dir_BU_div_trig=false;
         Long_BU_div_trig=false;
         Dir_BE_div_trig=false;
         Long_BE_div_trig=true;


         H_Long_BE_div_alarm_trig=true;
    
         if((!U_USE && !V_USE)  && (Dir_BU_div_CCB_trig || Dir_BU_div_CC_trig) && !last_dive_deleted && Lshift!=shift)
            Dir_BU_div_incomp_del(shift);
         if((!U_USE && !V_USE)  && (Long_BU_div_CCB_trig  || Long_BU_div_CC_trig)&& !last_dive_deleted && Lshift!=shift)
           {

            Long_BU_div_incomp_del(shift);

           }
         if((!U_USE && !V_USE)  && (Dir_BE_div_CCB_trig || Dir_BE_div_CCB_trig)&& !last_dive_deleted && Lshift!=shift)
            Dir_BE_div_incomp_del(shift);
         if((!U_USE && !V_USE) && (Long_BE_div_CCB_trig ||Long_BE_div_CC_trig)&& !last_dive_deleted && Lshift!=shift)
            Long_BE_div_incomp_del(shift);
     
         if((!U_USE && !V_USE)  && (H_Dir_BU_div_CCB_trig || H_Dir_BU_div_CC_trig) && !last_dive_deleted && Lshift!=shift)
            H_Dir_BU_div_incomp_del(shift);
         if((!U_USE && !V_USE)  && (H_Long_BU_div_CCB_trig  || H_Long_BU_div_CC_trig)&& !last_dive_deleted && Lshift!=shift)
           {

            H_Long_BU_div_incomp_del(shift);

           }
         if((!U_USE && !V_USE)  && (H_Dir_BE_div_CCB_trig || H_Dir_BE_div_CCB_trig)&& !last_dive_deleted && Lshift!=shift)
            H_Dir_BE_div_incomp_del(shift);
         if((!U_USE && !V_USE) && (H_Long_BE_div_CCB_trig ||H_Long_BE_div_CC_trig)&& !last_dive_deleted && Lshift!=shift)
            H_Long_BE_div_incomp_del(shift);



         Long_Arrow_Zone_trig=true;
         Long_fast_MA_trig=true;
         Long_slow_MA_trig=true;
   
         U_USE=false;
         V_USE=false;
         Dir_BU_div_CCB_trig=false;
         Long_BU_div_CCB_trig=false;
         Dir_BE_div_CCB_trig=false;
         Long_BE_div_CCB_trig=false;
   
         Dir_BU_div_CC_trig=false;
         Dir_BE_div_CC_trig=false;
         Long_BU_div_CC_trig=false;
         Long_BE_div_CC_trig=false;
   
         Dir_BU_div_CP_trig=false;
         Long_BU_div_CP_trig=false;
         Dir_BE_div_CP_trig=false;
         Long_BE_div_CP_trig=false;
   
         H_Dir_BU_div_CCB_trig=false;
         H_Long_BU_div_CCB_trig=false;
         H_Dir_BE_div_CCB_trig=false;
         H_Long_BE_div_CCB_trig=false;
     
         H_Dir_BU_div_CC_trig=false;
         H_Dir_BE_div_CC_trig=false;
         H_Long_BU_div_CC_trig=false;
         H_Long_BE_div_CC_trig=false;
        
         H_Dir_BU_div_CP_trig=false;
         H_Long_BU_div_CP_trig=false;
         H_Dir_BE_div_CP_trig=false;
         H_Long_BE_div_CP_trig=false;
         CC_valid_state=false;
         CCB_valid_state=false;
         CP_valid_state=false;


         H_Long_BE_div_del_trig=true;
         last_dive_deleted=false;
         Fib_Switch=false;
         Fib_Switch_Lengthy=false;
         H_Long_BE_div_CC_trig=true;
         Lshift=shift;
         KLONG=true;
         H_Long_BE_div_CCB_trig=false;
         dRSId[cPk] = MathAbs(rsi_L[cPk] - rsi_L[lPk]);
         dRSIdp[cPk] = MathAbs(Low[cPk] - Low[lPk]);
         if(Show_Graphic_Object)
           {
            ObjectSetText("XXDType","SELL");
            ObjectSetText("XXCCB_Value","Waiting");
            ObjectSetText("XXCC_Value","Waiting");

            if(DrawPriceTrendLines_Lengthy)
              {
               h1=Time[cPk];
               h2=Time[lPk];
               s7=StringConcatenate(PriceLine,h1," ",h2);

               t4=0;
               DTL(s7,t4,h1,Close[cPk],h2,Close[lPk],H_ShortColour_Lengthy,STYLE_SOLID,H_Divergence_Line_Width_Lengthy);
               DA_L(1,1,cPk-1,High[cPk-1]);

              }
            if(DrawIndicatorTrendLines_Lengthy)
              {
               h1=Time[cPk];
               h2=Time[lPk];
               s7=StringConcatenate(RSILine,h1," ",h2);

               t4=ChartWindowFind(0,indicatorName);
               DTL(s7,t4,h1,rsi_L[cPk],h2,rsi_L[lPk],H_ShortColour_Lengthy,STYLE_SOLID,H_Divergence_Line_Width_Lengthy);

              }
           }
        }
     }
  }

bool IsdPk(int shift) 
  {
   if(rsi_L[shift] >= rsi_L[shift+1] &&  rsi_L[shift]>= rsi_L[shift-1])
      return(true);
   else
      return(false);
  }

bool IsdTgh(int shift) 
  {
   if(rsi_L[shift] <= rsi_L[shift+1] && rsi_L[shift] <= rsi_L[shift-1])
      return(true);
   else
      return(false);
  }

int GiLpK(int shift) 
  {
   for(int j = shift + 2; j <=shift+Max_Bars; j++)
     {
      if(rsi_L[j+1] <= rsi_L[j] &&  rsi_L[j] >= rsi_L[j-1])
         return(j);
     }
   return(-1);
  }

int GiLpKp(int shift, int Start) 
  {
     {
      if(rsi_L[shift+1] <= rsi_L[shift] &&  rsi_L[shift] >= rsi_L[shift-1])

         return(shift);
      //      }
     }
   return(-1);
  }

int start()
  {
   int countedBars = IndicatorCounted();
   if(countedBars < 0 && countedBars>50000)
      countedBars = 0;
   Cal_i(countedBars);
   if((TimeCurrent()-Trefresh)>(Chart_Refresh_Time_min*60))
     {

      Trefresh=TimeCurrent();
     }
   ChartRedraw();
   return(0);

  }

int GiLTgh(int shift)
  {
   for(int j = shift + 2; j <= shift+Max_Bars; j++)
     {
      if(rsi_L[j+1] >= rsi_L[j] && rsi_L[j] <= rsi_L[j-1])
         return(j);
     }
   return(-1);
  }

int GiLTghp(int shift,int Start)
  {
   if(rsi_L[shift+1] >= rsi_L[shift] && rsi_L[shift] <= rsi_L[shift-1])

      return(shift);

   return(-1);
  }

void alert(int dir, string message, int shift,bool sound_enable,string soundname)
  {

   if(shift <= 3 && Time[shift] != lastAlertTime && Time[shift]>TS && Time[shift]> lastAlertTime+Period())
     {
      KLONG=1;

      lastAlertTime = Time[shift];

      if(DisplayAlert)
         Alert(message);
      if(sound_enable)
         PlaySound(soundname);
      if(DisplayNotification)
        {
         bool s11=SendNotification(message);
         if(!s11)
            Print(GetLastError());
        }

      if(Send_eMail&&dir==1)
        {

         bool m11=SendMail("Bearish Divergence",message);
        
         if(!m11)
            Print(GetLastError());
        }
      if(Send_eMail&&dir==0)
        {


         bool m12=SendMail("Bullish Divergence",message);
          //SaveMailBox(Massage_BOX);
         if(!m12)
            Print(GetLastError());

        }
     }

  }



void alert_LCCB(int dir, string message, int shift,bool sound_enable,string soundname,string M1,string M2)
  {

   if(shift <= 3&& Time[shift]>TS && KLONG==1 && Time[shift] != lastAlertTime_LCCB && Time[shift]> lastAlertTime_LCCB+Period())
     {
      KLONG=0;

      lastAlertTime_LCCB=Time[shift];
      if(sound_enable)
         PlaySound(soundname);

      if(DisplayAlert_Lengthy)
         Alert(Alert_BOX);
      if(DisplayNotification_Lengthy)
        {
         bool s12= SendNotification(Alert_BOX);
         if(!s12)
            Print(GetLastError());
        }
      if(Send_eMail_Lengthy&&Sig_S=="SELL")
        {
         bool m21=SendMail("Bearish Divergence",Email_BOX);
         if(!m21)
            Print(GetLastError());

        }
      if(Sig_S=="SELL")
        {
     
           SaveMailBox(Email_BOX);
       
        }

      if(Send_eMail_Lengthy&& Sig_S=="BUY")
        {
         bool m22=SendMail("Bullish Divergence",Email_BOX);
         if(!m22)
            Print(GetLastError());
        }
      if(Sig_S=="BUY")
        {
 
           SaveMailBox(Email_BOX);
        
        }

      if(DisplayNotification)
        {
         MessageBoxW(WindowHandle(Symbol(),Period()),Massage_BOX,M2,MB_ICONEXCLAMATION);
        }
     }

  }



void alert_CCB2(int dir, string message, int shift,bool sound_enable,string soundname)
  {
   if(shift <= 3 &&Time[shift]>TS && Time[shift] != lastAlertTime_CCB2 && Time[shift]> lastAlertTime_CCB2+Period())
     {

      lastAlertTime_CCB2=Time[shift];
      if(sound_enable)
         PlaySound(soundname);

      if(DisplayAlert)
         if(DisplayNotification)
           {
            bool s31=SendNotification(message);
            if(!s31)
               Print(GetLastError());
           }

      if(Send_eMail&&dir==1)
        {

         bool m31=SendMail("Bearish Divergence",message);
   
         if(!m31)
            Print(GetLastError());
        }

      if(Send_eMail&&dir==0)
        {


         bool m32=SendMail("Bullish Divergence",message);
      
         if(!m32)
            Print(GetLastError());

        }

     }
  }


void alert_LCCB2(int dir, string message, int shift,bool sound_enable,string soundname)
  {

   if(shift <= 3 &&Time[shift]>TS  && Time[shift] != lastAlertTime_LCCB2 && Time[shift]> lastAlertTime_LCCB2+Period())
     {


      lastAlertTime_LCCB2=Time[shift];
      if(sound_enable)
         PlaySound(soundname);

      if(DisplayAlert_Lengthy)
         Alert(message);
      if(DisplayNotification_Lengthy)
        {
         bool s41=SendNotification(message);
         if(!s41)
            Print(GetLastError());
        }

      if(Send_eMail_Lengthy&&dir==1)
        {

         bool m41=SendMail("Bearish Divergence",message);
        
         if(!m41)
            Print(GetLastError());
        }
      if(Send_eMail_Lengthy&&dir==0)
        {


         bool m42=SendMail("Bullish Divergence",message);
         
         if(!m42)
            Print(GetLastError());

        }

     }
  }


void alert_L(int dir, string message, int shift,bool sound_enable,string soundname)
  {
   if(shift <= 3 && Time[shift] != lastAlertTime && Time[shift]>TS && Time[shift]> lastAlertTime+Period())
     {
      KLONG=1;
      lastAlertTime = Time[shift];
      if(DisplayAlert_Lengthy)
         Alert(message);
      if(sound_enable)
         PlaySound(soundname);
      if(DisplayNotification_Lengthy)
        {
         bool s51=SendNotification(message);
         if(!s51)
            Print(GetLastError());
        }

      if(Send_eMail_Lengthy&&dir==1)
        {

         bool m51=SendMail("Bearish Divergence",message);
         
         if(!m51)
            Print(GetLastError());
        }
      if(Send_eMail_Lengthy&&dir==0)
        {


         bool m52=SendMail("Bullish Divergence",message);
          
         if(!m52)
            Print(GetLastError());

        }
     }
  }

void DTL(string r6,int x1,datetime x6,double f6,datetime x7,double f7,color x3,int x4,int x5)
  {
   if(x6==0 && x7==0 && ObjectFind(0,r6)!=-1)
     {
      ObjectDelete(0,r6);
     }
   if(x6>0 || x7>0)
     {
      if(ObjectFind(0,r6)==-1)
        {
         ObjectCreate(0,r6,OBJ_TREND,x1,0,0,0,0);
         ObjectSetInteger(0,r6,OBJPROP_RAY,false);
        }
      ObjectSetInteger(0,r6,OBJPROP_TIME,x6);
      ObjectSetInteger(0,r6,OBJPROP_TIME,1,x7);
      ObjectSetDouble(0,r6,OBJPROP_PRICE,f6);
      ObjectSetDouble(0,r6,OBJPROP_PRICE,1,f7);
      ObjectSetInteger(0,r6,OBJPROP_COLOR,x3);
      ObjectSetInteger(0,r6,OBJPROP_STYLE,x4);
      ObjectSetInteger(0,r6,OBJPROP_WIDTH,x5);
      ObjectSetInteger(0,r6,OBJPROP_BACK,true);
      if(StringFind(r6, RSILine)!=-1)
        {
         Rr6n=r6;
         Rx1n=x1;
         Rx6n=x6;
         Rf6n=f6;
         Rx7n=x7;
         Rf7n=f7;
         Rx3n=x3;
         Rx4n=x4;
         Rx5n=x5;
        }
      if(StringFind(r6,  PriceLine)!=-1)
        {
         r6n=r6;
         x1n=x1;
         x6n=x6;
         f6n=f6;
         x7n=x7;
         f7n=f7;
         x3n=x3;
         x4n=x4;
         x5n=x5;
        }
     }
  }

void RobJ(string r6)
  {
   int t1;

   t1=ObjectsTotal();
   while(t1>=0)
     {
      if(StringFind(ObjectName(t1),r6,0)>=0)
        {
         ObjectDelete(0,ObjectName(t1));
        }
      t1--;
     }
  }

void DA(int k,int dir, int shi, double val)
  {
   if(k==0)
     {
      if(dir==0)
        {
         ObjectCreate(0,"Arrow_Up"+Time[shi], OBJ_ARROW, 0, Time[shi], Low[shi]-window_width*0.055);
         ObjectSetInteger(0,"Arrow_Up"+Time[shi], OBJPROP_COLOR, Arrow_LongColour);
         ObjectSetInteger(0,"Arrow_Up"+Time[shi],OBJPROP_ARROWCODE,LongArrowCode);
         ObjectSetInteger(0,"Arrow_Up"+Time[shi],OBJPROP_STYLE,STYLE_SOLID);
         ObjectSetInteger(0,"Arrow_Up"+Time[shi],OBJPROP_WIDTH,ArrowSize);
         ObjectSetInteger(0,"Arrow_Up"+Time[shi],OBJPROP_BACK,true);
         ObjectSetInteger(0,"Arrow_Up"+Time[shi],OBJPROP_SELECTABLE,true);
         ArroUP_NAME="Arrow_Up"+Time[shi];
        }
      if(dir==1)
        {
         ObjectCreate(0,"Arrow_Dn"+Time[shi], OBJ_ARROW, 0, Time[shi], High[shi]+window_width*0.055);
         ObjectSetInteger(0,"Arrow_Dn"+Time[shi], OBJPROP_COLOR, Arrow_ShortColour);
         ObjectSetInteger(0,"Arrow_Dn"+Time[shi],OBJPROP_ARROWCODE,ShortArrowCode);
         ObjectSetInteger(0,"Arrow_Dn"+Time[shi],OBJPROP_STYLE,STYLE_SOLID);
         ObjectSetInteger(0,"Arrow_Dn"+Time[shi],OBJPROP_WIDTH,ArrowSize);
         ObjectSetInteger(0,"Arrow_Dn"+Time[shi],OBJPROP_ANCHOR,ANCHOR_BOTTOM);
         ObjectSetInteger(0,"Arrow_Dn"+Time[shi],OBJPROP_BACK,true);
         ObjectSetInteger(0,"Arrow_Dn"+Time[shi],OBJPROP_SELECTABLE,true);
         ArroDn_NAME="Arrow_Dn"+Time[shi];
        }
     }
   if(k==1)
     {
      if(dir==0)
        {
         ObjectCreate(0,"Arrow_Up"+Time[shi], OBJ_ARROW, 0, Time[shi], Low[shi]-window_width*0.055);
         ObjectSetInteger(0,"Arrow_Up"+Time[shi], OBJPROP_COLOR, H_Arrow_LongColour);
         ObjectSetInteger(0,"Arrow_Up"+Time[shi],OBJPROP_ARROWCODE,H_LongArrowCode);
         ObjectSetInteger(0,"Arrow_Up"+Time[shi],OBJPROP_STYLE,STYLE_SOLID);
         ObjectSetInteger(0,"Arrow_Up"+Time[shi],OBJPROP_WIDTH,H_ArrowSize);
         ObjectSetInteger(0,"Arrow_Up"+Time[shi],OBJPROP_BACK,true);
         ObjectSetInteger(0,"Arrow_Up"+Time[shi],OBJPROP_SELECTABLE,true);
         ArroUP_NAME="Arrow_Up"+Time[shi];
        }
      if(dir==1)
        {
         ObjectCreate(0,"Arrow_Dn"+Time[shi], OBJ_ARROW, 0, Time[shi], High[shi]+window_width*0.055);
         ObjectSetInteger(0,"Arrow_Dn"+Time[shi], OBJPROP_COLOR, H_Arrow_ShortColour);
         ObjectSetInteger(0,"Arrow_Dn"+Time[shi],OBJPROP_ARROWCODE,H_ShortArrowCode);
         ObjectSetInteger(0,"Arrow_Dn"+Time[shi],OBJPROP_STYLE,STYLE_SOLID);
         ObjectSetInteger(0,"Arrow_Dn"+Time[shi],OBJPROP_WIDTH,H_ArrowSize);
         ObjectSetInteger(0,"Arrow_Dn"+Time[shi],OBJPROP_ANCHOR,ANCHOR_BOTTOM);
         ObjectSetInteger(0,"Arrow_Dn"+Time[shi],OBJPROP_BACK,true);
         ObjectSetInteger(0,"Arrow_Dn"+Time[shi],OBJPROP_SELECTABLE,true);
         ArroDn_NAME="Arrow_Dn"+Time[shi];
        }
     }
  }

void DA_L(int k,int dir, int shi, double val)
  {
   if(k==0)
     {
      if(dir==0)
        {
         ObjectCreate(0,"Arrow_Up"+Time[shi], OBJ_ARROW, 0, Time[shi], Low[shi]-window_width*0.055);
         ObjectSetInteger(0,"Arrow_Up"+Time[shi], OBJPROP_COLOR, Arrow_LongColour_Lengthy);
         ObjectSetInteger(0,"Arrow_Up"+Time[shi],OBJPROP_ARROWCODE,LongArrowCode_Lengthy);
         ObjectSetInteger(0,"Arrow_Up"+Time[shi],OBJPROP_STYLE,STYLE_SOLID);
         ObjectSetInteger(0,"Arrow_Up"+Time[shi],OBJPROP_WIDTH,ArrowSize_Lengthy);
         ObjectSetInteger(0,"Arrow_Up"+Time[shi],OBJPROP_BACK,true);
         ObjectSetInteger(0,"Arrow_Up"+Time[shi],OBJPROP_SELECTABLE,true);
         ArroUP_NAME="Arrow_Up"+Time[shi];
        }
      if(dir==1)
        {
         ObjectCreate(0,"Arrow_Dn"+Time[shi], OBJ_ARROW, 0, Time[shi], High[shi]+window_width*0.055);
         ObjectSetInteger(0,"Arrow_Dn"+Time[shi], OBJPROP_COLOR, ShortColour_Lengthy);
         ObjectSetInteger(0,"Arrow_Dn"+Time[shi],OBJPROP_ARROWCODE,ShortArrowCode_Lengthy);
         ObjectSetInteger(0,"Arrow_Dn"+Time[shi],OBJPROP_STYLE,STYLE_SOLID);
         ObjectSetInteger(0,"Arrow_Dn"+Time[shi],OBJPROP_WIDTH,ArrowSize_Lengthy);
         ObjectSetInteger(0,"Arrow_Dn"+Time[shi],OBJPROP_ANCHOR,ANCHOR_BOTTOM);
         ObjectSetInteger(0,"Arrow_Dn"+Time[shi],OBJPROP_BACK,true);
         ObjectSetInteger(0,"Arrow_Dn"+Time[shi],OBJPROP_SELECTABLE,true);
         ArroDn_NAME="Arrow_Dn"+Time[shi];
        }
     }
   if(k==1)
     {
      if(dir==0)
        {
         ObjectCreate(0,"Arrow_Up"+Time[shi], OBJ_ARROW, 0, Time[shi], Low[shi]-window_width*0.055);
         ObjectSetInteger(0,"Arrow_Up"+Time[shi], OBJPROP_COLOR, H_Arrow_LongColour_Lengthy);
         ObjectSetInteger(0,"Arrow_Up"+Time[shi],OBJPROP_ARROWCODE,H_LongArrowCode_Lengthy);
         ObjectSetInteger(0,"Arrow_Up"+Time[shi],OBJPROP_STYLE,STYLE_SOLID);
         ObjectSetInteger(0,"Arrow_Up"+Time[shi],OBJPROP_WIDTH,H_ArrowSize_Lengthy);
         ObjectSetInteger(0,"Arrow_Up"+Time[shi],OBJPROP_BACK,true);
         ObjectSetInteger(0,"Arrow_Up"+Time[shi],OBJPROP_SELECTABLE,true);
         ArroUP_NAME="Arrow_Up"+Time[shi];
        }
      if(dir==1)
        {
         ObjectCreate(0,"Arrow_Dn"+Time[shi], OBJ_ARROW, 0, Time[shi], High[shi]+window_width*0.055);
         ObjectSetInteger(0,"Arrow_Dn"+Time[shi], OBJPROP_COLOR, H_ShortColour_Lengthy);
         ObjectSetInteger(0,"Arrow_Dn"+Time[shi],OBJPROP_ARROWCODE,H_ShortArrowCode_Lengthy);
         ObjectSetInteger(0,"Arrow_Dn"+Time[shi],OBJPROP_STYLE,STYLE_SOLID);
         ObjectSetInteger(0,"Arrow_Dn"+Time[shi],OBJPROP_WIDTH,H_ArrowSize_Lengthy);
         ObjectSetInteger(0,"Arrow_Dn"+Time[shi],OBJPROP_ANCHOR,ANCHOR_BOTTOM);
         ObjectSetInteger(0,"Arrow_Dn"+Time[shi],OBJPROP_BACK,true);
         ObjectSetInteger(0,"Arrow_Dn"+Time[shi],OBJPROP_SELECTABLE,true);
         ArroDn_NAME="Arrow_Dn"+Time[shi];
        }
     }
  }

bool BeC(int st, int fn) 
  {
   ObjectCreate(0,"cond"+fn,OBJ_TREND,0,Time[st],Close[st],Time[fn],Close[fn]);
   ObjectSetInteger(0,"cond"+fn,OBJPROP_RAY,false);
   ObjectSetInteger(0,"cond"+fn,OBJPROP_COLOR,clrBlue);
   for(int j=st-1; j>fn; j--)
     {
      if(Close[j]>ObjectGetValueByShift("cond"+fn,j))
        {
         ObjectDelete(0,"cond"+fn);
         return(false);
        }
     }
   ObjectDelete(0,"cond"+fn);
   return(true);
  }

bool BuC(int st, int fn) 
  {
   ObjectCreate(0,"cond"+fn,OBJ_TREND,0,Time[st],Close[st],Time[fn],Close[fn]);
   ObjectSetInteger(0,"cond"+fn,OBJPROP_RAY,false);
   ObjectSetInteger(0,"cond"+fn,OBJPROP_COLOR,clrBlue);
   for(int j=st-1; j>fn; j--)
     {
      if(Close[j]<ObjectGetValueByShift("cond"+fn,j))
        {
         ObjectDelete(0,"cond"+fn);
         return(false);
        }
     }
   ObjectDelete(0,"cond"+fn);
   return(true);
  }

bool H_BeC(int st, int fn)
  {
   ObjectCreate(0,"cond"+fn,OBJ_TREND,0,Time[st],Close[st],Time[fn],Close[fn]);
   ObjectSetInteger(0,"cond"+fn,OBJPROP_RAY,false);
   ObjectSetInteger(0,"cond"+fn,OBJPROP_COLOR,clrBlue);
   for(int j=st-1; j>fn; j--)
     {
    
      if((Close[j]>ObjectGetValueByShift("cond"+fn,j)))
        {
         ObjectDelete(0,"cond"+fn);
         return(false);
        }
     }
   ObjectDelete(0,"cond"+fn);
   return(true);
  }

bool H_BuC(int st, int fn)
  {
   ObjectCreate(0,"cond"+fn,OBJ_TREND,0,Time[st],Close[st],Time[fn],Close[fn]);
   ObjectSetInteger(0,"cond"+fn,OBJPROP_RAY,false);
   ObjectSetInteger(0,"cond"+fn,OBJPROP_COLOR,clrBlue);
   for(int j=st-1; j>fn; j--)
     {
      //|| Open[j]<ObjectGetValueByShift("cond"+fn,j)
      if(Close[j]<ObjectGetValueByShift("cond"+fn,j))
        {
         ObjectDelete(0,"cond"+fn);
         return(false);
        }
     }
   ObjectDelete(0,"cond"+fn);
   return(true);
  }

bool BeCr(int st, int fn) 
  {
   if(Using_IN_EA)
     {
      double yy=0;
      for(int j=st-1; j>fn; j--)
        {
         if(rsi_L[fn]!=rsi_L[st])
            yy=((int(Time[fn])-int(Time[st]))/(rsi_L[fn]-rsi_L[st]))*(int(Time[j])-int(Time[fn]))+rsi_L[fn];
         else
            yy=rsi_L[fn];
         if(rsi_L[j]>yy)
           {

            return(false);
           }
        }
      return(true);
     }
   if(!  Using_IN_EA)
     {
      ObjectCreate(0,"cond"+fn+1,OBJ_TREND,1,Time[st],rsi_L[st],Time[fn],rsi_L[fn]);
      ObjectSetInteger(0,"cond"+fn+1,OBJPROP_RAY,false);
      ObjectSetInteger(0,"cond"+fn+1,OBJPROP_COLOR,clrBlue);
      for(int j1=st-1; j1>fn; j1--)
        {
         if(rsi_L[j1]>ObjectGetValueByShift("cond"+fn+1,j1))
           {
            ObjectDelete(0,"cond"+fn+1);
            return(false);
           }
        }
      ObjectDelete(0,"cond"+fn+1);
      return(true);
     }

  }


bool BuCr(int st, int fn) 
  {
   if(Using_IN_EA)
     {
      double yy;
      for(int j=st-1; j>fn; j--)
        {
         if(rsi_L[fn]!=rsi_L[st])
            yy =((int(Time[fn])-int(Time[st]))/(rsi_L[fn]-rsi_L[st]))*(int(Time[j])-int(Time[fn]))+rsi_L[fn];
         else
            yy=rsi_L[fn];

         if(rsi_L[j]<yy)
           {
            return(false);
           }
        }
      return(true);
     }
   if(!Using_IN_EA)
     {
      ObjectCreate(0,"cond"+fn+1,OBJ_TREND,1,Time[st],rsi_L[st],Time[fn],rsi_L[fn]);
      ObjectSetInteger(0,"cond"+fn+1,OBJPROP_RAY,false);
      ObjectSetInteger(0,"cond"+fn+1,OBJPROP_COLOR,clrBlue);
      for(int j1=st-1; j1>fn; j1--)
        {
         if(rsi_L[j1]<ObjectGetValueByShift("cond"+fn+1,j1))
           {
            ObjectDelete(0,"cond"+fn+1);
            return(false);
           }
        }
      ObjectDelete(0,"cond"+fn+1);
      return(true);
     }
  }


int  Dir_BU_div_CC_detec(int cTgh)  
  {

   int k=0;
   if(Close[cTgh+2]<Close[cTgh+1])
     {
      long_BE_div_Vali_level=High[cTgh+1];
      long_BE_div_UnVali_level=Low[cTgh+2];
      if(Show_Graphic_Object)
        {
         ObjectSetInteger(0,ArroUP_NAME,OBJPROP_ARROWCODE,252);
         ObjectSetText("XXCC_Value","Confirmed");
        }
      Dir_BU_div_CCB_trig=true;
      Long_BU_div_CCB_trig=false;
      Dir_BE_div_CCB_trig=false;
      Long_BE_div_CCB_trig=false;
      H_Dir_BU_div_CCB_trig=false;
      H_Long_BU_div_CCB_trig=false;
      H_Dir_BE_div_CCB_trig=false;
      H_Long_BE_div_CCB_trig=false;
      CC_valid_state=true;
      Dir_BU_div_CC_trig=false;
      CCB_valid_state=false;
      Fib_Switch=true;
      Fib_Switch_Lengthy=false;
      Dir_BU_div_CP_trig=true;
      Long_BU_div_CP_trig=false;
      Dir_BE_div_CP_trig=false;
      Long_BE_div_CP_trig=false;
      H_Dir_BU_div_CP_trig=false;
      H_Long_BU_div_CP_trig=false;
      H_Dir_BE_div_CP_trig=false;
      H_Long_BE_div_CP_trig=false;
      CP_valid_state=false;
      CP_del_Dir_div=true;


      k=1;


     }

   else
     {

      CC_valid_state=false;
      UnvalidD(cTgh);

      if(Dir_BU_div_del_trig)
        {
         if(Show_Graphic_Object)
           {
            MegaDelete2(cTgh+2);
            MegaDelete3(cTgh+2);
            MegaDelete4(cTgh+2);
            MegaDelete(cTgh+3);
           }
         last_dive_deleted=true;
        }
      Dir_BU_div_del_trig=false;
      Dir_BU_div_CC_trig=false;
      Dir_BU_div_CCB_trig=false;
      Dir_BU_div_CP_trig=false;
      Dir_BU_div_CCB_trig=false;
      Long_BU_div_CCB_trig=false;
      Dir_BE_div_CCB_trig=false;
      Long_BE_div_CCB_trig=false;
      H_Dir_BU_div_CCB_trig=false;
      H_Long_BU_div_CCB_trig=false;
      H_Dir_BE_div_CCB_trig=false;
      H_Long_BE_div_CCB_trig=false;
      k=0;
      Fib_Switch=false;
      CP_valid_state=false;
      CCB_valid_state=false;

     }
   return(k);
  }


int  H_Dir_BU_div_CC_detec(int cTgh)  
  {

   int k=0;
   if(Close[cTgh+2]<Close[cTgh+1])
     {
      H_long_BE_div_Vali_level=High[cTgh+1];
      H_long_BE_div_UnVali_level=Low[cTgh+2];
      if(Show_Graphic_Object)
        {
         ObjectSetInteger(0,ArroUP_NAME,OBJPROP_ARROWCODE,252);
         ObjectSetText("XXCC_Value","Confirmed");
        }
      Dir_BU_div_CCB_trig=false;
      Long_BU_div_CCB_trig=false;
      Dir_BE_div_CCB_trig=false;
      Long_BE_div_CCB_trig=false;
      H_Dir_BU_div_CCB_trig=true;
      H_Long_BU_div_CCB_trig=false;
      H_Dir_BE_div_CCB_trig=false;
      H_Long_BE_div_CCB_trig=false;
      CC_valid_state=true; 
      Dir_BU_div_CC_trig=false;
      CCB_valid_state=false;
      Fib_Switch=true;
      Fib_Switch_Lengthy=false;
      Dir_BU_div_CP_trig=false;
      Long_BU_div_CP_trig=false;
      Dir_BE_div_CP_trig=false;
      Long_BE_div_CP_trig=false;
      H_Dir_BU_div_CP_trig=true;
      H_Long_BU_div_CP_trig=false;
      H_Dir_BE_div_CP_trig=false;
      H_Long_BE_div_CP_trig=false;
      CP_valid_state=false;
      H_CP_del_Dir_div=true;


      k=1;


     }

   else
     {

      CC_valid_state=false;
      UnvalidD(cTgh);
      if(H_Dir_BU_div_del_trig)
        {
         if(Show_Graphic_Object)
           {
            MegaDelete2(cTgh+2);
            MegaDelete3(cTgh+2);
            MegaDelete4(cTgh+2);
            MegaDelete(cTgh+3);
           }
         last_dive_deleted=true;
        }
      H_Dir_BU_div_del_trig=false;
      H_Dir_BU_div_CC_trig=false;
      H_Dir_BU_div_CCB_trig=false;
      H_Dir_BU_div_CP_trig=false;
      Dir_BU_div_CCB_trig=false;
      Long_BU_div_CCB_trig=false;
      Dir_BE_div_CCB_trig=false;
      Long_BE_div_CCB_trig=false;
      H_Dir_BU_div_CCB_trig=false;
      H_Long_BU_div_CCB_trig=false;
      H_Dir_BE_div_CCB_trig=false;
      H_Long_BE_div_CCB_trig=false;
      k=0;
      Fib_Switch=false;
      CP_valid_state=false;
      CCB_valid_state=false;

     }
   return(k);
  }


int   Dir_BE_div_CC_detec(int cTgh)
  {
   int k=0;
   if(Close[cTgh+2]>Close[cTgh+1])
     {

      CC_valid_state=true;
      CCB_valid_state=false;
      long_BU_div_Vali_level=Low[cTgh+1];
      long_BU_div_UnVali_level=High[cTgh+2];
      Fib_Switch=true;
      Fib_Switch_Lengthy=false;
      Dir_BU_div_CP_trig=false;
      Long_BU_div_CP_trig=false;
      Dir_BE_div_CP_trig=true;
      Long_BE_div_CP_trig=false;
      H_Dir_BU_div_CP_trig=false;
      H_Long_BU_div_CP_trig=false;
      H_Dir_BE_div_CP_trig=false;
      H_Long_BE_div_CP_trig=false;
      CP_valid_state=false;
      if(Show_Graphic_Object)
        {
         ObjectSetInteger(0,ArroDn_NAME,OBJPROP_ARROWCODE,252);
         ObjectSetText("XXCC_Value","Confirmed");
        }
      // CC_valid_state[cTgh]=1;
      Dir_BU_div_CCB_trig=false;
      Long_BU_div_CCB_trig=false;
      Dir_BE_div_CCB_trig=true;
      Long_BE_div_CCB_trig=false;
      H_Dir_BU_div_CCB_trig=false;
      H_Long_BU_div_CCB_trig=false;
      H_Dir_BE_div_CCB_trig=false;
      H_Long_BE_div_CCB_trig=false;
      CP_del_Dir_div=true;


      k=1;

     }
   else
     {


      CC_valid_state=false;
      Dir_BE_div_CCB_trig=false;
      k=0;

      if(Dir_BE_div_del_trig)
        {
         if(Show_Graphic_Object)
           {
            MegaDelete(cTgh+3);
            MegaDelete2(cTgh+2);
            MegaDelete3(cTgh+2);
            MegaDelete4(cTgh+2);
           }
         // delete line of unvalid D
         last_dive_deleted=true;
        }
      Dir_BE_div_del_trig=false;
      Dir_BE_div_CP_trig=false;
      Dir_BU_div_CCB_trig=false;
      Long_BU_div_CCB_trig=false;
      Dir_BE_div_CCB_trig=false;
      Long_BE_div_CCB_trig=false;
      H_Dir_BU_div_CCB_trig=false;
      H_Long_BU_div_CCB_trig=false;
      H_Dir_BE_div_CCB_trig=false;
      H_Long_BE_div_CCB_trig=false;
      UnvalidD(cTgh);

      Fib_Switch=false;
      CCB_valid_state=false;
      CP_valid_state=false;
     }
   return(k);
  }


int   H_Dir_BE_div_CC_detec(int cTgh)
  {
   int k=0;
   if(Close[cTgh+2]>Close[cTgh+1])
     {

      CC_valid_state=true;
      CCB_valid_state=false;
      H_long_BU_div_Vali_level=Low[cTgh+1];
      H_long_BU_div_UnVali_level=High[cTgh+2];
      Fib_Switch=true;
      Fib_Switch_Lengthy=false;
      Dir_BU_div_CP_trig=false;
      Long_BU_div_CP_trig=false;
      Dir_BE_div_CP_trig=false;
      Long_BE_div_CP_trig=false;
      H_Dir_BU_div_CP_trig=false;
      H_Long_BU_div_CP_trig=false;
      H_Dir_BE_div_CP_trig=true;
      H_Long_BE_div_CP_trig=false;
      CP_valid_state=false;
      if(Show_Graphic_Object)
        {
         ObjectSetInteger(0,ArroDn_NAME,OBJPROP_ARROWCODE,252);
         ObjectSetText("XXCC_Value","Confirmed");
        }
      // CC_valid_state[cTgh]=1;
      Dir_BU_div_CCB_trig=false;
      Long_BU_div_CCB_trig=false;
      Dir_BE_div_CCB_trig=false;
      Long_BE_div_CCB_trig=false;
      H_Dir_BU_div_CCB_trig=false;
      H_Long_BU_div_CCB_trig=false;
      H_Dir_BE_div_CCB_trig=true;
      H_Long_BE_div_CCB_trig=false;
      CP_del_Dir_div=true;


      k=1;

     }
   else
     {


      CC_valid_state=false;
      H_Dir_BE_div_CCB_trig=false;
      k=0;

      if(H_Dir_BE_div_del_trig)
        {
         if(Show_Graphic_Object)
           {
            MegaDelete(cTgh+3);
            MegaDelete2(cTgh+2);
            MegaDelete3(cTgh+2);
            MegaDelete4(cTgh+2);
           }
   
         last_dive_deleted=true;
        }
      H_Dir_BE_div_del_trig=false;
      H_Dir_BE_div_CP_trig=false;
      Dir_BU_div_CCB_trig=false;
      Long_BU_div_CCB_trig=false;
      Dir_BE_div_CCB_trig=false;
      Long_BE_div_CCB_trig=false;
      H_Dir_BU_div_CCB_trig=false;
      H_Long_BU_div_CCB_trig=false;
      H_Dir_BE_div_CCB_trig=false;
      H_Long_BE_div_CCB_trig=false;
      UnvalidD(cTgh);

      Fib_Switch=false;
      CCB_valid_state=false;
      CP_valid_state=false;
     }
   return(k);
  }



int   Long_BU_div_CC_detec(int cTgh)
  {
   int k=0;
   if(Close[cTgh+2]<Close[cTgh+1])
     {
      Dir_BE_div_Vali_level=High[cTgh+1];
      Dir_BE_div_UnVali_level=Low[cTgh+2];
      if(Show_Graphic_Object)
        {
         ObjectSetText("XXCC_Value","Confirmed");
         ObjectSetInteger(0,ArroUP_NAME,OBJPROP_ARROWCODE,252);
        }
      Dir_BU_div_CCB_trig=false;
      Long_BU_div_CCB_trig=true;
      Dir_BE_div_CCB_trig=false;
      Long_BE_div_CCB_trig=false;
      H_Dir_BU_div_CCB_trig=false;
      H_Long_BU_div_CCB_trig=false;
      H_Dir_BE_div_CCB_trig=false;
      H_Long_BE_div_CCB_trig=false;
      CC_valid_state=true;
      Long_BU_div_CC_trig=false;
      CCB_valid_state=false;
      Fib_Switch_Lengthy=true;
      Fib_Switch=false;
      Dir_BU_div_CP_trig=false;
      Long_BU_div_CP_trig=true;
      Dir_BE_div_CP_trig=false;
      Long_BE_div_CP_trig=false;
      H_Dir_BU_div_CP_trig=false;
      H_Long_BU_div_CP_trig=false;
      H_Dir_BE_div_CP_trig=false;
      H_Long_BE_div_CP_trig=false;
      Long_BU_div_CC_trig=false;
      CP_valid_state=false;
      CP_del_Long_div=true;

      k=1;

     }
   else
     {
      k=0;


      if(Long_BU_div_del_trig==true)
        {
         if(Show_Graphic_Object)
           {
            MegaDelete2(cTgh+2);
            MegaDelete3(cTgh+2);
            MegaDelete4(cTgh+2);
            MegaDelete(cTgh+3); 
           }
         last_dive_deleted=true;

        }
      Long_BU_div_del_trig=false;
      Long_BU_div_CP_trig=false;
      CC_valid_state=false;
      UnvalidD(cTgh);
      CP_valid_state=false;
      CCB_valid_state=false;
      Long_BU_div_CC_trig=false;
      Dir_BU_div_CCB_trig=false;
      Long_BU_div_CCB_trig=false;
      Dir_BE_div_CCB_trig=false;
      Long_BE_div_CCB_trig=false;
      H_Dir_BU_div_CCB_trig=false;
      H_Long_BU_div_CCB_trig=false;
      H_Dir_BE_div_CCB_trig=false;
      H_Long_BE_div_CCB_trig=false;
      k=0;
      Fib_Switch_Lengthy=false;
     }
   return(k);
  }


int   H_Long_BU_div_CC_detec(int cTgh)
  {
   int k=0;
   if(Close[cTgh+2]<Close[cTgh+1])
     {
      H_Dir_BE_div_Vali_level=High[cTgh+1];
      H_Dir_BE_div_UnVali_level=Low[cTgh+2];
      if(Show_Graphic_Object)
        {
         ObjectSetText("XXCC_Value","Confirmed");
         ObjectSetInteger(0,ArroUP_NAME,OBJPROP_ARROWCODE,252);
        }
      Dir_BU_div_CCB_trig=false;
      Long_BU_div_CCB_trig=false;
      Dir_BE_div_CCB_trig=false;
      Long_BE_div_CCB_trig=false;
      H_Dir_BU_div_CCB_trig=false;
      H_Long_BU_div_CCB_trig=true;
      H_Dir_BE_div_CCB_trig=false;
      H_Long_BE_div_CCB_trig=false;
      CC_valid_state=true;
      H_Long_BU_div_CC_trig=false;
      CCB_valid_state=false;
      Fib_Switch_Lengthy=true;
      Fib_Switch=false;
      Dir_BU_div_CP_trig=false;
      Long_BU_div_CP_trig=false;
      Dir_BE_div_CP_trig=false;
      Long_BE_div_CP_trig=false;
      H_Dir_BU_div_CP_trig=false;
      H_Long_BU_div_CP_trig=false;
      H_Dir_BE_div_CP_trig=false;
      H_Long_BE_div_CP_trig=true;
      H_Long_BU_div_CC_trig=false;
      CP_valid_state=false;
      CP_del_Long_div=true;



      k=1;

     }
   else
     {

      k=0;


      if(H_Long_BU_div_del_trig==true)
        {
         if(Show_Graphic_Object)
           {

            MegaDelete2(cTgh+2);
            MegaDelete3(cTgh+2);
            MegaDelete4(cTgh+2);
            MegaDelete(cTgh+3); 
           }
         last_dive_deleted=true;

        }

      H_Long_BU_div_del_trig=false;
      H_Long_BU_div_CP_trig=false;
      CC_valid_state=false;
      UnvalidD(cTgh);
      CP_valid_state=false;
      CCB_valid_state=false;
      H_Long_BU_div_CC_trig=false;
      Dir_BU_div_CCB_trig=false;
      Long_BU_div_CCB_trig=false;
      Dir_BE_div_CCB_trig=false;
      Long_BE_div_CCB_trig=false;
      H_Dir_BU_div_CCB_trig=false;
      H_Long_BU_div_CCB_trig=false;
      H_Dir_BE_div_CCB_trig=false;
      H_Long_BE_div_CCB_trig=false;
      k=0;
      Fib_Switch_Lengthy=false;
     }
   return(k);
  }


int  Long_BE_div_CC_detec(int cTgh)
  {
   int k=0;
   if(Close[cTgh+2]>Close[cTgh+1])
     {
      k=1;
      CC_valid_state=true;

      Dir_BU_div_Vali_level=Low[cTgh+1];
      Dir_BU_div_UnVali_level=High[cTgh+2];
      if(Show_Graphic_Object)
        {
         ObjectSetText("XXCC_Value","Confirmed");
         ObjectSetInteger(0,ArroDn_NAME,OBJPROP_ARROWCODE,252);
        }
      Dir_BU_div_CCB_trig=false;
      Long_BU_div_CCB_trig=false;
      Dir_BE_div_CCB_trig=false;
      Long_BE_div_CCB_trig=true;
      H_Dir_BU_div_CCB_trig=false;
      H_Long_BU_div_CCB_trig=false;
      H_Dir_BE_div_CCB_trig=false;
      H_Long_BE_div_CCB_trig=false;
      CCB_valid_state=false;
      Long_BE_div_CC_trig=false;
      CP_valid_state=false;
      Long_BU_div_CP_trig=false;
      Dir_BU_div_CP_trig=false;
      Dir_BE_div_CP_trig=false;
      Long_BE_div_CP_trig=true;
      H_Dir_BU_div_CP_trig=false;
      H_Long_BU_div_CP_trig=false;
      H_Dir_BE_div_CP_trig=false;
      H_Long_BE_div_CP_trig=false;
      CP_del_Long_div=true;


      Fib_Switch_Lengthy=true;
      Fib_Switch=false;


     }
   else
     {
      k=0;


      CC_valid_state=false;
      Long_BE_div_CC_trig=false;
      if(Long_BE_div_del_trig)
        {
         if(Show_Graphic_Object)
           {

            MegaDelete2(cTgh+2);
            MegaDelete3(cTgh+2);
            MegaDelete4(cTgh+2);
            MegaDelete(cTgh+3); 
           }
         last_dive_deleted=true;
        }
      Long_BE_div_del_trig=false;
      Long_BE_div_CP_trig=false;
      UnvalidD(cTgh);
      Fib_Switch_Lengthy=false;
      CCB_valid_state=false;
      Long_BE_div_CC_trig=false;
      Dir_BU_div_CCB_trig=false;
      Long_BU_div_CCB_trig=false;
      Dir_BE_div_CCB_trig=false;
      Long_BE_div_CCB_trig=false;
      H_Dir_BU_div_CCB_trig=false;
      H_Long_BU_div_CCB_trig=false;
      H_Dir_BE_div_CCB_trig=false;
      H_Long_BE_div_CCB_trig=false;
      CP_valid_state=false;
     }
   return(k);
  }


int  H_Long_BE_div_CC_detec(int cTgh)
  {
   int k=0;
   if(Close[cTgh+2]>Close[cTgh+1])
     {
      k=1;
      CC_valid_state=true;

      H_Dir_BU_div_Vali_level=Low[cTgh+1];
      H_Dir_BU_div_UnVali_level=High[cTgh+2];
      if(Show_Graphic_Object)
        {
         ObjectSetText("XXCC_Value","Confirmed");
         ObjectSetInteger(0,ArroDn_NAME,OBJPROP_ARROWCODE,252);
        }
      Dir_BU_div_CCB_trig=false;
      Long_BU_div_CCB_trig=false;
      Dir_BE_div_CCB_trig=false;
      Long_BE_div_CCB_trig=false;
      H_Dir_BU_div_CCB_trig=false;
      H_Long_BU_div_CCB_trig=false;
      H_Dir_BE_div_CCB_trig=false;
      H_Long_BE_div_CCB_trig=true;
      CCB_valid_state=false;
      H_Long_BE_div_CC_trig=false;
      CP_valid_state=false;
      Long_BU_div_CP_trig=false;
      Dir_BU_div_CP_trig=false;
      Dir_BE_div_CP_trig=false;
      Long_BE_div_CP_trig=false;
      H_Dir_BU_div_CP_trig=false;
      H_Long_BU_div_CP_trig=false;
      H_Dir_BE_div_CP_trig=false;
      H_Long_BE_div_CP_trig=true;
      CP_del_Long_div=true;


      Fib_Switch_Lengthy=true;
      Fib_Switch=false;


     }
   else
     {
      k=0;


      CC_valid_state=false;
      H_Long_BE_div_CC_trig=false;
      if(H_Long_BE_div_del_trig)
        {
         if(Show_Graphic_Object)
           {

            MegaDelete2(cTgh+2);
            MegaDelete3(cTgh+2);
            MegaDelete4(cTgh+2);
            MegaDelete(cTgh+3); 
           }
         last_dive_deleted=true;
        }
      H_Long_BE_div_del_trig=false;
      H_Long_BE_div_CP_trig=false;
      UnvalidD(cTgh);
      Fib_Switch_Lengthy=false;
      CCB_valid_state=false;
      Dir_BU_div_CCB_trig=false;
      Long_BU_div_CCB_trig=false;
      Dir_BE_div_CCB_trig=false;
      Long_BE_div_CCB_trig=false;
      H_Dir_BU_div_CCB_trig=false;
      H_Long_BU_div_CCB_trig=false;
      H_Dir_BE_div_CCB_trig=false;
      H_Long_BE_div_CCB_trig=false;
      CP_valid_state=false;
     }
   return(k);
  }

void TextMaker(int X,int t,int dir,int shi,string massg)
  {

   if(dir==0)
     {
      if(ObjectFind(0,"texmaker_up"+Time[shi])<0)
        {
         ObjectCreate(0,"texmaker_up"+Time[shi], OBJ_TEXT, 0, Time[shi], Low[shi]-window_width*0.125);
         ObjectSetString(0,"texmaker_up"+Time[shi], OBJPROP_TEXT, massg);
         ObjectSetInteger(0,"texmaker_up"+Time[shi],OBJPROP_BACK,true);
         ObjectSetInteger(0,"texmaker_up"+Time[shi],OBJPROP_SELECTABLE,true);
         ObjectSetString(0,"texmaker_up"+Time[shi],OBJPROP_FONT,"Times New Roman");
         ObjectSetInteger(0,"texmaker_up"+Time[shi],OBJPROP_FONTSIZE,10);
         if(X==0&&t==0)
            ObjectSetInteger(0,"texmaker_up"+Time[shi],OBJPROP_COLOR,LongColour);
         if(X==0&&t==1)
            ObjectSetInteger(0,"texmaker_up"+Time[shi],OBJPROP_COLOR,LongColour_Lengthy);
         if(X==1&&t==0)
            ObjectSetInteger(0,"texmaker_up"+Time[shi],OBJPROP_COLOR,H_LongColour);
         if(X==1&&t==1)
            ObjectSetInteger(0,"texmaker_up"+Time[shi],OBJPROP_COLOR,H_LongColour_Lengthy);
         ObjectSetInteger(0,"texmaker_up"+Time[shi],OBJPROP_BACK,true);

         TextNAME_U="txup"+Time[shi];
        }
     }
   if(dir==1)
     {
      if(ObjectFind(0,"texmaker_down"+Time[shi])<0)
        {
         ObjectCreate(0,"texmaker_down"+Time[shi], OBJ_TEXT, 0, Time[shi], High[shi]+window_width*0.125);
         ObjectSetString(0,"texmaker_down"+Time[shi], OBJPROP_TEXT, massg);
         ObjectSetInteger(0,"texmaker_down"+Time[shi],OBJPROP_BACK,true);
         ObjectSetInteger(0,"texmaker_down"+Time[shi],OBJPROP_SELECTABLE,true);
         ObjectSetString(0,"texmaker_down"+Time[shi],OBJPROP_FONT,"Times New Roman");
         ObjectSetInteger(0,"texmaker_down"+Time[shi],OBJPROP_FONTSIZE,10);
         if(X==0&&t==0)
            ObjectSetInteger(0,"texmaker_down"+Time[shi],OBJPROP_COLOR,ShortColour);
         if(X==0&&t==1)
            ObjectSetInteger(0,"texmaker_down"+Time[shi],OBJPROP_COLOR,ShortColour_Lengthy);
         if(X==1&&t==0)
            ObjectSetInteger(0,"texmaker_down"+Time[shi],OBJPROP_COLOR,H_ShortColour);
         if(X==1&&t==1)
            ObjectSetInteger(0,"texmaker_down"+Time[shi],OBJPROP_COLOR,H_ShortColour_Lengthy);
         ObjectSetInteger(0,"texmaker_down"+Time[shi],OBJPROP_BACK,true);
         TextNAME_D="txdown"+Time[shi];
        }
     }

  }

void RecMaker(int X,int t,int dir,int shi) 
  {
   if(dir==0)
     {
      ObjectCreate(0,"RECTUP"+Time[shi], OBJ_RECTANGLE, 0, Time[shi-1],Low[shi]-5*Point,Time[shi+1],High[shi]+5*Point);
      ObjectSetInteger(0,"RECTUP"+Time[shi],OBJPROP_BACK,false);
      ObjectSetInteger(0,"RECTUP"+Time[shi],OBJPROP_WIDTH,3);
      if(X==0&&t==0)
         ObjectSetInteger(0,"RECTUP"+Time[shi],OBJPROP_COLOR,LongColour);
      if(X==0&&t==1)
         ObjectSetInteger(0,"RECTUP"+Time[shi],OBJPROP_COLOR,LongColour_Lengthy);
      if(X==1&&t==0)
         ObjectSetInteger(0,"RECTUP"+Time[shi],OBJPROP_COLOR,H_LongColour);
      if(X==1&&t==1)
         ObjectSetInteger(0,"RECTUP"+Time[shi],OBJPROP_COLOR,H_LongColour_Lengthy);
      ObjectSetInteger(0,"RECTUP"+Time[shi],OBJPROP_BACK,true);
      RECNAME_U="RECTUP"+Time[shi];
     }
   if(dir==1)
     {
      ObjectCreate(0,"RECTDn"+Time[shi], OBJ_RECTANGLE, 0, Time[shi-1],Low[shi]-5*Point,Time[shi+1],High[shi]+5*Point);
      ObjectSetInteger(0,"RECTDn"+Time[shi],OBJPROP_BACK,false);
      ObjectSetInteger(0,"RECTDn"+Time[shi],OBJPROP_WIDTH,3);
      if(X==0&&t==0)
         ObjectSetInteger(0,"RECTDn"+Time[shi],OBJPROP_COLOR,ShortColour);
      if(X==0&&t==1)
         ObjectSetInteger(0,"RECTDn"+Time[shi],OBJPROP_COLOR,ShortColour_Lengthy);
      if(X==1&&t==0)
         ObjectSetInteger(0,"RECTDn"+Time[shi],OBJPROP_COLOR,H_ShortColour);
      if(X==1&&t==1)
         ObjectSetInteger(0,"RECTDn"+Time[shi],OBJPROP_COLOR,H_ShortColour_Lengthy);
      ObjectSetInteger(0,"RECTDn"+Time[shi],OBJPROP_BACK,true);
      RECNAME_D="RECTDown"+Time[shi];
     }
  }

void MegaDelete(int shift) 
  {
   if(dLD[shift-1]!=(dType[shift-1]*10+1))
     {
      int j=Time[shift];
      for(int i=ObjectsTotal(0,-1,-1); i>=0; i--)
        {
         if(StringFind(ObjectName(i), IntegerToString(j))==11&& StringFind(ObjectName(i), RSILine)!=-1)
           {
            dLD[shift-1]=dType[shift-1]*10+1;
            ObjectDelete(0,ObjectName(i));

           }
         if(StringFind(ObjectName(i), IntegerToString(j))==13&& StringFind(ObjectName(i),  PriceLine)!=-1)
           {
            ObjectDelete(0,ObjectName(i));
            dLD[shift-1]=dType[shift-1]*10+1;
           }
        }
     }
  }

void MegaDelete2(int shift) 
  {
   if(dAD[shift+1]!=(dType[shift+1]*10+1))
     {
      if(dUnvalid[shift+1]!=1)
        {

         int k=1;
         int j=Time[shift];
         if(dType[shift+1]==1 || dType[shift+1]==2 || dType[shift+1]==5 || dType[shift+1]==6)
           {
            if(ObjectFind("Arrow_Up"+Time[shift])==0)
              {
               ObjectDelete(0,"Arrow_Up"+Time[shift]);
               dAD[shift+1]=dType[shift+1]*10+1;

              }

           }
         if(dType[shift+1]==3 || dType[shift+1]==4 || dType[shift+1]==7 || dType[shift+1]==8)
           {
            if(ObjectFind("Arrow_Dn"+Time[shift])==0)
              {
               ObjectDelete(0,"Arrow_Dn"+Time[shift]);
               dAD[shift+1]=dType[shift+1]*10+1;
              }

           }
        }
     }
  }


void MegaDelete3(int shift) 
  {
   if(dUnvalid[shift+1]!=1)
     {
      int k=1;
      int j=Time[shift];
      if(dType[shift+1]==1 || dType[shift+1]==2 || dType[shift+1]==5 || dType[shift+1]==6)
        {
         if(ObjectFind("RECTUP"+Time[shift])==0)
           {
            ObjectDelete(0,"RECTUP"+Time[shift]);
            dRD[shift+1]=dType[shift+1]*10+1;
           }

        }
      if(dType[shift+1]==3 || dType[shift+1]==4 || dType[shift+1]==7 || dType[shift+1]==8)
        {
         if(ObjectFind("RECTDn"+Time[shift])==0)
           {
            ObjectDelete(0,"RECTDn"+Time[shift]);
            dRD[shift+1]=dType[shift+1]*10+1;

           }

        }
     }

  }

void MegaDelete4(int shift) 
  {
   if(dTD[shift+1]!=(dType[shift+1]*10+1))
     {
      if(dUnvalid[shift+1]!=1)
        {
         int k=1;
         int j=Time[shift];
         if(dType[shift+1]==1 || dType[shift+1]==2 || dType[shift+1]==5 || dType[shift+1]==6)
           {
            if(ObjectFind("texmaker_up"+Time[shift])==0)
              {
               ObjectDelete(0,"texmaker_up"+Time[shift]);
               dTD[shift+1]=dType[shift+1]*10+1;
              }

           }
         if(dType[shift+1]==3 || dType[shift+1]==4 || dType[shift+1]==7 || dType[shift+1]==8)
           {

            if(ObjectFind("texmaker_down"+Time[shift])==0)
              {


               ObjectDelete(0,"texmaker_down"+Time[shift]);
               dTD[shift+1]=dType[shift+1]*10+1;

              }

           }
        }
     }
  }

int Dir_BU_div_CCB_detec(int cTgh)
  {
   int k=0;
   int n=1;
   if(Close[cTgh+1]>=long_BE_div_UnVali_level+ Stop_Loss_Pips_GAP_LONG*10*Point)//Checking if last candle close was above the SL
     {
      if(Open[cTgh]>long_BE_div_Vali_level+ Entery_Point_GAP_LONG*10*Point || High[cTgh]>long_BE_div_Vali_level+ Entery_Point_GAP_LONG*10*Point || Close[cTgh]>long_BE_div_Vali_level+ Entery_Point_GAP_LONG*10*Point || Low[cTgh]>long_BE_div_Vali_level+ Entery_Point_GAP_LONG*10*Point)
        {
     
         if(Show_Graphic_Object)
           {
            ObjectSetInteger(0,ArroUP_NAME,OBJPROP_ARROWCODE,233);
            ObjectSetText("XXCCB_Value","Confirmed");
           }
         Dir_BU_div_CCB_trig=false;
         CCB_valid_state=true;
         CCB_Alert_BU_Dir_trig=true;
         Dir_CCB_Zone_trig=true;



        }
     }

   else
      if(Close[cTgh+1]<long_BE_div_UnVali_level+ Stop_Loss_Pips_GAP_LONG*10*Point || Long_BU_dive_check(cTgh+1)>0 || Long_BE_dive_check(cTgh+1)>0|| H_Long_BU_dive_check(cTgh)>0 || H_Long_BE_dive_check(cTgh)>0)
        {

         CCB_valid_state=false;

         int m=0;
         for(int i=cTgh+1; i<cTgh+1+50; i++)
           {
            if(dType[i]==1)
              {
               m=i;
               break;
              }
           }

         if(Dir_BU_div_del_trig)
           {
            if(Show_Graphic_Object)
              {
               MegaDelete(m);

               MegaDelete2(m-1);
               MegaDelete3(m-1);
               MegaDelete4(m-1);
               MegaDelete3(m-1);
               MegaDelete4(m-1);
              }

            last_dive_deleted=true;
           }
         Dir_BU_div_del_trig=false;

         Dir_BU_div_CCB_trig=false;
         Dir_CCB_Zone_trig=false;
         UnvalidD(cTgh);

        


         k=0;
        }
   return(k);
  }


int H_Dir_BU_div_CCB_detec(int cTgh)
  {
   int k=0;
   int n=1;
   if(Close[cTgh+1]>=H_long_BE_div_UnVali_level+ H_Stop_Loss_Pips_GAP_LONG*10*Point)
     {
      if(Open[cTgh]>H_long_BE_div_Vali_level+ H_Entery_Point_GAP_LONG*10*Point || High[cTgh]>H_long_BE_div_Vali_level+ H_Entery_Point_GAP_LONG*10*Point || Close[cTgh]>H_long_BE_div_Vali_level+ H_Entery_Point_GAP_LONG*10*Point || Low[cTgh]>H_long_BE_div_Vali_level+ H_Entery_Point_GAP_LONG*10*Point)
        {
       
         if(Show_Graphic_Object)
           {
            ObjectSetInteger(0,ArroUP_NAME,OBJPROP_ARROWCODE,233);
            ObjectSetText("XXCCB_Value","Confirmed");
           }
         H_Dir_BU_div_CCB_trig=false;
         CCB_valid_state=true;
         H_CCB_Alert_BU_Dir_trig=true;
         Dir_CCB_Zone_trig=true;



        }
     }

   else
      if(Close[cTgh+1]<H_long_BE_div_UnVali_level+ H_Stop_Loss_Pips_GAP_LONG*10*Point || Long_BU_dive_check(cTgh+1)>0 || Long_BE_dive_check(cTgh+1)>0|| H_Long_BU_dive_check(cTgh)>0 || H_Long_BE_dive_check(cTgh)>0)
        {

         CCB_valid_state=false;

         int m=0;
         for(int i=cTgh+1; i<cTgh+1+50; i++)
           {
            if(dType[i]==5)
              {
               m=i;
               break;
              }
           }

         if(H_Dir_BU_div_del_trig)
           {
            if(Show_Graphic_Object)
              {
               MegaDelete(m);

               MegaDelete2(m-1);
               MegaDelete3(m-1);
               MegaDelete4(m-1);
               MegaDelete3(m-1);
               MegaDelete4(m-1);
              }

            last_dive_deleted=true;
           }
         H_Dir_BU_div_del_trig=false;

         H_Dir_BU_div_CCB_trig=false;
         Dir_CCB_Zone_trig=false;
         UnvalidD(cTgh);

        


         k=0;
        }
   return(k);
  }


int Dir_BE_div_CCB_detec(int cTgh)
  {
   int k=0;

   int n=1;
   if(Close[cTgh+1]<=long_BU_div_UnVali_level+Stop_Loss_Pips_GAP_SHORT *10*Point)
     {
      if(Open[cTgh]<long_BU_div_Vali_level+ Entery_Point_GAP_SHORT *10*Point || High[cTgh]<long_BU_div_Vali_level+ Entery_Point_GAP_SHORT *10*Point || Close[cTgh]<long_BU_div_Vali_level+ Entery_Point_GAP_SHORT *10*Point || Low[cTgh]<long_BU_div_Vali_level+ Entery_Point_GAP_SHORT *10*Point)
        {
         CCB_valid_state=true;

         CCB_Alert_BE_Dir_trig=true;
         Dir_CCB_Zone_trig=true;


         Dir_BE_div_CCB_trig=false;
         k=1;
         if(Show_Graphic_Object)
           {
            ObjectSetText("CCB_Value","XXConfirmed");
            ObjectSetInteger(0,ArroDn_NAME,OBJPROP_ARROWCODE,234);
           }

        }
     }
   else
      if(Close[cTgh+1]>long_BU_div_UnVali_level+Stop_Loss_Pips_GAP_SHORT *10*Point || Long_BU_dive_check(cTgh+1)>0 || Long_BE_dive_check(cTgh+1)>0|| H_Long_BU_dive_check(cTgh)>0 || H_Long_BE_dive_check(cTgh)>0)
        {

         CCB_valid_state=false;
         int m=0;
         for(int i=cTgh+1; i<cTgh+1+50; i++)
           {
            if(dType[i]==3)
              {
               m=i;
               break;
              }
           }
         Dir_BE_div_CCB_trig=false;

         if(Dir_BE_div_del_trig)
           {
            if(Show_Graphic_Object)
              {
               MegaDelete2(m-1);
               MegaDelete3(m-1);

               MegaDelete4(m-1);
               MegaDelete(m);
              }
            last_dive_deleted=true;

           }
         Dir_BE_div_del_trig=false;
         Dir_BE_div_CCB_trig=false;
         Dir_CCB_Zone_trig=false;
         UnvalidD(cTgh);

         k=0;

        }
   return(k);
  }

int H_Dir_BE_div_CCB_detec(int cTgh)
  {
   int k=0;

   int n=1;
   if(Close[cTgh+1]<=H_long_BU_div_UnVali_level+H_Stop_Loss_Pips_GAP_SHORT *10*Point)
     {
      if(Open[cTgh]<H_long_BU_div_Vali_level+ H_Entery_Point_GAP_SHORT *10*Point || High[cTgh]<H_long_BU_div_Vali_level+ H_Entery_Point_GAP_SHORT *10*Point || Close[cTgh]<H_long_BU_div_Vali_level+ H_Entery_Point_GAP_SHORT *10*Point || Low[cTgh]<H_long_BU_div_Vali_level+ H_Entery_Point_GAP_SHORT *10*Point)
        {
         CCB_valid_state=true;

         H_CCB_Alert_BE_Dir_trig=true;
         Dir_CCB_Zone_trig=true;


         H_Dir_BE_div_CCB_trig=false;
         k=1;
         if(Show_Graphic_Object)
           {
            ObjectSetText("CCB_Value","XXConfirmed");
            ObjectSetInteger(0,ArroDn_NAME,OBJPROP_ARROWCODE,234);
           }

        }
     }
   else
      if(Close[cTgh+1]>H_long_BU_div_UnVali_level+H_Stop_Loss_Pips_GAP_SHORT *10*Point || Long_BU_dive_check(cTgh+1)>0 || Long_BE_dive_check(cTgh+1)>0|| H_Long_BU_dive_check(cTgh)>0 || H_Long_BE_dive_check(cTgh)>0)
        {

         CCB_valid_state=false;
         int m=0;
         for(int i=cTgh+1; i<cTgh+1+50; i++)
           {
            if(dType[i]==7)
              {
               m=i;
               break;
              }
           }
         H_Dir_BE_div_CCB_trig=false;

         if(H_Dir_BE_div_del_trig)
           {
            if(Show_Graphic_Object)
              {
               MegaDelete2(m-1);
               MegaDelete3(m-1);

               MegaDelete4(m-1);
               MegaDelete(m);
              }
            last_dive_deleted=true;

           }
         H_Dir_BE_div_del_trig=false;
         H_Dir_BE_div_CCB_trig=false;
         Dir_CCB_Zone_trig=false;
         UnvalidD(cTgh);

         k=0;

        }
   return(k);
  }

int Long_BU_div_CCB_detec(int cTgh)
  {
   int k=0;
   if(Close[cTgh+1]>=Dir_BE_div_UnVali_level+ Stop_Loss_Pips_GAP_Lengthy_LONG *10*Point)
     {
      if(Open[cTgh]>Dir_BE_div_Vali_level+Entery_Point_GAP_Lengthy_LONG *10*Point || High[cTgh]>Dir_BE_div_Vali_level +Entery_Point_GAP_Lengthy_LONG *10*Point|| Close[cTgh]>Dir_BE_div_Vali_level+Entery_Point_GAP_Lengthy_LONG *10*Point || Low[cTgh]>Dir_BE_div_Vali_level+Entery_Point_GAP_Lengthy_LONG *10*Point)
        {
         if(Show_Graphic_Object)
           {
            ObjectSetInteger(0,ArroUP_NAME,OBJPROP_ARROWCODE,233);
            ObjectSetText("XXCCB_Value","Confirmed");
           }
         CCB_valid_state=true;

         Long_BU_div_CCB_trig=false;

         CCB_Alert_BU_Long_trig=true;
         Long_CCB_Zone_trig=true;


         CCB_valid_state=true;
         k=1;

        }
     }
   else
      if(Close[cTgh+1]<Dir_BE_div_UnVali_level+ Stop_Loss_Pips_GAP_Lengthy_LONG *10*Point|| Long_BU_dive_check(cTgh)>0 || Long_BE_dive_check(cTgh)>0|| H_Long_BU_dive_check(cTgh)>0 || H_Long_BE_dive_check(cTgh)>0)
        {
         CCB_valid_state=false;
         Long_BU_div_CCB_trig=false;

         int m=0;
         for(int i=cTgh+1; i<cTgh+1+50; i++)
           {
            if(dType[i]==2)
              {
               m=i;
               break;
              }
           }

         if(Long_BU_div_del_trig)
           {
            if(Show_Graphic_Object)
              {
               MegaDelete2(m-1);

               MegaDelete3(m-1);

               MegaDelete4(m-1);
               MegaDelete(m);
              }
            last_dive_deleted=true;

           }
         Long_BU_div_del_trig=false;
         Long_CCB_Zone_trig=false;

         UnvalidD(cTgh);
         k=0;
        }
   return(k);
  }

int H_Long_BU_div_CCB_detec(int cTgh)
  {
   int k=0;
   if(Close[cTgh+1]>=H_Dir_BE_div_UnVali_level+ H_Stop_Loss_Pips_GAP_Lengthy_LONG *10*Point)
     {
      if(Open[cTgh]>H_Dir_BE_div_Vali_level+H_Entery_Point_GAP_Lengthy_LONG *10*Point || High[cTgh]>H_Dir_BE_div_Vali_level +H_Entery_Point_GAP_Lengthy_LONG *10*Point|| Close[cTgh]>H_Dir_BE_div_Vali_level+H_Entery_Point_GAP_Lengthy_LONG *10*Point || Low[cTgh]>H_Dir_BE_div_Vali_level+H_Entery_Point_GAP_Lengthy_LONG *10*Point)
        {
         if(Show_Graphic_Object)
           {
            ObjectSetInteger(0,ArroUP_NAME,OBJPROP_ARROWCODE,233);
            ObjectSetText("XXCCB_Value","Confirmed");
           }
         CCB_valid_state=true;

         H_Long_BU_div_CCB_trig=false;

         H_CCB_Alert_BU_Long_trig=true;
         Long_CCB_Zone_trig=true;

         CCB_valid_state=true;
         k=1;

        }
     }
   else
      if(Close[cTgh+1]<H_Dir_BE_div_UnVali_level+ H_Stop_Loss_Pips_GAP_Lengthy_LONG *10*Point|| Long_BU_dive_check(cTgh)>0 || Long_BE_dive_check(cTgh)>0|| H_Long_BU_dive_check(cTgh)>0 || H_Long_BE_dive_check(cTgh)>0)
        {
         CCB_valid_state=false;
         H_Long_BU_div_CCB_trig=false;

         int m=0;
         for(int i=cTgh+1; i<cTgh+1+50; i++)
           {
            if(dType[i]==6)
              {
               m=i;
               break;
              }
           }

         if(H_Long_BU_div_del_trig)
           {
            if(Show_Graphic_Object)
              {
               MegaDelete2(m-1);

               MegaDelete3(m-1);

               MegaDelete4(m-1);
               MegaDelete(m);
              }
            last_dive_deleted=true;

           }
         Long_CCB_Zone_trig=false;
         H_Long_BU_div_del_trig=false;

         UnvalidD(cTgh);
         k=0;
        }
   return(k);
  }

int Long_BE_div_CCB_detec(int cTgh)
  {
   int k=0;
   int n=1;
   if(Close[cTgh+1]<=Dir_BU_div_UnVali_level+Stop_Loss_Pips_GAP_Lengthy_SHORT *10*Point)
     {
      if(Open[cTgh]<Dir_BU_div_Vali_level+ Entery_Point_GAP_Lengthy_SHORT *10*Point || High[cTgh]<Dir_BU_div_Vali_level+ Entery_Point_GAP_Lengthy_SHORT *10*Point || Close[cTgh]<Dir_BU_div_Vali_level + Entery_Point_GAP_Lengthy_SHORT *10*Point|| Low[cTgh]<Dir_BU_div_Vali_level+ Entery_Point_GAP_Lengthy_SHORT *10*Point)
        {
         CCB_valid_state=true;

         k=1;
         Long_BE_div_CCB_trig=false;
         if(Show_Graphic_Object)
           {
            ObjectSetText("XXCCB_Value","Confirmed");
            ObjectSetInteger(0,ArroDn_NAME,OBJPROP_ARROWCODE,234);
           }

         CCB_Alert_BE_Long_trig=true;
         Long_CCB_Zone_trig=true;

        }
     }
   else
      if(Close[cTgh+1]>Dir_BU_div_UnVali_level+Stop_Loss_Pips_GAP_Lengthy_SHORT *10*Point || Long_BU_dive_check(cTgh)>0 || Long_BE_dive_check(cTgh)>0|| H_Long_BU_dive_check(cTgh)>0 || H_Long_BE_dive_check(cTgh)>0)
        {
         k=0;
         int m=0;
         for(int i=cTgh+1; i<cTgh+1+50; i++)
           {
            if(dType[i]==4)
              {
               m=i;
               break;
              }
           }
         CCB_valid_state=false;

         Long_BE_div_CCB_trig=false;
         if(Long_BE_div_del_trig)
           {
            if(Show_Graphic_Object)
              {
               MegaDelete2(m-1);
               MegaDelete3(m-1);

               MegaDelete4(m-1);
               MegaDelete(m);
              }
            last_dive_deleted=true;
           }
         Long_BE_div_del_trig=false;
         Long_CCB_Zone_trig=false;

         UnvalidD(cTgh);
        }

   return(k);
  }

int H_Long_BE_div_CCB_detec(int cTgh)
  {
   int k=0;
   int n=1;
   if(Close[cTgh+1]<=H_Dir_BU_div_UnVali_level+H_Stop_Loss_Pips_GAP_Lengthy_SHORT *10*Point)
     {
      if(Open[cTgh]<H_Dir_BU_div_Vali_level+ H_Entery_Point_GAP_Lengthy_SHORT *10*Point || High[cTgh]<H_Dir_BU_div_Vali_level+ H_Entery_Point_GAP_Lengthy_SHORT *10*Point || Close[cTgh]<H_Dir_BU_div_Vali_level + H_Entery_Point_GAP_Lengthy_SHORT *10*Point|| Low[cTgh]<H_Dir_BU_div_Vali_level+ H_Entery_Point_GAP_Lengthy_SHORT *10*Point)
        {
         CCB_valid_state=true;

         k=1;
         H_Long_BE_div_CCB_trig=false;
         if(Show_Graphic_Object)
           {
            ObjectSetText("XXCCB_Value","Confirmed");
            ObjectSetInteger(0,ArroDn_NAME,OBJPROP_ARROWCODE,234);
           }
         Long_CCB_Zone_trig=true;
         H_CCB_Alert_BE_Long_trig=true;

        }
     }
   else
      if(Close[cTgh+1]>H_Dir_BU_div_UnVali_level+H_Stop_Loss_Pips_GAP_Lengthy_SHORT *10*Point || Long_BU_dive_check(cTgh)>0 || Long_BE_dive_check(cTgh)>0 || H_Long_BU_dive_check(cTgh)>0 || H_Long_BE_dive_check(cTgh)>0)
        {
         k=0;
         int m=0;
         for(int i=cTgh+1; i<cTgh+1+50; i++)
           {
            if(dType[i]==8)
              {
               m=i;
               break;
              }
           }
         CCB_valid_state=false;

         H_Long_BE_div_CCB_trig=false;
         if(H_Long_BE_div_del_trig)
           {
            if(Show_Graphic_Object)
              {
               MegaDelete2(m-1);
               MegaDelete3(m-1);

               MegaDelete4(m-1);
               MegaDelete(m);
              }
            last_dive_deleted=true;
           }
         H_Long_BE_div_del_trig=false;
         Long_CCB_Zone_trig=false;

         UnvalidD(cTgh);
        }

   return(k);
  }

int Long_BU_dive_check(int shift) 
  {
   int k=0;
   if(IsdTgh(shift) == false)
      k=-1;
   int cTgh = shift;
   for(int a=shift+2; a<=shift+Max_Bars_Lengthy; a++)
     {
      int lTgh = GiLTghp(a, shift+2);
      if(rsi_L[cTgh] >= rsi_L[lTgh] && Close[cTgh]<=Close[lTgh] && Close[cTgh]<Open[cTgh] && Close[lTgh]<Open[lTgh] && BuC(lTgh,cTgh) && BuCr(lTgh,cTgh)&&((RSI_Filter_Lengthy&&rsi_L[cTgh]<bulish_Level_Lengthy&&rsi_L[lTgh]<bulish_Level_Lengthy)||RSI_Filter_Lengthy==0))
        {
         k=cTgh;
        }
     }
   return(k);
  }

int Long_BE_dive_check(int shift)
  {
   int k=0;
   if(IsdPk(shift) == false)
      k=-1;
   int cPk = shift;
   for(int a=shift+2; a<=shift+Max_Bars_Lengthy; a++)
     {
      int lPk = GiLpKp(a, shift+2);
      if(rsi_L[cPk] <= rsi_L[lPk] && Close[cPk]>=Close[lPk] && Close[cPk]>Open[cPk] && Close[lPk]>Open[lPk] && BeC(lPk,cPk) && BeCr(lPk,cPk)&&((RSI_Filter_Lengthy&&rsi_L[cPk]>bearish_Level_Lengthy&&rsi_L[lPk]>bearish_Level_Lengthy)||RSI_Filter_Lengthy==0))
        {
         k=cPk;
        }
     }
   return(k);
  }

int H_Long_BU_dive_check(int shift) 
  {
   int k=0;
   if(IsdTgh(shift) == false)
      k=-1;
   int cTgh = shift;
   for(int a=shift+2; a<=shift+H_Max_Bars_Lengthy; a++)
     {
      int lTgh = GiLTghp(a, shift+2);
      if(rsi_L[cTgh] <= rsi_L[lTgh] && Close[cTgh]>=Close[lTgh] && Close[cTgh]<Open[cTgh] && Close[lTgh]<Open[lTgh] && BuC(lTgh,cTgh) && BuCr(lTgh,cTgh)&&((RSI_Filter_Lengthy&&rsi_L[cTgh]<bulish_Level_Lengthy&&rsi_L[lTgh]<bulish_Level_Lengthy)||RSI_Filter_Lengthy==0))
        {
         k=cTgh;
        }
     }
   return(k);
  }

int H_Long_BE_dive_check(int shift)
  {
   int k=0;
   if(IsdPk(shift) == false)
      k=-1;
   int cPk = shift;
   for(int a=shift+2; a<=shift+H_Max_Bars_Lengthy; a++)
     {
      int lPk = GiLpKp(a, shift+2);
      if(rsi_L[cPk] >= rsi_L[lPk] && Close[cPk]<=Close[lPk] && Close[cPk]>Open[cPk] && Close[lPk]>Open[lPk] && BeC(lPk,cPk) && BeCr(lPk,cPk)&&((RSI_Filter_Lengthy&&rsi_L[cPk]>bearish_Level_Lengthy&&rsi_L[lPk]>bearish_Level_Lengthy)||RSI_Filter_Lengthy==0))
        {
         k=cPk;
        }
     }
   return(k);
  }

bool Label(const long                    chart_ID=0,  
           const string            name="Label",
           const int               sub_window=0,
           const int               x=0,
           const int               y=0,
           const ENUM_BASE_CORNER  corner=CORNER_LEFT_UPPER,
           const string            text="Label",
           const string            font="Arial",
           const int               font_size=10,
           const color             clr=clrRed,
           const double            angle=0.0,
           const ENUM_ANCHOR_POINT anchor=ANCHOR_LEFT_UPPER,
           const bool              back=false,
           const bool              selection=false,
           const bool              hidden=false,
           const long              z_order=0)
  {
   ResetLastError();
   if(ObjectCreate(chart_ID,name,OBJ_LABEL,sub_window,0,0))
     {
      ObjectSetInteger(chart_ID,name,OBJPROP_XDISTANCE,x);
      ObjectSetInteger(chart_ID,name,OBJPROP_YDISTANCE,y);
      ObjectSetInteger(chart_ID,name,OBJPROP_CORNER,corner);
      ObjectSetString(chart_ID,name,OBJPROP_TEXT,text);
      ObjectSetString(chart_ID,name,OBJPROP_FONT,font);
      ObjectSetInteger(chart_ID,name,OBJPROP_FONTSIZE,font_size);
      ObjectSetDouble(chart_ID,name,OBJPROP_ANGLE,angle);
      ObjectSetInteger(chart_ID,name,OBJPROP_ANCHOR,anchor);
      ObjectSetInteger(chart_ID,name,OBJPROP_COLOR,clr);
      ObjectSetInteger(chart_ID,name,OBJPROP_BACK,back);
      ObjectSetInteger(chart_ID,name,OBJPROP_SELECTABLE,selection);
      ObjectSetInteger(chart_ID,name,OBJPROP_SELECTED,selection);
      ObjectSetInteger(chart_ID,name,OBJPROP_HIDDEN,hidden);
      ObjectSetInteger(chart_ID,name,OBJPROP_ZORDER,z_order);
      return(true);
     }
   else
     {
      return(false);
     }
  }

void TableMaking()
  {
   if(Fibbo_Table_BackGround_Color!=clrNONE)
     {
      ObjectCreate("XXrtl1",OBJ_RECTANGLE_LABEL,0,0,0);
      ObjectSet("XXrtl1",OBJPROP_CORNER,CORNER_LEFT_LOWER);
      ObjectSet("XXrtl1",OBJPROP_XDISTANCE,5);
      ObjectSet("XXrtl1",OBJPROP_YDISTANCE,220);
      ObjectSet("XXrtl1",OBJPROP_XSIZE,310);
      ObjectSet("XXrtl1",OBJPROP_YSIZE,220);
      ObjectSet("XXrtl1",OBJPROP_BORDER_TYPE,BORDER_FLAT);
      ObjectSet("XXrtl1",OBJPROP_COLOR,Fibbo_Table_BackGround_Color);
      ObjectSet("XXrtl1",OBJPROP_BGCOLOR,Fibbo_Table_BackGround_Color);
      ObjectSetInteger(0,"XXrtl1",OBJPROP_BACK,false);
      ObjectSetInteger(0,"XXrtl1",OBJPROP_HIDDEN,false);
      ObjectSetInteger(0,"XXrtl1",OBJPROP_BACK,false);
     }
   for(int i1=0; i1<30; i1++)
     {

      Label(0,"XXHL0"+DoubleToString(i1+101)+"L",0,i1*10+10,228,CORNER_LEFT_LOWER, "_","Times New Roman",8, Fibbo_Table_Borader_Color);
     }
   for(int i2=0; i2<30; i2++)
     {
      Label(0,"XXHL1"+DoubleToString(i2+101)+"L",0,i2*10+10,185,CORNER_LEFT_LOWER, "_","Times New Roman",8, Fibbo_Table_Borader_Color);
     }
   for(int i3=0; i3<30; i3++)
     {
      Label(0,"XXHL2"+DoubleToString(i3+101)+"L",0,i3*10+10,145,CORNER_LEFT_LOWER, "_","Times New Roman",8,Fibbo_Table_Borader_Color);
     }
   for(int i4=0; i4<30; i4++)
     {
      Label(0,"XXHL3"+DoubleToString(i4+101)+"L",0,i4*10+10,105,CORNER_LEFT_LOWER, "_","Times New Roman",8,Fibbo_Table_Borader_Color);
     }
   for(int i5=0; i5<30; i5++)
     {
      Label(0,"XXHL4"+DoubleToString(i5+101)+"L",0,i5*10+10,65,CORNER_LEFT_LOWER, "_","Times New Roman",8, Fibbo_Table_Borader_Color);
     }
   for(int i6=0; i6<30; i6++)
     {
      Label(0,"XXHL5"+DoubleToString(i6+101)+"L",0,i6*10+10,22,CORNER_LEFT_LOWER, "_","Times New Roman",8,Fibbo_Table_Borader_Color);
     }

   for(int q=0; q<14; q++)
     {
      Label(0,"XXFVL0"+DoubleToString(q),0,308,0+q*15+23,CORNER_LEFT_LOWER, "|","Times New Roman",8, Fibbo_Table_Borader_Color);
     }
   for(int q1=0; q1<14; q1++)
     {
      Label(0,"XXFVL1"+DoubleToString(q1),0,8,0+q1*15+23,CORNER_LEFT_LOWER, "|","Times New Roman",8, Fibbo_Table_Borader_Color);
     }

   Label(0,"XXtx01",0,65,205,CORNER_LEFT_LOWER, Symbol(),"Times New Roman",12,  Fibbo_Table_Text_Color);


   Label(0,"XXtx02",0,25,160,CORNER_LEFT_LOWER, "SIGNAL","Times New Roman",10,  Fibbo_Table_Text_Color);

   Label(0,"XXsignal_Value",0,90,160,CORNER_LEFT_LOWER, "SIGNAL","Times New Roman",10, Fibbo_Table_vlaue_Color);



   Label(0,"XXtx099",0,140,160,CORNER_LEFT_LOWER, "TimeD","Times New Roman",10,  Fibbo_Table_Text_Color);

   Label(0,"XXTimeD",0,205,160,CORNER_LEFT_LOWER, "TimeToString(rtx_034)","Times New Roman",10,Fibbo_Table_vlaue_Color);

   Label(0,"XXtx04",0,25,120,CORNER_LEFT_LOWER, "ENTRY 1","Times New Roman",10,  Fibbo_Table_Text_Color);

   Label(0,"XXentry_Value",0,90,120,CORNER_LEFT_LOWER, "ENTRY 1","Times New Roman",10, Fibbo_Table_vlaue_Color);
   ObjectCreate("XXrtl01",OBJ_RECTANGLE_LABEL,0,0,0);
   ObjectSet("XXrtl01",OBJPROP_CORNER,CORNER_LEFT_LOWER);
   ObjectSet("XXrtl01",OBJPROP_XDISTANCE,137);
   ObjectSet("XXrtl01",OBJPROP_YDISTANCE,117);
   ObjectSet("XXrtl01",OBJPROP_XSIZE,20);
   ObjectSet("XXrtl01",OBJPROP_YSIZE,10);
   ObjectSet("XXrtl01",OBJPROP_BORDER_TYPE,BORDER_FLAT);
   ObjectSet("XXrtl01",OBJPROP_COLOR,Fibbo_Table_color_Box_Neutral);
   ObjectSet("XXrtl01",OBJPROP_BGCOLOR,Fibbo_Table_color_Box_Neutral);
   ObjectSetInteger(0,"XXrtl01",OBJPROP_HIDDEN,false);

   Label(0,"XXtx05",0,170,120,CORNER_LEFT_LOWER,"ENTRY 2","Times New Roman",10,  Fibbo_Table_Text_Color);

   Label(0,"XXentry_Value2",0,235,120,CORNER_LEFT_LOWER, "ENTRY 2","Times New Roman",10,Fibbo_Table_vlaue_Color);
   ObjectCreate("XXrtl02",OBJ_RECTANGLE_LABEL,0,0,0);
   ObjectSet("XXrtl02",OBJPROP_CORNER,CORNER_LEFT_LOWER);
   ObjectSet("XXrtl02",OBJPROP_XDISTANCE,282);
   ObjectSet("XXrtl02",OBJPROP_YDISTANCE,117);
   ObjectSet("XXrtl02",OBJPROP_XSIZE,20);
   ObjectSet("XXrtl02",OBJPROP_YSIZE,10);
   ObjectSet("XXrtl02",OBJPROP_BORDER_TYPE,BORDER_FLAT);
   ObjectSet("XXrtl02",OBJPROP_COLOR,Fibbo_Table_color_Box_Neutral);
   ObjectSet("XXrtl02",OBJPROP_BGCOLOR,Fibbo_Table_color_Box_Neutral);
   ObjectSetInteger(0,"XXrtl02",OBJPROP_HIDDEN,false);


   Label(0,"XXtx06",0,25,80,CORNER_LEFT_LOWER, "STOP","Times New Roman",10,  Fibbo_Table_Text_Color);

   Label(0,"XXstop_Value",0,90,80,CORNER_LEFT_LOWER, "STOP","Times New Roman",10, Fibbo_Table_vlaue_Color);
   ObjectCreate("XXrtl03",OBJ_RECTANGLE_LABEL,0,0,0);
   ObjectSet("XXrtl03",OBJPROP_CORNER,CORNER_LEFT_LOWER);
   ObjectSet("XXrtl03",OBJPROP_XDISTANCE,137);
   ObjectSet("XXrtl03",OBJPROP_YDISTANCE,77);
   ObjectSet("XXrtl03",OBJPROP_XSIZE,20);
   ObjectSet("XXrtl03",OBJPROP_YSIZE,10);
   ObjectSet("XXrtl03",OBJPROP_BORDER_TYPE,BORDER_FLAT);
   ObjectSet("XXrtl03",OBJPROP_COLOR,Fibbo_Table_color_Box_Neutral);
   ObjectSet("XXrtl03",OBJPROP_BGCOLOR,Fibbo_Table_color_Box_Neutral);
   ObjectSetInteger(0,"XXrtl03",OBJPROP_HIDDEN,false);

   Label(0,"XXtx07",0,170,80,CORNER_LEFT_LOWER, "TARGET 1","Times New Roman",10,  Fibbo_Table_Text_Color);

   Label(0,"XXtarget1_Value",0,235,80,CORNER_LEFT_LOWER, "TARGET 1","Times New Roman",10, Fibbo_Table_vlaue_Color);
   ObjectCreate("XXrtl04",OBJ_RECTANGLE_LABEL,0,0,0);
   ObjectSet("XXrtl04",OBJPROP_CORNER,CORNER_LEFT_LOWER);
   ObjectSet("XXrtl04",OBJPROP_XDISTANCE,282);
   ObjectSet("XXrtl04",OBJPROP_YDISTANCE,77);
   ObjectSet("XXrtl04",OBJPROP_XSIZE,20);
   ObjectSet("XXrtl04",OBJPROP_YSIZE,10);
   ObjectSet("XXrtl04",OBJPROP_BORDER_TYPE,BORDER_FLAT);
   ObjectSet("XXrtl04",OBJPROP_COLOR,Fibbo_Table_color_Box_Neutral);
   ObjectSet("XXrtl04",OBJPROP_BGCOLOR,Fibbo_Table_color_Box_Neutral);
   ObjectSetInteger(0,"XXrtl04",OBJPROP_HIDDEN,false);


   Label(0,"XXtx08",0,25,40,CORNER_LEFT_LOWER, "TARGET 2","Times New Roman",10,  Fibbo_Table_Text_Color);

   Label(0,"XXtarget2_Value",0,90,40,CORNER_LEFT_LOWER, "TARGET 2","Times New Roman",10, Fibbo_Table_vlaue_Color);
   ObjectCreate("XXrtl05",OBJ_RECTANGLE_LABEL,0,0,0);
   ObjectSet("XXrtl05",OBJPROP_CORNER,CORNER_LEFT_LOWER);
   ObjectSet("XXrtl05",OBJPROP_XDISTANCE,137);
   ObjectSet("XXrtl05",OBJPROP_YDISTANCE,37);
   ObjectSet("XXrtl05",OBJPROP_XSIZE,20);
   ObjectSet("XXrtl05",OBJPROP_YSIZE,10);
   ObjectSet("XXrtl05",OBJPROP_BORDER_TYPE,BORDER_FLAT);
   ObjectSet("XXrtl05",OBJPROP_COLOR,Fibbo_Table_color_Box_Neutral);
   ObjectSet("XXrtl05",OBJPROP_BGCOLOR,Fibbo_Table_color_Box_Neutral);
   ObjectSetInteger(0,"XXrtl05",OBJPROP_HIDDEN,false);


   Label(0,"XXtx09",0,170,40,CORNER_LEFT_LOWER, "TARGET 3","Times New Roman",10,  Fibbo_Table_Text_Color);

   Label(0,"XXtarget3_Value",0,235,40,CORNER_LEFT_LOWER, "TARGET 3","Times New Roman",10,Fibbo_Table_vlaue_Color);
   ObjectCreate("XXrtl06",OBJ_RECTANGLE_LABEL,0,0,0);
   ObjectSet("XXrtl06",OBJPROP_CORNER,CORNER_LEFT_LOWER);
   ObjectSet("XXrtl06",OBJPROP_XDISTANCE,282);
   ObjectSet("XXrtl06",OBJPROP_YDISTANCE,37);
   ObjectSet("XXrtl06",OBJPROP_XSIZE,20);
   ObjectSet("XXrtl06",OBJPROP_YSIZE,10);
   ObjectSet("XXrtl06",OBJPROP_BORDER_TYPE,BORDER_FLAT);
   ObjectSet("XXrtl06",OBJPROP_COLOR,Fibbo_Table_color_Box_Neutral);
   ObjectSet("XXrtl06",OBJPROP_BGCOLOR,Fibbo_Table_color_Box_Neutral);
   ObjectSetInteger(0,"XXrtl06",OBJPROP_HIDDEN,false);


  }

void DisplayCardMaking()
  {
   if(Display_Table_BackGround_Color!=clrNONE)
     {
      ObjectCreate("XXrtl2",OBJ_RECTANGLE_LABEL,0,0,0);
      ObjectSet("XXrtl2",OBJPROP_CORNER,CORNER_LEFT_LOWER);
      ObjectSet("XXrtl2",OBJPROP_XDISTANCE,305);
      ObjectSet("XXrtl2",OBJPROP_YDISTANCE,220);
      ObjectSet("XXrtl2",OBJPROP_XSIZE,305);
      ObjectSet("XXrtl2",OBJPROP_YSIZE,220);
      ObjectSet("XXrtl2",OBJPROP_BORDER_TYPE,BORDER_FLAT);
      ObjectSet("XXrtl2",OBJPROP_COLOR,Display_Table_BackGround_Color);
      ObjectSet("XXrtl2",OBJPROP_BGCOLOR,Display_Table_BackGround_Color);
      ObjectSetInteger(0,"XXrtl2",OBJPROP_BACK,false);
      ObjectSetInteger(0,"XXrtl2",OBJPROP_HIDDEN,false);
      ObjectSetInteger(0,"XXrtl2",OBJPROP_BACK,false);
     }
   for(int j1=0; j1<30; j1++)
     {
      Label(0,"XXHLJ0"+DoubleToString(j1+101)+"L",0,j1*10+300,228,CORNER_LEFT_LOWER, "_","Times New Roman",8, Display_Table_Borader_Color);
     }
   for(int i2=0; i2<30; i2++)
     {
      Label(0,"XXHLJ1"+DoubleToString(i2+101)+"L",0,i2*10+300,185,CORNER_LEFT_LOWER, "_","Times New Roman",8,  Display_Table_Borader_Color);
     }
   for(int i3=0; i3<30; i3++)
     {
      Label(0,"XXHLJ2"+DoubleToString(i3+101)+"L",0,i3*10+300,145,CORNER_LEFT_LOWER, "_","Times New Roman",8, Display_Table_Borader_Color);
     }
   for(int i4=0; i4<30; i4++)
     {
      Label(0,"XXHLJ3"+DoubleToString(i4+101)+"L",0,i4*10+300,105,CORNER_LEFT_LOWER, "_","Times New Roman",8, Display_Table_Borader_Color);
     }
   for(int i5=0; i5<30; i5++)
     {
      Label(0,"XXHLJ4"+DoubleToString(i5+101)+"L",0,i5*10+300,65,CORNER_LEFT_LOWER, "_","Times New Roman",8, Display_Table_Borader_Color);
     }
   for(int i6=0; i6<30; i6++)
     {
      Label(0,"XXHLJ5"+DoubleToString(i6+101)+"L",0,i6*10+300,22,CORNER_LEFT_LOWER, "_","Times New Roman",8, Display_Table_Borader_Color);
     }
   for(int q2=0; q2<14; q2++)
     {
      Label(0,"XXFVcL2"+DoubleToString(q2),0,308,0+q2*15+23,CORNER_LEFT_LOWER, "|","Times New Roman",8, Display_Table_Borader_Color);
     }
   for(int q1=0; q1<14; q1++)
     {
      Label(0,"XXFVLq1"+DoubleToString(q1),0,598,0+q1*15+23,CORNER_LEFT_LOWER, "|","Times New Roman",8,  Display_Table_Borader_Color);
     }

   Label(0,"XXtxDC",0,395,205,CORNER_LEFT_LOWER, "Display Card","Times New Roman",14, Display_Table_Text_Color);


   Label(0,"XXtx002",0,325,160,CORNER_LEFT_LOWER, "SIGNAL","Times New Roman",12, Display_Table_Text_Color);

   Label(0,"XXDType",0,490,160,CORNER_LEFT_LOWER, "SIGNAL","Times New Roman",10, Display_Table_vlaue_Color);



   Label(0,"XXtx004",0,325,120,CORNER_LEFT_LOWER, "TimeFrame","Times New Roman",12, Display_Table_Text_Color);

   Label(0,"XXTF_Value",0,490,120,CORNER_LEFT_LOWER, TF_NOW,"Times New Roman",10,Display_Table_vlaue_Color);

   Label(0,"XXtx005",0,325,80,CORNER_LEFT_LOWER, "Candle Confirmation","Times New Roman",10, Display_Table_Text_Color);

   Label(0,"XXCC_Value",0,490,80,CORNER_LEFT_LOWER, "CC_Value","Times New Roman",10,Display_Table_vlaue_Color);

   Label(0,"XXtx006",0,325,40,CORNER_LEFT_LOWER, "Confirmation Break ","Times New Roman",10, Display_Table_Text_Color);

   Label(0,"XXCCB_Value",0,490,40,CORNER_LEFT_LOWER, "CCB_Value","Times New Roman",10,Display_Table_vlaue_Color);
  }


//+------------------------------------------------------------------+
void FibCAl(int k01,int k02,int kind,int cTgh)
  {

   EN2BA=false;
   EN2SA=false;
   bool stest=false;
   bool ftest=true;
   int Shift=0;
   for(int i=cTgh+1; i<cTgh+1+50; i++)
     {
      if(dType[i]<9)
        {
         Shift=i;
         break;
        }
     }
   Shift-=3;

   if(NormalizeDouble(dType[i],1)==2)
     {
      Un_Switch=false;
      Va_Switch=false;
      string sig_B_1="BUY";
      double EnteryPoint_B_1=High[Shift+1]+ Entery_Point_GAP_Lengthy_LONG*10*Point;
      string Pair_B_1=Symbol();
      double stoploss_B_1=Low[Shift+2]+ Stop_Loss_Pips_GAP_Lengthy_LONG  *10*Point;
      double Fib_0_100_B_1=High[Shift+1]-Low[Shift+2];
      double EnteryPoint2_B_1=Low[Shift+2]+Fib_0_100_B_1*Entry_2_Lengthy_LONG *0.01+ Entery2_Point_GAP_Lengthy_LONG*10*Point;
      double tr1_B_1=EnteryPoint_B_1+Fib_0_100_B_1*0.618+   Take_Profit_GAP_161_8_Lengthy_LONG   *10*Point;
      double tr2_B_1=EnteryPoint_B_1+Fib_0_100_B_1*1.618+  Take_Profit_GAP_261_8_Lengthy_LONG*10*Point;
      double tr3_B_1=EnteryPoint_B_1+Fib_0_100_B_1*3.238+   Take_Profit_GAP_423_6_Lengthy_LONG  *10*Point;
      double tr4_B_1=EnteryPoint_B_1+Fib_0_100_B_1*7.47+   Take_Profit_GAP_847_0_Lengthy_LONG  *10*Point;

      if(Show_Graphic_Object)
        {
         ObjectSetText("XXsignal_Value",sig_B_1);
         ObjectSetText("XXDType",sig_B_1);
         ObjectSetText("XXpair_Value",Pair_B_1);
         ObjectSetText("XXentry_Value",DoubleToString(EnteryPoint_B_1,5));
         ObjectSetText("XXstop_Value",DoubleToString(stoploss_B_1,5));
         ObjectSetText("XXtarget1_Value",DoubleToString(tr1_B_1,5));
         ObjectSetText("XXtarget2_Value",DoubleToString(tr2_B_1,5));
         ObjectSetText("XXtarget3_Value",DoubleToString(tr3_B_1,5));
         ObjectSetText("XXentry_Value2",DoubleToString(EnteryPoint2_B_1,5));
        }
      Sig_N=sig_B_1;
      EP_N=EnteryPoint_B_1;
      EP2_N=EnteryPoint2_B_1;
      SL_N=stoploss_B_1;
      tr1_N=tr1_B_1;
      tr2_N=tr2_B_1;
      tr3_N=tr3_B_1;
      tr4_N=tr4_B_1;
      TD_N=Time[Shift+3];
      TD_N=Time[Shift+3];
      if(Show_Graphic_Object)
        {
         ObjectSetText("XXTimeD", TimeToString(TD_N));
        }
     }
   if(NormalizeDouble(dType[i],1)==4)
     {
      Un_Switch=false;
      Va_Switch=false;
      string sig_S_1="SELL";
      double EnteryPoint_S_1=Low[Shift+1]+ Entery_Point_GAP_Lengthy_SHORT *10*Point;
      string Pair_S_1=Symbol();
      ObjectSetText("XXDType",sig_S_1);
      double stoploss_S_1=High[Shift+2]+Stop_Loss_Pips_GAP_Lengthy_SHORT*10*Point;
      double Fib_0_100_S_1=Low[Shift+1]-High[Shift+2];
      double EnteryPoint2_S_1=High[Shift+2]+Fib_0_100_S_1*Entry_2_Lengthy_SHORT*0.01+ Entery2_Point_GAP_Lengthy_SHORT*10*Point;
      double tr1_s_1=EnteryPoint_S_1+Fib_0_100_S_1*0.618+  Take_Profit_GAP_161_8_Lengthy_SHORT *10*Point;
      double tr2_s_1=EnteryPoint_S_1+Fib_0_100_S_1*1.618+  Take_Profit_GAP_261_8_Lengthy_SHORT*10*Point;
      double tr3_s_1=EnteryPoint_S_1+Fib_0_100_S_1*3.238+  Take_Profit_GAP_423_6_Lengthy_SHORT*10*Point;
      double tr4_s_1=EnteryPoint_S_1+Fib_0_100_S_1*7.47+  Take_Profit_GAP_847_0_Lengthy_SHORT*10*Point;
      if(Show_Graphic_Object)
        {
         ObjectSetText("XXsignal_Value",sig_S_1);
         ObjectSetText("XXpair_Value",Pair_S_1);
         ObjectSetText("XXentry_Value",DoubleToString(EnteryPoint_S_1,5));
         ObjectSetText("XXstop_Value",DoubleToString(stoploss_S_1,5));
         ObjectSetText("XXtarget1_Value",DoubleToString(tr1_s_1,5));
         ObjectSetText("XXtarget2_Value",DoubleToString(tr2_s_1,5));
         ObjectSetText("XXtarget3_Value",DoubleToString(tr3_s_1,5));
         ObjectSetText("XXentry_Value2",DoubleToString(EnteryPoint2_S_1,5));
        }
      Sig_N=sig_S_1;
      EP_N=EnteryPoint_S_1;
      EP2_N=EnteryPoint2_S_1;
      SL_N=stoploss_S_1;
      tr1_N=tr1_s_1;
      tr2_N=tr2_s_1;
      tr3_N=tr3_s_1;
      tr4_N=tr4_s_1;
      TD_N=Time[Shift+3];

      if(Show_Graphic_Object)
        {
         ObjectSetText("XXTimeD", TimeToString(TD_N));
        }
     }
   if(NormalizeDouble(dType[i],1)==1)
     {
      Un_Switch=false;
      Va_Switch=false;
      string sig_B="BUY";
      double EnteryPoint_B=High[Shift+1]+ Entery_Point_GAP_LONG*10*Point;
      string Pair_B=Symbol();
      double stoploss_B=Low[Shift+2]+ Stop_Loss_Pips_GAP_LONG *10*Point;
      double Fib_0_100_B=High[Shift+1]-Low[Shift+2];
      double EnteryPoint2_B=Low[Shift+2]+Fib_0_100_B*Entry_2_LONG *0.01+ Entery2_Point_GAP_LONG*10*Point;
      double tr1_B=EnteryPoint_B+Fib_0_100_B*0.618+  Take_Profit_GAP_161_8_LONG *10*Point;
      double tr2_B=EnteryPoint_B+Fib_0_100_B*1.618+  Take_Profit_GAP_261_8_LONG*10*Point;
      double tr3_B=EnteryPoint_B+Fib_0_100_B*3.238+  Take_Profit_GAP_423_6_LONG  *10*Point;
      double tr4_B=EnteryPoint_B+Fib_0_100_B*7.47+  Take_Profit_GAP_847_0_LONG  *10*Point;
      if(Show_Graphic_Object)
        {
         ObjectSetText("XXsignal_Value",sig_B);
         ObjectSetText("XXDType",sig_B);
         ObjectSetText("XXpair_Value",Pair_B);
         ObjectSetText("XXentry_Value",DoubleToString(EnteryPoint_B,5));
         ObjectSetText("XXstop_Value",DoubleToString(stoploss_B,5));
         ObjectSetText("XXtarget1_Value",DoubleToString(tr1_B,5));
         ObjectSetText("XXtarget2_Value",DoubleToString(tr2_B,5));
         ObjectSetText("XXtarget3_Value",DoubleToString(tr3_B,5));
         ObjectSetText("XXentry_Value2",DoubleToString(EnteryPoint2_B,5));
        }
      Sig_N=sig_B;
      EP_N=EnteryPoint_B;
      EP2_N=EnteryPoint2_B;
      SL_N=stoploss_B;
      tr1_N=tr1_B;
      tr2_N=tr2_B;
      tr3_N=tr3_B;
      tr4_N=tr4_B;
      TD_N=Time[Shift+3];
      if(Show_Graphic_Object)
        {
         ObjectSetText("XXTimeD", TimeToString(TD_N));
        }
     }
   if(NormalizeDouble(dType[i],1)==3)
     {
      Un_Switch=false;
      Va_Switch=false;
      string sig_S="SELL";
      double EnteryPoint_S=Low[Shift+1]+ Entery_Point_GAP_SHORT *10*Point;
      string Pair_S=Symbol();
      ObjectSetText("XXDType",sig_S);
      double stoploss_S=High[Shift+2]+Stop_Loss_Pips_GAP_SHORT*10*Point;
      // Comment(stoploss_S);
      double Fib_0_100_S=Low[Shift+1]-High[Shift+2];
      double EnteryPoint2_S=High[Shift+2]+Fib_0_100_S*0.01* Entry_2_SHORT +Entery2_Point_GAP_SHORT *10*Point;
      double tr1_s=EnteryPoint_S+Fib_0_100_S*0.618+ Take_Profit_GAP_161_8_SHORT *10*Point;
      double tr2_s=EnteryPoint_S+Fib_0_100_S*1.618+ Take_Profit_GAP_261_8_SHORT*10*Point;
      double tr3_s=EnteryPoint_S+Fib_0_100_S*3.238+     Take_Profit_GAP_423_6_SHORT*10*Point;
      double tr4_s=EnteryPoint_S+Fib_0_100_S*7.47+     Take_Profit_GAP_847_0_SHORT*10*Point;
      if(Show_Graphic_Object)
        {
         ObjectSetText("XXsignal_Value",sig_S);
         ObjectSetText("XXpair_Value",Pair_S);
         ObjectSetText("XXentry_Value",DoubleToString(EnteryPoint_S,5));
         ObjectSetText("XXstop_Value",DoubleToString(stoploss_S,5));
         ObjectSetText("XXtarget1_Value",DoubleToString(tr1_s,5));
         ObjectSetText("XXtarget2_Value",DoubleToString(tr2_s,5));
         ObjectSetText("XXtarget3_Value",DoubleToString(tr3_s,5));
         ObjectSetText("XXentry_Value2",DoubleToString(EnteryPoint2_S,5));
        }
      Sig_N=sig_S;
      EP_N=EnteryPoint_S;
      EP2_N=EnteryPoint2_S;
      SL_N=stoploss_S;
      tr1_N=tr1_s;
      tr2_N=tr2_s;
      tr3_N=tr3_s;
      tr4_N=tr3_s;
      TD_N=Time[Shift+3];

      if(Show_Graphic_Object)
        {
         ObjectSetText("XXTimeD", TimeToString(TD_N));
        }
     }

   if(NormalizeDouble(dType[i],1)==6)
     {
      Un_Switch=false;
      Va_Switch=false;
      string H_sig_B_1="BUY";
      double H_EnteryPoint_B_1=High[Shift+1]+ H_Entery_Point_GAP_Lengthy_LONG*10*Point;
      string H_Pair_B_1=Symbol();
      double H_stoploss_B_1=Low[Shift+2]+ H_Stop_Loss_Pips_GAP_Lengthy_LONG  *10*Point;
      double H_Fib_0_100_B_1=High[Shift+1]-Low[Shift+2];
      double H_EnteryPoint2_B_1=Low[Shift+2]+H_Fib_0_100_B_1*H_Entry_2_Lengthy_LONG *0.01+ H_Entery2_Point_GAP_Lengthy_LONG*10*Point;
      double H_tr1_B_1=H_EnteryPoint_B_1+H_Fib_0_100_B_1*0.618+   H_Take_Profit_GAP_161_8_Lengthy_LONG   *10*Point;
      double H_tr2_B_1=H_EnteryPoint_B_1+H_Fib_0_100_B_1*1.618+  H_Take_Profit_GAP_261_8_Lengthy_LONG*10*Point;
      double H_tr3_B_1=H_EnteryPoint_B_1+H_Fib_0_100_B_1*3.238+   H_Take_Profit_GAP_423_6_Lengthy_LONG  *10*Point;
      double H_tr4_B_1=H_EnteryPoint_B_1+H_Fib_0_100_B_1*7.47+   H_Take_Profit_GAP_847_0_Lengthy_LONG  *10*Point;

      if(Show_Graphic_Object)
        {
         ObjectSetText("XXsignal_Value",H_sig_B_1);
         ObjectSetText("XXDType",H_sig_B_1);
         ObjectSetText("XXpair_Value",H_Pair_B_1);
         ObjectSetText("XXentry_Value",DoubleToString(H_EnteryPoint_B_1,Digits));
         ObjectSetText("XXstop_Value",DoubleToString(H_stoploss_B_1,Digits));
         ObjectSetText("XXtarget1_Value",DoubleToString(H_tr1_B_1,Digits));
         ObjectSetText("XXtarget2_Value",DoubleToString(H_tr2_B_1,Digits));
         ObjectSetText("XXtarget3_Value",DoubleToString(H_tr3_B_1,Digits));
         ObjectSetText("XXentry_Value2",DoubleToString(H_EnteryPoint2_B_1,Digits));
        }
      Sig_N=H_sig_B_1;
      EP_N=H_EnteryPoint_B_1;
      EP2_N=H_EnteryPoint2_B_1;
      SL_N=H_stoploss_B_1;
      tr1_N=H_tr1_B_1;
      tr2_N=H_tr2_B_1;
      tr3_N=H_tr3_B_1;
      tr4_N=H_tr4_B_1;
      TD_N=Time[Shift+3];
      TD_N=Time[Shift+3];
      if(Show_Graphic_Object)
        {
         ObjectSetText("XXTimeD", TimeToString(TD_N));
        }
     }
   if(NormalizeDouble(dType[i],1)==8)
     {
      Un_Switch=false;
      Va_Switch=false;
      string H_sig_S_1="SELL";
      double H_EnteryPoint_S_1=Low[Shift+1]+ H_Entery_Point_GAP_Lengthy_SHORT *10*Point;
      string H_Pair_S_1=Symbol();
      ObjectSetText("XXDType",H_sig_S_1);
      double H_stoploss_S_1=High[Shift+2]+H_Stop_Loss_Pips_GAP_Lengthy_SHORT*10*Point;
      double H_Fib_0_100_S_1=Low[Shift+1]-High[Shift+2];
      double H_EnteryPoint2_S_1=High[Shift+2]+H_Fib_0_100_S_1*H_Entry_2_Lengthy_SHORT*0.01+ H_Entery2_Point_GAP_Lengthy_SHORT*10*Point;
      double H_tr1_s_1=H_EnteryPoint_S_1+H_Fib_0_100_S_1*0.618+  H_Take_Profit_GAP_161_8_Lengthy_SHORT *10*Point;
      double H_tr2_s_1=H_EnteryPoint_S_1+H_Fib_0_100_S_1*1.618+  H_Take_Profit_GAP_261_8_Lengthy_SHORT*10*Point;
      double H_tr3_s_1=H_EnteryPoint_S_1+H_Fib_0_100_S_1*3.238+  H_Take_Profit_GAP_423_6_Lengthy_SHORT*10*Point;
      double H_tr4_s_1=H_EnteryPoint_S_1+H_Fib_0_100_S_1*7.47+  H_Take_Profit_GAP_847_0_Lengthy_SHORT*10*Point;
      if(Show_Graphic_Object)
        {
         ObjectSetText("XXsignal_Value",H_sig_S_1);
         ObjectSetText("XXpair_Value",H_Pair_S_1);
         ObjectSetText("XXentry_Value",DoubleToString(H_EnteryPoint_S_1,Digits));
         ObjectSetText("XXstop_Value",DoubleToString(H_stoploss_S_1,Digits));
         ObjectSetText("XXtarget1_Value",DoubleToString(H_tr1_s_1,Digits));
         ObjectSetText("XXtarget2_Value",DoubleToString(H_tr2_s_1,Digits));
         ObjectSetText("XXtarget3_Value",DoubleToString(H_tr3_s_1,Digits));
         ObjectSetText("XXentry_Value2",DoubleToString(H_EnteryPoint2_S_1,Digits));
        }
      Sig_N=H_sig_S_1;
      EP_N=H_EnteryPoint_S_1;
      EP2_N=H_EnteryPoint2_S_1;
      SL_N=H_stoploss_S_1;
      tr1_N=H_tr1_s_1;
      tr2_N=H_tr2_s_1;
      tr3_N=H_tr3_s_1;
      tr4_N=H_tr4_s_1;
      TD_N=Time[Shift+3];
     
      if(Show_Graphic_Object)
        {
         ObjectSetText("XXTimeD", TimeToString(TD_N));
        }
     }
   if(NormalizeDouble(dType[i],1)==5)
     {
      Un_Switch=false;
      Va_Switch=false;
      string H_sig_B="BUY";
      double H_EnteryPoint_B=High[Shift+1]+ H_Entery_Point_GAP_LONG*10*Point;
      string H_Pair_B=Symbol();
      double H_stoploss_B=Low[Shift+2]+ H_Stop_Loss_Pips_GAP_LONG *10*Point;
      double H_Fib_0_100_B=High[Shift+1]-Low[Shift+2];
      double H_EnteryPoint2_B=Low[Shift+2]+H_Fib_0_100_B*H_Entry_2_LONG *0.01+ H_Entery2_Point_GAP_LONG*10*Point;
      double H_tr1_B=H_EnteryPoint_B+H_Fib_0_100_B*0.618+  H_Take_Profit_GAP_161_8_LONG *10*Point;
      double H_tr2_B=H_EnteryPoint_B+H_Fib_0_100_B*1.618+  H_Take_Profit_GAP_261_8_LONG*10*Point;
      double H_tr3_B=H_EnteryPoint_B+H_Fib_0_100_B*3.238+  H_Take_Profit_GAP_423_6_LONG  *10*Point;
      double H_tr4_B=H_EnteryPoint_B+H_Fib_0_100_B*7.47+  H_Take_Profit_GAP_847_0_LONG  *10*Point;
      if(Show_Graphic_Object)
        {
         ObjectSetText("XXsignal_Value",H_sig_B);
         ObjectSetText("XXDType",H_sig_B);
         ObjectSetText("XXpair_Value",H_Pair_B);
         ObjectSetText("XXentry_Value",DoubleToString(H_EnteryPoint_B,Digits));
         ObjectSetText("XXstop_Value",DoubleToString(H_stoploss_B,Digits));
         ObjectSetText("XXtarget1_Value",DoubleToString(H_tr1_B,Digits));
         ObjectSetText("XXtarget2_Value",DoubleToString(H_tr2_B,Digits));
         ObjectSetText("XXtarget3_Value",DoubleToString(H_tr3_B,Digits));
         ObjectSetText("XXentry_Value2",DoubleToString(H_EnteryPoint2_B,Digits));
        }
      Sig_N=H_sig_B;
      EP_N=H_EnteryPoint_B;
      EP2_N=H_EnteryPoint2_B;
      SL_N=H_stoploss_B;
      tr1_N=H_tr1_B;
      tr2_N=H_tr2_B;
      tr3_N=H_tr3_B;
      tr4_N=H_tr4_B;
      TD_N=Time[Shift+3];
      if(Show_Graphic_Object)
        {
         ObjectSetText("XXTimeD", TimeToString(TD_N));
        }
     }
   if(NormalizeDouble(dType[i],1)==7)
     {
      Un_Switch=false;
      Va_Switch=false;
      string H_sig_S="SELL";
      double H_EnteryPoint_S=Low[Shift+1]+ H_Entery_Point_GAP_SHORT *10*Point;
      string H_Pair_S=Symbol();
      ObjectSetText("XXDType",H_sig_S);
      double H_stoploss_S=High[Shift+2]+H_Stop_Loss_Pips_GAP_SHORT*10*Point;
      // Comment(stoploss_S);
      double H_Fib_0_100_S=Low[Shift+1]-High[Shift+2];
      double H_EnteryPoint2_S=High[Shift+2]+Fib_0_100_S*0.01* H_Entry_2_SHORT +H_Entery2_Point_GAP_SHORT *10*Point;
      double H_tr1_s=H_EnteryPoint_S+H_Fib_0_100_S*0.618+ H_Take_Profit_GAP_161_8_SHORT *10*Point;
      double H_tr2_s=H_EnteryPoint_S+H_Fib_0_100_S*1.618+ H_Take_Profit_GAP_261_8_SHORT*10*Point;
      double H_tr3_s=H_EnteryPoint_S+H_Fib_0_100_S*3.238+     H_Take_Profit_GAP_423_6_SHORT*10*Point;
      double H_tr4_s=H_EnteryPoint_S+H_Fib_0_100_S*7.47+     H_Take_Profit_GAP_847_0_SHORT*10*Point;
      if(Show_Graphic_Object)
        {
         ObjectSetText("XXsignal_Value",H_sig_S);
         ObjectSetText("XXpair_Value",H_Pair_S);
         ObjectSetText("XXentry_Value",DoubleToString(H_EnteryPoint_S,Digits));
         ObjectSetText("XXstop_Value",DoubleToString(H_stoploss_S,Digits));
         ObjectSetText("XXtarget1_Value",DoubleToString(H_tr1_s,Digits));
         ObjectSetText("XXtarget2_Value",DoubleToString(H_tr2_s,Digits));
         ObjectSetText("XXtarget3_Value",DoubleToString(H_tr3_s,Digits));
         ObjectSetText("XXentry_Value2",DoubleToString(H_EnteryPoint2_S,Digits));
        }
      Sig_N=H_sig_S;
      EP_N=H_EnteryPoint_S;
      EP2_N=H_EnteryPoint2_S;
      SL_N=H_stoploss_S;
      tr1_N=H_tr1_s;
      tr2_N=H_tr2_s;
      tr3_N=H_tr3_s;
      tr4_N=H_tr3_s;
      TD_N=Time[Shift+3];

      if(Show_Graphic_Object)
        {
         ObjectSetText("XXTimeD", TimeToString(TD_N));
        }
     }



   if(Show_Graphic_Object)
     {
      ObjectSet("XXrtl01",OBJPROP_BGCOLOR,Fibbo_Table_color_Box_Neutral);
      ObjectSet("XXrtl02",OBJPROP_BGCOLOR,Fibbo_Table_color_Box_Neutral);
      ObjectSet("XXrtl03",OBJPROP_BGCOLOR,Fibbo_Table_color_Box_Neutral);
      ObjectSet("XXrtl04",OBJPROP_BGCOLOR,Fibbo_Table_color_Box_Neutral);
      ObjectSet("XXrtl05",OBJPROP_BGCOLOR,Fibbo_Table_color_Box_Neutral);
      ObjectSet("XXrtl06",OBJPROP_BGCOLOR,Fibbo_Table_color_Box_Neutral);
     }

  }

void ValidD(int shift)
  {
   if(Va_Switch==false)
     {
  

      V_USE=true;
      Sig_S=Sig_N;
      EP_S=EP_N;
      EP2_S=EP2_N;
      SL_S= SL_N;
      tr1_S=tr1_N;
      tr2_S= tr2_N;
      tr3_S= tr3_N;
      tr4_S=tr4_N;
      TD_S=TD_N;

      if(Show_Graphic_Object)
        {
         CC_STATE=ObjectDescription("XXCC_Value");
         CCB_STATE=ObjectDescription("XXCCB_Value");
         Pattern_Name=ObjectDescription("XXtx01");
        }
      cl_EN_S=cl_EN_N;
      cl_EN2_S=cl_EN2_N;
      cl_SL_S= cl_SL_N;
      cl_TR1_S=cl_TR1_N;
      cl_TR2_S=cl_TR2_N;
      cl_TR3_S=cl_TR3_N;
      DifferenceCal();
      RiskCal();
      if(Show_Graphic_Object)
        {
         r6s=r6n;
         x1s=x1n;
         x6s=x6n;
         f6s=f6n;
         x7s=x7n;
         f7s=f7n;
         x3s=x3n;
         x4s=x4n;
         x5s=x5n;
         Rr6s=Rr6n;
         Rx1s=Rx1n;
         Rx6s=Rx6n;
         Rf6s=Rf6n;
         Rx7s=Rx7n;
         Rf7s=Rf7n;
         Rx3s=Rx3n;
         Rx4s=Rx4n;
         Rx5s=Rx5n;
        }
      int Bshift=0;
      for(int i=shift+1; i<shift+1+50; i++)
        {
         if(dType[i]<9)
           {
            Bshift=i;
            if(dType[i]<5)
               DIV_TYPE="Classic";
            if(dType[i]>4)
               DIV_TYPE="Hidden";
            break;
           }
        }


      dUnvalid[Bshift]=1;
      dEn2 [Bshift]=EP_S;
      dEn1[Bshift]=EP2_S;
      dSL[Bshift]=SL_S;
      dTr4[Bshift]=tr1_S;
      dTr3[Bshift]=tr2_S;
      dTr2[Bshift]=tr3_S;
      dTr1[Bshift]=tr4_S;
      dLot2[Bshift]=lot_En1;
      dLot1[Bshift]=lot_En2;



      string EmsgL1="{";



      string EmsgL2=Jason_DIV_TYPE();
      string EmsgL3=Jason_NAME();
      string EmsgL4=Jason_Symbol();
      string EmsgL5=Jason_Period();
      string EmsgL6=Jason_Mode();
      string EmsgL7=Jason_SL();
      string EmsgL8=Jason_EN1();
      string EmsgL9=Jason_EN1Lot();
      string EmsgL10=Jason_EN2();
      string EmsgL11=Jason_EN2Lot();
      string EmsgL12=Jason_Tr1();
      string EmsgL13=Jason_Tr2();
      string EmsgL14=Jason_Tr3();
      string EmsgL15=Jason_Tr4();
      string EmsgL16=Jason_SE1();
      string EmsgL17=Jason_SE2();;
      string EmsgL18=Jason_T1E1D();
      string EmsgL19=Jason_T1E2D();
      string EmsgL20=Jason_T2E1D();
      string EmsgL21=Jason_T2E2D();
      string EmsgL22=Jason_T3E1D();
      string EmsgL23=Jason_T3E2D();
      string EmsgL24=Jason_T4E1D();
      string EmsgL25=Jason_T4E2D();
      string EmsgL26=Jason_Magic_Number();
      string EmsgL27="}";


      Email_BOX=EmsgL1+"\n"+EmsgL2+"\n"+EmsgL3+"\n"+EmsgL4+"\n"+EmsgL5+"\n"+EmsgL6+"\n"+EmsgL7+"\n"+EmsgL8+"\n"+EmsgL9+"\n"+EmsgL10+"\n"+EmsgL11+"\n"+EmsgL12+"\n"+EmsgL13+"\n"+EmsgL14+"\n"+EmsgL15+"\n"+EmsgL16+"\n"+EmsgL17+"\n"+EmsgL18+"\n"+EmsgL19+"\n"+EmsgL20+"\n"+EmsgL21+"\n"+EmsgL22+"\n"+EmsgL23+"\n"+EmsgL24+"\n"+EmsgL25+"\n"+EmsgL26+"\n"+EmsgL27;
    
     
      string AmsgL1=PN+" "+" "+"("+Symbol()+")"+" "+" "+"("+TF_NOW+")"+" "+" "+" "+" "+"("+Sig_S+")"+" "+" ";

      string AmsgL2="SL:"+" "+DoubleToString(SL_S,MarketInfo(Symbol(),MODE_DIGITS))+" ";

      string AmsgL3="EN1:"+" "+DoubleToString(EP_S,MarketInfo(Symbol(),MODE_DIGITS))+" "+"("+"Lot:"+DoubleToString(lot_En1,2)+" "+")"+" "+" "+"EN2:"+" "+DoubleToString(EP2_S,MarketInfo(Symbol(),MODE_DIGITS))+" "+"("+"Lot:"+DoubleToString(lot_En2,2)+" "+")"+" "+" ";


      string AmsgL4="TP 1: "+DoubleToString(tr1_S,MarketInfo(Symbol(),MODE_DIGITS))+" "+" "+"TP 2: "+DoubleToString(tr2_S,MarketInfo(Symbol(),MODE_DIGITS))+" "+" "+"TP 3: "+DoubleToString(tr3_S,MarketInfo(Symbol(),MODE_DIGITS))+" "+" ";

      string AmsgL5="SL_EN1:"+" "+DoubleToString(SE1D,1)+" "+" "+" "+" "+" "+" "+" "+" "+" "+" "+" "+"SL_EN2:"+" "+DoubleToString(SE2D,1)+" "+" ";

      string AmsgL6="TP1_EN1: "+" "+DoubleToString(T1E1D,1)+" "+" "+" "+" "+" "+" "+" "+" "+"TP1_EN2: "+" "+DoubleToString(T1E2D,1)+" "+" ";

      string AmsgL7="TP2_EN1: "+" "+DoubleToString(T2E1D,1)+" "+" "+" "+" "+" "+" "+" "+" "+"TP2_EN2: "+" "+DoubleToString(T2E2D,1)+" "+" ";

      string AmsgL8="TP3_EN1: "+" "+DoubleToString(T3E1D,1)+" "+" "+" "+" "+" "+" "+" "+" "+"TP3_EN2: "+" "+DoubleToString(T3E2D,1)+" "+" ";
      Alert_BOX=AmsgL1+AmsgL2+AmsgL3+AmsgL4+AmsgL5+AmsgL6+AmsgL7+AmsgL8;
     
      string msgL1=PN;

      string msgL2="NEW SIGNAL";

      string msgL3=Symbol()+" "+" "+"("+TF_NOW+")"+" "+" "+" "+" "+"("+Sig_S+")";


      string msgL4="SL:"+" "+DoubleToString(SL_S,MarketInfo(Symbol(),MODE_DIGITS));

      string msgL5="EN1:"+" "+DoubleToString(EP_S,MarketInfo(Symbol(),MODE_DIGITS))+" "+"("+"Lot:"+DoubleToString(lot_En1,2)+" "+")"+" "+" "+"EN2:"+" "+DoubleToString(EP2_S,MarketInfo(Symbol(),MODE_DIGITS))+" "+"("+"Lot:"+DoubleToString(lot_En2,2)+" "+")";


      string msgL6="TP 1: "+DoubleToString(tr1_S,MarketInfo(Symbol(),MODE_DIGITS))+" "+" "+"TP 2: "+DoubleToString(tr2_S,MarketInfo(Symbol(),MODE_DIGITS))+" "+" "+"TP 3: "+DoubleToString(tr3_S,MarketInfo(Symbol(),MODE_DIGITS));


      Massage_BOX= msgL1+"\n"+msgL2+"\n"+msgL3+"\n"+msgL4+"\n"+msgL5+"\n"+msgL6;


     }

  }

void UnvalidD(int shift)
  {
   if(Un_Switch==false)
     {
      Fib_Switch_Lengthy=false;
      Fib_Switch=false;
      U_USE=true;
      DifferenceCal();
      RiskCal();
      if(dType[Lshift]<9)
         dValid[Lshift]=1;

      if(Show_Graphic_Object)
        {
         ObjectSetText("XXCCB_Value",CC_STATE);
         ObjectSetText("XXtx01", Pattern_Name);
         ObjectSetText("XXCC_Value",CCB_STATE);
         ObjectSetText("XXsignal_Value",Sig_S);
         ObjectSetText("XXDType",Sig_S);
         ObjectSetText("XXentry_Value",EP_S);
         ObjectSetText("XXstop_Value",SL_S);
         ObjectSetText("XXtarget1_Value",tr1_S);
         ObjectSetText("XXtarget2_Value", tr2_S);
         ObjectSetText("XXtarget3_Value", tr3_S);
         ObjectSetText("XXtarget4_Value",tr4_S);
         ObjectSetText("XXentry_Value2", EP2_S);
         ObjectSetText("XXTimeD", TimeToString(TD_S));


         DTL(r6s,x1s,x6s,f6s,x7s,f7s,x3s,x4s,x5s);
         DTL(Rr6s,Rx1s,Rx6s,Rf6s,Rx7s,Rf7s,Rx3s,Rx4s,Rx5s);
        }
     }
  }

int Bullish_Hammer_Detection(int X,int t,int Shift,double BW,double TW)
  {

   int k=0;
   if(!CP_valid_state)
     {
      double Body=MathAbs(Close[Shift+2]-Open[Shift+2]);
      if(Close[Shift+2]>Open[Shift+2])
        {
         if(((High[Shift+2]-Close[Shift+2]))<=TW*Body && ((Open[Shift+2]-Low[Shift+2]))>=BW*Body && Open[Shift+1]<Close[Shift+1])
           {
            if(Show_Graphic_Object)
              {
               TextMaker(X,t,0,Shift+2,"BUH");
               RecMaker(X,t,0,Shift+2);
               ObjectSetText("XXtx01",Symbol()+" - Bullish Hammer");
              }
            PN="Bullish Hammer";
            CP_valid_state=true;


            k=1;
            dCandlePatren[Shift+3]=1;
           }
        }
      else
         if(Close[Shift+2]<Open[Shift+2])
           {

            if(((High[Shift+2]-Open[Shift+2]))<=TW*Body && ((Close[Shift+2]-Low[Shift+2]))>=BW*Body && Open[Shift+1]<Close[Shift+1])
              {
               if(Show_Graphic_Object)
                 {
                  TextMaker(X,t,0,Shift+2,"BUH");
                  RecMaker(X,t,0,Shift+2);
                  ObjectSetText("XXtx01",Symbol()+" - Bullish Hammer");
                 }
               PN="Bullish Hammer";
               CP_valid_state=true;

               k=1;

               dCandlePatren[Shift+3]=1;
              }
           }
     }
   return(k);
  }

int Bullish_Inverted_Hammer_Detection(int X,int t,int Shift,double BW,double TW)
  {
   int k=0;
   if(!CP_valid_state)
     {
      double Body=MathAbs(Close[Shift+2]-Open[Shift+2]);
      if(Close[Shift+2]>Open[Shift+2])
        {

         if(((Open[Shift+2]-Low[Shift+2]))<=BW*Body && ((High[Shift+2]-Close[Shift+2]))>=TW*Body && Open[Shift+1]<Close[Shift+1])
           {
            if(Show_Graphic_Object)
              {
               TextMaker(X,t,0,Shift+2,"BUIH");
               RecMaker(X,t,0,Shift+2);
               ObjectSetText("XXtx01",Symbol()+" - Bullish Inverted Hammer");
              }
            PN="Bullish Inverted Hammer";
            CP_valid_state=true;

            k=1;


            dCandlePatren[Shift+3]=2;
           }
        }
      if(Close[Shift+2]<Open[Shift+2])
        {
         if(((Close[Shift+2]-Low[Shift+2]))<=BW*Body && ((High[Shift+2]-Open[Shift+2]))>=TW*Body && Open[Shift+1]<Close[Shift+1])
           {
            if(Show_Graphic_Object)
              {
               TextMaker(X,t,0,Shift+2,"BUIH");
               RecMaker(X,t,0,Shift+2);
               ObjectSetText("XXtx01",Symbol()+" - Bullish Inverted Hammer");
              }
            PN="Bullish Inverted Hammer";
            CP_valid_state=true;

            k=1;


            dCandlePatren[Shift+3]=2;
           }
        }
     }
   return(k);
  }

int Bearish_Hammer_Detection(int X,int t,int Shift,double BW,double TW)
  {
   int k=0;
   if(!CP_valid_state)
     {
      double Body=MathAbs(Close[Shift+2]-Open[Shift+2]);
      if(Close[Shift+2]>Open[Shift+2])
        {

         if(((Open[Shift+2]-Low[Shift+2]))<=BW*Body && ((High[Shift+2]-Close[Shift+2]))>=TW*Body && Open[Shift+1]>Close[Shift+1])
           {
            if(Show_Graphic_Object)
              {
               TextMaker(X,t,1,Shift+2,"BEH");
               RecMaker(X,t,1,Shift+2);
               ObjectSetText("XXtx01",Symbol()+" - Bearish Hammer");
              }
            PN="Bearish Hammer";

            k=1;
            CP_valid_state=true;


            dCandlePatren[Shift+3]=3;
           }
        }
      if(Close[Shift+2]<Open[Shift+2])
        {

         if(((Close[Shift+2]-Low[Shift+2]))<=BW*Body && ((High[Shift+2]-Open[Shift+2]))>=TW*Body && Open[Shift+1]>Close[Shift+1])
           {
            if(Show_Graphic_Object)
              {
               TextMaker(X,t,1,Shift+2,"BEH");
               RecMaker(X,t,1,Shift+2);
               ObjectSetText("XXtx01",Symbol()+" - Bearish Hammer");
              }
            PN="Bearish Hammer";
            CP_valid_state=true;



            dCandlePatren[Shift+3]=3;

            k=1;
           }
        }
     }
   return(k);
  }

int Bearish_Inverted_Hammer_Detection(int X,int t,int Shift,double BW,double TW)
  {
   int k=0;
   if(!CP_valid_state)
     {
      double Body=MathAbs(Close[Shift+2]-Open[Shift+2]);
      if(Close[Shift+2]>Open[Shift+2])
        {

         if(((High[Shift+2]-Close[Shift+2]))<=TW*Body && ((Open[Shift+2]-Low[Shift+2]))>=BW*Body && Open[Shift+1]>Close[Shift+1])
           {
            if(Show_Graphic_Object)
              {
               TextMaker(X,t,1,Shift+2,"BEIH");
               RecMaker(X,t,1,Shift+2);
               ObjectSetText("XXtx01",Symbol()+" - Bearish Inverted Hammer");
              }
            CP_valid_state=true;
            PN="Bearish Inverted Hammer";

            k=1;


            dCandlePatren[Shift+3]=4;
           }

        }
      if(Close[Shift+2]<Open[Shift+2])
        {
         if(((High[Shift+2]-Open[Shift+2]))<=TW*Body && ((Close[Shift+2]-Low[Shift+2]))>=BW*Body && Open[Shift+1]>Close[Shift+1])
           {
            if(Show_Graphic_Object)
              {
               TextMaker(X,t,1,Shift+2,"BEIH");
               RecMaker(X,t,1,Shift+2);
               ObjectSetText("XXtx01",Symbol()+" - Bearish Inverted Hammer");
              }
            PN="Bearish Inverted Hammer";


            CP_valid_state=true;

            dCandlePatren[Shift+3]=4;
            k=1;
           }

        }
     }
   return(k);

  }


int Bullish_Engulfing_Detection(int X,int t,int Shift,double BW,double TW)
  {
   int k=0;
   if(!CP_valid_state)
     {
      double Body=MathAbs(Close[Shift+2]-Open[Shift+2]);


      if(((Open[Shift+2]-Low[Shift+2]))<=BW*Body && ((High[Shift+2]-Close[Shift+2]))<=TW*Body
         && Open[Shift+3]<Close[Shift+2]  && Open[Shift+2]<Close[Shift+3]&& Open[Shift+2]<Close[Shift+2]&& Open[Shift+3]>Close[Shift+3])
        {
         if(Show_Graphic_Object)
           {
            TextMaker(X,t,0,Shift+2,"BUE");
            RecMaker(X,t,0,Shift+2);

            ObjectSetText("XXtx01",Symbol()+" - Bullish Engulfing");
           }
         PN="Bullish Engulfing";
         k=1;
         CP_valid_state=true;


         dCandlePatren[Shift+3]=5;
        }

     }
   return(k);
  }

int Bearish_Engulfing_Detection(int X,int t,int Shift,double BW,double TW)
  {
   int k=0;
   if(!CP_valid_state)
     {
      double Body=MathAbs(Close[Shift+2]-Open[Shift+2]);


      if(((Close[Shift+2]-Low[Shift+2]))<=BW*Body && ((High[Shift+2]-Open[Shift+2]))<=TW*Body
         && Open[Shift+3]>Close[Shift+2]  && Open[Shift+2]>Close[Shift+3]&& Open[Shift+2]>Close[Shift+2]&& Open[Shift+3]<Close[Shift+3])
        {
         if(Show_Graphic_Object)
           {
            TextMaker(X,t,1,Shift+2,"BEE");
            RecMaker(X,t,1,Shift+2);
            ObjectSetText("XXtx01",Symbol()+" - Bearish Engulfing");
           }
         k=1;
         PN="Bearish Engulfing";
         CP_valid_state=true;



         dCandlePatren[Shift+3]=6;
        }
     }

   return(k);
  }

int Piercing_Candle_Detection(int X,int t,int Shift,double BW,double TW,double Pierce_Percentage)
  {
   int k=0;
   if(!CP_valid_state)
     {
      double Body=MathAbs(Close[Shift+2]-Open[Shift+2]);
      if(((Open[Shift+2]-Low[Shift+2]))<=BW*Body && ((High[Shift+2]-Close[Shift+2]))<=TW*Body
         && Close[Shift+2]>Close[Shift+3]+(Open[Shift+3]-Close[Shift+3])*Pierce_Percentage*0.01 && Close[Shift+2]<=Open[Shift+3]
         && Open[Shift+2]<Close[Shift+2]&& Open[Shift+3]>Close[Shift+3] && Close[Shift+3]>Open[Shift+2])
        {
         if(Show_Graphic_Object)
           {
            TextMaker(X,t,0,Shift+2,"PC");
            RecMaker(X,t,0,Shift+2);

            ObjectSetText("XXtx01",Symbol()+" - Piercing Candle");
           }
         PN="Piercing Candle";
         CP_valid_state=true;

         k=1;

         dCandlePatren[Shift+3]=7;
        }
     }

   return(k);
  }

int Dark_Cloud_Cover_Detection(int X,int t,int Shift,double BW,double TW,double Pierce_Percentage)
  {
   int k=0;
   if(!CP_valid_state)
     {
      double Body=MathAbs(Close[Shift+2]-Open[Shift+2]);
      if(((Close[Shift+2]-Low[Shift+2]))<=BW*Body && ((High[Shift+2]-Open[Shift+2]))<=TW*Body
         && Open[Shift+2]>Close[Shift+2]&& Open[Shift+3]<Close[Shift+3] && Open[Shift+2]>Close[Shift+3] &&
         Close[Shift+2]<Close[Shift+3]-(Close[Shift+3]-Open[Shift+3])*Pierce_Percentage*0.01)
        {
         if(Show_Graphic_Object)
           {
            TextMaker(X,t,1,Shift+2,"DCC");
            RecMaker(X,t,1,Shift+2);
            ObjectSetText("XXtx01",Symbol()+" -Dark Cloud Cover");
           }
         PN="Dark Cloud Cover";
         CP_valid_state=true;


         k=1;
         dCandlePatren[Shift+3]=8;
        }
     }

   return(k);
  }

int Bullish_Sash_Detection(int X,int t,int Shift,double BW)
  {
   int k=0;
   if(!CP_valid_state)
     {
      double Body=MathAbs(Close[Shift+2]-Open[Shift+2]);


      if(((Open[Shift+2]-Low[Shift+2]))<=BW*Body
         && Open[Shift+3]<Close[Shift+2]  && Open[Shift+2]>Close[Shift+3]&& Open[Shift+2]<Close[Shift+2]&& Open[Shift+3]>Close[Shift+3])
        {
         if(Show_Graphic_Object)
           {
            TextMaker(X,t,0,Shift+2,"BUS");
            RecMaker(X,t,0,Shift+2);

            ObjectSetText("XXtx01",Symbol()+" - Bullish Sash");
           }
         PN="Bullish Sash";
         k=1;
         CP_valid_state=true;

         dCandlePatren[Shift+3]=9;
        }
     }

   return(k);
  }

int Bearish_Sash_Detection(int X,int t,int Shift,double TW)
  {
   int k=0;
   if(!CP_valid_state)
     {
      double Body=MathAbs(Close[Shift+2]-Open[Shift+2]);



      if((High[Shift+2]-Open[Shift+2])<=TW*Body
         && Open[Shift+3]>Close[Shift+2]  && Open[Shift+2]<Close[Shift+3]&& Open[Shift+2]>Close[Shift+2]&& Open[Shift+3]<Close[Shift+3])
        {
         if(Show_Graphic_Object)
           {
            TextMaker(X,t,1,Shift+2,"BES");
            RecMaker(X,t,1,Shift+2);
            ObjectSetText("XXtx01",Symbol()+" - Bearish Sash");
           }
         k=1;
         PN="Bearish Sash";
         CP_valid_state=true;

         dCandlePatren[Shift+3]=10;
        }

     }
   return(k);
  }

int Morning_Star_Detection(int X,int t,int Shift,double BW,double TW,double Candle_3_Body_Size_Minimum,double Candle_1_Body_Size_Minimum,double Candle_2_Body_Size_Maximum)
  {
   int k=0;
   if(!CP_valid_state)
     {
      double Body1=MathAbs(Close[Shift+1]-Open[Shift+1]);
      double Body2=MathAbs(Close[Shift+2]-Open[Shift+2]);
      double Body3=MathAbs(Close[Shift+3]-Open[Shift+3]);


      if((High[Shift+2]-MathMax(Open[Shift+2],Close[Shift+2]))<=TW*Body2 && (MathMin(Open[Shift+2],Close[Shift+2])-Low[Shift+2])<=BW*Body2
         && (Body1>=Body3*Candle_3_Body_Size_Minimum) &&  Body3>=Body2*Candle_1_Body_Size_Minimum   &&
         Body2<=Body3*Candle_2_Body_Size_Maximum  && Open[Shift+1]<Close[Shift+1]&& Open[Shift+3]>Close[Shift+3] && Open[Shift+1]>MathMin(Open[Shift+2],Close[Shift+2]))
        {

         if(Show_Graphic_Object)
           {
            TextMaker(X,t,0,Shift+2,"MS");
            RecMaker(X,t,0,Shift+2);
            ObjectSetText("XXtx01",Symbol()+" - Morning Star");
           }
         k=1;
         PN=" Morning Star";
         CP_valid_state=true;
         dCandlePatren[Shift+3]=11;
        }
     }

   return(k);
  }

int Evening_Star_Detection(int X,int t,int Shift,double BW,double TW,double Candle_3_Body_Size_Minimum,double Candle_1_Body_Size_Minimum,double Candle_2_Body_Size_Maximum)
  {
   int k=0;
   if(!CP_valid_state)
     {
      double Body1=MathAbs(Close[Shift+1]-Open[Shift+1]);
      double Body2=MathAbs(Close[Shift+2]-Open[Shift+2]);
      double Body3=MathAbs(Close[Shift+3]-Open[Shift+3]);


      if((High[Shift+2]-MathMax(Open[Shift+2],Close[Shift+2]))<=TW*Body2 && (MathMin(Open[Shift+2],Close[Shift+2])-Low[Shift+2])<=BW*Body2
         && (Body1>=Body3*Candle_3_Body_Size_Minimum)  &&  Body3>=Body2*Candle_1_Body_Size_Minimum  &&
         Body2<=Body3*Candle_2_Body_Size_Maximum &&  Open[Shift+1]>Close[Shift+1]&& Open[Shift+3]<Close[Shift+3] && Open[Shift+1]<MathMax(Open[Shift+2],Close[Shift+2]))
        {
         if(Show_Graphic_Object)
           {
            TextMaker(X,t,1,Shift+2,"ES");
            RecMaker(X,t,1,Shift+2);
            ObjectSetText("XXtx01",Symbol()+" - Evening Star");
           }
         k=1;
         PN=" Evening Star";
         CP_valid_state=true;

         dCandlePatren[Shift+3]=12;
        }

     }
   return(k);
  }

void Dive_Delete(int q1,int q2,int i)
  {
   if(Show_Graphic_Object)
     {

      MegaDelete2(i+2);
      MegaDelete3(i+2);
      MegaDelete4(i+2);
      MegaDelete(i+3);
     }
   last_dive_deleted=true;

   UnvalidD(i);


  }




void Fibbreach(int Shift)
  {

   if(ObjectDescription("XXsignal_Value")=="BUY")
     {

      
      color tr3color_gB=ObjectGet("XXrtl06",OBJPROP_BGCOLOR);
      if(tr3color_gB!=Fibbo_Table_color_Box_Take_Profit)
        {

         double En_gB=StringToDouble(ObjectDescription("XXentry_Value"));
         color Encolor_gB=ObjectGet("XXrtl01",OBJPROP_BGCOLOR);
         if((Open[Shift]>=En_gB || High[Shift]>=En_gB || Close[Shift]>=En_gB || Low[Shift]>=En_gB) &&(Encolor_gB!=Fibbo_Table_color_Box_Entry))
            ObjectSet("XXrtl01",OBJPROP_BGCOLOR,Fibbo_Table_color_Box_Entry);
         if(Encolor_gB==Fibbo_Table_color_Box_Entry)
           {
            double sl_gB=StringToDouble(ObjectDescription("XXstop_Value"));
            if(Open[Shift]<=sl_gB || High[Shift]<=sl_gB || Close[Shift]<=sl_gB || Low[Shift]<=sl_gB)
               ObjectSet("XXrtl03",OBJPROP_BGCOLOR,Fibbo_Table_color_Box_Stop_Loss);
            color SLcolor_gB=ObjectGet("XXrtl03",OBJPROP_BGCOLOR);
            if(SLcolor_gB!=Fibbo_Table_color_Box_Stop_Loss)
              {
               double En2_gB=StringToDouble(ObjectDescription("XXentry_Value2"));
               if((Open[Shift]<=En2_gB || High[Shift]<=En2_gB || Close[Shift]<=En2_gB || Low[Shift]<=En2_gB) && (Close[Shift]<En_gB))
                  EN2BA=true;
               if((Open[Shift]>=En2_gB || High[Shift]>=En2_gB || Close[Shift]>=En2_gB || Low[Shift]>=En2_gB) && (Close[Shift]<En_gB)&& EN2BA)
                  ObjectSet("XXrtl02",OBJPROP_BGCOLOR,Fibbo_Table_color_Box_Entry);
               double tr1_gB=StringToDouble(ObjectDescription("XXtarget1_Value"));
               if(Open[Shift]>=tr1_gB || High[Shift]>=tr1_gB || Close[Shift]>=tr1_gB || Low[Shift]>=tr1_gB)
                  ObjectSet("XXrtl04",OBJPROP_BGCOLOR,Fibbo_Table_color_Box_Take_Profit);
               double tr2_gB=StringToDouble(ObjectDescription("XXtarget2_Value"));
               if(Open[Shift]>=tr2_gB || High[Shift]>=tr2_gB || Close[Shift]>=tr2_gB || Low[Shift]>=tr2_gB)
                  ObjectSet("XXrtl05",OBJPROP_BGCOLOR,Fibbo_Table_color_Box_Take_Profit);
               double tr3_gB=StringToDouble(ObjectDescription("XXtarget3_Value"));
               if(Open[Shift]>=tr3_gB || High[Shift]>=tr3_gB || Close[Shift]>=tr3_gB || Low[Shift]>=tr3_gB)
                  ObjectSet("XXrtl06",OBJPROP_BGCOLOR,Fibbo_Table_color_Box_Take_Profit);
              }
           }

         cl_EN_N= ObjectGet("XXrtl01",OBJPROP_BGCOLOR);
         cl_EN2_N=ObjectGet("XXrtl02",OBJPROP_BGCOLOR);
         cl_SL_N= ObjectGet("XXrtl03",OBJPROP_BGCOLOR);
         cl_TR1_N=ObjectGet("XXrtl04",OBJPROP_BGCOLOR);
         cl_TR2_N=ObjectGet("XXrtl05",OBJPROP_BGCOLOR);
         cl_TR3_N=ObjectGet("XXrtl06",OBJPROP_BGCOLOR);
        }
     }

   if(ObjectDescription("XXsignal_Value")=="SELL")
     {
      color tr3color_gS=ObjectGet("XXrtl06",OBJPROP_BGCOLOR);
      if(tr3color_gS!=Fibbo_Table_color_Box_Take_Profit)
        {
         color Encolor_gS=ObjectGet("XXrtl01",OBJPROP_BGCOLOR);
         double En_gS=StringToDouble(ObjectDescription("XXentry_Value"));
         if((Open[Shift]<= En_gS || High[Shift]<= En_gS || Close[Shift]<= En_gS || Low[Shift]<= En_gS)&&(Encolor_gS!=Fibbo_Table_color_Box_Entry))
            ObjectSet("XXrtl01",OBJPROP_BGCOLOR,Fibbo_Table_color_Box_Entry);
         if(Encolor_gS==Fibbo_Table_color_Box_Entry)
           {
            double sl_gS=StringToDouble(ObjectDescription("XXstop_Value"));
            if(Open[Shift]>=sl_gS || High[Shift]>=sl_gS || Close[Shift]>=sl_gS || Low[Shift]>=sl_gS)
               ObjectSet("XXrtl03",OBJPROP_BGCOLOR,Fibbo_Table_color_Box_Stop_Loss);
            color SLcolor_gS=ObjectGet("XXrtl03",OBJPROP_BGCOLOR);
            if(SLcolor_gS!=Fibbo_Table_color_Box_Stop_Loss)
              {
               double En2_gS=StringToDouble(ObjectDescription("XXentry_Value2"));
               if((Open[Shift]>= En2_gS || High[Shift]>= En2_gS || Close[Shift]>= En2_gS || Low[Shift]>= En2_gS) &&(Close[Shift]> En_gS))
                  EN2SA=true;
               if((Open[Shift]<= En2_gS || High[Shift]<= En2_gS || Close[Shift]<= En2_gS || Low[Shift]<= En2_gS) &&(Close[Shift]> En_gS) &&  EN2SA)
                  ObjectSet("XXrtl02",OBJPROP_BGCOLOR,Fibbo_Table_color_Box_Entry);
               double tr1_gS=StringToDouble(ObjectDescription("XXtarget1_Value"));
               if(Open[Shift]<=tr1_gS || High[Shift]<=tr1_gS || Close[Shift]<=tr1_gS || Low[Shift]<=tr1_gS)
                  ObjectSet("XXrtl04",OBJPROP_BGCOLOR,Fibbo_Table_color_Box_Take_Profit);
               double tr2_gS=StringToDouble(ObjectDescription("XXtarget2_Value"));
               if(Open[Shift]<=tr2_gS || High[Shift]<=tr2_gS || Close[Shift]<=tr2_gS || Low[Shift]<=tr2_gS)
                  ObjectSet("XXrtl05",OBJPROP_BGCOLOR,Fibbo_Table_color_Box_Take_Profit);
               double tr3_gS=StringToDouble(ObjectDescription("XXtarget3_Value"));
               if(Open[Shift]<=tr3_gS || High[Shift]<=tr3_gS || Close[Shift]<=tr3_gS || Low[Shift]<=tr3_gS)
                  ObjectSet("XXrtl06",OBJPROP_BGCOLOR,Fibbo_Table_color_Box_Take_Profit);
              }
           }
         cl_EN_N= ObjectGet("XXrtl01",OBJPROP_BGCOLOR);
         cl_EN2_N=ObjectGet("XXrtl02",OBJPROP_BGCOLOR);
         cl_SL_N= ObjectGet("XXrtl03",OBJPROP_BGCOLOR);
         cl_TR1_N=ObjectGet("XXrtl04",OBJPROP_BGCOLOR);
         cl_TR2_N=ObjectGet("XXrtl05",OBJPROP_BGCOLOR);
         cl_TR3_N=ObjectGet("XXrtl06",OBJPROP_BGCOLOR);
        }
     }
  }


void Dir_BU_div_incomp_del(int cTgh)
  {
   CCB_valid_state=false;
   int m=0;
   for(int i=cTgh+1; i<cTgh+1+50; i++)
     {
      if(dType[i]==1)
        {
         m=i;

         break;
        }
     }

   if(Dir_BU_div_del_trig)
     {
      if(Show_Graphic_Object)
        {
         MegaDelete(m);
         MegaDelete2(m-1);
         MegaDelete3(m-1);

         MegaDelete4(m-1);
        }
      last_dive_deleted=true;
     }
   Dir_BU_div_del_trig=false;

   Dir_BU_div_CCB_trig=false;
   ;
   UnvalidD(cTgh);





  }

void H_Dir_BU_div_incomp_del(int cTgh)
  {
   CCB_valid_state=false;
   int m=0;
   for(int i=cTgh+1; i<cTgh+1+50; i++)
     {
      if(dType[i]==5)
        {
         m=i;

         break;
        }
     }

   if(H_Dir_BU_div_del_trig)
     {
      if(Show_Graphic_Object)
        {
         MegaDelete(m);
         MegaDelete2(m-1);
         MegaDelete3(m-1);

         MegaDelete4(m-1);
        }
      last_dive_deleted=true;
     }
   H_Dir_BU_div_del_trig=false;

   H_Dir_BU_div_CCB_trig=false;
   ;
   UnvalidD(cTgh);





  }

void Dir_BE_div_incomp_del(int cTgh)
  {



   CCB_valid_state=false;
   int m=0;
   for(int i=cTgh+2; i<cTgh+1+50; i++)
     {
      if(dType[i]==3)
        {
         m=i;
         break;
        }
     }

   Dir_BE_div_CCB_trig=false;
   if(Dir_BE_div_del_trig)
     {
      if(Show_Graphic_Object)
        {
         MegaDelete(m);
         MegaDelete2(m-1);
         MegaDelete3(m-1);

         MegaDelete4(m-1);
        }
      last_dive_deleted=true;
     }
   Dir_BE_div_del_trig=false;

   Dir_BE_div_CCB_trig=false;
   UnvalidD(cTgh);


  }


void H_Dir_BE_div_incomp_del(int cTgh)
  {



   CCB_valid_state=false;
   int m=0;
   for(int i=cTgh+2; i<cTgh+1+50; i++)
     {
      if(dType[i]==7)
        {
         m=i;
         break;
        }
     }

   H_Dir_BE_div_CCB_trig=false;
   if(H_Dir_BE_div_del_trig)
     {
      if(Show_Graphic_Object)
        {
         MegaDelete(m);
         MegaDelete2(m-1);
         MegaDelete3(m-1);

         MegaDelete4(m-1);
        }
      last_dive_deleted=true;
     }
   H_Dir_BE_div_del_trig=false;

   H_Dir_BE_div_CCB_trig=false;
   UnvalidD(cTgh);


  }


void Long_BU_div_incomp_del(int cTgh)
  {

   CCB_valid_state=false;
   Long_BU_div_CCB_trig=false;


   int m=0;
   for(int i=cTgh+1; i<cTgh+1+50; i++)
     {
      if(dType[i]==2)
        {
         m=i;
         break;
        }
     }

   Long_BU_div_CCB_trig=false;
   if(Long_BU_div_del_trig)
     {
      if(Show_Graphic_Object)
        {
         MegaDelete(m);
         MegaDelete2(m-1);
         MegaDelete3(m-1);
         MegaDelete4(m-1);
        }
      last_dive_deleted=true;
     }
   Long_BU_div_del_trig=false;
   UnvalidD(cTgh);



  }

void H_Long_BU_div_incomp_del(int cTgh)
  {

   CCB_valid_state=false;
   H_Long_BU_div_CCB_trig=false;


   int m=0;
   for(int i=cTgh+1; i<cTgh+1+50; i++)
     {
      if(dType[i]==6)
        {
         m=i;
         break;
        }
     }

   H_Long_BU_div_CCB_trig=false;
   if(H_Long_BU_div_del_trig)
     {
      if(Show_Graphic_Object)
        {
         MegaDelete(m);
         MegaDelete2(m-1);
         MegaDelete3(m-1);
         MegaDelete4(m-1);
        }
      last_dive_deleted=true;
     }
   H_Long_BU_div_del_trig=false;
   UnvalidD(cTgh);



  }

void Long_BE_div_incomp_del(int cTgh)
  {

   int m=0;
   for(int i=cTgh+1; i<cTgh+1+50; i++)
     {
      if(dType[i]==4)
        {
         m=i;
         break;
        }
     }
   CCB_valid_state=false;
   Long_BE_div_CCB_trig=false;
   Long_BE_div_CC_trig=false;
   if(Long_BE_div_del_trig)
     {
      if(Show_Graphic_Object)
        {
         MegaDelete(m);
         MegaDelete2(m-1);
         MegaDelete3(m-1);
         MegaDelete4(m-1);
        }
      last_dive_deleted=true;

     }
   Long_BE_div_del_trig=false;

   UnvalidD(cTgh);
  }

void H_Long_BE_div_incomp_del(int cTgh)
  {

   int m=0;
   for(int i=cTgh+1; i<cTgh+1+50; i++)
     {
      if(dType[i]==8)
        {
         m=i;
         break;
        }
     }
   CCB_valid_state=false;
   H_Long_BE_div_CCB_trig=false;
   H_Long_BE_div_CC_trig=false;
   if(H_Long_BE_div_del_trig)
     {
      if(Show_Graphic_Object)
        {
         MegaDelete(m);
         MegaDelete2(m-1);
         MegaDelete3(m-1);
         MegaDelete4(m-1);
        }
      last_dive_deleted=true;

     }
   H_Long_BE_div_del_trig=false;

   UnvalidD(cTgh);
  }

bool IsnewcandleM(int i)
  {
   static datetime SCTM;
   if(Time[i]==SCTM)
      return false;
   else
      SCTM=Time[i];
   return true;
  }

bool IsnewcandleCC(int i)
  {
   static datetime SCTCC;
   if(Time[i]==SCTCC)
      return false;
   else
      SCTCC=Time[i];
   return true;
  }


bool IsnewcandleDM(int i)
  {
   static datetime SCTDM;
   if(Time[i]==SCTDM)
      return false;
   else
      SCTDM=Time[i];
   return true;
  }

bool IsnewcandleCCB(int i)
  {
   static datetime SCTCCB;
   if(Time[i]==SCTCCB)
      return false;
   else
      SCTCCB=Time[i];
   return true;
  }


bool Button(const long                    chart_ID=0,
            const string            name="Button",
            const int               sub_window=0,
            const int               x=0,
            const int               y=0,
            const int               width=50,
            const int               height=18,
            const ENUM_BASE_CORNER  corner=CORNER_LEFT_LOWER,
            const string            text="Button",
            const string            font="Arial",
            const int               font_size=10,
            const color             clr=clrBlack,
            const color             back_clr=C'236,233,216',
            const color             border_clr=clrNONE,
            const bool              state=false,
            const bool              back=false,
            const bool              selection=false,
            const bool              hidden=true,
            const long              z_order=0)
  {
   ResetLastError();
   if(ObjectCreate(chart_ID,name,OBJ_BUTTON,sub_window,0,0))
     {
      ObjectSetInteger(chart_ID,name,OBJPROP_XDISTANCE,x);
      ObjectSetInteger(chart_ID,name,OBJPROP_YDISTANCE,y);
      ObjectSetInteger(chart_ID,name,OBJPROP_XSIZE,width);
      ObjectSetInteger(chart_ID,name,OBJPROP_YSIZE,height);
      ObjectSetInteger(chart_ID,name,OBJPROP_CORNER,corner);
      ObjectSetString(chart_ID,name,OBJPROP_TEXT,text);
      ObjectSetString(chart_ID,name,OBJPROP_FONT,font);
      ObjectSetInteger(chart_ID,name,OBJPROP_FONTSIZE,font_size);
      ObjectSetInteger(chart_ID,name,OBJPROP_COLOR,clr);
      ObjectSetInteger(chart_ID,name,OBJPROP_BGCOLOR,back_clr);
      ObjectSetInteger(chart_ID,name,OBJPROP_BORDER_COLOR,border_clr);
      ObjectSetInteger(chart_ID,name,OBJPROP_BACK,back);
      ObjectSetInteger(chart_ID,name,OBJPROP_STATE,state);
      ObjectSetInteger(chart_ID,name,OBJPROP_SELECTABLE,selection);
      ObjectSetInteger(chart_ID,name,OBJPROP_SELECTED,selection);
      ObjectSetInteger(chart_ID,name,OBJPROP_HIDDEN,hidden);
      ObjectSetInteger(chart_ID,name,OBJPROP_ZORDER,z_order);
      ChartRedraw();
      return(true);
     }
   else
     {
      Print(__FUNCTION__,
            ": failed to create => ",name," object! Error code = ",GetLastError());
      return(false);
     }
  }

void DifferenceTable()
  {
   if(Difference_Table_BackGround_Color!=clrNONE)
     {
      ObjectCreate("XXrtl3",OBJ_RECTANGLE_LABEL,0,0,0);
      ObjectSet("XXrtl3",OBJPROP_CORNER,CORNER_LEFT_LOWER);
      ObjectSet("XXrtl3",OBJPROP_XDISTANCE,600);
      ObjectSet("XXrtl3",OBJPROP_YDISTANCE,220);
      ObjectSet("XXrtl3",OBJPROP_XSIZE,308);
      ObjectSet("XXrtl3",OBJPROP_YSIZE,220);
      ObjectSet("XXrtl3",OBJPROP_BORDER_TYPE,BORDER_FLAT);
      ObjectSet("XXrtl3",OBJPROP_COLOR,Difference_Table_BackGround_Color);
      ObjectSet("XXrtl3",OBJPROP_BGCOLOR,Difference_Table_BackGround_Color);
      ObjectSetInteger(0,"XXrtl3",OBJPROP_BACK,false);
      ObjectSetInteger(0,"XXrtl3",OBJPROP_HIDDEN,false);
      ObjectSetInteger(0,"XXrtl3",OBJPROP_BACK,false);
     }
   for(int i1=0; i1<30; i1++)
     {

      Label(0,"XXHDL0"+DoubleToString(i1+101)+"L",0,i1*10+10+600-5,228,CORNER_LEFT_LOWER, "_","Times New Roman",8, Difference_Table_Borader_Color);
     }
   for(int i2=0; i2<30; i2++)
     {
      Label(0,"XXHDL1"+DoubleToString(i2+101)+"L",0,i2*10+10+600-5,185,CORNER_LEFT_LOWER, "_","Times New Roman",8, Difference_Table_Borader_Color);
     }
   for(int i3=0; i3<30; i3++)
     {
      Label(0,"XXHDL2"+DoubleToString(i3+101)+"L",0,i3*10+10+600-5,145,CORNER_LEFT_LOWER, "_","Times New Roman",8,Difference_Table_Borader_Color);
     }
   for(int i4=0; i4<30; i4++)
     {
      Label(0,"XXHDL3"+DoubleToString(i4+101)+"L",0,i4*10+10+600-5,105,CORNER_LEFT_LOWER, "_","Times New Roman",8,Difference_Table_Borader_Color);
     }
   for(int i5=0; i5<30; i5++)
     {
      Label(0,"XXHDL4"+DoubleToString(i5+101)+"L",0,i5*10+10+600-5,65,CORNER_LEFT_LOWER, "_","Times New Roman",8,Difference_Table_Borader_Color);
     }
   for(int i6=0; i6<30; i6++)
     {
      Label(0,"XXHDL5"+DoubleToString(i6+101)+"L",0,i6*10+10+600-5,22,CORNER_LEFT_LOWER, "_","Times New Roman",8, Difference_Table_Borader_Color);
     }


   for(int q1=0; q1<14; q1++)
     {
      Label(0,"XXFVLD1"+DoubleToString(q1),0,905,0+q1*15+23,CORNER_LEFT_LOWER, "|","Times New Roman",8, Difference_Table_Borader_Color);
     }
   for(int q2=0; q2<14; q2++)
     {
      Label(0,"XXFVLq1"+DoubleToString(q2),0,598,0+q2*15+23,CORNER_LEFT_LOWER, "|","Times New Roman",8, Difference_Table_Borader_Color);
     }
   Label(0,"XXtx801",0,695,205,CORNER_LEFT_LOWER,"Difference Table","Times New Roman",14, Difference_Table_Text_Color);


   Label(0,"XXtx802",0,625,160,CORNER_LEFT_LOWER, "SL_EN 1","Times New Roman",10, Difference_Table_Text_Color);

   Label(0,"XXSE1diff",0,690,160,CORNER_LEFT_LOWER, "SE 1","Times New Roman",10,Difference_Table_vlaue_Color);


   Label(0,"XXtx803",0,770,160,CORNER_LEFT_LOWER, "SL_EN 2","Times New Roman",10, Difference_Table_Text_Color);

   Label(0,"XXSE2diff",0,835,160,CORNER_LEFT_LOWER, "SE 2","Times New Roman",10,Difference_Table_vlaue_Color);

   Label(0,"XXtx804",0,625,120,CORNER_LEFT_LOWER, "TP 1_EN 1","Times New Roman",10, Difference_Table_Text_Color);

   Label(0,"XXT1E1diff",0,690,120,CORNER_LEFT_LOWER, "T 1E 1","Times New Roman",10,Difference_Table_vlaue_Color);

   Label(0,"XXtx805",0,770,120,CORNER_LEFT_LOWER,"TP 1_EN 2","Times New Roman",10, Difference_Table_Text_Color);

   Label(0,"XXT1E2diff",0,835,120,CORNER_LEFT_LOWER, "T 1E 2","Times New Roman",10,Difference_Table_vlaue_Color);

   Label(0,"XXtx806",0,625,80,CORNER_LEFT_LOWER, "TP 2_EN 1","Times New Roman",10,Difference_Table_Text_Color);

   Label(0,"XXT2E1diff",0,690,80,CORNER_LEFT_LOWER, "T 2E 1","Times New Roman",10,Difference_Table_vlaue_Color);

   Label(0,"XXtx807",0,770,80,CORNER_LEFT_LOWER,"TP 2_EN 2","Times New Roman",10, Difference_Table_Text_Color);

   Label(0,"XXT2E2diff",0,835,80,CORNER_LEFT_LOWER, "T 2E 2","Times New Roman",10,Difference_Table_vlaue_Color);


   Label(0,"XXtx808",0,625,40,CORNER_LEFT_LOWER, "TP 3_EN 1","Times New Roman",10,Difference_Table_Text_Color);

   Label(0,"XXT3E1diff",0,690,40,CORNER_LEFT_LOWER, "T 3E 1","Times New Roman",10,Difference_Table_vlaue_Color);

   Label(0,"XXtx809",0,770,40,CORNER_LEFT_LOWER,"TP 3_EN 2","Times New Roman",10,Difference_Table_Text_Color);

   Label(0,"XXT3E2diff",0,835,40,CORNER_LEFT_LOWER, "T 3E 2","Times New Roman",10, Difference_Table_vlaue_Color);
  }

void RiskTable()
  {
   if(Risk_Table_BackGround_Color!=clrNONE)
     {
      ObjectCreate("XXrtl4",OBJ_RECTANGLE_LABEL,0,0,0);
      ObjectSet("XXrtl4",OBJPROP_CORNER,CORNER_LEFT_LOWER);
      ObjectSet("XXrtl4",OBJPROP_XDISTANCE,908);
      ObjectSet("XXrtl4",OBJPROP_YDISTANCE,220);
      ObjectSet("XXrtl4",OBJPROP_XSIZE,227);
      ObjectSet("XXrtl4",OBJPROP_YSIZE,220);
      ObjectSet("XXrtl4",OBJPROP_BORDER_TYPE,BORDER_FLAT);
      ObjectSet("XXrtl4",OBJPROP_COLOR,Risk_Table_BackGround_Color);
      ObjectSet("XXrtl4",OBJPROP_BGCOLOR,Risk_Table_BackGround_Color);
      ObjectSetInteger(0,"XXrtl4",OBJPROP_BACK,false);
      ObjectSetInteger(0,"XXrtl4",OBJPROP_HIDDEN,false);
      ObjectSetInteger(0,"XXrtl4",OBJPROP_BACK,false);
     }
   for(int j1=0; j1<22; j1++)
     {
      Label(0,"XXHLR0"+DoubleToString(j1+101)+"L",0,j1*10+900,228,CORNER_LEFT_LOWER, "_","Times New Roman",8,Risk_Table_Borader_Color);
     }
   for(int i2=0; i2<22; i2++)
     {
      Label(0,"XXHLR1"+DoubleToString(i2+101)+"L",0,i2*10+900,185,CORNER_LEFT_LOWER, "_","Times New Roman",8, Risk_Table_Borader_Color);
     }
   for(int i3=0; i3<22; i3++)
     {
      Label(0,"XXHLR2"+DoubleToString(i3+101)+"L",0,i3*10+900,145,CORNER_LEFT_LOWER, "_","Times New Roman",8, Risk_Table_Borader_Color);
     }
   for(int i4=0; i4<22; i4++)
     {
      Label(0,"XXHLR3"+DoubleToString(i4+101)+"L",0,i4*10+900,105,CORNER_LEFT_LOWER, "_","Times New Roman",8, Risk_Table_Borader_Color);
     }
   for(int i5=0; i5<22; i5++)
     {
      Label(0,"XXHLR4"+DoubleToString(i5+101)+"L",0,i5*10+900,65,CORNER_LEFT_LOWER, "_","Times New Roman",8,Risk_Table_Borader_Color);
     }
   for(int i6=0; i6<22; i6++)
     {
      Label(0,"XXHLR5"+DoubleToString(i6+101)+"L",0,i6*10+900,22,CORNER_LEFT_LOWER, "_","Times New Roman",8, Risk_Table_Borader_Color);
     }

   for(int q2=0; q2<14; q2++)
     {
      Label(0,"XXFVLD1"+DoubleToString(q2),0,905,0+q2*15+23,CORNER_LEFT_LOWER, "|","Times New Roman",8, Risk_Table_Borader_Color);
     }
   for(int q3=0; q3<14; q3++)
     {
      Label(0,"XXFVLD3"+DoubleToString(q3),0,1115,0+q3*15+23,CORNER_LEFT_LOWER, "|","Times New Roman",8, Risk_Table_Borader_Color);
     }
   Label(0,"XXtx601",0,995,205,CORNER_LEFT_LOWER, "Risk","Times New Roman",14, Risk_Table_Text_Color);


   Label(0,"XXtx602",0,925,160,CORNER_LEFT_LOWER, "Entry 1 Risk Amount","Times New Roman",10, Risk_Table_Text_Color);

   Label(0,"XXE1R$",0,1070,160,CORNER_LEFT_LOWER, "En1R$","Times New Roman",10, Risk_Table_vlaue_Color);



   Label(0,"XXtx604",0,925,120,CORNER_LEFT_LOWER, "Entry 1 Lot","Times New Roman",10,Risk_Table_Text_Color);

   Label(0,"XXE1lot",0,1070,120,CORNER_LEFT_LOWER, "En 1lot","Times New Roman",10, Risk_Table_vlaue_Color);

   Label(0,"XXtx605",0,925,80,CORNER_LEFT_LOWER, "Entry 2 Risk Amount","Times New Roman",10, Risk_Table_Text_Color);

   Label(0,"XXE2R$",0,1070,80,CORNER_LEFT_LOWER, "En 2R$","Times New Roman",10, Risk_Table_vlaue_Color);

   Label(0,"XXtx606",0,925,40,CORNER_LEFT_LOWER,"Entry 2 Lot","Times New Roman",10, Risk_Table_Text_Color);

   Label(0,"XXE2lot",0,1070,40,CORNER_LEFT_LOWER, "En2lot","Times New Roman",10, Risk_Table_vlaue_Color);
  }

void DifferenceCal()//this function calculate diffence betwenn Entry,stoploss and other
  {
   SE1D=MathAbs(((SL_S-EP_S)/Point)/10);
   SE2D=MathAbs(((SL_S-EP2_S)/Point)/10);
   T1E1D=MathAbs(((tr1_S-EP_S)/Point)/10);
   T1E2D=MathAbs(((tr1_S-EP2_S)/Point)/10);
   T2E1D=MathAbs(((tr2_S-EP_S)/Point)/10);
   T2E2D=MathAbs(((tr2_S-EP2_S)/Point)/10);
   T3E1D=MathAbs(((tr3_S-EP_S)/Point)/10);
   T3E2D=MathAbs(((tr3_S-EP2_S)/Point)/10);
   T4E1D=MathAbs(((tr4_S-EP_S)/Point)/10);
   T4E2D=MathAbs(((tr4_S-EP2_S)/Point)/10);
   ObjectSetText("XXSE1diff",DoubleToString(SE1D,1));
   ObjectSetText("XXSE2diff",DoubleToString(SE2D,1));
   ObjectSetText("XXT1E1diff",DoubleToString(T1E1D,1));
   ObjectSetText("XXT1E2diff",DoubleToString(T1E2D,1));
   ObjectSetText("XXT2E1diff",DoubleToString(T2E1D,1));
   ObjectSetText("XXT2E2diff",DoubleToString(T2E2D,1));
   ObjectSetText("XXT3E1diff",DoubleToString(T3E1D,1));
   ObjectSetText("XXT3E2diff",DoubleToString(T3E2D,1));

  }

void RiskCal()
  {
   if(MathAbs(SL_S-EP_S)>=Point)
     {
      lot_En1=NormalizeDouble(CalculateLotSize(SL_S,Risk_Table_Entry1_Risk_Amount,EP_S),2);
      ObjectSetText("XXE1lot",DoubleToString(lot_En1,2));
     }
   else
     {
      ObjectSetText("XXE1lot","NA");
      lot_En1=0;
     }
   if(MathAbs(SL_S-EP2_S)>=Point)
     {
      lot_En2=NormalizeDouble(CalculateLotSize(SL_S,Risk_Table_Entry2_Risk_Amount,EP2_S),2);
      ObjectSetText("XXE2lot",DoubleToString(lot_En2,2));
     }
   else
     {
      lot_En2=0;
      ObjectSetText("XXE2lot","NA");
     }
   ObjectSetText("XXE1R$",DoubleToString(Risk_Table_Entry1_Risk_Amount,0));
   ObjectSetText("XXE2R$",DoubleToString(Risk_Table_Entry2_Risk_Amount,0));

  }


double CalculateLotSize(double SL,double Amount,double En)           
  {
   double LotSize=0;
   double distance=(MathAbs(En-SL)/(Point));
   LotSize=(Amount/(distance));
   return LotSize;
  }

void OBJECTMOVEOUT()
  {
   for(int i=ObjectsTotal(0,-1,-1); i>=0; i--)
     {

      if(StringFind(ObjectName(i), "XX")!=-1)
        {

         double xm=ObjectGet(ObjectName(i),OBJPROP_XDISTANCE);
         double ym=ObjectGet(ObjectName(i),OBJPROP_YDISTANCE);
         if(xm<=MMOVE)
            ObjectSet(ObjectName(i),OBJPROP_XDISTANCE,xm+MMOVE);
         if(ym<=MMOVE)
            ObjectSet(ObjectName(i),OBJPROP_YDISTANCE,ym+MMOVE);


        }

     }
  }


void OBJECTMOVEIN(bool mf)
  {
   if(!mf)
     {
      for(int i=ObjectsTotal(0,-1,-1); i>=0; i--)
        {

         if(StringFind(ObjectName(i), "XX")!=-1)
           {


            double xm=ObjectGet(ObjectName(i),OBJPROP_XDISTANCE);
            double ym=ObjectGet(ObjectName(i),OBJPROP_YDISTANCE);
            if(xm>=MMOVE)
               ObjectSet(ObjectName(i),OBJPROP_XDISTANCE,xm-MMOVE);
            if(ym>=MMOVE)
               ObjectSet(ObjectName(i),OBJPROP_YDISTANCE,ym-MMOVE);


           }
        }

     }
  }

void RefreshObject()
  {

   for(int i=ObjectsTotal(0,-1,-1); i>=0; i--)
     {

      if(StringFind(ObjectName(i), "XX")!=-1)
        {


         double xm=ObjectGet(ObjectName(i),OBJPROP_XDISTANCE);
         double ym=ObjectGet(ObjectName(i),OBJPROP_YDISTANCE);
         if(xm>=MMOVE && ym>=MMOVE)
           {
            ObjectSet(ObjectName(i),OBJPROP_XDISTANCE,xm-MMOVE);
            ObjectSet(ObjectName(i),OBJPROP_YDISTANCE,ym-MMOVE);
           }


        }
     }


  }

void Divergence_Alert_Maker(int i)
  {
   if(dType[i+1]==1)
     {
      if(DisplayAlert_Divergence_LONG && IsnewcandleM(i))
        {
     ;

         string msg1;
         if(Period()<60)
            msg1="RSI Bullish divergence on:"+ Symbol()+" at "+IntegerToString(Period())+" minutes chart @ "+TimeToStr(Time[i+1],TIME_DATE|TIME_MINUTES|TIME_SECONDS);
         if(59<Period() && Period()<241)
            msg1="RSI Bullish divergence on:"+ Symbol()+" at "+IntegerToString(Period()/60)+" Hours chart @ "+TimeToStr(Time[i+1],TIME_DATE|TIME_MINUTES|TIME_SECONDS);
         if(Period()==1440)
            msg1="RSI Bullish divergence on:"+ Symbol()+" at Daily chart @ "+TimeToStr(Time[i+1],TIME_DATE|TIME_MINUTES|TIME_SECONDS);
         if(Period()==10080)
            msg1="RSI Bullish divergence on:"+ Symbol()+" at Weekly chart @ "+TimeToStr(Time[i+1],TIME_DATE|TIME_MINUTES|TIME_SECONDS);
         if(Period()==43200)
            msg1="RSI Bullish divergence on:"+ Symbol()+" at Monthly chart @ "+TimeToStr(Time[i+1],TIME_DATE|TIME_MINUTES|TIME_SECONDS);
         alert(0,msg1,i,Candle_Confirmations_Alert_Sound_Enable_LONG,Candle_Confirmations_Alert_Sound_LONG);
        }
     }
   if(dType[i+1]==2)
     {

      if(DisplayAlert_Divergence_LONG_Lengthy  && IsnewcandleM(i))
        {
        
         string msg2;
         if(Period()<60)
            msg2="RSI Bullish divergence on:"+ Symbol()+" at "+IntegerToString(Period())+" minutes chart @ "+TimeToStr(Time[i+1],TIME_DATE|TIME_MINUTES|TIME_SECONDS);
         if(59<Period() && Period()<241)
            msg2="RSI Bullish divergence on:"+ Symbol()+" at "+IntegerToString(Period()/60)+" Hours chart @ "+TimeToStr(Time[i+1],TIME_DATE|TIME_MINUTES|TIME_SECONDS);
         if(Period()==1440)
            msg2="RSI Bullish divergence on:"+ Symbol()+" at Daily chart @ "+TimeToStr(Time[i+1],TIME_DATE|TIME_MINUTES|TIME_SECONDS);
         if(Period()==10080)
            msg2="RSI Bullish divergence on:"+ Symbol()+" at Weekly chart @ "+TimeToStr(Time[i+1],TIME_DATE|TIME_MINUTES|TIME_SECONDS);
         if(Period()==43200)
            msg2="RSI Bullish divergence on:"+ Symbol()+" at Monthly chart @ "+TimeToStr(Time[i+1],TIME_DATE|TIME_MINUTES|TIME_SECONDS);
         alert_L(0,msg2,i,Sound_Enable_Divergence_LONG_Lengthy,Sound_Divergence_LONG_Lengthy);
        }
     }

   if(dType[i+1]==3)
     {

      if(DisplayAlert_Divergence_SHORT  && IsnewcandleM(i))
        {
     
         string msg3;
         if(Period()<60)
            msg3="RSI Bearish divergence on:"+ Symbol()+" at "+IntegerToString(Period())+" minutes chart @ "+TimeToStr(Time[i+1],TIME_DATE|TIME_MINUTES|TIME_SECONDS);
         if(59<Period() && Period()<241)
            msg3="RSI Bearish divergence on:"+ Symbol()+" at "+IntegerToString(Period()/60)+" Hours chart @ "+TimeToStr(Time[i+1],TIME_DATE|TIME_MINUTES|TIME_SECONDS);
         if(Period()==1440)
            msg3="RSI Bearish divergence on:"+ Symbol()+" at Daily chart @ "+TimeToStr(Time[i+1],TIME_DATE|TIME_MINUTES|TIME_SECONDS);
         if(Period()==10080)
            msg3="RSI Bearish divergence on:"+ Symbol()+" at Weekly chart @ "+TimeToStr(Time[i+1],TIME_DATE|TIME_MINUTES|TIME_SECONDS);
         if(Period()==43200)
            msg3="RSI Bearish divergence on:"+ Symbol()+" at Monthly chart @ "+TimeToStr(Time[i+1],TIME_DATE|TIME_MINUTES|TIME_SECONDS);
         alert(1,msg3,i,Candle_Confirmations_Alert_Sound_Enable_SHORT,Candle_Confirmations_Alert_Sound_SHORT);
        }
     }

   if(dType[i+1]==4)
     {

      if(DisplayAlert_Divergence_SHORT_Lengthy  && IsnewcandleM(i))
        {
    
         string msg4;
         if(Period()<60)
            msg4="RSI Bearish divergence on:"+ Symbol()+" at "+IntegerToString(Period())+" minutes chart @ "+TimeToStr(Time[i+1],TIME_DATE|TIME_MINUTES|TIME_SECONDS);
         if(59<Period() && Period()<241)
            msg4="RSI Bearish divergence on:"+ Symbol()+" at "+IntegerToString(Period()/60)+" Hours chart @ "+TimeToStr(Time[i+1],TIME_DATE|TIME_MINUTES|TIME_SECONDS);
         if(Period()==1440)
            msg4="RSI Bearish divergence on:"+ Symbol()+" at Daily chart @ "+TimeToStr(Time[i+1],TIME_DATE|TIME_MINUTES|TIME_SECONDS);
         if(Period()==10080)
            msg4="RSI Bearish divergence on:"+ Symbol()+" at Weekly chart @ "+TimeToStr(Time[i+1],TIME_DATE|TIME_MINUTES|TIME_SECONDS);
         if(Period()==43200)
            msg4="RSI Bearish divergence on:"+ Symbol()+" at Monthly chart @ "+TimeToStr(Time[i+1],TIME_DATE|TIME_MINUTES|TIME_SECONDS);
         alert_L(1,msg4,i,Sound_Enable_Divergence_SHORT_Lengthy,Sound_Divergence_SHORT_Lengthy);
        }
     }
   if(dType[i+1]==5)
     {
      if(H_DisplayAlert_Divergence_LONG && IsnewcandleM(i))
        {
    

         string msg5;
         if(Period()<60)
            msg5="RSI Hidden Bullish divergence on:"+ Symbol()+" at "+IntegerToString(Period())+" minutes chart @ "+TimeToStr(Time[i+1],TIME_DATE|TIME_MINUTES|TIME_SECONDS);
         if(59<Period() && Period()<241)
            msg5="RSI Hidden Bullish divergence on:"+ Symbol()+" at "+IntegerToString(Period()/60)+" Hours chart @ "+TimeToStr(Time[i+1],TIME_DATE|TIME_MINUTES|TIME_SECONDS);
         if(Period()==1440)
            msg5="RSI Hidden Bullish divergence on:"+ Symbol()+" at Daily chart @ "+TimeToStr(Time[i+1],TIME_DATE|TIME_MINUTES|TIME_SECONDS);
         if(Period()==10080)
            msg5="RSI Hidden Bullish divergence on:"+ Symbol()+" at Weekly chart @ "+TimeToStr(Time[i+1],TIME_DATE|TIME_MINUTES|TIME_SECONDS);
         if(Period()==43200)
            msg5="RSI Hidden Bullish divergence on:"+ Symbol()+" at Monthly chart @ "+TimeToStr(Time[i+1],TIME_DATE|TIME_MINUTES|TIME_SECONDS);
         alert(0,msg5,i,H_Candle_Confirmations_Alert_Sound_Enable_LONG,H_Candle_Confirmations_Alert_Sound_LONG);
        }
     }
   if(dType[i+1]==6)
     {

      if(H_DisplayAlert_Divergence_LONG_Lengthy  && IsnewcandleM(i))
        {
   
         string msg6;
         if(Period()<60)
            msg6="RSI Hidden Bullish divergence on:"+ Symbol()+" at "+IntegerToString(Period())+" minutes chart @ "+TimeToStr(Time[i+1],TIME_DATE|TIME_MINUTES|TIME_SECONDS);
         if(59<Period() && Period()<241)
            msg6="RSI Hidden Bullish divergence on:"+ Symbol()+" at "+IntegerToString(Period()/60)+" Hours chart @ "+TimeToStr(Time[i+1],TIME_DATE|TIME_MINUTES|TIME_SECONDS);
         if(Period()==1440)
            msg6="RSI Hidden Bullish divergence on:"+ Symbol()+" at Daily chart @ "+TimeToStr(Time[i+1],TIME_DATE|TIME_MINUTES|TIME_SECONDS);
         if(Period()==10080)
            msg6="RSI Hidden Bullish divergence on:"+ Symbol()+" at Weekly chart @ "+TimeToStr(Time[i+1],TIME_DATE|TIME_MINUTES|TIME_SECONDS);
         if(Period()==43200)
            msg6="RSI Hidden Bullish divergence on:"+ Symbol()+" at Monthly chart @ "+TimeToStr(Time[i+1],TIME_DATE|TIME_MINUTES|TIME_SECONDS);
         alert_L(0,msg6,i,H_Sound_Enable_Divergence_LONG_Lengthy,H_Sound_Divergence_LONG_Lengthy);
        }
     }

   if(dType[i+1]==7)
     {

      if(H_DisplayAlert_Divergence_SHORT  && IsnewcandleM(i))
        {
   
         string msg7;
         if(Period()<60)
            msg7="RSI Hidden Bearish divergence on:"+ Symbol()+" at "+IntegerToString(Period())+" minutes chart @ "+TimeToStr(Time[i+1],TIME_DATE|TIME_MINUTES|TIME_SECONDS);
         if(59<Period() && Period()<241)
            msg7="RSI Hidden Bearish divergence on:"+ Symbol()+" at "+IntegerToString(Period()/60)+" Hours chart @ "+TimeToStr(Time[i+1],TIME_DATE|TIME_MINUTES|TIME_SECONDS);
         if(Period()==1440)
            msg7="RSI Hidden Bearish divergence on:"+ Symbol()+" at Daily chart @ "+TimeToStr(Time[i+1],TIME_DATE|TIME_MINUTES|TIME_SECONDS);
         if(Period()==10080)
            msg7="RSI Hidden Bearish divergence on:"+ Symbol()+" at Weekly chart @ "+TimeToStr(Time[i+1],TIME_DATE|TIME_MINUTES|TIME_SECONDS);
         if(Period()==43200)
            msg7="RSI Hidden Bearish divergence on:"+ Symbol()+" at Monthly chart @ "+TimeToStr(Time[i+1],TIME_DATE|TIME_MINUTES|TIME_SECONDS);
         alert(1,msg7,i,H_Candle_Confirmations_Alert_Sound_Enable_SHORT,H_Candle_Confirmations_Alert_Sound_SHORT);
        }
     }

   if(dType[i+1]==8)
     {

      if(H_DisplayAlert_Divergence_SHORT_Lengthy  && IsnewcandleM(i))
        {
       
         string msg8;
         if(Period()<60)
            msg8="RSI Hidden Bearish divergence on:"+ Symbol()+" at "+IntegerToString(Period())+" minutes chart @ "+TimeToStr(Time[i+1],TIME_DATE|TIME_MINUTES|TIME_SECONDS);
         if(59<Period() && Period()<241)
            msg8="RSI Hidden Bearish divergence on:"+ Symbol()+" at "+IntegerToString(Period()/60)+" Hours chart @ "+TimeToStr(Time[i+1],TIME_DATE|TIME_MINUTES|TIME_SECONDS);
         if(Period()==1440)
            msg8="RSI Hidden Bearish divergence on:"+ Symbol()+" at Daily chart @ "+TimeToStr(Time[i+1],TIME_DATE|TIME_MINUTES|TIME_SECONDS);
         if(Period()==10080)
            msg8="RSI Hidden Bearish divergence on:"+ Symbol()+" at Weekly chart @ "+TimeToStr(Time[i+1],TIME_DATE|TIME_MINUTES|TIME_SECONDS);
         if(Period()==43200)
            msg8="RSI Hidden Bearish divergence on:"+ Symbol()+" at Monthly chart @ "+TimeToStr(Time[i+1],TIME_DATE|TIME_MINUTES|TIME_SECONDS);
         alert_L(1,msg8,i,H_Sound_Enable_Divergence_SHORT_Lengthy,H_Sound_Divergence_SHORT_Lengthy);
        }
     }
  }


void Divergence_Long_CC_Alert_Maker(int i)
  {

   string Ps;
   if(CP_valid_state || dCandlePatren[i+3]<20)
      Ps=" "+PN+" ";
   else
      Ps=" ";

   if(dType[i+3]==2)
     {
      string ps2="";
      if(Alert_With_Candle_Pattern_LONG_Lengthy)
         ps2=Ps;

      string msg2;
      if(Candle_Confirmations_Alert_LONG_Lengthy && IsnewcandleCC(i))
        {
         if(Period()<60)
            msg2="RSI Bullish divergence"+ps2+"with confirmation candle on:"+ Symbol()+" at "+IntegerToString(Period())+" minutes chart @ "+TimeToStr(Time[i],TIME_DATE|TIME_MINUTES|TIME_SECONDS);
         if(59<Period() && Period()<241)
            msg2="RSI Bearish divergence"+ps2+"with confirmation candle on:"+ Symbol()+" at "+IntegerToString(Period()/60)+" Hours chart @ "+TimeToStr(Time[i],TIME_DATE|TIME_MINUTES|TIME_SECONDS);
         if(Period()==1440)
            msg2="RSI Bullish divergence"+ps2+"with confirmation candle on:"+ Symbol()+" at Daily chart @ "+TimeToStr(Time[i],TIME_DATE|TIME_MINUTES|TIME_SECONDS);
         if(Period()==10080)
            msg2="RSI Bullish divergence"+ps2+"with confirmation candle on:"+ Symbol()+" at Weekly chart @ "+TimeToStr(Time[i],TIME_DATE|TIME_MINUTES|TIME_SECONDS);
         if(Period()==43200)
            msg2="RSI Bullish divergence"+ps2+"with confirmation candle on:"+ Symbol()+" at Monthly chart @ "+TimeToStr(Time[i],TIME_DATE|TIME_MINUTES|TIME_SECONDS);
         alert_L(0, msg2, i,Candle_Confirmations_Alert_Sound_Enable_LONG_Lengthy,Candle_Confirmations_Alert_Sound_LONG_Lengthy);
        }
     }



   if(dType[i+3]==4)
     {
      string ps4="";
      if(Alert_With_Candle_Pattern_SHORT_Lengthy)
         ps4=Ps;

      string msg4;
      if(Candle_Confirmations_Alert_SHORT_Lengthy && IsnewcandleCC(i))
        {
         if(Period()<60)
            msg4="RSI Bearish divergence"+ps4+"with confirmation candle on:"+ Symbol()+" at "+IntegerToString(Period())+" minutes chart @ "+TimeToStr(Time[i],TIME_DATE|TIME_MINUTES|TIME_SECONDS);
         if(59<Period() && Period()<241)
            msg4="RSI Bearish divergence"+ps4+"with confirmation candle on:"+ Symbol()+" at "+IntegerToString(Period()/60)+" Hours chart @ "+TimeToStr(Time[i],TIME_DATE|TIME_MINUTES|TIME_SECONDS);
         if(Period()==1440)
            msg4="RSI Bearish divergence"+ps4+"with confirmation candle on:"+ Symbol()+" at Daily chart @ "+TimeToStr(Time[i],TIME_DATE|TIME_MINUTES|TIME_SECONDS);
         if(Period()==10080)
            msg4="RSI Bearish divergence"+ps4+"cwith confirmation candle on:"+ Symbol()+" at Weekly chart @ "+TimeToStr(Time[i],TIME_DATE|TIME_MINUTES|TIME_SECONDS);
         if(Period()==43200)
            msg4="RSI Bearish divergence"+ps4+"with confirmation candle on:"+ Symbol()+" at Monthly chart @ "+TimeToStr(Time[i],TIME_DATE|TIME_MINUTES|TIME_SECONDS);
         alert_L(1,msg4, i,Candle_Confirmations_Alert_Sound_Enable_SHORT_Lengthy,Candle_Confirmations_Alert_Sound_SHORT_Lengthy);
        }
     }
   if(dType[i+3]==6)
     {
      string ps6="";
      if(H_Alert_With_Candle_Pattern_LONG_Lengthy)
         ps6=Ps;

      string msg6;
      if(H_Candle_Confirmations_Alert_LONG_Lengthy && IsnewcandleCC(i))
        {
         if(Period()<60)
            msg6="RSI Hidden Bullish divergence"+ps2+"with confirmation candle on:"+ Symbol()+" at "+IntegerToString(Period())+" minutes chart @ "+TimeToStr(Time[i],TIME_DATE|TIME_MINUTES|TIME_SECONDS);
         if(59<Period() && Period()<241)
            msg6="RSI Hidden Bearish divergence"+ps2+"with confirmation candle on:"+ Symbol()+" at "+IntegerToString(Period()/60)+" Hours chart @ "+TimeToStr(Time[i],TIME_DATE|TIME_MINUTES|TIME_SECONDS);
         if(Period()==1440)
            msg6="RSI Hidden Bullish divergence"+ps2+"with confirmation candle on:"+ Symbol()+" at Daily chart @ "+TimeToStr(Time[i],TIME_DATE|TIME_MINUTES|TIME_SECONDS);
         if(Period()==10080)
            msg6="RSI Hidden Bullish divergence"+ps2+"with confirmation candle on:"+ Symbol()+" at Weekly chart @ "+TimeToStr(Time[i],TIME_DATE|TIME_MINUTES|TIME_SECONDS);
         if(Period()==43200)
            msg6="RSI Hidden Bullish divergence"+ps2+"with confirmation candle on:"+ Symbol()+" at Monthly chart @ "+TimeToStr(Time[i],TIME_DATE|TIME_MINUTES|TIME_SECONDS);
         alert_L(0, msg6, i,H_Candle_Confirmations_Alert_Sound_Enable_LONG_Lengthy,H_Candle_Confirmations_Alert_Sound_LONG_Lengthy);
        }
     }



   if(dType[i+3]==8)
     {
      string ps8="";
      if(H_Alert_With_Candle_Pattern_SHORT_Lengthy)
         ps8=Ps;

      string msg8;
      if(H_Candle_Confirmations_Alert_SHORT_Lengthy && IsnewcandleCC(i))
        {
         if(Period()<60)
            msg8="RSI Hidden Bearish divergence"+ps4+"with confirmation candle on:"+ Symbol()+" at "+IntegerToString(Period())+" minutes chart @ "+TimeToStr(Time[i],TIME_DATE|TIME_MINUTES|TIME_SECONDS);
         if(59<Period() && Period()<241)
            msg8="RSI Hidden Bearish divergence"+ps4+"with confirmation candle on:"+ Symbol()+" at "+IntegerToString(Period()/60)+" Hours chart @ "+TimeToStr(Time[i],TIME_DATE|TIME_MINUTES|TIME_SECONDS);
         if(Period()==1440)
            msg8="RSI Hidden Bearish divergence"+ps4+"with confirmation candle on:"+ Symbol()+" at Daily chart @ "+TimeToStr(Time[i],TIME_DATE|TIME_MINUTES|TIME_SECONDS);
         if(Period()==10080)
            msg8="RSI Hidden Bearish divergence"+ps4+"cwith confirmation candle on:"+ Symbol()+" at Weekly chart @ "+TimeToStr(Time[i],TIME_DATE|TIME_MINUTES|TIME_SECONDS);
         if(Period()==43200)
            msg8="RSI Hidden Bearish divergence"+ps4+"with confirmation candle on:"+ Symbol()+" at Monthly chart @ "+TimeToStr(Time[i],TIME_DATE|TIME_MINUTES|TIME_SECONDS);
         alert_L(1,msg8, i,H_Candle_Confirmations_Alert_Sound_Enable_SHORT_Lengthy,H_Candle_Confirmations_Alert_Sound_SHORT_Lengthy);
        }
     }

  }

void Divergence_Dir_CC_Alert_Maker(int i)
  {

   string Ps;
   if(CP_valid_state || dCandlePatren[i+3]<20)
      Ps=" "+PN+" ";
   else
      Ps=" ";
   if(dType[i+3]==1)
     {
      string ps1="";
      if(Alert_With_Candle_Pattern_LONG)
         ps1=Ps;
      string msg1;
      if(Candle_Confirmations_Alert_LONG && IsnewcandleCC(i))
        {
         if(Period()<60)
            msg1="RSI Bullish divergence"+ps1+"with confirmation candle on: "+ Symbol()+" at "+IntegerToString(Period())+" minutes chart @ "+TimeToStr(Time[i],TIME_DATE|TIME_MINUTES|TIME_SECONDS);
         if(59<Period() && Period()<241)
            msg1="RSI Bullish divergence"+ps1+"with confirmation candle on: "+ Symbol()+" at "+IntegerToString(Period()/60)+" Hours chart @ "+TimeToStr(Time[i],TIME_DATE|TIME_MINUTES|TIME_SECONDS);
         if(Period()==1440)
            msg1="RSI Bullish divergence"+ps1+"with confirmation candle on: "+ Symbol()+" at Daily chart @ "+TimeToStr(Time[i],TIME_DATE|TIME_MINUTES|TIME_SECONDS);
         if(Period()==10080)
            msg1="RSI Bullish divergence"+ps1+"with confirmation candle on: "+ Symbol()+" at Weekly chart @ "+TimeToStr(Time[i],TIME_DATE|TIME_MINUTES|TIME_SECONDS);
         if(Period()==43200)
            msg1="RSI Bullish divergence"+ps1+"with confirmation candle on: "+ Symbol()+" at Monthly chart @ "+TimeToStr(Time[i],TIME_DATE|TIME_MINUTES|TIME_SECONDS);

         alert(0, msg1, i,Confirmation_candle_Breakout_Alert_Sound_Enable_LONG,Confirmation_candle_Breakout_Alert_Sound_LONG);
        }
     }



   if(dType[i+3]==3)
     {
      string ps3="";
      if(Alert_With_Candle_Pattern_SHORT)
         ps3=Ps;
      string msg3;
      if(Candle_Confirmations_Alert_SHORT && IsnewcandleCC(i))
        {
         if(Period()<60)
            msg3="RSI Bearish divergence"+ps3+"with confirmation candle on: "+ Symbol()+" at "+IntegerToString(Period())+" minutes chart @ "+TimeToStr(Time[i],TIME_DATE|TIME_MINUTES|TIME_SECONDS);
         if(59<Period() && Period()<241)
            msg3="RSI Bearish divergence"+ps3+"with confirmation candle on: "+ Symbol()+" at "+IntegerToString(Period()/60)+" Hours chart @ "+TimeToStr(Time[i],TIME_DATE|TIME_MINUTES|TIME_SECONDS);
         if(Period()==1440)
            msg3="RSI Bearish divergence"+ps3+"with confirmation candle on: "+ Symbol()+" at Daily chart @ "+TimeToStr(Time[i],TIME_DATE|TIME_MINUTES|TIME_SECONDS);
         if(Period()==10080)
            msg3="RSI Bearish divergence"+ps3+"with confirmation candle on: "+ Symbol()+" at Weekly chart @ "+TimeToStr(Time[i],TIME_DATE|TIME_MINUTES|TIME_SECONDS);
         if(Period()==43200)
            msg3="RSI Bearish divergence"+ps3+"with confirmation candle on: "+ Symbol()+" at Monthly chart @ "+TimeToStr(Time[i],TIME_DATE|TIME_MINUTES|TIME_SECONDS);
         alert(1,msg3, i,Confirmation_candle_Breakout_Alert_Sound_Enable_SHORT,Confirmation_candle_Breakout_Alert_Sound_SHORT);
        }
     }
   if(dType[i+3]==5)
     {
      string ps5="";
      if(Alert_With_Candle_Pattern_LONG)
         ps5=Ps;
      string msg5;
      if(Candle_Confirmations_Alert_LONG && IsnewcandleCC(i))
        {
         if(Period()<60)
            msg5="RSI Bullish Hidden divergence"+ps1+"with confirmation candle on: "+ Symbol()+" at "+IntegerToString(Period())+" minutes chart @ "+TimeToStr(Time[i],TIME_DATE|TIME_MINUTES|TIME_SECONDS);
         if(59<Period() && Period()<241)
            msg5="RSI Bullish Hidden divergence"+ps1+"with confirmation candle on: "+ Symbol()+" at "+IntegerToString(Period()/60)+" Hours chart @ "+TimeToStr(Time[i],TIME_DATE|TIME_MINUTES|TIME_SECONDS);
         if(Period()==1440)
            msg5="RSI Bullish Hidden divergence"+ps1+"with confirmation candle on: "+ Symbol()+" at Daily chart @ "+TimeToStr(Time[i],TIME_DATE|TIME_MINUTES|TIME_SECONDS);
         if(Period()==10080)
            msg5="RSI Bullish Hidden divergence"+ps1+"with confirmation candle on: "+ Symbol()+" at Weekly chart @ "+TimeToStr(Time[i],TIME_DATE|TIME_MINUTES|TIME_SECONDS);
         if(Period()==43200)
            msg5="RSI Bullish Hidden divergence"+ps1+"with confirmation candle on: "+ Symbol()+" at Monthly chart @ "+TimeToStr(Time[i],TIME_DATE|TIME_MINUTES|TIME_SECONDS);

         alert(0, msg5, i,Confirmation_candle_Breakout_Alert_Sound_Enable_LONG,Confirmation_candle_Breakout_Alert_Sound_LONG);
        }
     }



   if(dType[i+3]==7)
     {
      string ps7="";
      if(H_Alert_With_Candle_Pattern_SHORT)
         ps7=Ps;
      string msg7;
      if(H_Candle_Confirmations_Alert_SHORT && IsnewcandleCC(i))
        {
         if(Period()<60)
            msg7="RSI Bearish Hidden divergence"+ps3+"with confirmation candle on: "+ Symbol()+" at "+IntegerToString(Period())+" minutes chart @ "+TimeToStr(Time[i],TIME_DATE|TIME_MINUTES|TIME_SECONDS);
         if(59<Period() && Period()<241)
            msg7="RSI Bearish Hidden divergence"+ps3+"with confirmation candle on: "+ Symbol()+" at "+IntegerToString(Period()/60)+" Hours chart @ "+TimeToStr(Time[i],TIME_DATE|TIME_MINUTES|TIME_SECONDS);
         if(Period()==1440)
            msg7="RSI Bearish Hidden divergence"+ps3+"with confirmation candle on: "+ Symbol()+" at Daily chart @ "+TimeToStr(Time[i],TIME_DATE|TIME_MINUTES|TIME_SECONDS);
         if(Period()==10080)
            msg7="RSI Bearish Hidden divergence"+ps3+"with confirmation candle on: "+ Symbol()+" at Weekly chart @ "+TimeToStr(Time[i],TIME_DATE|TIME_MINUTES|TIME_SECONDS);
         if(Period()==43200)
            msg7="RSI Bearish Hidden divergence"+ps3+"with confirmation candle on: "+ Symbol()+" at Monthly chart @ "+TimeToStr(Time[i],TIME_DATE|TIME_MINUTES|TIME_SECONDS);
         alert(1,msg7, i,H_Confirmation_candle_Breakout_Alert_Sound_Enable_SHORT,H_Confirmation_candle_Breakout_Alert_Sound_SHORT);
        }
     }

  }


void Divergence_Long_CCB_Alert_Maker(int i)
  {
   string Ps;
   if(CP_valid_state)
      Ps=" "+PN+" ";
   else
      Ps=" ";

   if(CCB_Alert_BU_Long_trig)
     {
      string ps2="";
      if(Alert_With_Candle_Pattern_LONG_Lengthy)
         ps2=Ps;


      if(Confirmation_candle_Breakout_Alert_LONG_Lengthy  && IsnewcandleCCB(i))
        {
         string msg2;
         if(Period()<60)
            msg2="RSI Bullish divergence"+ps2+"confirmation candle Breakout on:"+ Symbol()+" at "+IntegerToString(Period())+" minutes chart @ "+TimeToStr(Time[i],TIME_DATE|TIME_MINUTES|TIME_SECONDS);
         if(59<Period() && Period()<241)
            msg2="RSI Bearish divergence"+ps2+"confirmation candle Breakout on:"+ Symbol()+" at "+IntegerToString(Period()/60)+" Hours chart @ "+TimeToStr(Time[i],TIME_DATE|TIME_MINUTES|TIME_SECONDS);
         if(Period()==1440)
            msg2="RSI Bullish divergence"+ps2+"confirmation candle Breakout on:"+ Symbol()+" at Daily chart @ "+TimeToStr(Time[i],TIME_DATE|TIME_MINUTES|TIME_SECONDS);
         if(Period()==10080)
            msg2="RSI Bullish divergence"+ps2+"confirmation candle Breakout on:"+ Symbol()+" at Weekly chart @ "+TimeToStr(Time[i],TIME_DATE|TIME_MINUTES|TIME_SECONDS);
         if(Period()==43200)
            msg2="RSI Bullish divergence"+ps2+"confirmation candle Breakout on:"+ Symbol()+" at Monthly chart @ "+TimeToStr(Time[i],TIME_DATE|TIME_MINUTES|TIME_SECONDS);

         alert_LCCB2(0, msg2, i,Confirmation_candle_Breakout_Alert_Sound_Enable_LONG_Lengthy,Confirmation_candle_Breakout_Alert_Sound_LONG_Lengthy);

        }
     }




   if(CCB_Alert_BE_Long_trig)
     {
      string ps4="";
      if(Alert_With_Candle_Pattern_SHORT_Lengthy)
         ps4=Ps;

      if(Confirmation_candle_Breakout_Alert_SHORT_Lengthy && IsnewcandleCCB(i))
        {
         string msg4;
         if(Period()<60)
            msg4="RSI Bearish divergence"+ps4+"confirmation candle Breakout on:"+ Symbol()+" at "+IntegerToString(Period())+" minutes chart @ "+TimeToStr(Time[i],TIME_DATE|TIME_MINUTES|TIME_SECONDS);
         if(59<Period() && Period()<241)
            msg4="RSI Bearish divergence"+ps4+"confirmation candle Breakout on:"+ Symbol()+" at "+IntegerToString(Period()/60)+" Hours chart @ "+TimeToStr(Time[i],TIME_DATE|TIME_MINUTES|TIME_SECONDS);
         if(Period()==1440)
            msg4="RSI Bearish divergence"+ps4+"confirmation candle Breakout on:"+ Symbol()+" at Daily chart @ "+TimeToStr(Time[i],TIME_DATE|TIME_MINUTES|TIME_SECONDS);
         if(Period()==10080)
            msg4="RSI Bearish divergence"+ps4+"confirmation candle Breakout on:"+ Symbol()+" at Weekly chart @ "+TimeToStr(Time[i],TIME_DATE|TIME_MINUTES|TIME_SECONDS);
         if(Period()==43200)
            msg4="RSI Bearish divergence"+ps4+"confirmation candle Breakout on:"+ Symbol()+" at Monthly chart @ "+TimeToStr(Time[i],TIME_DATE|TIME_MINUTES|TIME_SECONDS);

         alert_LCCB2(1,msg4, i,Confirmation_candle_Breakout_Alert_Sound_Enable_SHORT_Lengthy, Confirmation_candle_Breakout_Alert_Sound_SHORT_Lengthy);

        }
     }
   CCB_Alert_BU_Long_trig=false;
   CCB_Alert_BE_Long_trig=false;
   if(H_CCB_Alert_BU_Long_trig)
     {
      string ps6="";
      if(H_Alert_With_Candle_Pattern_LONG_Lengthy)
         ps6=Ps;


      if(H_Confirmation_candle_Breakout_Alert_LONG_Lengthy  && IsnewcandleCCB(i))
        {
         string msg6;
         if(Period()<60)
            msg6="RSI Bullish Hidden divergence"+ps2+"confirmation candle Breakout on:"+ Symbol()+" at "+IntegerToString(Period())+" minutes chart @ "+TimeToStr(Time[i],TIME_DATE|TIME_MINUTES|TIME_SECONDS);
         if(59<Period() && Period()<241)
            msg6="RSI Bearish Hidden divergence"+ps2+"confirmation candle Breakout on:"+ Symbol()+" at "+IntegerToString(Period()/60)+" Hours chart @ "+TimeToStr(Time[i],TIME_DATE|TIME_MINUTES|TIME_SECONDS);
         if(Period()==1440)
            msg6="RSI Bullish Hidden divergence"+ps2+"confirmation candle Breakout on:"+ Symbol()+" at Daily chart @ "+TimeToStr(Time[i],TIME_DATE|TIME_MINUTES|TIME_SECONDS);
         if(Period()==10080)
            msg6="RSI Bullish Hidden divergence"+ps2+"confirmation candle Breakout on:"+ Symbol()+" at Weekly chart @ "+TimeToStr(Time[i],TIME_DATE|TIME_MINUTES|TIME_SECONDS);
         if(Period()==43200)
            msg6="RSI Bullish Hidden divergence"+ps2+"confirmation candle Breakout on:"+ Symbol()+" at Monthly chart @ "+TimeToStr(Time[i],TIME_DATE|TIME_MINUTES|TIME_SECONDS);

         alert_LCCB2(0, msg6, i,H_Confirmation_candle_Breakout_Alert_Sound_Enable_LONG_Lengthy,H_Confirmation_candle_Breakout_Alert_Sound_LONG_Lengthy);

        }
     }




   if(H_CCB_Alert_BE_Long_trig)
     {
      string ps8="";
      if(H_Alert_With_Candle_Pattern_SHORT_Lengthy)
         ps8=Ps;

      if(H_Confirmation_candle_Breakout_Alert_SHORT_Lengthy && IsnewcandleCCB(i))
        {
         string msg8;
         if(Period()<60)
            msg8="RSI Bearish Hidden divergence"+ps4+"confirmation candle Breakout on:"+ Symbol()+" at "+IntegerToString(Period())+" minutes chart @ "+TimeToStr(Time[i],TIME_DATE|TIME_MINUTES|TIME_SECONDS);
         if(59<Period() && Period()<241)
            msg8="RSI Bearish Hidden divergence"+ps4+"confirmation candle Breakout on:"+ Symbol()+" at "+IntegerToString(Period()/60)+" Hours chart @ "+TimeToStr(Time[i],TIME_DATE|TIME_MINUTES|TIME_SECONDS);
         if(Period()==1440)
            msg8="RSI Bearish Hidden divergence"+ps4+"confirmation candle Breakout on:"+ Symbol()+" at Daily chart @ "+TimeToStr(Time[i],TIME_DATE|TIME_MINUTES|TIME_SECONDS);
         if(Period()==10080)
            msg8="RSI Bearish Hidden divergence"+ps4+"confirmation candle Breakout on:"+ Symbol()+" at Weekly chart @ "+TimeToStr(Time[i],TIME_DATE|TIME_MINUTES|TIME_SECONDS);
         if(Period()==43200)
            msg8="RSI Bearish Hidden divergence"+ps4+"confirmation candle Breakout on:"+ Symbol()+" at Monthly chart @ "+TimeToStr(Time[i],TIME_DATE|TIME_MINUTES|TIME_SECONDS);

         alert_LCCB2(1,msg8, i,H_Confirmation_candle_Breakout_Alert_Sound_Enable_SHORT_Lengthy, H_Confirmation_candle_Breakout_Alert_Sound_SHORT_Lengthy);

        }
     }
   H_CCB_Alert_BU_Long_trig=false;
   H_CCB_Alert_BE_Long_trig=false;

  }

void Divergence_Dir_CCB_Alert_Maker(int i)
  {
   string Ps;
   if(CP_valid_state)
      Ps=" "+PN+" ";
   else
      Ps=" ";
   if(CCB_Alert_BU_Dir_trig)
     {
      string ps1="";
      if(Alert_With_Candle_Pattern_LONG)
         ps1=Ps;
      if(Confirmation_candle_Breakout_Alert_LONG  && IsnewcandleCCB(i))
        {
         string msg1;
         if(Period()<60)
            msg1="RSI Bullish divergence"+ps1+"confirmation candle Breakout on:" + Symbol()+" at "+IntegerToString(Period())+" minutes chart @ "+TimeToStr(Time[i],TIME_DATE|TIME_MINUTES|TIME_SECONDS);
         if(59<Period() && Period()<241)
            msg1="RSI Bullish divergence"+ps1+"confirmation candle Breakout on:" + Symbol()+" at "+IntegerToString(Period()/60)+" Hours chart @ "+TimeToStr(Time[i],TIME_DATE|TIME_MINUTES|TIME_SECONDS);
         if(Period()==1440)
            msg1="RSI Bullish divergence"+ps1+"confirmation candle Breakout on:" + Symbol()+" at Daily chart @ "+TimeToStr(Time[i],TIME_DATE|TIME_MINUTES|TIME_SECONDS);
         if(Period()==10080)
            msg1="RSI Bullish divergence"+ps1+"confirmation candle Breakout on:" + Symbol()+" at Weekly chart @ "+TimeToStr(Time[i],TIME_DATE|TIME_MINUTES|TIME_SECONDS);
         if(Period()==43200)
            msg1="RSI Bullish divergence"+ps1+"confirmation candle Breakout on:" + Symbol()+" at Monthly chart @ "+TimeToStr(Time[i],TIME_DATE|TIME_MINUTES|TIME_SECONDS);
         alert_CCB2(0, msg1, i,Confirmation_candle_Breakout_Alert_Sound_Enable_LONG,Confirmation_candle_Breakout_Alert_Sound_LONG);

        }
     }



   if(CCB_Alert_BE_Dir_trig)
     {
      string ps3="";
      if(Alert_With_Candle_Pattern_SHORT)
         ps3=Ps;

      if(Confirmation_candle_Breakout_Alert_SHORT  && IsnewcandleCCB(i))
        {
         string msg3;
         if(Period()<60)
            msg3="RSI Bearish divergence"+ps3+"confirmation candle Breakout on:"+ Symbol()+" at "+IntegerToString(Period())+" minutes chart @ "+TimeToStr(Time[i],TIME_DATE|TIME_MINUTES|TIME_SECONDS);
         if(59<Period() && Period()<241)
            msg3="RSI Bearish divergence"+ps3+"confirmation candle Breakout on:"+ Symbol()+" at "+IntegerToString(Period()/60)+" Hours chart @ "+TimeToStr(Time[i],TIME_DATE|TIME_MINUTES|TIME_SECONDS);
         if(Period()==1440)
            msg3="RSI Bearish divergence"+ps3+"confirmation candle Breakout on:"+ Symbol()+" at Daily chart @ "+TimeToStr(Time[i],TIME_DATE|TIME_MINUTES|TIME_SECONDS);
         if(Period()==10080)
            msg3="RSI Bearish divergence"+ps3+"confirmation candle Breakout on:"+ Symbol()+" at Weekly chart @ "+TimeToStr(Time[i],TIME_DATE|TIME_MINUTES|TIME_SECONDS);
         if(Period()==43200)
            msg3="RSI Bearish divergence"+ps3+"confirmation candle Breakout on:"+ Symbol()+" at Monthly chart @ "+TimeToStr(Time[i],TIME_DATE|TIME_MINUTES|TIME_SECONDS);

         alert_CCB2(1,msg3, i,Confirmation_candle_Breakout_Alert_Sound_Enable_SHORT,Confirmation_candle_Breakout_Alert_Sound_SHORT);

        }
     }

   CCB_Alert_BU_Dir_trig=false;
   CCB_Alert_BE_Dir_trig=false;
   if(H_CCB_Alert_BU_Dir_trig)
     {
      string ps5="";
      if(H_Alert_With_Candle_Pattern_LONG)
         ps5=Ps;
      if(H_Confirmation_candle_Breakout_Alert_LONG  && IsnewcandleCCB(i))
        {
         string msg5;
         if(Period()<60)
            msg5="RSI Bullish divergence"+ps1+"confirmation candle Breakout on:" + Symbol()+" at "+IntegerToString(Period())+" minutes chart @ "+TimeToStr(Time[i],TIME_DATE|TIME_MINUTES|TIME_SECONDS);
         if(59<Period() && Period()<241)
            msg5="RSI Bullish divergence"+ps1+"confirmation candle Breakout on:" + Symbol()+" at "+IntegerToString(Period()/60)+" Hours chart @ "+TimeToStr(Time[i],TIME_DATE|TIME_MINUTES|TIME_SECONDS);
         if(Period()==1440)
            msg5="RSI Bullish divergence"+ps1+"confirmation candle Breakout on:" + Symbol()+" at Daily chart @ "+TimeToStr(Time[i],TIME_DATE|TIME_MINUTES|TIME_SECONDS);
         if(Period()==10080)
            msg5="RSI Bullish divergence"+ps1+"confirmation candle Breakout on:" + Symbol()+" at Weekly chart @ "+TimeToStr(Time[i],TIME_DATE|TIME_MINUTES|TIME_SECONDS);
         if(Period()==43200)
            msg5="RSI Bullish divergence"+ps1+"confirmation candle Breakout on:" + Symbol()+" at Monthly chart @ "+TimeToStr(Time[i],TIME_DATE|TIME_MINUTES|TIME_SECONDS);
         alert_CCB2(0, msg5, i,H_Confirmation_candle_Breakout_Alert_Sound_Enable_LONG,H_Confirmation_candle_Breakout_Alert_Sound_LONG);

        }
     }



   if(H_CCB_Alert_BE_Dir_trig)
     {
      string ps7="";
      if(H_Alert_With_Candle_Pattern_SHORT)
         ps7=Ps;

      if(H_Confirmation_candle_Breakout_Alert_SHORT  && IsnewcandleCCB(i))
        {
         string msg7;
         if(Period()<60)
            msg7="RSI Bearish divergence"+ps3+"confirmation candle Breakout on:"+ Symbol()+" at "+IntegerToString(Period())+" minutes chart @ "+TimeToStr(Time[i],TIME_DATE|TIME_MINUTES|TIME_SECONDS);
         if(59<Period() && Period()<241)
            msg7="RSI Bearish divergence"+ps3+"confirmation candle Breakout on:"+ Symbol()+" at "+IntegerToString(Period()/60)+" Hours chart @ "+TimeToStr(Time[i],TIME_DATE|TIME_MINUTES|TIME_SECONDS);
         if(Period()==1440)
            msg7="RSI Bearish divergence"+ps3+"confirmation candle Breakout on:"+ Symbol()+" at Daily chart @ "+TimeToStr(Time[i],TIME_DATE|TIME_MINUTES|TIME_SECONDS);
         if(Period()==10080)
            msg7="RSI Bearish divergence"+ps3+"confirmation candle Breakout on:"+ Symbol()+" at Weekly chart @ "+TimeToStr(Time[i],TIME_DATE|TIME_MINUTES|TIME_SECONDS);
         if(Period()==43200)
            msg7="RSI Bearish divergence"+ps3+"confirmation candle Breakout on:"+ Symbol()+" at Monthly chart @ "+TimeToStr(Time[i],TIME_DATE|TIME_MINUTES|TIME_SECONDS);

         alert_CCB2(1,msg7, i,H_Confirmation_candle_Breakout_Alert_Sound_Enable_SHORT,H_Confirmation_candle_Breakout_Alert_Sound_SHORT);

        }
     }

   H_CCB_Alert_BU_Dir_trig=false;
   H_CCB_Alert_BE_Dir_trig=false;


  }

void DeleteMachine(int i)
  {
   for(int j=i; j<i+11; j++)
     {
      if(dType[j]<9 && dUnvalid[j]!=1 &&  Time[j]!=LastD)
        {

         MegaDelete(j);
         MegaDelete2(j-1);
         MegaDelete3(j-1);
         MegaDelete4(j-1);
        }
     }
  }

void Bool_Input_Set()
  {
   if(StringSubstr(bool_Input_EA,0,1)=="1")
      Show_Graphic_Object=true;
   if(StringSubstr(bool_Input_EA,0,1)=="0")
      Show_Graphic_Object=false;

   if(StringSubstr(bool_Input_EA,1,1)=="1")
      Using_IN_EA=true;
   if(StringSubstr(bool_Input_EA,1,1)=="0")
      Using_IN_EA=false;

   if(StringSubstr(bool_Input_EA,2,1)=="1")
      Candle_Patterns_Enable=true;
   if(StringSubstr(bool_Input_EA,2,1)=="0")
      Candle_Patterns_Enable=false;

   if(StringSubstr(bool_Input_EA,3,1)=="1")
      RSI_Filter=true;
   if(StringSubstr(bool_Input_EA,3,1)=="0")
      RSI_Filter=false;

   if(StringSubstr(bool_Input_EA,4,1)=="1")
      Candle_Confirmations_LONG=true;
   if(StringSubstr(bool_Input_EA,4,1)=="0")
      Candle_Confirmations_LONG=false;

   if(StringSubstr(bool_Input_EA,5,1)=="1")
      Candle_Confirmations_SHORT=true;
   if(StringSubstr(bool_Input_EA,5,1)=="0")
      Candle_Confirmations_SHORT=false;

   if(StringSubstr(bool_Input_EA,6,1)=="1")
      Confirmation_candle_Breakout_LONG=true;
   if(StringSubstr(bool_Input_EA,6,1)=="0")
      Confirmation_candle_Breakout_LONG=false;

   if(StringSubstr(bool_Input_EA,7,1)=="1")
      Confirmation_candle_Breakout_SHORT=true;
   if(StringSubstr(bool_Input_EA,7,1)=="0")
      Confirmation_candle_Breakout_SHORT=false;

   if(StringSubstr(bool_Input_EA,8,1)=="1")
      Bullish_Hammer=true;
   if(StringSubstr(bool_Input_EA,8,1)=="0")
      Bullish_Hammer=false;

   if(StringSubstr(bool_Input_EA,9,1)=="1")
      Bullish_Inverted_Hammer=true;
   if(StringSubstr(bool_Input_EA,9,1)=="0")
      Bullish_Inverted_Hammer=false;

   if(StringSubstr(bool_Input_EA,10,1)=="1")
      Bearish_Hammer=true;
   if(StringSubstr(bool_Input_EA,10,1)=="0")
      Bearish_Hammer=false;

   if(StringSubstr(bool_Input_EA,11,1)=="1")
      Bearish_Inverted_Hammer=true;
   if(StringSubstr(bool_Input_EA,11,1)=="0")
      Bearish_Inverted_Hammer=false;

   if(StringSubstr(bool_Input_EA,12,1)=="1")
      Bullish_Engulfing=true;
   if(StringSubstr(bool_Input_EA,12,1)=="0")
      Bullish_Engulfing=false;

   if(StringSubstr(bool_Input_EA,13,1)=="1")
      Bearish_Engulfing=true;
   if(StringSubstr(bool_Input_EA,13,1)=="0")
      Bearish_Engulfing=false;

   if(StringSubstr(bool_Input_EA,14,1)=="1")
      Piercing_Candle=true;
   if(StringSubstr(bool_Input_EA,14,1)=="0")
      Piercing_Candle=false;

   if(StringSubstr(bool_Input_EA,15,1)=="1")
      Dark_Cloud_Cover=true;
   if(StringSubstr(bool_Input_EA,15,1)=="0")
      Dark_Cloud_Cover=false;

   if(StringSubstr(bool_Input_EA,16,1)=="1")
      Bullish_Sash=true;
   if(StringSubstr(bool_Input_EA,16,1)=="0")
      Bullish_Sash=false;

   if(StringSubstr(bool_Input_EA,17,1)=="1")
      Bearish_Sash=true;
   if(StringSubstr(bool_Input_EA,17,1)=="0")
      Bearish_Sash=false;

   if(StringSubstr(bool_Input_EA,18,1)=="1")
      Morning_Star=true;
   if(StringSubstr(bool_Input_EA,18,1)=="0")
      Morning_Star=false;

   if(StringSubstr(bool_Input_EA,19,1)=="1")
      Evening_Star=true;
   if(StringSubstr(bool_Input_EA,19,1)=="0")
      Evening_Star=false;


   if(StringSubstr(bool_Input_EA,20,1)=="1")
      Show_Lengthy_Divergence=true;
   if(StringSubstr(bool_Input_EA,20,1)=="0")
      Show_Lengthy_Divergence=false;

   if(StringSubstr(bool_Input_EA,21,1)=="1")
      RSI_Filter_Lengthy=true;
   if(StringSubstr(bool_Input_EA,21,1)=="0")
      RSI_Filter_Lengthy=false;

   if(StringSubstr(bool_Input_EA,22,1)=="1")
      Candle_Confirmations_LONG_Lengthy=true;
   if(StringSubstr(bool_Input_EA,22,1)=="0")
      Candle_Confirmations_LONG_Lengthy=false;

   if(StringSubstr(bool_Input_EA,23,1)=="1")
      Candle_Confirmations_SHORT_Lengthy=true;
   if(StringSubstr(bool_Input_EA,23,1)=="0")
      Candle_Confirmations_SHORT_Lengthy=false;

   if(StringSubstr(bool_Input_EA,24,1)=="1")
      Confirmation_candle_Breakout_LONG_Lengthy=true;
   if(StringSubstr(bool_Input_EA,24,1)=="0")
      Confirmation_candle_Breakout_LONG_Lengthy=false;

   if(StringSubstr(bool_Input_EA,25,1)=="1")
      Confirmation_candle_Breakout_SHORT_Lengthy=true;
   if(StringSubstr(bool_Input_EA,25,1)=="0")
      Confirmation_candle_Breakout_SHORT_Lengthy=false;

   if(StringSubstr(bool_Input_EA,26,1)=="1")
      Bullish_Hammer_Lengthy=true;
   if(StringSubstr(bool_Input_EA,26,1)=="0")
      Bullish_Hammer_Lengthy=false;

   if(StringSubstr(bool_Input_EA,27,1)=="1")
      Bullish_Inverted_Hammer_Lengthy=true;
   if(StringSubstr(bool_Input_EA,27,1)=="0")
      Bullish_Inverted_Hammer_Lengthy=false;

   if(StringSubstr(bool_Input_EA,28,1)=="1")
      Bearish_Hammer_Lengthy=true;
   if(StringSubstr(bool_Input_EA,28,1)=="0")
      Bearish_Hammer_Lengthy=false;

   if(StringSubstr(bool_Input_EA,29,1)=="1")
      Bearish_Inverted_Hammer_Lengthy=true;
   if(StringSubstr(bool_Input_EA,29,1)=="0")
      Bearish_Inverted_Hammer_Lengthy=false;

   if(StringSubstr(bool_Input_EA,30,1)=="1")
      Bullish_Engulfing_Lengthy=true;
   if(StringSubstr(bool_Input_EA,30,1)=="0")
      Bullish_Engulfing_Lengthy=false;

   if(StringSubstr(bool_Input_EA,31,1)=="1")
      Bearish_Engulfing_Lengthy=true;
   if(StringSubstr(bool_Input_EA,31,1)=="0")
      Bearish_Engulfing_Lengthy=false;

   if(StringSubstr(bool_Input_EA,32,1)=="1")
      Piercing_Candle_Lengthy=true;
   if(StringSubstr(bool_Input_EA,32,1)=="0")
      Piercing_Candle_Lengthy=false;

   if(StringSubstr(bool_Input_EA,33,1)=="1")
      Dark_Cloud_Cover_Lengthy=true;
   if(StringSubstr(bool_Input_EA,33,1)=="0")
      Dark_Cloud_Cover_Lengthy=false;

   if(StringSubstr(bool_Input_EA,34,1)=="1")
      Bullish_Sash_Lengthy=true;
   if(StringSubstr(bool_Input_EA,34,1)=="0")
      Bullish_Sash_Lengthy=false;

   if(StringSubstr(bool_Input_EA,35,1)=="1")
      Bearish_Sash_Lengthy=true;
   if(StringSubstr(bool_Input_EA,35,1)=="0")
      Bearish_Sash_Lengthy=false;

   if(StringSubstr(bool_Input_EA,36,1)=="1")
      Morning_Star_Lengthy=true;
   if(StringSubstr(bool_Input_EA,36,1)=="0")
      Morning_Star_Lengthy=false;

   if(StringSubstr(bool_Input_EA,37,1)=="1")
      Evening_Star_Lengthy=true;
   if(StringSubstr(bool_Input_EA,37,1)=="0")
      Evening_Star_Lengthy=false;

  }

void FIB_EA_INPUT()
  {

   Entry_2_LONG                     =StringToDouble(StringSubstr(FIBB,0,5));
   Stop_Loss_Pips_GAP_LONG                     =StringToDouble(StringSubstr(FIBB,5,3));
   Entery_Point_GAP_LONG                        =StringToDouble(StringSubstr(FIBB,8,3));
   Entery2_Point_GAP_LONG                        =StringToDouble(StringSubstr(FIBB,11,3));
   Take_Profit_GAP_161_8_LONG                          =StringToDouble(StringSubstr(FIBB,14,3));
   Take_Profit_GAP_261_8_LONG                         =StringToDouble(StringSubstr(FIBB,17,3));
   Take_Profit_GAP_423_6_LONG                          =StringToDouble(StringSubstr(FIBB,20,3));
   Take_Profit_GAP_847_0_LONG                          =StringToDouble(StringSubstr(FIBB,23,3));
   Entry_2_SHORT                     =StringToDouble(StringSubstr(FIBB,26,5));
   Stop_Loss_Pips_GAP_SHORT                      =StringToDouble(StringSubstr(FIBB,31,3));
   Entery_Point_GAP_SHORT                       =StringToDouble(StringSubstr(FIBB,34,3));
   Entery2_Point_GAP_SHORT                       =StringToDouble(StringSubstr(FIBB,37,3));
   Take_Profit_GAP_161_8_SHORT                         =StringToDouble(StringSubstr(FIBB,40,3));
   Take_Profit_GAP_261_8_SHORT                        =StringToDouble(StringSubstr(FIBB,43,3));
   Take_Profit_GAP_423_6_SHORT                         =StringToDouble(StringSubstr(FIBB,46,3));
   Take_Profit_GAP_847_0_SHORT                         =StringToDouble(StringSubstr(FIBB,49,3));

   Entry_2_Lengthy_LONG                    =StringToDouble(StringSubstr(FIBBL,0,5));
   Stop_Loss_Pips_GAP_Lengthy_LONG                     =StringToDouble(StringSubstr(FIBBL,5,3));
   Entery_Point_GAP_Lengthy_LONG                        =StringToDouble(StringSubstr(FIBBL,8,3));
   Entery2_Point_GAP_Lengthy_LONG                        =StringToDouble(StringSubstr(FIBBL,11,3));
   Take_Profit_GAP_161_8_Lengthy_LONG                          =StringToDouble(StringSubstr(FIBBL,14,3));
   Take_Profit_GAP_261_8_Lengthy_LONG                         =StringToDouble(StringSubstr(FIBBL,17,3));
   Take_Profit_GAP_423_6_Lengthy_LONG                          =StringToDouble(StringSubstr(FIBBL,20,3));
   Take_Profit_GAP_847_0_Lengthy_LONG                          =StringToDouble(StringSubstr(FIBBL,23,3));
   Entry_2_Lengthy_SHORT                     =StringToDouble(StringSubstr(FIBBL,26,5));
   Stop_Loss_Pips_GAP_Lengthy_SHORT                      =StringToDouble(StringSubstr(FIBBL,31,3));

   Entery_Point_GAP_Lengthy_SHORT                       =StringToDouble(StringSubstr(FIBBL,34,3));
   Entery2_Point_GAP_Lengthy_SHORT                       =StringToDouble(StringSubstr(FIBBL,37,3));
   Take_Profit_GAP_161_8_Lengthy_SHORT                         =StringToDouble(StringSubstr(FIBBL,40,3));
   Take_Profit_GAP_261_8_Lengthy_SHORT                        =StringToDouble(StringSubstr(FIBBL,43,3));
   Take_Profit_GAP_423_6_Lengthy_SHORT                         =StringToDouble(StringSubstr(FIBBL,46,3));
   Take_Profit_GAP_847_0_Lengthy_SHORT                         =StringToDouble(StringSubstr(FIBBL,49,3));
  }

void CANDLE_PATTERN_EA_INPUT()
  {


   Morning_Star_Candle_1_Body_Size_Minimum=StringToDouble(StringSubstr(PCIN1,0,6));
   Morning_Star_Candle_2_Body_Size_Maximum=StringToDouble(StringSubstr(PCIN1,6,6));
   Morning_Star_Candle_2_Body_Top_Wick_Size_Maximum=StringToDouble(StringSubstr(PCIN1,12,6));
   Morning_Star_Candle_2_Body_Bottom_Wick_Size_Maximum=StringToDouble(StringSubstr(PCIN1,18,6));
   Morning_Star_Candle_3_Body_Size_Minimum =StringToDouble(StringSubstr(PCIN1,24,6));

   Evening_Star_Candle_1_Body_Size_Minimum=StringToDouble(StringSubstr(PCIN1,30,6));
   Evening_Star_Candle_2_Body_Size_Maximum=StringToDouble(StringSubstr(PCIN1,36,6));
   Evening_Star_Candle_2_Body_Top_Wick_Size_Maximum=StringToDouble(StringSubstr(PCIN1,42,6));
   Evening_Star_Candle_2_Body_Bottom_Wick_Size_Maximum=StringToDouble(StringSubstr(PCIN1,48,6));
   Evening_Star_Candle_3_Body_Size_Minimum =StringToDouble(StringSubstr(PCIN1,54,6));

   Bullish_Sash_Bottom_Wick_Size_Maximum_1_Time     =StringToDouble(StringSubstr(PCIN2,0,6));
   Bearish_Sash_Top_Wick_Size_Maximum_1_Time     =StringToDouble(StringSubstr(PCIN2,6,6));
   Bullish_Engulfing_Top_Wick_Size_Maximum_1_Time     =StringToDouble(StringSubstr(PCIN2,12,6));
   Bullish_Engulfing_Bottom_Wick_Size_Maximum_1_Time     =StringToDouble(StringSubstr(PCIN2,18,6));
   Bearish_Engulfing_Top_Wick_Size_Maximum_1_Time     =StringToDouble(StringSubstr(PCIN2,24,6));
   Bearish_Engulfing_Bottom_Wick_Size_Maximum_1_Time     =StringToDouble(StringSubstr(PCIN2,30,6));
   Piercing_Candle_Top_Wick_Size_Maximum_1_Time     =StringToDouble(StringSubstr(PCIN2,36,6));
   Piercing_Candle_Bottom_Wick_Size_Maximum_1_Time     =StringToDouble(StringSubstr(PCIN2,42,6));
   Piercing_Candle_Pierce_Factor_Minimum_100_Percentage     =StringToDouble(StringSubstr(PCIN2,48,6));
   Dark_Cloud_Cover_Top_Wick_Size_Maximum_1_Time     =StringToDouble(StringSubstr(PCIN2,54,6));
   Dark_Cloud_Cover_Bottom_Wick_Size_Maximum_1_Time     =StringToDouble(StringSubstr(PCIN3,0,6));
   Dark_Cloud_Cover_Pierce_Factor_Minimum_100_Percentage     =StringToDouble(StringSubstr(PCIN3,6,6));
   Bullish_Hammer_Bottom_Wick_Size_Minimum_2_Time =StringToDouble(StringSubstr(PCIN3,12,6));
   Bullish_Hammer_Top_Wick_Size_Maximum_1_Time     =StringToDouble(StringSubstr(PCIN3,18,6));
   Bearish_Hammer_Bottom_Wick_Size_Maximum_1_Time  =StringToDouble(StringSubstr(PCIN3,24,6));
   Bearish_Hammer_Top_Wick_Size_Minimum_2_Time     =StringToDouble(StringSubstr(PCIN3,30,6));
   Bullish_Inverted_Hammer_Bottom_Wick_Size_Maximum_1_Time  =StringToDouble(StringSubstr(PCIN3,36,6));
   Bullish_Inverted_Hammer_Top_Wick_Size_Minimum_2_Time     =StringToDouble(StringSubstr(PCIN3,42,6));
   Bearish_Inverted_Hammer_Bottom_Wick_Size_Minimum_2_Time  =StringToDouble(StringSubstr(PCIN3,48,6));
   Bearish_Inverted_Hammer_Top_Wick_Size_Maximum_1_Time     =StringToDouble(StringSubstr(PCIN3,54,6));

   Morning_Star_Candle_1_Body_Size_Minimum_Lengthy=StringToDouble(StringSubstr(PCINL1,0,6));
   Morning_Star_Candle_2_Body_Size_Maximum_Lengthy=StringToDouble(StringSubstr(PCINL1,6,6));
   Morning_Star_Candle_2_Body_Top_Wick_Size_Maximum_Lengthy=StringToDouble(StringSubstr(PCINL1,12,6));
   Morning_Star_Candle_2_Body_Bottom_Wick_Size_Maximum_Lengthy=StringToDouble(StringSubstr(PCINL1,18,6));
   Morning_Star_Candle_3_Body_Size_Minimum_Lengthy =StringToDouble(StringSubstr(PCINL1,24,6));

   Evening_Star_Candle_1_Body_Size_Minimum_Lengthy=StringToDouble(StringSubstr(PCINL1,30,6));
   Evening_Star_Candle_2_Body_Size_Maximum_Lengthy=StringToDouble(StringSubstr(PCINL1,36,6));
   Evening_Star_Candle_2_Body_Top_Wick_Size_Maximum_Lengthy=StringToDouble(StringSubstr(PCINL1,42,6));
   Evening_Star_Candle_2_Body_Bottom_Wick_Size_Maximum_Lengthy=StringToDouble(StringSubstr(PCINL1,48,6));
   Evening_Star_Candle_3_Body_Size_Minimum_Lengthy =StringToDouble(StringSubstr(PCINL1,54,6));
   Bullish_Sash_Bottom_Wick_Size_Maximum_1_Time_Lengthy     =StringToDouble(StringSubstr(PCINL2,0,6));
   Bearish_Sash_Top_Wick_Size_Maximum_1_Time_Lengthy     =StringToDouble(StringSubstr(PCINL2,6,6));
   Bullish_Engulfing_Top_Wick_Size_Maximum_1_Time_Lengthy      =StringToDouble(StringSubstr(PCINL2,12,6));
   Bullish_Engulfing_Bottom_Wick_Size_Maximum_1_Time_Lengthy      =StringToDouble(StringSubstr(PCINL2,18,6));
   Bearish_Engulfing_Top_Wick_Size_Maximum_1_Time_Lengthy      =StringToDouble(StringSubstr(PCINL2,24,6));
   Bearish_Engulfing_Bottom_Wick_Size_Maximum_1_Time_Lengthy      =StringToDouble(StringSubstr(PCINL2,30,6));
   Piercing_Candle_Top_Wick_Size_Maximum_1_Time_Lengthy      =StringToDouble(StringSubstr(PCINL2,36,6));
   Piercing_Candle_Bottom_Wick_Size_Maximum_1_Time_Lengthy      =StringToDouble(StringSubstr(PCINL2,42,6));
   Piercing_Candle_Pierce_Factor_Minimum_100_Percentage_Lengthy      =StringToDouble(StringSubstr(PCINL2,48,6));
   Dark_Cloud_Cover_Top_Wick_Size_Maximum_1_Time_Lengthy      =StringToDouble(StringSubstr(PCINL2,54,6));
   Dark_Cloud_Cover_Bottom_Wick_Size_Maximum_1_Time_Lengthy      =StringToDouble(StringSubstr(PCINL3,0,6));
   Dark_Cloud_Cover_Pierce_Factor_Minimum_100_Percentage_Lengthy      =StringToDouble(StringSubstr(PCINL3,6,6));
   Bullish_Hammer_Bottom_Wick_Size_Minimum_2_Time_Lengthy  =StringToDouble(StringSubstr(PCINL3,12,6));
   Bullish_Hammer_Top_Wick_Size_Maximum_1_Time_Lengthy      =StringToDouble(StringSubstr(PCINL3,18,6));
   Bearish_Hammer_Bottom_Wick_Size_Maximum_1_Time_Lengthy   =StringToDouble(StringSubstr(PCINL3,24,6));
   Bearish_Hammer_Top_Wick_Size_Minimum_2_Time_Lengthy      =StringToDouble(StringSubstr(PCINL3,30,6));
   Bullish_Inverted_Hammer_Bottom_Wick_Size_Maximum_1_Time_Lengthy   =StringToDouble(StringSubstr(PCINL3,36,6));
   Bullish_Inverted_Hammer_Top_Wick_Size_Minimum_2_Time_Lengthy      =StringToDouble(StringSubstr(PCINL3,42,6));
   Bearish_Inverted_Hammer_Bottom_Wick_Size_Minimum_2_Time_Lengthy   =StringToDouble(StringSubstr(PCINL3,48,6));
   Bearish_Inverted_Hammer_Top_Wick_Size_Maximum_1_Time_Lengthy      =StringToDouble(StringSubstr(PCINL3,54,6));
  }

string Jason_DIV_TYPE()
  {

   string TMM;
   string jason1 = "{\"N1\": { \"Divergence\": \""+DIV_TYPE+"\", }}";

   JSONParser *parser = new JSONParser();

   JSONValue *jv = parser.parse(jason1);

   if(jv == NULL)
     {
      Print("error:"+(string)parser.getErrorCode()+parser.getErrorMessage());
     }
   else
     {


   

      if(jv.isObject())   
        {

         JSONObject *jo = jv;


         JSONIterator *it = new JSONIterator(jo);
         string M1;
         for(; it.hasNext() ; it.next())
           {
               
            M1=M1+"\n"+it.val().toString();
        
           }
         string M2=StringSubstr(M1, 2,StringLen(M1)-3);
         string M3=StringSubstr(M2, 0,StringLen("Divergence")+4);
         string M4=StringSubstr(M2, StringLen(M3)+2,StringLen(M2)-3);
         string M5=StringSubstr(M4, 0,StringLen(M4)-1);
         string MMM=M1+"\n"+M2+"\n"+M3+"\n"+M4+"\n"+M5;
         string XM=M3+M5+",";
         string XM2=M2+",";
         TMM=XM2;
         delete it;
        }
      delete jv;
     }
   delete parser;

   return(TMM);
  }

string Jason_NAME()
  {

   string TMM;
   string jason1 = "{\"N1\": { \"Name\": \""+PN+"\", }}";

   JSONParser *parser = new JSONParser();

   JSONValue *jv = parser.parse(jason1);

   if(jv == NULL)
     {
      Print("error:"+(string)parser.getErrorCode()+parser.getErrorMessage());
     }
   else
     {


     

      if(jv.isObject())    
        {

         JSONObject *jo = jv;

        

         JSONIterator *it = new JSONIterator(jo);
         string M1;
         for(; it.hasNext() ; it.next())
           {
      
            M1=M1+"\n"+it.val().toString();
      
           }
         string M2=StringSubstr(M1, 2,StringLen(M1)-3);
         string M3=StringSubstr(M2, 0,StringLen("Name")+4);
         string M4=StringSubstr(M2, StringLen(M3)+2,StringLen(M2)-3);
         string M5=StringSubstr(M4, 0,StringLen(M4)-1);
         string MMM=M1+"\n"+M2+"\n"+M3+"\n"+M4+"\n"+M5;
         string XM=M3+M5+",";
         string XM2=M2+",";
         TMM=XM2;
         delete it;
        }
      delete jv;
     }
   delete parser;

   return(TMM);
  }





string Jason_Symbol()
  {
   string TMM;


   string jason2 = "{\"N2\": { \"Symbol\": \""+Symbol()+"\", }}";

   JSONParser *parser = new JSONParser();

   JSONValue *jv = parser.parse(jason2);

   if(jv == NULL)
     {
      Print("error:"+(string)parser.getErrorCode()+parser.getErrorMessage());
     }
   else
     {


     

      if(jv.isObject())    
        {

         JSONObject *jo = jv;

        
       
         JSONIterator *it = new JSONIterator(jo);
         string M1;
         for(; it.hasNext() ; it.next())
           {
      
            M1=M1+"\n"+it.val().toString();
         
           }
         string M2=StringSubstr(M1, 2,StringLen(M1)-3);
         string M3=StringSubstr(M2, 0,StringLen("Symbol")+4);
         string M4=StringSubstr(M2, StringLen(M3)+2,StringLen(M2)-3);
         string M5=StringSubstr(M4, 0,StringLen(M4)-1);
         string MMM=M1+"\n"+M2+"\n"+M3+"\n"+M4+"\n"+M5;
         string XM=M3+M5+",";
         string XM2=M2+",";
         TMM=XM2;
         delete it;
        }
      delete jv;
     }
   delete parser;

   return(TMM);
  }

string Jason_Period()
  {
   string TMM;

   string TPeriod;
   switch(Period())
     {
      case 1:
         TPeriod="00:01:00";
         break;
      case 5:
         TPeriod="00:05:00";
         break;
      case 15:
         TPeriod="00:15:00";
         break;
      case 30:
         TPeriod="00:30:00";
         break;
      case 60:
         TPeriod="01:00:00";
         break;
      case 240:
         TPeriod="04:00:00";
         break;
      case 1440:
         TPeriod="24:00:00";
         break;
      case 10080:
         TPeriod="Weelky";
         break;
      case 43200:
         TPeriod="Monthly";
         break;
     }
   string jason3 = "{\"N3\": { \"Period\": \""+TPeriod+"\", }}";

   JSONParser *parser = new JSONParser();

   JSONValue *jv = parser.parse(jason3);

   if(jv == NULL)
     {
      Print("error:"+(string)parser.getErrorCode()+parser.getErrorMessage());
     }
   else
     {


     

      if(jv.isObject())    
        {

         JSONObject *jo = jv;

        

         JSONIterator *it = new JSONIterator(jo);
         string M1;
         for(; it.hasNext() ; it.next())
           {

            M1=M1+"\n"+it.val().toString();
        
           }
         string M2=StringSubstr(M1, 2,StringLen(M1)-3);
         string M3=StringSubstr(M2, 0,StringLen("Period")+4);
         string M4=StringSubstr(M2, StringLen(M3)+2,StringLen(M2)-3);
         string M5=StringSubstr(M4, 0,StringLen(M4)-1);
         string MMM=M1+"\n"+M2+"\n"+M3+"\n"+M4+"\n"+M5;
         string XM=M3+M5+",";
         string XM2=M2+",";
         TMM=XM2;
         delete it;
        }
      delete jv;
     }
   delete parser;

   return(TMM);
  }

string Jason_Mode()
  {
   string TMM;


   string jason3 = "{\"N3\": { \"Mode\": \""+Sig_S+"\", }}";

   JSONParser *parser = new JSONParser();

   JSONValue *jv = parser.parse(jason3);

   if(jv == NULL)
     {
      Print("error:"+(string)parser.getErrorCode()+parser.getErrorMessage());
     }
   else
     {


     

      if(jv.isObject())    
        {

         JSONObject *jo = jv;

        
        
         JSONIterator *it = new JSONIterator(jo);
         string M1;
         for(; it.hasNext() ; it.next())
           {
          
            M1=M1+"\n"+it.val().toString();
            
           }
         string M2=StringSubstr(M1, 2,StringLen(M1)-3);
         string M3=StringSubstr(M2, 0,StringLen("Mode")+4);
         string M4=StringSubstr(M2, StringLen(M3)+2,StringLen(M2)-3);
         string M5=StringSubstr(M4, 0,StringLen(M4)-1);
         string MMM=M1+"\n"+M2+"\n"+M3+"\n"+M4+"\n"+M5;
         string XM=M3+M5+",";
         string XM2=M2+",";
         TMM=XM2;
         delete it;
        }
      delete jv;
     }
   delete parser;

   return(TMM);
  }

string Jason_SL()
  {
   string TMM;


   string jason3 = "{\"N3\": { \"SL\": \""+DoubleToString(SL_S,MarketInfo(Symbol(),MODE_DIGITS))+"\", }}";

   JSONParser *parser = new JSONParser();

   JSONValue *jv = parser.parse(jason3);

   if(jv == NULL)
     {
      Print("error:"+(string)parser.getErrorCode()+parser.getErrorMessage());
     }
   else
     {


     

      if(jv.isObject())    
        {

         JSONObject *jo = jv;

        
        
         JSONIterator *it = new JSONIterator(jo);
         string M1;
         for(; it.hasNext() ; it.next())
           {
         
            M1=M1+"\n"+it.val().toString();
       
           }
         string M2=StringSubstr(M1, 2,StringLen(M1)-3);
         string M3=StringSubstr(M2, 0,StringLen("SL")+4);
         string M4=StringSubstr(M2, StringLen(M3)+2,StringLen(M2)-3);
         string M5=StringSubstr(M4, 0,StringLen(M4)-1);
         string MMM=M1+"\n"+M2+"\n"+M3+"\n"+M4+"\n"+M5;
         string XM=M3+M5+",";
         string XM2=M2+",";
         TMM=XM;
         delete it;
        }
      delete jv;
     }
   delete parser;

   return(TMM);
  }

string Jason_EN1()
  {
   string TMM;


   string jason3 = "{\"N3\": { \"EN1\": \""+DoubleToString(EP_S,MarketInfo(Symbol(),MODE_DIGITS))+"\", }}";

   JSONParser *parser = new JSONParser();

   JSONValue *jv = parser.parse(jason3);

   if(jv == NULL)
     {
      Print("error:"+(string)parser.getErrorCode()+parser.getErrorMessage());
     }
   else
     {


     

      if(jv.isObject())    
        {

         JSONObject *jo = jv;

        
         
         
         

        
         

         
         JSONIterator *it = new JSONIterator(jo);
         string M1;
         for(; it.hasNext() ; it.next())
           {
          
            M1=M1+"\n"+it.val().toString();
        
           }
         string M2=StringSubstr(M1, 2,StringLen(M1)-3);
         string M3=StringSubstr(M2, 0,StringLen("EN1")+4);
         string M4=StringSubstr(M2, StringLen(M3)+2,StringLen(M2)-3);
         string M5=StringSubstr(M4, 0,StringLen(M4)-1);
         string MMM=M1+"\n"+M2+"\n"+M3+"\n"+M4+"\n"+M5;
         string XM=M3+M5+",";
         string XM2=M2+",";
         TMM=XM;
         delete it;
        }
      delete jv;
     }
   delete parser;

   return(TMM);
  }

string Jason_EN1Lot()
  {
   string TMM;


   string jason3 = "{\"N3\": { \"EN1Lot\": \""+DoubleToString(lot_En1,2)+"\", }}";

   JSONParser *parser = new JSONParser();

   JSONValue *jv = parser.parse(jason3);

   if(jv == NULL)
     {
      Print("error:"+(string)parser.getErrorCode()+parser.getErrorMessage());
     }
   else
     {


     

      if(jv.isObject())    
        {

         JSONObject *jo = jv;

        
      
         
         

    
         

         
         JSONIterator *it = new JSONIterator(jo);
         string M1;
         for(; it.hasNext() ; it.next())
           {
          
            M1=M1+"\n"+it.val().toString();
      
           }
         string M2=StringSubstr(M1, 2,StringLen(M1)-3);
         string M3=StringSubstr(M2, 0,StringLen("EN1_Lot")+4);
         string M4=StringSubstr(M2, StringLen(M3)+2,StringLen(M2)-3);
         string M5=StringSubstr(M4, 0,StringLen(M4)-1);
         string MMM=M1+"\n"+M2+"\n"+M3+"\n"+M4+"\n"+M5;
         string XM=M3+M5+",";
         string XM2=M2+",";
         TMM=XM;
         delete it;
        }
      delete jv;
     }
   delete parser;

   return(TMM);
  }

string Jason_EN2()
  {
   string TMM;


   string jason3 = "{\"N3\": { \"EN2\": \""+DoubleToString(EP2_S,MarketInfo(Symbol(),MODE_DIGITS))+"\", }}";

   JSONParser *parser = new JSONParser();

   JSONValue *jv = parser.parse(jason3);

   if(jv == NULL)
     {
      Print("error:"+(string)parser.getErrorCode()+parser.getErrorMessage());
     }
   else
     {


     

      if(jv.isObject())    
        {

         JSONObject *jo = jv;

        
      
         
         

        
         

         
         JSONIterator *it = new JSONIterator(jo);
         string M1;
         for(; it.hasNext() ; it.next())
           {
        
            M1=M1+"\n"+it.val().toString();
        
           }
         string M2=StringSubstr(M1, 2,StringLen(M1)-3);
         string M3=StringSubstr(M2, 0,StringLen("EN2")+4);
         string M4=StringSubstr(M2, StringLen(M3)+2,StringLen(M2)-3);
         string M5=StringSubstr(M4, 0,StringLen(M4)-1);
         string MMM=M1+"\n"+M2+"\n"+M3+"\n"+M4+"\n"+M5;
         string XM=M3+M5+",";
         string XM2=M2+",";
         TMM=XM;
         delete it;
        }
      delete jv;
     }
   delete parser;

   return(TMM);
  }

string Jason_EN2Lot()
  {
   string TMM;


   string jason3 = "{\"N3\": { \"EN2Lot\": \""+DoubleToString(lot_En2,2)+"\", }}";

   JSONParser *parser = new JSONParser();

   JSONValue *jv = parser.parse(jason3);

   if(jv == NULL)
     {
      Print("error:"+(string)parser.getErrorCode()+parser.getErrorMessage());
     }
   else
     {


     

      if(jv.isObject())    
        {

         JSONObject *jo = jv;

        
   
         
         

      
         

         
         JSONIterator *it = new JSONIterator(jo);
         string M1;
         for(; it.hasNext() ; it.next())
           {
         
            M1=M1+"\n"+it.val().toString();
         
           }
         string M2=StringSubstr(M1, 2,StringLen(M1)-3);
         string M3=StringSubstr(M2, 0,StringLen("EN2_Lot")+4);
         string M4=StringSubstr(M2, StringLen(M3)+2,StringLen(M2)-3);
         string M5=StringSubstr(M4, 0,StringLen(M4)-1);
         string MMM=M1+"\n"+M2+"\n"+M3+"\n"+M4+"\n"+M5;
         string XM=M3+M5+",";
         string XM2=M2+",";
         TMM=XM;
         delete it;
        }
      delete jv;
     }
   delete parser;

   return(TMM);
  }

string Jason_Tr1()
  {
   string TMM;


   string jason3 = "{\"N3\": { \"TP1\": \""+DoubleToString(tr1_S,MarketInfo(Symbol(),MODE_DIGITS))+"\", }}";

   JSONParser *parser = new JSONParser();

   JSONValue *jv = parser.parse(jason3);

   if(jv == NULL)
     {
      Print("error:"+(string)parser.getErrorCode()+parser.getErrorMessage());
     }
   else
     {


     

      if(jv.isObject())    
        {

         JSONObject *jo = jv;

    
         
         

     

         
         JSONIterator *it = new JSONIterator(jo);
         string M1;
         for(; it.hasNext() ; it.next())
           {
   
            M1=M1+"\n"+it.val().toString();
     
           }
         string M2=StringSubstr(M1, 2,StringLen(M1)-3);
         string M3=StringSubstr(M2, 0,StringLen("TP1")+4);
         string M4=StringSubstr(M2, StringLen(M3)+2,StringLen(M2)-3);
         string M5=StringSubstr(M4, 0,StringLen(M4)-1);
         string MMM=M1+"\n"+M2+"\n"+M3+"\n"+M4+"\n"+M5;
         string XM=M3+M5+",";
         string XM2=M2+",";
         TMM=XM;
         delete it;
        }
      delete jv;
     }
   delete parser;

   return(TMM);
  }

string Jason_Tr2()
  {
   string TMM;


   string jason3 = "{\"N3\": { \"TP2\": \""+DoubleToString(tr2_S,MarketInfo(Symbol(),MODE_DIGITS))+"\", }}";

   JSONParser *parser = new JSONParser();

   JSONValue *jv = parser.parse(jason3);

   if(jv == NULL)
     {
      Print("error:"+(string)parser.getErrorCode()+parser.getErrorMessage());
     }
   else
     {


     

      if(jv.isObject())    
        {

         JSONObject *jo = jv;

        
  
         

         
         JSONIterator *it = new JSONIterator(jo);
         string M1;
         for(; it.hasNext() ; it.next())
           {
  
            M1=M1+"\n"+it.val().toString();
 
           }
         string M2=StringSubstr(M1, 2,StringLen(M1)-3);
         string M3=StringSubstr(M2, 0,StringLen("TP2")+4);
         string M4=StringSubstr(M2, StringLen(M3)+2,StringLen(M2)-3);
         string M5=StringSubstr(M4, 0,StringLen(M4)-1);
         string MMM=M1+"\n"+M2+"\n"+M3+"\n"+M4+"\n"+M5;
         string XM=M3+M5+",";
         string XM2=M2+",";
         TMM=XM;
         delete it;
        }
      delete jv;
     }
   delete parser;

   return(TMM);
  }

string Jason_Tr3()
  {
   string TMM;


   string jason3 = "{\"N3\": { \"TP3\": \""+DoubleToString(tr3_S,MarketInfo(Symbol(),MODE_DIGITS))+"\", }}";

   JSONParser *parser = new JSONParser();

   JSONValue *jv = parser.parse(jason3);

   if(jv == NULL)
     {
      Print("error:"+(string)parser.getErrorCode()+parser.getErrorMessage());
     }
   else
     {


     

      if(jv.isObject())    
        {

         JSONObject *jo = jv;

         

         
         JSONIterator *it = new JSONIterator(jo);
         string M1;
         for(; it.hasNext() ; it.next())
           {
   
            M1=M1+"\n"+it.val().toString();
       
           }
         string M2=StringSubstr(M1, 2,StringLen(M1)-3);
         string M3=StringSubstr(M2, 0,StringLen("TP3")+4);
         string M4=StringSubstr(M2, StringLen(M3)+2,StringLen(M2)-3);
         string M5=StringSubstr(M4, 0,StringLen(M4)-1);
         string MMM=M1+"\n"+M2+"\n"+M3+"\n"+M4+"\n"+M5;
         string XM=M3+M5+",";
         string XM2=M2+",";
         TMM=XM;
         delete it;
        }
      delete jv;
     }
   delete parser;

   return(TMM);
  }

string Jason_Tr4()
  {
   string TMM;


   string jason3 = "{\"N3\": { \"TP4\": \""+DoubleToString(tr4_S,MarketInfo(Symbol(),MODE_DIGITS))+"\", }}";

   JSONParser *parser = new JSONParser();

   JSONValue *jv = parser.parse(jason3);

   if(jv == NULL)
     {
      Print("error:"+(string)parser.getErrorCode()+parser.getErrorMessage());
     }
   else
     {


     

      if(jv.isObject())    
        {

         JSONObject *jo = jv;



         
         JSONIterator *it = new JSONIterator(jo);
         string M1;
         for(; it.hasNext() ; it.next())
           {
       
            M1=M1+"\n"+it.val().toString();
     
           }
         string M2=StringSubstr(M1, 2,StringLen(M1)-3);
         string M3=StringSubstr(M2, 0,StringLen("TP3")+4);
         string M4=StringSubstr(M2, StringLen(M3)+2,StringLen(M2)-3);
         string M5=StringSubstr(M4, 0,StringLen(M4)-1);
         string MMM=M1+"\n"+M2+"\n"+M3+"\n"+M4+"\n"+M5;
         string XM=M3+M5+",";
         string XM2=M2+",";
         TMM=XM;
         delete it;
        }
      delete jv;
     }
   delete parser;

   return(TMM);
  }

string Jason_SE1()
  {
   string TMM;


   string jason3 = "{\"N3\": { \"SLEN1\": \""+DoubleToString(SE1D,1)+"\", }}";

   JSONParser *parser = new JSONParser();

   JSONValue *jv = parser.parse(jason3);

   if(jv == NULL)
     {
      Print("error:"+(string)parser.getErrorCode()+parser.getErrorMessage());
     }
   else
     {


     

      if(jv.isObject())    
        {

         JSONObject *jo = jv;

        
   

         
         JSONIterator *it = new JSONIterator(jo);
         string M1;
         for(; it.hasNext() ; it.next())
           {
   
            M1=M1+"\n"+it.val().toString();
     
           }
         string M2=StringSubstr(M1, 2,StringLen(M1)-3);
         string M3=StringSubstr(M2, 0,StringLen("SL_EN1")+4);
         string M4=StringSubstr(M2, StringLen(M3)+2,StringLen(M2)-3);
         string M5=StringSubstr(M4, 0,StringLen(M4)-1);
         string MMM=M1+"\n"+M2+"\n"+M3+"\n"+M4+"\n"+M5;
         string XM=M3+M5+",";
         string XM2=M2+",";
         TMM=XM;
         delete it;
        }
      delete jv;
     }
   delete parser;

   return(TMM);
  }

string Jason_SE2()
  {
   string TMM;


   string jason3 = "{\"N3\": { \"SLEN2\": \""+DoubleToString(SE2D,1)+"\", }}";

   JSONParser *parser = new JSONParser();

   JSONValue *jv = parser.parse(jason3);

   if(jv == NULL)
     {
      Print("error:"+(string)parser.getErrorCode()+parser.getErrorMessage());
     }
   else
     {


     

      if(jv.isObject())    
        {

         JSONObject *jo = jv;

        

         

         
         JSONIterator *it = new JSONIterator(jo);
         string M1;
         for(; it.hasNext() ; it.next())
           {
            //            M1=M1+"\n"+"loop:"+it.key()+" = "+it.val().toString();
            M1=M1+"\n"+it.val().toString();
            //  Print("loop:"+it.key()+" = "+it.val().toString());
           }
         string M2=StringSubstr(M1, 2,StringLen(M1)-3);
         string M3=StringSubstr(M2, 0,StringLen("SL_EN2")+4);
         string M4=StringSubstr(M2, StringLen(M3)+2,StringLen(M2)-3);
         string M5=StringSubstr(M4, 0,StringLen(M4)-1);
         string MMM=M1+"\n"+M2+"\n"+M3+"\n"+M4+"\n"+M5;
         string XM=M3+M5+",";
         string XM2=M2+",";
         TMM=XM;
         delete it;
        }
      delete jv;
     }
   delete parser;

   return(TMM);
  }

string Jason_T1E1D()
  {
   string TMM;


   string jason3 = "{\"N3\": { \"TP1EN1\": \""+DoubleToString(T1E1D,1)+"\", }}";

   JSONParser *parser = new JSONParser();

   JSONValue *jv = parser.parse(jason3);

   if(jv == NULL)
     {
      Print("error:"+(string)parser.getErrorCode()+parser.getErrorMessage());
     }
   else
     {


     

      if(jv.isObject())    
        {

         JSONObject *jo = jv;

        


         
         JSONIterator *it = new JSONIterator(jo);
         string M1;
         for(; it.hasNext() ; it.next())
           {

            M1=M1+"\n"+it.val().toString();
       
           }
         string M2=StringSubstr(M1, 2,StringLen(M1)-3);
         string M3=StringSubstr(M2, 0,StringLen("TP1_EN1")+4);
         string M4=StringSubstr(M2, StringLen(M3)+2,StringLen(M2)-3);
         string M5=StringSubstr(M4, 0,StringLen(M4)-1);
         string MMM=M1+"\n"+M2+"\n"+M3+"\n"+M4+"\n"+M5;
         string XM=M3+M5+",";
         string XM2=M2+",";
         TMM=XM;
         delete it;
        }
      delete jv;
     }
   delete parser;

   return(TMM);
  }

string Jason_T1E2D()
  {
   string TMM;

   string jason3 = "{\"N3\": { \"TP1EN2\": \""+DoubleToString(T1E2D,1)+"\", }}";

   JSONParser *parser = new JSONParser();

   JSONValue *jv = parser.parse(jason3);

   if(jv == NULL)
     {
      Print("error:"+(string)parser.getErrorCode()+parser.getErrorMessage());
     }
   else
     {


     

      if(jv.isObject())    
        {

         JSONObject *jo = jv;

        
 

         
         JSONIterator *it = new JSONIterator(jo);
         string M1;
         for(; it.hasNext() ; it.next())
           {
    
            M1=M1+"\n"+it.val().toString();

           }
         string M2=StringSubstr(M1, 2,StringLen(M1)-3);
         string M3=StringSubstr(M2, 0,StringLen("TP1_EN2")+4);
         string M4=StringSubstr(M2, StringLen(M3)+2,StringLen(M2)-3);
         string M5=StringSubstr(M4, 0,StringLen(M4)-1);
         string MMM=M1+"\n"+M2+"\n"+M3+"\n"+M4+"\n"+M5;
         string XM=M3+M5+",";
         string XM2=M2+",";
         TMM=XM;
         delete it;
        }
      delete jv;
     }
   delete parser;

   return(TMM);
  }

string Jason_T2E1D()
  {
   string TMM;


   string jason3 = "{\"N3\": { \"TP2EN1\": \""+DoubleToString(T2E1D,1)+"\", }}";

   JSONParser *parser = new JSONParser();

   JSONValue *jv = parser.parse(jason3);

   if(jv == NULL)
     {
      Print("error:"+(string)parser.getErrorCode()+parser.getErrorMessage());
     }
   else
     {


     

      if(jv.isObject())    
        {

         JSONObject *jo = jv;

   

         
         JSONIterator *it = new JSONIterator(jo);
         string M1;
         for(; it.hasNext() ; it.next())
           {
   
            M1=M1+"\n"+it.val().toString();
        
           }
         string M2=StringSubstr(M1, 2,StringLen(M1)-3);
         string M3=StringSubstr(M2, 0,StringLen("TP2_EN1")+4);
         string M4=StringSubstr(M2, StringLen(M3)+2,StringLen(M2)-3);
         string M5=StringSubstr(M4, 0,StringLen(M4)-1);
         string MMM=M1+"\n"+M2+"\n"+M3+"\n"+M4+"\n"+M5;
         string XM=M3+M5+",";
         string XM2=M2+",";
         TMM=XM;
         delete it;
        }
      delete jv;
     }
   delete parser;

   return(TMM);
  }

string Jason_T2E2D()
  {
   string TMM;


   string jason3 = "{\"N3\": { \"TP2EN2\": \""+DoubleToString(T2E2D,1)+"\", }}";

   JSONParser *parser = new JSONParser();

   JSONValue *jv = parser.parse(jason3);

   if(jv == NULL)
     {
      Print("error:"+(string)parser.getErrorCode()+parser.getErrorMessage());
     }
   else
     {


     

      if(jv.isObject())    
        {

         JSONObject *jo = jv;


         

         
         JSONIterator *it = new JSONIterator(jo);
         string M1;
         for(; it.hasNext() ; it.next())
           {
     
            M1=M1+"\n"+it.val().toString();
      
           }
         string M2=StringSubstr(M1, 2,StringLen(M1)-3);
         string M3=StringSubstr(M2, 0,StringLen("TP2_EN2")+4);
         string M4=StringSubstr(M2, StringLen(M3)+2,StringLen(M2)-3);
         string M5=StringSubstr(M4, 0,StringLen(M4)-1);
         string MMM=M1+"\n"+M2+"\n"+M3+"\n"+M4+"\n"+M5;
         string XM=M3+M5+",";
         string XM2=M2+",";
         TMM=XM;
         delete it;
        }
      delete jv;
     }
   delete parser;

   return(TMM);
  }

string Jason_T3E1D()
  {
   string TMM;


   string jason3 = "{\"N3\": { \"TP3EN1\": \""+DoubleToString(T3E1D,1)+"\", }}";

   JSONParser *parser = new JSONParser();

   JSONValue *jv = parser.parse(jason3);

   if(jv == NULL)
     {
      Print("error:"+(string)parser.getErrorCode()+parser.getErrorMessage());
     }
   else
     {


     

      if(jv.isObject())    
        {

         JSONObject *jo = jv;

        


         
         JSONIterator *it = new JSONIterator(jo);
         string M1;
         for(; it.hasNext() ; it.next())
           {
         
            M1=M1+"\n"+it.val().toString();
       
           }
         string M2=StringSubstr(M1, 2,StringLen(M1)-3);
         string M3=StringSubstr(M2, 0,StringLen("TP3_EN1")+4);
         string M4=StringSubstr(M2, StringLen(M3)+2,StringLen(M2)-3);
         string M5=StringSubstr(M4, 0,StringLen(M4)-1);
         string MMM=M1+"\n"+M2+"\n"+M3+"\n"+M4+"\n"+M5;
         string XM=M3+M5+",";
         string XM2=M2+",";
         TMM=XM;
         delete it;
        }
      delete jv;
     }
   delete parser;

   return(TMM);
  }

string Jason_T3E2D()
  {
   string TMM;


   string jason3 = "{\"N3\": { \"TP3EN2\": \""+DoubleToString(T3E2D,1)+"\", }}";

   JSONParser *parser = new JSONParser();

   JSONValue *jv = parser.parse(jason3);

   if(jv == NULL)
     {
      Print("error:"+(string)parser.getErrorCode()+parser.getErrorMessage());
     }
   else
     {


     

      if(jv.isObject())    
        {

         JSONObject *jo = jv;

        


         
         JSONIterator *it = new JSONIterator(jo);
         string M1;
         for(; it.hasNext() ; it.next())
           {
       
            M1=M1+"\n"+it.val().toString();
     
           }
         string M2=StringSubstr(M1, 2,StringLen(M1)-3);
         string M3=StringSubstr(M2, 0,StringLen("TP3_EN2")+4);
         string M4=StringSubstr(M2, StringLen(M3)+2,StringLen(M2)-3);
         string M5=StringSubstr(M4, 0,StringLen(M4)-1);
         string MMM=M1+"\n"+M2+"\n"+M3+"\n"+M4+"\n"+M5;
         string XM=M3+M5+",";
         string XM2=M2+",";
         TMM=XM;
         delete it;
        }
      delete jv;
     }
   delete parser;

   return(TMM);
  }

string Jason_T4E1D()
  {
   string TMM;


   string jason3 = "{\"N3\": { \"TP4EN1\": \""+DoubleToString(T4E1D,1)+"\", }}";

   JSONParser *parser = new JSONParser();

   JSONValue *jv = parser.parse(jason3);

   if(jv == NULL)
     {
      Print("error:"+(string)parser.getErrorCode()+parser.getErrorMessage());
     }
   else
     {


     

      if(jv.isObject())    
        {

         JSONObject *jo = jv;

        


         
         JSONIterator *it = new JSONIterator(jo);
         string M1;
         for(; it.hasNext() ; it.next())
           {

            M1=M1+"\n"+it.val().toString();
     
           }
         string M2=StringSubstr(M1, 2,StringLen(M1)-3);
         string M3=StringSubstr(M2, 0,StringLen("TP4_EN1")+4);
         string M4=StringSubstr(M2, StringLen(M3)+2,StringLen(M2)-3);
         string M5=StringSubstr(M4, 0,StringLen(M4)-1);
         string MMM=M1+"\n"+M2+"\n"+M3+"\n"+M4+"\n"+M5;
         string XM=M3+M5+",";
         string XM2=M2+",";
         TMM=XM;
         delete it;
        }
      delete jv;
     }
   delete parser;

   return(TMM);
  }

string Jason_T4E2D()
  {
   string TMM;


   string jason3 = "{\"N3\": { \"TP4EN2\": \""+DoubleToString(T4E2D,1)+"\", }}";

   JSONParser *parser = new JSONParser();

   JSONValue *jv = parser.parse(jason3);

   if(jv == NULL)
     {
      Print("error:"+(string)parser.getErrorCode()+parser.getErrorMessage());
     }
   else
     {


     

      if(jv.isObject())    
        {

         JSONObject *jo = jv;

        


         
         JSONIterator *it = new JSONIterator(jo);
         string M1;
         for(; it.hasNext() ; it.next())
           {

            M1=M1+"\n"+it.val().toString();
      
           }
         string M2=StringSubstr(M1, 2,StringLen(M1)-3);
         string M3=StringSubstr(M2, 0,StringLen("TP4_EN2")+4);
         string M4=StringSubstr(M2, StringLen(M3)+2,StringLen(M2)-3);
         string M5=StringSubstr(M4, 0,StringLen(M4)-1);
         string MMM=M1+"\n"+M2+"\n"+M3+"\n"+M4+"\n"+M5;
         string XM=M3+M5+",";
         string XM2=M2+",";
         TMM=XM;
         delete it;
        }
      delete jv;
     }
   delete parser;

   return(TMM);
  }

string Jason_Magic_Number()
  {
   string TMM;


   string jason3 = "{\"N3\": { \"MagicNo\": \""+IntegerToString(Magic_Number)+"\", }}";

   JSONParser *parser = new JSONParser();

   JSONValue *jv = parser.parse(jason3);

   if(jv == NULL)
     {
      Print("error:"+(string)parser.getErrorCode()+parser.getErrorMessage());
     }
   else
     {


     

      if(jv.isObject())    
        {

         JSONObject *jo = jv;

        

         

         
         JSONIterator *it = new JSONIterator(jo);
         string M1;
         for(; it.hasNext() ; it.next())
           {
    
            M1=M1+"\n"+it.val().toString();
           
           }
         string M2=StringSubstr(M1, 2,StringLen(M1)-3);
         string M3=StringSubstr(M2, 0,StringLen("Magic_no")+4);
         string M4=StringSubstr(M2, StringLen(M3)+2,StringLen(M2)-3);
         string M5=StringSubstr(M4, 0,StringLen(M4)-1);
         string MMM=M1+"\n"+M2+"\n"+M3+"\n"+M4+"\n"+M5;
         string XM=M3+M5;
         string XM2=M2+",";
         TMM=XM2;
         delete it;
        }
      delete jv;
     }
   delete parser;

   return(TMM);
  }

void PNFIB_EA_INPUT()
  {
   if(StringSubstr(PNFIBB,0,1)==1)
      Entry_2_LONG=Entry_2_LONG*(-1);

   if(StringSubstr(PNFIBB,1,1)==1)
      Stop_Loss_Pips_GAP_LONG=Stop_Loss_Pips_GAP_LONG*(-1);

   if(StringSubstr(PNFIBB,2,1)==1)
      Entery_Point_GAP_LONG=Entery_Point_GAP_LONG*(-1);

   if(StringSubstr(PNFIBB,3,1)==1)
      Entery2_Point_GAP_LONG=Entery2_Point_GAP_LONG*(-1);

   if(StringSubstr(PNFIBB,4,1)==1)
      Take_Profit_GAP_161_8_LONG=Take_Profit_GAP_161_8_LONG*(-1);

   if(StringSubstr(PNFIBB,5,1)==1)
      Take_Profit_GAP_261_8_LONG=Take_Profit_GAP_261_8_LONG*(-1);

   if(StringSubstr(PNFIBB,6,1)==1)
      Take_Profit_GAP_423_6_LONG=Take_Profit_GAP_423_6_LONG*(-1);

   if(StringSubstr(PNFIBB,7,1)==1)
      Take_Profit_GAP_847_0_LONG=Take_Profit_GAP_847_0_LONG*(-1);

   if(StringSubstr(PNFIBB,8,1)==1)
      Entry_2_SHORT=Entry_2_SHORT*(-1);

   if(StringSubstr(PNFIBB,9,1)==1)
      Stop_Loss_Pips_GAP_SHORT=Stop_Loss_Pips_GAP_SHORT*(-1);

   if(StringSubstr(PNFIBB,10,1)==1)
      Entery_Point_GAP_SHORT=Entery_Point_GAP_SHORT*(-1);

   if(StringSubstr(PNFIBB,11,1)==1)
      Entery2_Point_GAP_SHORT=Entery2_Point_GAP_SHORT*(-1);

   if(StringSubstr(PNFIBB,12,1)==1)
      Take_Profit_GAP_161_8_SHORT=Take_Profit_GAP_161_8_SHORT*(-1);

   if(StringSubstr(PNFIBB,13,1)==1)
      Take_Profit_GAP_261_8_SHORT=Take_Profit_GAP_261_8_SHORT*(-1);

   if(StringSubstr(PNFIBB,14,1)==1)
      Take_Profit_GAP_423_6_SHORT=Take_Profit_GAP_423_6_SHORT*(-1);

   if(StringSubstr(PNFIBB,15,1)==1)
      Take_Profit_GAP_847_0_SHORT=Take_Profit_GAP_847_0_SHORT*(-1);

  }

void PNFIBL_EA_INPUT()
  {
   if(StringSubstr(PNFIBBL,0,1)==1)
      Entry_2_Lengthy_LONG=Entry_2_Lengthy_LONG*(-1);

   if(StringSubstr(PNFIBBL,1,1)==1)
      Stop_Loss_Pips_GAP_Lengthy_LONG=Stop_Loss_Pips_GAP_Lengthy_LONG*(-1);

   if(StringSubstr(PNFIBBL,2,1)==1)
      Entery_Point_GAP_Lengthy_LONG=Entery_Point_GAP_Lengthy_LONG*(-1);

   if(StringSubstr(PNFIBBL,3,1)==1)
      Entery2_Point_GAP_Lengthy_LONG=Entery2_Point_GAP_Lengthy_LONG*(-1);

   if(StringSubstr(PNFIBBL,4,1)==1)
      Take_Profit_GAP_161_8_Lengthy_LONG=Take_Profit_GAP_161_8_Lengthy_LONG*(-1);

   if(StringSubstr(PNFIBBL,5,1)==1)
      Take_Profit_GAP_261_8_Lengthy_LONG=Take_Profit_GAP_261_8_Lengthy_LONG*(-1);

   if(StringSubstr(PNFIBBL,6,1)==1)
      Take_Profit_GAP_423_6_Lengthy_LONG=Take_Profit_GAP_423_6_Lengthy_LONG*(-1);

   if(StringSubstr(PNFIBBL,7,1)==1)
      Take_Profit_GAP_847_0_Lengthy_LONG=Take_Profit_GAP_847_0_Lengthy_LONG*(-1);

   if(StringSubstr(PNFIBBL,8,1)==1)
      Entry_2_Lengthy_SHORT=Entry_2_Lengthy_SHORT*(-1);

   if(StringSubstr(PNFIBBL,9,1)==1)
      Stop_Loss_Pips_GAP_Lengthy_SHORT=Stop_Loss_Pips_GAP_Lengthy_SHORT*(-1);

   if(StringSubstr(PNFIBBL,10,1)==1)
      Entery_Point_GAP_Lengthy_SHORT=Entery_Point_GAP_Lengthy_SHORT*(-1);

   if(StringSubstr(PNFIBBL,11,1)==1)
      Entery2_Point_GAP_Lengthy_SHORT=Entery2_Point_GAP_Lengthy_SHORT*(-1);

   if(StringSubstr(PNFIBBL,12,1)==1)
      Take_Profit_GAP_161_8_Lengthy_SHORT=Take_Profit_GAP_161_8_Lengthy_SHORT*(-1);

   if(StringSubstr(PNFIBBL,13,1)==1)
      Take_Profit_GAP_261_8_Lengthy_SHORT=Take_Profit_GAP_261_8_Lengthy_SHORT*(-1);

   if(StringSubstr(PNFIBBL,14,1)==1)
      Take_Profit_GAP_423_6_Lengthy_SHORT=Take_Profit_GAP_423_6_Lengthy_SHORT*(-1);

   if(StringSubstr(PNFIBBL,15,1)==1)
      Take_Profit_GAP_847_0_Lengthy_SHORT=Take_Profit_GAP_847_0_Lengthy_SHORT*(-1);

  }

void ADX_ZONE_Maker(int i,int A)
  {
   if(Isnewcandle(i))
     {
      White_Z[i]=1;

      if(State_Decide(i)!=PSD)
        {
         NZ=true;
         PSD=State_Decide(i);


        }
      if(State_Decide(i)==1 && Buy_Zone_Enable && ADX_Trend(i)==1)
        {
         Zone_Maker(i,1,Buy_Color);
         Buy_Z[i]=1;
         Sell_Z[i]=0;
         Neutral_Z[i]=0;
         White_Z[i]=0;
         if(i<(A-1))
           {

            Buy_Z[i+1]=1;
            Neutral_Z[i+1]=0;
            Sell_Z[i+1]=0;
            White_Z[i+1]=0;

           }
         if(i<(A-2))
           {


            Buy_Z[i+2]=1;
            Neutral_Z[i+2]=0;
            Sell_Z[i+2]=0;
            White_Z[i+2]=0;

           }
        }
      if(State_Decide(i)==2 &&  Sell_Zone_Enable  && ADX_Trend(i)==1)
        {
         Zone_Maker(i,2, Sell_Color);
         Buy_Z[i]=0;
         Sell_Z[i]=1;
         Neutral_Z[i]=0;
         White_Z[i]=0;
         if(i<(A-1))
           {
            White_Z[i+1]=0;
            Buy_Z[i+1]=0;
            Neutral_Z[i+1]=0;
            Sell_Z[i+1]=1;

           }
         if(i<(A-2))
           {


            Buy_Z[i+2]=0;
            Neutral_Z[i+2]=0;
            Sell_Z[i+2]=1;
            White_Z[i+2]=0;
           }

        }
      if(State_Decide(i)==3 && Neutral_Zone_Enable)
        {
         Zone_Maker(i,3, Neutral_Color);
         Buy_Z[i]=0;
         Sell_Z[i]=0;
         Neutral_Z[i]=1;
         White_Z[i]=0;
         if(i<(A-1))
           {

            Buy_Z[i+1]=0;
            Neutral_Z[i+1]=1;
            Sell_Z[i+1]=0;
            White_Z[i+1]=0;

           }
         if(i<(A-2))
           {


            Buy_Z[i+2]=0;
            Neutral_Z[i+2]=1;
            Sell_Z[i+2]=0;
            White_Z[i+2]=0;

           }

        }
      if((PSD==1 || PSD==2) && ADX_Trend(i)==0)
         PSD=0;


     }






  }

int State_Decide(int i)
  {
   int k=0;
   if(iADX(NULL,TF_Zone,ADX_Period,ADX_Price,MODE_MAIN,iBarShift(NULL,TF_Zone,iTime(NULL,0,i+1)))>=ADX_Percentage && iADX(NULL,TF_Zone,ADX_Period,ADX_Price, MODE_PLUSDI,iBarShift(NULL,TF_Zone,iTime(NULL,0,i+1)))>=iADX(NULL,TF_Zone,ADX_Period,ADX_Price, MODE_MINUSDI,iBarShift(NULL,TF_Zone,iTime(NULL,0,i+1)))
      && iADX(NULL,TF_Zone,ADX_Period,ADX_Price, MODE_PLUSDI,iBarShift(NULL,TF_Zone,Time[i+1]))>=DI_Plus_Percentage)
      k=1;
   if(iADX(NULL,TF_Zone,ADX_Period,ADX_Price,MODE_MAIN,iBarShift(NULL,TF_Zone,iTime(NULL,0,i+1)))>=ADX_Percentage && iADX(NULL,TF_Zone,ADX_Period,ADX_Price, MODE_PLUSDI,iBarShift(NULL,TF_Zone,iTime(NULL,0,i+1)))<iADX(NULL,0,ADX_Period,ADX_Price, MODE_MINUSDI,iBarShift(NULL,TF_Zone,iTime(NULL,0,i+1)))
      && iADX(NULL,TF_Zone,ADX_Period,ADX_Price, MODE_MINUSDI,iBarShift(NULL,TF_Zone,iTime(NULL,0,i+1)))>=DI_Negative_Percentage)
      k=2;
   if(iADX(NULL,TF_Zone,ADX_Period,ADX_Price,MODE_MAIN,iBarShift(NULL,TF_Zone,iTime(NULL,0,i+1)))<ADX_Percentage)
      k=3;
   return(k);
  }

void Zone_Maker(int i,int j, color  A)
  {
   if(!NZ)
     {

      if(CH<iHigh(NULL,0,i+1))
         CH=iHigh(NULL,0,i+1);
      if(CL>iLow(NULL,0,i+1))
         CL=iLow(NULL,0,i+1);;














     }
   if(NZ)
     {
      CST=iTime(NULL,0,i+1);
      CH=iHigh(NULL,0,i+1);
      CL=iLow(NULL,0,i+1);



      NZ=false;





     }




  }

bool Isnewcandle(int i)
  {
   static datetime SCTCC;
   if(Time[i]==SCTCC)
      return false;
   else
      SCTCC=Time[i];
   return true;
  }

int ADX_Trend(int i)
  {
   int k=0;
   if(ADX_Strength==0 &&  iADX(NULL,0,ADX_Period,ADX_Price,MODE_MAIN,i+1)>=iADX(NULL,0,ADX_Period,ADX_Price,MODE_MAIN,i+2))
      k=1;
   if(ADX_Strength==1 &&  iADX(NULL,0,ADX_Period,ADX_Price,MODE_MAIN,i+1)<=iADX(NULL,0,ADX_Period,ADX_Price,MODE_MAIN,i+2))
      k=1;
   if(ADX_Strength==2)
      k=1;

   return(k);
  }



int ADX_ZONE_Arrow_Filter(int cTgh)
  {
   int z=0;
   int k=0;
   int w=0;
   int n=0;

   if((dType[cTgh]==1 || dType[cTgh]==2 || dType[cTgh]==5 || dType[cTgh]==6) && Buy_Z[cTgh-1]==1)
      z=1;
   if((dType[cTgh]==1 || dType[cTgh]==2 || dType[cTgh]==5 || dType[cTgh]==6) && Buy_Z[cTgh-1]==0)
      z=0;
   if((dType[cTgh]==3 || dType[cTgh]==4 || dType[cTgh]==7 || dType[cTgh]==8) && Sell_Z[cTgh-1]==1)
      z=1;
   if((dType[cTgh]==3 || dType[cTgh]==4 || dType[cTgh]==7 || dType[cTgh]==8) && Sell_Z[cTgh-1]==0)
      z=0;

   if(Without_Zone)
      w=Without_Zone_Detection(cTgh,0);
   if(Neutral_Zone)
      n=Neutral_Zone_Detection(cTgh,0);
   if(z+w+n>=1)
      k=1;

   if(k==0)
     {

      Dir_BU_div_CC_trig=false;
      Dir_BE_div_CC_trig=false;
      Long_BU_div_CC_trig=false;
      Long_BE_div_CC_trig=false;

      H_Dir_BU_div_CC_trig=false;
      H_Dir_BE_div_CC_trig=false;
      H_Long_BU_div_CC_trig=false;
      H_Long_BE_div_CC_trig=false;

      MegaDelete(cTgh);
      MegaDelete2(cTgh-1);
      MegaDelete3(cTgh-1);
      MegaDelete4(cTgh-1);

      UnvalidD(cTgh);



     }






   return(k);

  }

int ADX_ZONE_CCB_Filter(int cTgh)
  {
   int z=0;
   int k=0;
   int w=0;
   int n=0;
   int m=0;
   for(int i=cTgh+1; i<cTgh+1+50; i++)
     {
      if(dType[i]<9)
        {
         m=i;
         break;
        }
     }

   if((dType[m]==1 || dType[m]==2 || dType[m]==5 || dType[m]==6) && Buy_Z[cTgh]==1)
      z=1;
   if((dType[m]==1 || dType[m]==2 || dType[m]==5 || dType[m]==6) && Buy_Z[cTgh]==0)
      z=0;
   if((dType[m]==3 || dType[m]==4 || dType[m]==7 || dType[m]==8) && Sell_Z[cTgh]==1)
      z=1;
   if((dType[m]==3 || dType[m]==4 || dType[m]==7 || dType[m]==8) && Sell_Z[cTgh]==0)
      z=0;


   if(Without_Zone)
      w=Without_Zone_Detection(cTgh,1);
   if(Neutral_Zone)
      n=Neutral_Zone_Detection(cTgh,1);
   if(z+w+n>=1)
      k=1;
   if(k==0)
     {

      CCB_valid_state=false;

      MegaDelete(m);
      MegaDelete2(m-1);
      MegaDelete3(m-1);
      MegaDelete4(m-1);

      UnvalidD(cTgh);



     }


   return(k);

  }

int fast_MA_Filter(int m)
  {
   int k=0;
   double ma=iMA(NULL,0,fastMAPeriod,fastMAShift,fastMAMethod,fastMAPrice,m-1);
   if((dType[m]==1 || dType[m]==2 || dType[m]==5 || dType[m]==6) && MathMin(Open[m-1],Close[m-1])>=ma)
      k=1;
   if((dType[m]==1 || dType[m]==2 || dType[m]==5 || dType[m]==6) && MathMin(Open[m-1],Close[m-1])<ma)
      k=0;
   if((dType[m]==3 || dType[m]==4 || dType[m]==7 || dType[m]==8) && MathMin(Open[m-1],Close[m-1])<=ma)
      k=1;
   if((dType[m]==3 || dType[m]==4 || dType[m]==7 || dType[m]==8) && MathMin(Open[m-1],Close[m-1])>ma)
      k=0;
   if(k==0)
     {

      Dir_BU_div_CC_trig=false;
      Dir_BE_div_CC_trig=false;
      Long_BU_div_CC_trig=false;
      Long_BE_div_CC_trig=false;

      H_Dir_BU_div_CC_trig=false;
      H_Dir_BE_div_CC_trig=false;
      H_Long_BU_div_CC_trig=false;
      H_Long_BE_div_CC_trig=false;

      MegaDelete(m);
      MegaDelete2(m-1);
      MegaDelete3(m-1);
      MegaDelete4(m-1);

      UnvalidD(m);



     }
   return(k);

  }

int slow_MA_Filter(int m)
  {
   int k=0;
   double ma=iMA(NULL,0,slowMAPeriod,slowMAShift,slowMAMethod,slowMAPrice,m-1);
   if((dType[m]==1 || dType[m]==2 || dType[m]==5 || dType[m]==6) && MathMin(Open[m-1],Close[m-1])>=ma)
      k=1;
   if((dType[m]==1 || dType[m]==2 || dType[m]==5 || dType[m]==6) && MathMin(Open[m-1],Close[m-1])<ma)
      k=0;
   if((dType[m]==3 || dType[m]==4 || dType[m]==7 || dType[m]==8) && MathMin(Open[m-1],Close[m-1])<=ma)
      k=1;
   if((dType[m]==3 || dType[m]==4 || dType[m]==7 || dType[m]==8) && MathMin(Open[m-1],Close[m-1])>ma)
      k=0;
   if(k==0)
     {

      Dir_BU_div_CC_trig=false;
      Dir_BE_div_CC_trig=false;
      Long_BU_div_CC_trig=false;
      Long_BE_div_CC_trig=false;

      H_Dir_BU_div_CC_trig=false;
      H_Dir_BE_div_CC_trig=false;
      H_Long_BU_div_CC_trig=false;
      H_Long_BE_div_CC_trig=false;

      MegaDelete(m);
      MegaDelete2(m-1);
      MegaDelete3(m-1);
      MegaDelete4(m-1);

      UnvalidD(m);



     }
   return(k);

  }

int Neutral_Zone_Detection(int i,int x)
  {
   int k=0;

   if(x==0)
     {

      if((dType[i]==1 || dType[i]==2 || dType[i]==5 || dType[i]==6) && (Neutral_Z[i-1]==1))
         k=1;
      if((dType[i]==1 || dType[i]==2 || dType[i]==5 || dType[i]==6) && (Neutral_Z[i-1]==0))
         k=0;
      if((dType[i]==3 || dType[i]==4 || dType[i]==7 || dType[i]==8) && (Neutral_Z[i-1]==1))
         k=1;
      if((dType[i]==3 || dType[i]==4 || dType[i]==7 || dType[i]==8) && (Neutral_Z[i-1]==0))
         k=0;





     }
   if(x==1)
     {
      int m=0;
      for(int j=i+1; j<i+1+50; j++)
        {
         if(dType[j]<9)
           {
            m=j;
            break;
           }
        }


      if((dType[m]==1 || dType[m]==2 || dType[m]==5 || dType[m]==6) && (Neutral_Z[i]==1))
         k=1;
      if((dType[m]==1 || dType[m]==2 || dType[m]==5 || dType[m]==6) && (Neutral_Z[i]==0))
         k=0;
      if((dType[m]==3 || dType[m]==4 || dType[m]==7 || dType[m]==8) && (Neutral_Z[i]==1))
         k=1;
      if((dType[m]==3 || dType[m]==4 || dType[m]==7 || dType[m]==8) && (Neutral_Z[i]==0))
         k=0;






     }


   return(k);


  }

int Without_Zone_Detection(int i,int x)
  {
   int k=0;

   if(x==0)
     {

      if((dType[i]==1 || dType[i]==2 || dType[i]==5 || dType[i]==6) && (White_Z[i-1]==1))
         k=1;
      if((dType[i]==1 || dType[i]==2 || dType[i]==5 || dType[i]==6) && (White_Z[i-1]==0))
         k=0;
      if((dType[i]==3 || dType[i]==4 || dType[i]==7 || dType[i]==8) && (White_Z[i-1]==1))
         k=1;
      if((dType[i]==3 || dType[i]==4 || dType[i]==7 || dType[i]==8) && (White_Z[i-1]==0))
         k=0;





     }
   if(x==1)
     {
      int m=0;
      for(int j=i+1; j<i+1+50; j++)
        {
         if(dType[j]<9)
           {
            m=j;
            break;
           }
        }


      if((dType[m]==1 || dType[m]==2 || dType[m]==5 || dType[m]==6) && (White_Z[i]==1))
         k=1;
      if((dType[m]==1 || dType[m]==2 || dType[m]==5 || dType[m]==6) && (White_Z[i]==0))
         k=0;
      if((dType[m]==3 || dType[m]==4 || dType[m]==7 || dType[m]==8) && (White_Z[i]==1))
         k=1;
      if((dType[m]==3 || dType[m]==4 || dType[m]==7 || dType[m]==8) && (White_Z[i]==0))
         k=0;






     }



   return(k);

  }

void SaveMailBox(string json_data,int WOW=-1)
  {
         int handel=FileOpen("signal.txt",FILE_WRITE);
            FileWrite(handel,json_data);
            FileClose(handel);
  }

