--  Obtained via:
--  sudo gcc -c -fdump-ada-spec -C p32mx470f512.h

pragma Ada_2012;
--  pragma Style_Checks (Off);
pragma Warnings ("U");

with Interfaces.C; use Interfaces.C;
with Interfaces.C.Extensions;

package P32mx470f512h is

   ---------------------------------------------------------------------------
   --   PIC32MX470F512H processor header

   --   This software is developed by Microchip Technology Inc. and its
   --   subsidiaries ("Microchip").
   --
   --   Redistribution and use in source and binary forms, with or without
   --   modification, are permitted provided that the following conditions are
   --   met:

   --   1.      Redistributions of source code must retain the above copyright
   --           notice, this list of conditions and the following disclaimer.
   --   2.      Redistributions in binary form must reproduce the above
   --           copyright notice, this list of conditions and the following
   --           disclaimer in the documentation and/or other materials provided
   --           with the distribution.
   --   3.      Microchip's name may not be used to endorse or promote products
   --           derived from this software without specific prior written
   --           permission.

   --   THIS SOFTWARE IS PROVIDED BY MICROCHIP "AS IS" AND ANY EXPRESS OR IMPLIED
   --   WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF
   --   MERCHANTABILITY AND FITNESS FOR PURPOSE ARE DISCLAIMED. IN NO EVENT
   --   SHALL MICROCHIP BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL,
   --   EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING BUT NOT LIMITED TO
   --   PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA OR PROFITS;
   --   OR BUSINESS INTERRUPTION) HOWSOEVER CAUSED AND ON ANY THEORY OF LIABILITY,
   --   WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR
   --   OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF
   --   ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.

   --  -------------------------------------------------------------------------

   WDTCON : aliased unsigned  -- p32mx470f512.h:42
     with Import => True,
     Convention => C,
     External_Name => "WDTCON";

   type uu_WDTCONbits_t_struct796 is record
      WDTCLR   : Extensions.Unsigned_1;  -- p32mx470f512.h:45
      WDTWINEN : Extensions.Unsigned_1;  -- p32mx470f512.h:46
      SWDTPS   : Extensions.Unsigned_5;  -- p32mx470f512.h:47
      field_4  : aliased unsigned_char;
      ON       : Extensions.Unsigned_1;  -- p32mx470f512.h:49
   end record
     with Convention => C_Pass_By_Copy,
     Pack => True,
     Alignment => 4;

   type uu_WDTCONbits_t_struct799 is record
      anon1919 : Extensions.Unsigned_2;  -- p32mx470f512.h:52
      SWDTPS0  : Extensions.Unsigned_1;  -- p32mx470f512.h:53
      SWDTPS1  : Extensions.Unsigned_1;  -- p32mx470f512.h:54
      SWDTPS2  : Extensions.Unsigned_1;  -- p32mx470f512.h:55
      SWDTPS3  : Extensions.Unsigned_1;  -- p32mx470f512.h:56
      SWDTPS4  : Extensions.Unsigned_1;  -- p32mx470f512.h:57
   end record
     with Convention => C_Pass_By_Copy,
     Pack => True,
     Alignment => 4;

   type uu_WDTCONbits_t_struct801 is record
      anon1928 : Extensions.Unsigned_2;  -- p32mx470f512.h:60
      WDTPSTA  : Extensions.Unsigned_5;  -- p32mx470f512.h:61
   end record
     with Convention => C_Pass_By_Copy,
     Pack => True,
     Alignment => 4;

   type uu_WDTCONbits_t_struct802 is record
      anon1933 : Extensions.Unsigned_2;  -- p32mx470f512.h:64
      WDTPS    : Extensions.Unsigned_5;  -- p32mx470f512.h:65
   end record
     with Convention => C_Pass_By_Copy,
     Pack => True,
     Alignment => 4;

   type uu_WDTCONbits_t_struct803 is record
      w : aliased unsigned;  -- p32mx470f512.h:68
   end record
     with Convention => C_Pass_By_Copy;

   type uu_WDTCONbits_t (discr : unsigned := 0) is record
      case discr is
         when 0 => anon1917 : aliased uu_WDTCONbits_t_struct796;  -- p32mx470f512.h:50
         when 1 => anon1926 : aliased uu_WDTCONbits_t_struct799;  -- p32mx470f512.h:58
         when 2 => anon1931 : aliased uu_WDTCONbits_t_struct801;  -- p32mx470f512.h:62
         when 3 => anon1936 : aliased uu_WDTCONbits_t_struct802;  -- p32mx470f512.h:66
         when 4 => anon1940 : aliased uu_WDTCONbits_t_struct803;  -- p32mx470f512.h:69
         when others => null;
      end case;
   end record
     with Convention => C_Pass_By_Copy,
     Unchecked_Union => True;  -- p32mx470f512.h:70

   WDTCONbits : aliased uu_WDTCONbits_t  -- p32mx470f512.h:71
     with Import => True,
     Convention => C,
     External_Name => "WDTCON";

   WDTCONCLR : aliased unsigned  -- p32mx470f512.h:72
     with Import => True,
     Convention => C,
     External_Name => "WDTCONCLR";

   WDTCONSET : aliased unsigned  -- p32mx470f512.h:73
     with Import => True,
     Convention => C,
     External_Name => "WDTCONSET";

   WDTCONINV : aliased unsigned  -- p32mx470f512.h:74
     with Import => True,
     Convention => C,
     External_Name => "WDTCONINV";

   RTCCON : aliased unsigned  -- p32mx470f512.h:75
     with Import => True,
     Convention => C,
     External_Name => "RTCCON";

   type uu_RTCCONbits_t_struct810 is record
      RTCOE    : Extensions.Unsigned_1;  -- p32mx470f512.h:78
      HALFSEC  : Extensions.Unsigned_1;  -- p32mx470f512.h:79
      RTCSYNC  : Extensions.Unsigned_1;  -- p32mx470f512.h:80
      RTCWREN  : Extensions.Unsigned_1;  -- p32mx470f512.h:81
      anon1953 : Extensions.Unsigned_2;  -- p32mx470f512.h:82
      RTCCLKON : Extensions.Unsigned_1;  -- p32mx470f512.h:83
      RTSECSEL : Extensions.Unsigned_1;  -- p32mx470f512.h:84
      anon1956 : Extensions.Unsigned_5;  -- p32mx470f512.h:85
      SIDL     : Extensions.Unsigned_1;  -- p32mx470f512.h:86
      anon1958 : Extensions.Unsigned_1;  -- p32mx470f512.h:87
      ON       : Extensions.Unsigned_1;  -- p32mx470f512.h:88
      CAL      : Extensions.Unsigned_10;  -- p32mx470f512.h:89
   end record
     with Convention => C_Pass_By_Copy,
     Pack => True,
     Alignment => 4;
   type uu_RTCCONbits_t_struct812 is record
      w : aliased unsigned;  -- p32mx470f512.h:92
   end record
     with Convention => C_Pass_By_Copy;
   type uu_RTCCONbits_t (discr : unsigned := 0) is record
      case discr is
         when 0 => anon1962 : aliased uu_RTCCONbits_t_struct810;  -- p32mx470f512.h:90
         when 1 => anon1966 : aliased uu_RTCCONbits_t_struct812;  -- p32mx470f512.h:93
         when others => Null;
      end case;
   end record
     with Convention => C_Pass_By_Copy,
     Unchecked_Union => True;  -- p32mx470f512.h:94

   RTCCONbits : aliased uu_RTCCONbits_t  -- p32mx470f512.h:95
     with Import => True,
     Convention => C,
     External_Name => "RTCCON";

   RTCCONCLR : aliased unsigned  -- p32mx470f512.h:96
     with Import => True,
     Convention => C,
     External_Name => "RTCCONCLR";

   RTCCONSET : aliased unsigned  -- p32mx470f512.h:97
     with Import => True,
     Convention => C,
     External_Name => "RTCCONSET";

   RTCCONINV : aliased unsigned  -- p32mx470f512.h:98
     with Import => True,
     Convention => C,
     External_Name => "RTCCONINV";

   RTCALRM : aliased unsigned  -- p32mx470f512.h:99
     with Import => True,
     Convention => C,
     External_Name => "RTCALRM";

   type uu_RTCALRMbits_t_struct817 is record
      ARPT     : aliased unsigned_char;  -- p32mx470f512.h:102
      AMASK    : Extensions.Unsigned_4;  -- p32mx470f512.h:103
      ALRMSYNC : Extensions.Unsigned_1;  -- p32mx470f512.h:104
      PIV      : Extensions.Unsigned_1;  -- p32mx470f512.h:105
      CHIME    : Extensions.Unsigned_1;  -- p32mx470f512.h:106
      ALRMEN   : Extensions.Unsigned_1;  -- p32mx470f512.h:107
   end record
     with Convention => C_Pass_By_Copy,
     Pack => True,
     Alignment => 4;
   type uu_RTCALRMbits_t_struct819 is record
      w : aliased unsigned;  -- p32mx470f512.h:110
   end record
     with Convention => C_Pass_By_Copy;
   type uu_RTCALRMbits_t (discr : unsigned := 0) is record
      case discr is
         when 0 => anon1982 : aliased uu_RTCALRMbits_t_struct817;  -- p32mx470f512.h:108
         when 1 => anon1986 : aliased uu_RTCALRMbits_t_struct819;  -- p32mx470f512.h:111
         when others => Null;
      end case;
   end record
     with Convention => C_Pass_By_Copy,
     Unchecked_Union => True;  -- p32mx470f512.h:112

   RTCALRMbits : aliased uu_RTCALRMbits_t  -- p32mx470f512.h:113
     with Import => True,
     Convention => C,
     External_Name => "RTCALRM";

   RTCALRMCLR : aliased unsigned  -- p32mx470f512.h:114
     with Import => True,
     Convention => C,
     External_Name => "RTCALRMCLR";

   RTCALRMSET : aliased unsigned  -- p32mx470f512.h:115
     with Import => True,
     Convention => C,
     External_Name => "RTCALRMSET";

   RTCALRMINV : aliased unsigned  -- p32mx470f512.h:116
     with Import => True,
     Convention => C,
     External_Name => "RTCALRMINV";

   RTCTIME : aliased unsigned  -- p32mx470f512.h:117
     with Import => True,
     Convention => C,
     External_Name => "RTCTIME";

   type uu_RTCTIMEbits_t_struct826 is record
      parent : aliased unsigned_char;
      SEC01  : Extensions.Unsigned_4;  -- p32mx470f512.h:121
      SEC10  : Extensions.Unsigned_4;  -- p32mx470f512.h:122
      MIN01  : Extensions.Unsigned_4;  -- p32mx470f512.h:123
      MIN10  : Extensions.Unsigned_4;  -- p32mx470f512.h:124
      HR01   : Extensions.Unsigned_4;  -- p32mx470f512.h:125
      HR10   : Extensions.Unsigned_4;  -- p32mx470f512.h:126
   end record
     with Convention => C_Pass_By_Copy,
     Pack => True,
     Alignment => 4;
   type uu_RTCTIMEbits_t_struct827 is record
      w : aliased unsigned;  -- p32mx470f512.h:129
   end record
     with Convention => C_Pass_By_Copy;
   type uu_RTCTIMEbits_t (discr : unsigned := 0) is record
      case discr is
         when 0 => anon2003 : aliased uu_RTCTIMEbits_t_struct826;  -- p32mx470f512.h:127
         when 1 => anon2007 : aliased uu_RTCTIMEbits_t_struct827;  -- p32mx470f512.h:130
         when others => Null;
      end case;
   end record
     with Convention => C_Pass_By_Copy,
     Unchecked_Union => True;  -- p32mx470f512.h:131

   RTCTIMEbits : aliased uu_RTCTIMEbits_t  -- p32mx470f512.h:132
     with Import => True,
     Convention => C,
     External_Name => "RTCTIME";

   RTCTIMECLR : aliased unsigned  -- p32mx470f512.h:133
     with Import => True,
     Convention => C,
     External_Name => "RTCTIMECLR";

   RTCTIMESET : aliased unsigned  -- p32mx470f512.h:134
     with Import => True,
     Convention => C,
     External_Name => "RTCTIMESET";

   RTCTIMEINV : aliased unsigned  -- p32mx470f512.h:135
     with Import => True,
     Convention => C,
     External_Name => "RTCTIMEINV";

   RTCDATE : aliased unsigned  -- p32mx470f512.h:136
     with Import => True,
     Convention => C,
     External_Name => "RTCDATE";

   type uu_RTCDATEbits_t_struct832 is record
      WDAY01   : Extensions.Unsigned_4;  -- p32mx470f512.h:139
      anon2017 : Extensions.Unsigned_4;  -- p32mx470f512.h:140
      DAY01    : Extensions.Unsigned_4;  -- p32mx470f512.h:141
      DAY10    : Extensions.Unsigned_4;  -- p32mx470f512.h:142
      MONTH01  : Extensions.Unsigned_4;  -- p32mx470f512.h:143
      MONTH10  : Extensions.Unsigned_4;  -- p32mx470f512.h:144
      YEAR01   : Extensions.Unsigned_4;  -- p32mx470f512.h:145
      YEAR10   : Extensions.Unsigned_4;  -- p32mx470f512.h:146
   end record
     with Convention => C_Pass_By_Copy,
     Pack => True,
     Alignment => 4;
   type uu_RTCDATEbits_t_struct833 is record
      w : aliased unsigned;  -- p32mx470f512.h:149
   end record
     with Convention => C_Pass_By_Copy;
   type uu_RTCDATEbits_t (discr : unsigned := 0) is record
      case discr is
         when 0 => anon2025 : aliased uu_RTCDATEbits_t_struct832;  -- p32mx470f512.h:147
         when 1 => anon2029 : aliased uu_RTCDATEbits_t_struct833;  -- p32mx470f512.h:150
         when others => Null;
      end case;
   end record
     with Convention => C_Pass_By_Copy,
     Unchecked_Union => True;  -- p32mx470f512.h:151

   RTCDATEbits : aliased uu_RTCDATEbits_t  -- p32mx470f512.h:152
     with Import => True,
     Convention => C,
     External_Name => "RTCDATE";

   RTCDATECLR : aliased unsigned  -- p32mx470f512.h:153
     with Import => True,
     Convention => C,
     External_Name => "RTCDATECLR";

   RTCDATESET : aliased unsigned  -- p32mx470f512.h:154
     with Import => True,
     Convention => C,
     External_Name => "RTCDATESET";

   RTCDATEINV : aliased unsigned  -- p32mx470f512.h:155
     with Import => True,
     Convention => C,
     External_Name => "RTCDATEINV";

   ALRMTIME : aliased unsigned  -- p32mx470f512.h:156
     with Import => True,
     Convention => C,
     External_Name => "ALRMTIME";

   type uu_ALRMTIMEbits_t_struct838 is record
      parent : aliased unsigned_char;
      SEC01  : Extensions.Unsigned_4;  -- p32mx470f512.h:160
      SEC10  : Extensions.Unsigned_4;  -- p32mx470f512.h:161
      MIN01  : Extensions.Unsigned_4;  -- p32mx470f512.h:162
      MIN10  : Extensions.Unsigned_4;  -- p32mx470f512.h:163
      HR01   : Extensions.Unsigned_4;  -- p32mx470f512.h:164
      HR10   : Extensions.Unsigned_4;  -- p32mx470f512.h:165
   end record
     with Convention => C_Pass_By_Copy,
     Pack => True,
     Alignment => 4;
   type uu_ALRMTIMEbits_t_struct839 is record
      w : aliased unsigned;  -- p32mx470f512.h:168
   end record
     with Convention => C_Pass_By_Copy;
   type uu_ALRMTIMEbits_t (discr : unsigned := 0) is record
      case discr is
         when 0 => anon2046 : aliased uu_ALRMTIMEbits_t_struct838;  -- p32mx470f512.h:166
         when 1 => anon2050 : aliased uu_ALRMTIMEbits_t_struct839;  -- p32mx470f512.h:169
         when others => null;
      end case;
   end record
     with Convention => C_Pass_By_Copy,
     Unchecked_Union => True;  -- p32mx470f512.h:170

   ALRMTIMEbits : aliased uu_ALRMTIMEbits_t  -- p32mx470f512.h:171
     with Import => True,
     Convention => C,
     External_Name => "ALRMTIME";

   ALRMTIMECLR : aliased unsigned  -- p32mx470f512.h:172
     with Import => True,
     Convention => C,
     External_Name => "ALRMTIMECLR";

   ALRMTIMESET : aliased unsigned  -- p32mx470f512.h:173
     with Import => True,
     Convention => C,
     External_Name => "ALRMTIMESET";

   ALRMTIMEINV : aliased unsigned  -- p32mx470f512.h:174
     with Import => True,
     Convention => C,
     External_Name => "ALRMTIMEINV";

   ALRMDATE : aliased unsigned  -- p32mx470f512.h:175
     with Import => True,
     Convention => C,
     External_Name => "ALRMDATE";

   type uu_ALRMDATEbits_t_struct846 is record
      WDAY01   : Extensions.Unsigned_4;  -- p32mx470f512.h:178
      anon2060 : Extensions.Unsigned_4;  -- p32mx470f512.h:179
      DAY01    : Extensions.Unsigned_4;  -- p32mx470f512.h:180
      DAY10    : Extensions.Unsigned_4;  -- p32mx470f512.h:181
      MONTH01  : Extensions.Unsigned_4;  -- p32mx470f512.h:182
      MONTH10  : Extensions.Unsigned_4;  -- p32mx470f512.h:183
   end record
     with Convention => C_Pass_By_Copy,
     Pack => True,
     Alignment => 4;
   type uu_ALRMDATEbits_t_struct847 is record
      w : aliased unsigned;  -- p32mx470f512.h:186
   end record
     with Convention => C_Pass_By_Copy;
   type uu_ALRMDATEbits_t (discr : unsigned := 0) is record
      case discr is
         when 0 => anon2066 : aliased uu_ALRMDATEbits_t_struct846;  -- p32mx470f512.h:184
         when 1 => anon2070 : aliased uu_ALRMDATEbits_t_struct847;  -- p32mx470f512.h:187
         when others => null;
      end case;
   end record
     with Convention => C_Pass_By_Copy,
     Unchecked_Union => True;  -- p32mx470f512.h:188

   ALRMDATEbits : aliased uu_ALRMDATEbits_t  -- p32mx470f512.h:189
     with Import => True,
     Convention => C,
     External_Name => "ALRMDATE";

   ALRMDATECLR : aliased unsigned  -- p32mx470f512.h:190
     with Import => True,
     Convention => C,
     External_Name => "ALRMDATECLR";

   ALRMDATESET : aliased unsigned  -- p32mx470f512.h:191
     with Import => True,
     Convention => C,
     External_Name => "ALRMDATESET";

   ALRMDATEINV : aliased unsigned  -- p32mx470f512.h:192
     with Import => True,
     Convention => C,
     External_Name => "ALRMDATEINV";

   T1CON : aliased unsigned  -- p32mx470f512.h:193
     with Import => True,
     Convention => C,
     External_Name => "T1CON";

   type uu_T1CONbits_t_struct852 is record
      anon2079 : Extensions.Unsigned_1;  -- p32mx470f512.h:196
      TCS      : Extensions.Unsigned_1;  -- p32mx470f512.h:197
      TSYNC    : Extensions.Unsigned_1;  -- p32mx470f512.h:198
      anon2082 : Extensions.Unsigned_1;  -- p32mx470f512.h:199
      TCKPS    : Extensions.Unsigned_2;  -- p32mx470f512.h:200
      anon2084 : Extensions.Unsigned_1;  -- p32mx470f512.h:201
      TGATE    : Extensions.Unsigned_1;  -- p32mx470f512.h:202
      anon2086 : Extensions.Unsigned_3;  -- p32mx470f512.h:203
      TWIP     : Extensions.Unsigned_1;  -- p32mx470f512.h:204
      TWDIS    : Extensions.Unsigned_1;  -- p32mx470f512.h:205
      SIDL     : Extensions.Unsigned_1;  -- p32mx470f512.h:206
      anon2090 : Extensions.Unsigned_1;  -- p32mx470f512.h:207
      ON       : Extensions.Unsigned_1;  -- p32mx470f512.h:208
   end record
     with Convention => C_Pass_By_Copy,
     Pack => True,
     Alignment => 4;
   type uu_T1CONbits_t_struct854 is record
      anon2095 : Extensions.Unsigned_4;  -- p32mx470f512.h:211
      TCKPS0   : Extensions.Unsigned_1;  -- p32mx470f512.h:212
      TCKPS1   : Extensions.Unsigned_1;  -- p32mx470f512.h:213
   end record
     with Convention => C_Pass_By_Copy,
     Pack => True,
     Alignment => 4;
   type uu_T1CONbits_t_struct855 is record
      anon2101 : Extensions.Unsigned_13;  -- p32mx470f512.h:216
      TSIDL    : Extensions.Unsigned_1;  -- p32mx470f512.h:217
      anon2103 : Extensions.Unsigned_1;  -- p32mx470f512.h:218
      TON      : Extensions.Unsigned_1;  -- p32mx470f512.h:219
   end record
     with Convention => C_Pass_By_Copy,
     Pack => True,
     Alignment => 4;
   type uu_T1CONbits_t_struct857 is record
      w : aliased unsigned;  -- p32mx470f512.h:222
   end record
     with Convention => C_Pass_By_Copy;
   type uu_T1CONbits_t (discr : unsigned := 0) is record
      case discr is
         when 0 => anon2093 : aliased uu_T1CONbits_t_struct852;  -- p32mx470f512.h:209
         when 1 => anon2099 : aliased uu_T1CONbits_t_struct854;  -- p32mx470f512.h:214
         when 2 => anon2106 : aliased uu_T1CONbits_t_struct855;  -- p32mx470f512.h:220
         when 3 => anon2110 : aliased uu_T1CONbits_t_struct857;  -- p32mx470f512.h:223
         when others => null;
      end case;
   end record
     with Convention => C_Pass_By_Copy,
     Unchecked_Union => True;  -- p32mx470f512.h:224

   T1CONbits : aliased uu_T1CONbits_t  -- p32mx470f512.h:225
     with Import => True,
     Convention => C,
     External_Name => "T1CON";

   T1CONCLR : aliased unsigned  -- p32mx470f512.h:226
     with Import => True,
     Convention => C,
     External_Name => "T1CONCLR";

   T1CONSET : aliased unsigned  -- p32mx470f512.h:227
     with Import => True,
     Convention => C,
     External_Name => "T1CONSET";

   T1CONINV : aliased unsigned  -- p32mx470f512.h:228
     with Import => True,
     Convention => C,
     External_Name => "T1CONINV";

   TMR1 : aliased unsigned  -- p32mx470f512.h:229
     with Import => True,
     Convention => C,
     External_Name => "TMR1";

   TMR1CLR : aliased unsigned  -- p32mx470f512.h:230
     with Import => True,
     Convention => C,
     External_Name => "TMR1CLR";

   TMR1SET : aliased unsigned  -- p32mx470f512.h:231
     with Import => True,
     Convention => C,
     External_Name => "TMR1SET";

   TMR1INV : aliased unsigned  -- p32mx470f512.h:232
     with Import => True,
     Convention => C,
     External_Name => "TMR1INV";

   PR1 : aliased unsigned  -- p32mx470f512.h:233
     with Import => True,
     Convention => C,
     External_Name => "PR1";

   PR1CLR : aliased unsigned  -- p32mx470f512.h:234
     with Import => True,
     Convention => C,
     External_Name => "PR1CLR";

   PR1SET : aliased unsigned  -- p32mx470f512.h:235
     with Import => True,
     Convention => C,
     External_Name => "PR1SET";

   PR1INV : aliased unsigned  -- p32mx470f512.h:236
     with Import => True,
     Convention => C,
     External_Name => "PR1INV";

   T2CON : aliased unsigned  -- p32mx470f512.h:237
     with Import => True,
     Convention => C,
     External_Name => "T2CON";

   type uu_T2CONbits_t_struct864 is record
      anon2127 : Extensions.Unsigned_1;  -- p32mx470f512.h:240
      TCS      : Extensions.Unsigned_1;  -- p32mx470f512.h:241
      anon2129 : Extensions.Unsigned_1;  -- p32mx470f512.h:242
      T32      : Extensions.Unsigned_1;  -- p32mx470f512.h:243
      TCKPS    : Extensions.Unsigned_3;  -- p32mx470f512.h:244
      TGATE    : Extensions.Unsigned_1;  -- p32mx470f512.h:245
      anon2133 : Extensions.Unsigned_5;  -- p32mx470f512.h:246
      SIDL     : Extensions.Unsigned_1;  -- p32mx470f512.h:247
      anon2135 : Extensions.Unsigned_1;  -- p32mx470f512.h:248
      ON       : Extensions.Unsigned_1;  -- p32mx470f512.h:249
   end record
     with Convention => C_Pass_By_Copy,
     Pack => True,
     Alignment => 4;
   type uu_T2CONbits_t_struct865 is record
      anon2140 : Extensions.Unsigned_4;  -- p32mx470f512.h:252
      TCKPS0   : Extensions.Unsigned_1;  -- p32mx470f512.h:253
      TCKPS1   : Extensions.Unsigned_1;  -- p32mx470f512.h:254
      TCKPS2   : Extensions.Unsigned_1;  -- p32mx470f512.h:255
   end record
     with Convention => C_Pass_By_Copy,
     Pack => True,
     Alignment => 4;
   type uu_T2CONbits_t_struct866 is record
      anon2147 : Extensions.Unsigned_13;  -- p32mx470f512.h:258
      TSIDL    : Extensions.Unsigned_1;  -- p32mx470f512.h:259
      anon2149 : Extensions.Unsigned_1;  -- p32mx470f512.h:260
      TON      : Extensions.Unsigned_1;  -- p32mx470f512.h:261
   end record
     with Convention => C_Pass_By_Copy,
     Pack => True,
     Alignment => 4;
   type uu_T2CONbits_t_struct867 is record
      w : aliased unsigned;  -- p32mx470f512.h:264
   end record
     with Convention => C_Pass_By_Copy;
   type uu_T2CONbits_t (discr : unsigned := 0) is record
      case discr is
         when 0 => anon2138 : aliased uu_T2CONbits_t_struct864;  -- p32mx470f512.h:250
         when 1 => anon2145 : aliased uu_T2CONbits_t_struct865;  -- p32mx470f512.h:256
         when 2 => anon2152 : aliased uu_T2CONbits_t_struct866;  -- p32mx470f512.h:262
         when 3 => anon2156 : aliased uu_T2CONbits_t_struct867;  -- p32mx470f512.h:265
         when others => null;
      end case;
   end record
     with Convention => C_Pass_By_Copy,
     Unchecked_Union => True;  -- p32mx470f512.h:266

   T2CONbits : aliased uu_T2CONbits_t  -- p32mx470f512.h:267
     with Import => True,
     Convention => C,
     External_Name => "T2CON";

   T2CONCLR : aliased unsigned  -- p32mx470f512.h:268
     with Import => True,
     Convention => C,
     External_Name => "T2CONCLR";

   T2CONSET : aliased unsigned  -- p32mx470f512.h:269
     with Import => True,
     Convention => C,
     External_Name => "T2CONSET";

   T2CONINV : aliased unsigned  -- p32mx470f512.h:270
     with Import => True,
     Convention => C,
     External_Name => "T2CONINV";

   TMR2 : aliased unsigned  -- p32mx470f512.h:271
     with Import => True,
     Convention => C,
     External_Name => "TMR2";

   TMR2CLR : aliased unsigned  -- p32mx470f512.h:272
     with Import => True,
     Convention => C,
     External_Name => "TMR2CLR";

   TMR2SET : aliased unsigned  -- p32mx470f512.h:273
     with Import => True,
     Convention => C,
     External_Name => "TMR2SET";

   TMR2INV : aliased unsigned  -- p32mx470f512.h:274
     with Import => True,
     Convention => C,
     External_Name => "TMR2INV";

   PR2 : aliased unsigned  -- p32mx470f512.h:275
     with Import => True,
     Convention => C,
     External_Name => "PR2";

   PR2CLR : aliased unsigned  -- p32mx470f512.h:276
     with Import => True,
     Convention => C,
     External_Name => "PR2CLR";

   PR2SET : aliased unsigned  -- p32mx470f512.h:277
     with Import => True,
     Convention => C,
     External_Name => "PR2SET";

   PR2INV : aliased unsigned  -- p32mx470f512.h:278
     with Import => True,
     Convention => C,
     External_Name => "PR2INV";

   T3CON : aliased unsigned  -- p32mx470f512.h:279
     with Import => True,
     Convention => C,
     External_Name => "T3CON";

   type uu_T3CONbits_t_struct872 is record
      anon2173 : Extensions.Unsigned_1;  -- p32mx470f512.h:282
      TCS      : Extensions.Unsigned_1;  -- p32mx470f512.h:283
      anon2175 : Extensions.Unsigned_1;  -- p32mx470f512.h:284
      T32      : Extensions.Unsigned_1;  -- p32mx470f512.h:285
      TCKPS    : Extensions.Unsigned_3;  -- p32mx470f512.h:286
      TGATE    : Extensions.Unsigned_1;  -- p32mx470f512.h:287
      anon2179 : Extensions.Unsigned_5;  -- p32mx470f512.h:288
      SIDL     : Extensions.Unsigned_1;  -- p32mx470f512.h:289
      anon2181 : Extensions.Unsigned_1;  -- p32mx470f512.h:290
      ON       : Extensions.Unsigned_1;  -- p32mx470f512.h:291
   end record
     with Convention => C_Pass_By_Copy,
     Pack => True,
     Alignment => 4;
   type uu_T3CONbits_t_struct873 is record
      anon2186 : Extensions.Unsigned_4;  -- p32mx470f512.h:294
      TCKPS0   : Extensions.Unsigned_1;  -- p32mx470f512.h:295
      TCKPS1   : Extensions.Unsigned_1;  -- p32mx470f512.h:296
      TCKPS2   : Extensions.Unsigned_1;  -- p32mx470f512.h:297
   end record
     with Convention => C_Pass_By_Copy,
     Pack => True,
     Alignment => 4;
   type uu_T3CONbits_t_struct874 is record
      anon2193 : Extensions.Unsigned_13;  -- p32mx470f512.h:300
      TSIDL    : Extensions.Unsigned_1;  -- p32mx470f512.h:301
      anon2195 : Extensions.Unsigned_1;  -- p32mx470f512.h:302
      TON      : Extensions.Unsigned_1;  -- p32mx470f512.h:303
   end record
     with Convention => C_Pass_By_Copy,
     Pack => True,
     Alignment => 4;
   type uu_T3CONbits_t_struct875 is record
      w : aliased unsigned;  -- p32mx470f512.h:306
   end record
     with Convention => C_Pass_By_Copy;
   type uu_T3CONbits_t (discr : unsigned := 0) is record
      case discr is
         when 0 => anon2184 : aliased uu_T3CONbits_t_struct872;  -- p32mx470f512.h:292
         when 1 => anon2191 : aliased uu_T3CONbits_t_struct873;  -- p32mx470f512.h:298
         when 2 => anon2198 : aliased uu_T3CONbits_t_struct874;  -- p32mx470f512.h:304
         when 3 => anon2202 : aliased uu_T3CONbits_t_struct875;  -- p32mx470f512.h:307
         when others => null;
      end case;
   end record
     with Convention => C_Pass_By_Copy,
     Unchecked_Union => True;  -- p32mx470f512.h:308

   T3CONbits : aliased uu_T3CONbits_t  -- p32mx470f512.h:309
     with Import => True,
     Convention => C,
     External_Name => "T3CON";

   T3CONCLR : aliased unsigned  -- p32mx470f512.h:310
     with Import => True,
     Convention => C,
     External_Name => "T3CONCLR";

   T3CONSET : aliased unsigned  -- p32mx470f512.h:311
     with Import => True,
     Convention => C,
     External_Name => "T3CONSET";

   T3CONINV : aliased unsigned  -- p32mx470f512.h:312
     with Import => True,
     Convention => C,
     External_Name => "T3CONINV";

   TMR3 : aliased unsigned  -- p32mx470f512.h:313
     with Import => True,
     Convention => C,
     External_Name => "TMR3";

   TMR3CLR : aliased unsigned  -- p32mx470f512.h:314
     with Import => True,
     Convention => C,
     External_Name => "TMR3CLR";

   TMR3SET : aliased unsigned  -- p32mx470f512.h:315
     with Import => True,
     Convention => C,
     External_Name => "TMR3SET";

   TMR3INV : aliased unsigned  -- p32mx470f512.h:316
     with Import => True,
     Convention => C,
     External_Name => "TMR3INV";

   PR3 : aliased unsigned  -- p32mx470f512.h:317
     with Import => True,
     Convention => C,
     External_Name => "PR3";

   PR3CLR : aliased unsigned  -- p32mx470f512.h:318
     with Import => True,
     Convention => C,
     External_Name => "PR3CLR";

   PR3SET : aliased unsigned  -- p32mx470f512.h:319
     with Import => True,
     Convention => C,
     External_Name => "PR3SET";

   PR3INV : aliased unsigned  -- p32mx470f512.h:320
     with Import => True,
     Convention => C,
     External_Name => "PR3INV";

   T4CON : aliased unsigned  -- p32mx470f512.h:321
     with Import => True,
     Convention => C,
     External_Name => "T4CON";

   type uu_T4CONbits_t_struct880 is record
      anon2219 : Extensions.Unsigned_1;  -- p32mx470f512.h:324
      TCS      : Extensions.Unsigned_1;  -- p32mx470f512.h:325
      anon2221 : Extensions.Unsigned_1;  -- p32mx470f512.h:326
      T32      : Extensions.Unsigned_1;  -- p32mx470f512.h:327
      TCKPS    : Extensions.Unsigned_3;  -- p32mx470f512.h:328
      TGATE    : Extensions.Unsigned_1;  -- p32mx470f512.h:329
      anon2225 : Extensions.Unsigned_5;  -- p32mx470f512.h:330
      SIDL     : Extensions.Unsigned_1;  -- p32mx470f512.h:331
      anon2227 : Extensions.Unsigned_1;  -- p32mx470f512.h:332
      ON       : Extensions.Unsigned_1;  -- p32mx470f512.h:333
   end record
     with Convention => C_Pass_By_Copy,
     Pack => True,
     Alignment => 4;
   type uu_T4CONbits_t_struct881 is record
      anon2232 : Extensions.Unsigned_4;  -- p32mx470f512.h:336
      TCKPS0   : Extensions.Unsigned_1;  -- p32mx470f512.h:337
      TCKPS1   : Extensions.Unsigned_1;  -- p32mx470f512.h:338
      TCKPS2   : Extensions.Unsigned_1;  -- p32mx470f512.h:339
   end record
     with Convention => C_Pass_By_Copy,
     Pack => True,
     Alignment => 4;
   type uu_T4CONbits_t_struct882 is record
      anon2239 : Extensions.Unsigned_13;  -- p32mx470f512.h:342
      TSIDL    : Extensions.Unsigned_1;  -- p32mx470f512.h:343
      anon2241 : Extensions.Unsigned_1;  -- p32mx470f512.h:344
      TON      : Extensions.Unsigned_1;  -- p32mx470f512.h:345
   end record
     with Convention => C_Pass_By_Copy,
     Pack => True,
     Alignment => 4;
   type uu_T4CONbits_t_struct883 is record
      w : aliased unsigned;  -- p32mx470f512.h:348
   end record
     with Convention => C_Pass_By_Copy;
   type uu_T4CONbits_t (discr : unsigned := 0) is record
      case discr is
         when 0 => anon2230 : aliased uu_T4CONbits_t_struct880;  -- p32mx470f512.h:334
         when 1 => anon2237 : aliased uu_T4CONbits_t_struct881;  -- p32mx470f512.h:340
         when 2 => anon2244 : aliased uu_T4CONbits_t_struct882;  -- p32mx470f512.h:346
         when 3 => anon2248 : aliased uu_T4CONbits_t_struct883;  -- p32mx470f512.h:349
         when others => null;
      end case;
   end record
     with Convention => C_Pass_By_Copy,
     Unchecked_Union => True;  -- p32mx470f512.h:350

   T4CONbits : aliased uu_T4CONbits_t  -- p32mx470f512.h:351
     with Import => True,
     Convention => C,
     External_Name => "T4CON";

   T4CONCLR : aliased unsigned  -- p32mx470f512.h:352
     with Import => True,
     Convention => C,
     External_Name => "T4CONCLR";

   T4CONSET : aliased unsigned  -- p32mx470f512.h:353
     with Import => True,
     Convention => C,
     External_Name => "T4CONSET";

   T4CONINV : aliased unsigned  -- p32mx470f512.h:354
     with Import => True,
     Convention => C,
     External_Name => "T4CONINV";

   TMR4 : aliased unsigned  -- p32mx470f512.h:355
     with Import => True,
     Convention => C,
     External_Name => "TMR4";

   TMR4CLR : aliased unsigned  -- p32mx470f512.h:356
     with Import => True,
     Convention => C,
     External_Name => "TMR4CLR";

   TMR4SET : aliased unsigned  -- p32mx470f512.h:357
     with Import => True,
     Convention => C,
     External_Name => "TMR4SET";

   TMR4INV : aliased unsigned  -- p32mx470f512.h:358
     with Import => True,
     Convention => C,
     External_Name => "TMR4INV";

   PR4 : aliased unsigned  -- p32mx470f512.h:359
     with Import => True,
     Convention => C,
     External_Name => "PR4";

   PR4CLR : aliased unsigned  -- p32mx470f512.h:360
     with Import => True,
     Convention => C,
     External_Name => "PR4CLR";

   PR4SET : aliased unsigned  -- p32mx470f512.h:361
     with Import => True,
     Convention => C,
     External_Name => "PR4SET";

   PR4INV : aliased unsigned  -- p32mx470f512.h:362
     with Import => True,
     Convention => C,
     External_Name => "PR4INV";

   T5CON : aliased unsigned  -- p32mx470f512.h:363
     with Import => True,
     Convention => C,
     External_Name => "T5CON";

   type uu_T5CONbits_t_struct888 is record
      anon2265 : Extensions.Unsigned_1;  -- p32mx470f512.h:366
      TCS      : Extensions.Unsigned_1;  -- p32mx470f512.h:367
      anon2267 : Extensions.Unsigned_1;  -- p32mx470f512.h:368
      T32      : Extensions.Unsigned_1;  -- p32mx470f512.h:369
      TCKPS    : Extensions.Unsigned_3;  -- p32mx470f512.h:370
      TGATE    : Extensions.Unsigned_1;  -- p32mx470f512.h:371
      anon2271 : Extensions.Unsigned_5;  -- p32mx470f512.h:372
      SIDL     : Extensions.Unsigned_1;  -- p32mx470f512.h:373
      anon2273 : Extensions.Unsigned_1;  -- p32mx470f512.h:374
      ON       : Extensions.Unsigned_1;  -- p32mx470f512.h:375
   end record
     with Convention => C_Pass_By_Copy,
     Pack => True,
     Alignment => 4;
   type uu_T5CONbits_t_struct889 is record
      anon2278 : Extensions.Unsigned_4;  -- p32mx470f512.h:378
      TCKPS0   : Extensions.Unsigned_1;  -- p32mx470f512.h:379
      TCKPS1   : Extensions.Unsigned_1;  -- p32mx470f512.h:380
      TCKPS2   : Extensions.Unsigned_1;  -- p32mx470f512.h:381
   end record
     with Convention => C_Pass_By_Copy,
     Pack => True,
     Alignment => 4;
   type uu_T5CONbits_t_struct890 is record
      anon2285 : Extensions.Unsigned_13;  -- p32mx470f512.h:384
      TSIDL    : Extensions.Unsigned_1;  -- p32mx470f512.h:385
      anon2287 : Extensions.Unsigned_1;  -- p32mx470f512.h:386
      TON      : Extensions.Unsigned_1;  -- p32mx470f512.h:387
   end record
     with Convention => C_Pass_By_Copy,
     Pack => True,
     Alignment => 4;
   type uu_T5CONbits_t_struct891 is record
      w : aliased unsigned;  -- p32mx470f512.h:390
   end record
     with Convention => C_Pass_By_Copy;
   type uu_T5CONbits_t (discr : unsigned := 0) is record
      case discr is
         when 0 => anon2276 : aliased uu_T5CONbits_t_struct888;  -- p32mx470f512.h:376
         when 1 => anon2283 : aliased uu_T5CONbits_t_struct889;  -- p32mx470f512.h:382
         when 2 => anon2290 : aliased uu_T5CONbits_t_struct890;  -- p32mx470f512.h:388
         when 3 => anon2294 : aliased uu_T5CONbits_t_struct891;  -- p32mx470f512.h:391
         when others => null;
      end case;
   end record
     with Convention => C_Pass_By_Copy,
     Unchecked_Union => True;  -- p32mx470f512.h:392

   T5CONbits : aliased uu_T5CONbits_t  -- p32mx470f512.h:393
     with Import => True,
     Convention => C,
     External_Name => "T5CON";

   T5CONCLR : aliased unsigned  -- p32mx470f512.h:394
     with Import => True,
     Convention => C,
     External_Name => "T5CONCLR";

   T5CONSET : aliased unsigned  -- p32mx470f512.h:395
     with Import => True,
     Convention => C,
     External_Name => "T5CONSET";

   T5CONINV : aliased unsigned  -- p32mx470f512.h:396
     with Import => True,
     Convention => C,
     External_Name => "T5CONINV";

   TMR5 : aliased unsigned  -- p32mx470f512.h:397
     with Import => True,
     Convention => C,
     External_Name => "TMR5";

   TMR5CLR : aliased unsigned  -- p32mx470f512.h:398
     with Import => True,
     Convention => C,
     External_Name => "TMR5CLR";

   TMR5SET : aliased unsigned  -- p32mx470f512.h:399
     with Import => True,
     Convention => C,
     External_Name => "TMR5SET";

   TMR5INV : aliased unsigned  -- p32mx470f512.h:400
     with Import => True,
     Convention => C,
     External_Name => "TMR5INV";

   PR5 : aliased unsigned  -- p32mx470f512.h:401
     with Import => True,
     Convention => C,
     External_Name => "PR5";

   PR5CLR : aliased unsigned  -- p32mx470f512.h:402
     with Import => True,
     Convention => C,
     External_Name => "PR5CLR";

   PR5SET : aliased unsigned  -- p32mx470f512.h:403
     with Import => True,
     Convention => C,
     External_Name => "PR5SET";

   PR5INV : aliased unsigned  -- p32mx470f512.h:404
     with Import => True,
     Convention => C,
     External_Name => "PR5INV";

   IC1CON : aliased unsigned  -- p32mx470f512.h:405
     with Import => True,
     Convention => C,
     External_Name => "IC1CON";

   type uu_IC1CONbits_t_struct896 is record
      ICM      : Extensions.Unsigned_3;  -- p32mx470f512.h:408
      ICBNE    : Extensions.Unsigned_1;  -- p32mx470f512.h:409
      ICOV     : Extensions.Unsigned_1;  -- p32mx470f512.h:410
      ICI      : Extensions.Unsigned_2;  -- p32mx470f512.h:411
      ICTMR    : Extensions.Unsigned_1;  -- p32mx470f512.h:412
      C32      : Extensions.Unsigned_1;  -- p32mx470f512.h:413
      FEDGE    : Extensions.Unsigned_1;  -- p32mx470f512.h:414
      anon2318 : Extensions.Unsigned_3;  -- p32mx470f512.h:415
      SIDL     : Extensions.Unsigned_1;  -- p32mx470f512.h:416
      anon2320 : Extensions.Unsigned_1;  -- p32mx470f512.h:417
      ON       : Extensions.Unsigned_1;  -- p32mx470f512.h:418
   end record
     with Convention => C_Pass_By_Copy,
     Pack => True,
     Alignment => 4;
   type uu_IC1CONbits_t_struct897 is record
      ICM0     : Extensions.Unsigned_1;  -- p32mx470f512.h:421
      ICM1     : Extensions.Unsigned_1;  -- p32mx470f512.h:422
      ICM2     : Extensions.Unsigned_1;  -- p32mx470f512.h:423
      anon2328 : Extensions.Unsigned_2;  -- p32mx470f512.h:424
      ICI0     : Extensions.Unsigned_1;  -- p32mx470f512.h:425
      ICI1     : Extensions.Unsigned_1;  -- p32mx470f512.h:426
   end record
     with Convention => C_Pass_By_Copy,
     Pack => True,
     Alignment => 4;
   type uu_IC1CONbits_t_struct898 is record
      anon2334 : Extensions.Unsigned_13;  -- p32mx470f512.h:429
      ICSIDL   : Extensions.Unsigned_1;  -- p32mx470f512.h:430
   end record
     with Convention => C_Pass_By_Copy,
     Pack => True,
     Alignment => 4;
   type uu_IC1CONbits_t_struct899 is record
      w : aliased unsigned;  -- p32mx470f512.h:433
   end record
     with Convention => C_Pass_By_Copy;
   type uu_IC1CONbits_t (discr : unsigned := 0) is record
      case discr is
         when 0 => anon2323 : aliased uu_IC1CONbits_t_struct896;  -- p32mx470f512.h:419
         when 1 => anon2332 : aliased uu_IC1CONbits_t_struct897;  -- p32mx470f512.h:427
         when 2 => anon2337 : aliased uu_IC1CONbits_t_struct898;  -- p32mx470f512.h:431
         when 3 => anon2341 : aliased uu_IC1CONbits_t_struct899;  -- p32mx470f512.h:434
         when others => null;
      end case;
   end record
     with Convention => C_Pass_By_Copy,
     Unchecked_Union => True;  -- p32mx470f512.h:435

   IC1CONbits : aliased uu_IC1CONbits_t  -- p32mx470f512.h:436
     with Import => True,
     Convention => C,
     External_Name => "IC1CON";

   IC1CONCLR : aliased unsigned  -- p32mx470f512.h:437
     with Import => True,
     Convention => C,
     External_Name => "IC1CONCLR";

   IC1CONSET : aliased unsigned  -- p32mx470f512.h:438
     with Import => True,
     Convention => C,
     External_Name => "IC1CONSET";

   IC1CONINV : aliased unsigned  -- p32mx470f512.h:439
     with Import => True,
     Convention => C,
     External_Name => "IC1CONINV";

   IC1BUF : aliased unsigned  -- p32mx470f512.h:440
     with Import => True,
     Convention => C,
     External_Name => "IC1BUF";

   IC2CON : aliased unsigned  -- p32mx470f512.h:441
     with Import => True,
     Convention => C,
     External_Name => "IC2CON";

   type uu_IC2CONbits_t_struct904 is record
      ICM      : Extensions.Unsigned_3;  -- p32mx470f512.h:444
      ICBNE    : Extensions.Unsigned_1;  -- p32mx470f512.h:445
      ICOV     : Extensions.Unsigned_1;  -- p32mx470f512.h:446
      ICI      : Extensions.Unsigned_2;  -- p32mx470f512.h:447
      ICTMR    : Extensions.Unsigned_1;  -- p32mx470f512.h:448
      C32      : Extensions.Unsigned_1;  -- p32mx470f512.h:449
      FEDGE    : Extensions.Unsigned_1;  -- p32mx470f512.h:450
      anon2358 : Extensions.Unsigned_3;  -- p32mx470f512.h:451
      SIDL     : Extensions.Unsigned_1;  -- p32mx470f512.h:452
      anon2360 : Extensions.Unsigned_1;  -- p32mx470f512.h:453
      ON       : Extensions.Unsigned_1;  -- p32mx470f512.h:454
   end record
     with Convention => C_Pass_By_Copy,
     Pack => True,
     Alignment => 4;
   type uu_IC2CONbits_t_struct905 is record
      ICM0     : Extensions.Unsigned_1;  -- p32mx470f512.h:457
      ICM1     : Extensions.Unsigned_1;  -- p32mx470f512.h:458
      ICM2     : Extensions.Unsigned_1;  -- p32mx470f512.h:459
      anon2368 : Extensions.Unsigned_2;  -- p32mx470f512.h:460
      ICI0     : Extensions.Unsigned_1;  -- p32mx470f512.h:461
      ICI1     : Extensions.Unsigned_1;  -- p32mx470f512.h:462
   end record
     with Convention => C_Pass_By_Copy,
     Pack => True,
     Alignment => 4;
   type uu_IC2CONbits_t_struct906 is record
      anon2374 : Extensions.Unsigned_13;  -- p32mx470f512.h:465
      ICSIDL   : Extensions.Unsigned_1;  -- p32mx470f512.h:466
   end record
     with Convention => C_Pass_By_Copy,
     Pack => True,
     Alignment => 4;
   type uu_IC2CONbits_t_struct907 is record
      w : aliased unsigned;  -- p32mx470f512.h:469
   end record
     with Convention => C_Pass_By_Copy;
   type uu_IC2CONbits_t (discr : unsigned := 0) is record
      case discr is
         when 0 => anon2363 : aliased uu_IC2CONbits_t_struct904;  -- p32mx470f512.h:455
         when 1 => anon2372 : aliased uu_IC2CONbits_t_struct905;  -- p32mx470f512.h:463
         when 2 => anon2377 : aliased uu_IC2CONbits_t_struct906;  -- p32mx470f512.h:467
         when 3 => anon2381 : aliased uu_IC2CONbits_t_struct907;  -- p32mx470f512.h:470
         when others => null;
      end case;
   end record
     with Convention => C_Pass_By_Copy,
     Unchecked_Union => True;  -- p32mx470f512.h:471

   IC2CONbits : aliased uu_IC2CONbits_t  -- p32mx470f512.h:472
     with Import => True,
     Convention => C,
     External_Name => "IC2CON";

   IC2CONCLR : aliased unsigned  -- p32mx470f512.h:473
     with Import => True,
     Convention => C,
     External_Name => "IC2CONCLR";

   IC2CONSET : aliased unsigned  -- p32mx470f512.h:474
     with Import => True,
     Convention => C,
     External_Name => "IC2CONSET";

   IC2CONINV : aliased unsigned  -- p32mx470f512.h:475
     with Import => True,
     Convention => C,
     External_Name => "IC2CONINV";

   IC2BUF : aliased unsigned  -- p32mx470f512.h:476
     with Import => True,
     Convention => C,
     External_Name => "IC2BUF";

   IC3CON : aliased unsigned  -- p32mx470f512.h:477
     with Import => True,
     Convention => C,
     External_Name => "IC3CON";

   type uu_IC3CONbits_t_struct912 is record
      ICM      : Extensions.Unsigned_3;  -- p32mx470f512.h:480
      ICBNE    : Extensions.Unsigned_1;  -- p32mx470f512.h:481
      ICOV     : Extensions.Unsigned_1;  -- p32mx470f512.h:482
      ICI      : Extensions.Unsigned_2;  -- p32mx470f512.h:483
      ICTMR    : Extensions.Unsigned_1;  -- p32mx470f512.h:484
      C32      : Extensions.Unsigned_1;  -- p32mx470f512.h:485
      FEDGE    : Extensions.Unsigned_1;  -- p32mx470f512.h:486
      anon2398 : Extensions.Unsigned_3;  -- p32mx470f512.h:487
      SIDL     : Extensions.Unsigned_1;  -- p32mx470f512.h:488
      anon2400 : Extensions.Unsigned_1;  -- p32mx470f512.h:489
      ON       : Extensions.Unsigned_1;  -- p32mx470f512.h:490
   end record
     with Convention => C_Pass_By_Copy,
     Pack => True,
     Alignment => 4;
   type uu_IC3CONbits_t_struct913 is record
      ICM0     : Extensions.Unsigned_1;  -- p32mx470f512.h:493
      ICM1     : Extensions.Unsigned_1;  -- p32mx470f512.h:494
      ICM2     : Extensions.Unsigned_1;  -- p32mx470f512.h:495
      anon2408 : Extensions.Unsigned_2;  -- p32mx470f512.h:496
      ICI0     : Extensions.Unsigned_1;  -- p32mx470f512.h:497
      ICI1     : Extensions.Unsigned_1;  -- p32mx470f512.h:498
   end record
     with Convention => C_Pass_By_Copy,
     Pack => True,
     Alignment => 4;
   type uu_IC3CONbits_t_struct914 is record
      anon2414 : Extensions.Unsigned_13;  -- p32mx470f512.h:501
      ICSIDL   : Extensions.Unsigned_1;  -- p32mx470f512.h:502
   end record
     with Convention => C_Pass_By_Copy,
     Pack => True,
     Alignment => 4;
   type uu_IC3CONbits_t_struct915 is record
      w : aliased unsigned;  -- p32mx470f512.h:505
   end record
     with Convention => C_Pass_By_Copy;
   type uu_IC3CONbits_t (discr : unsigned := 0) is record
      case discr is
         when 0 => anon2403 : aliased uu_IC3CONbits_t_struct912;  -- p32mx470f512.h:491
         when 1 => anon2412 : aliased uu_IC3CONbits_t_struct913;  -- p32mx470f512.h:499
         when 2 => anon2417 : aliased uu_IC3CONbits_t_struct914;  -- p32mx470f512.h:503
         when 3 => anon2421 : aliased uu_IC3CONbits_t_struct915;  -- p32mx470f512.h:506
         when others => null;
      end case;
   end record
     with Convention => C_Pass_By_Copy,
     Unchecked_Union => True;  -- p32mx470f512.h:507

   IC3CONbits : aliased uu_IC3CONbits_t  -- p32mx470f512.h:508
     with Import => True,
     Convention => C,
     External_Name => "IC3CON";

   IC3CONCLR : aliased unsigned  -- p32mx470f512.h:509
     with Import => True,
     Convention => C,
     External_Name => "IC3CONCLR";

   IC3CONSET : aliased unsigned  -- p32mx470f512.h:510
     with Import => True,
     Convention => C,
     External_Name => "IC3CONSET";

   IC3CONINV : aliased unsigned  -- p32mx470f512.h:511
     with Import => True,
     Convention => C,
     External_Name => "IC3CONINV";

   IC3BUF : aliased unsigned  -- p32mx470f512.h:512
     with Import => True,
     Convention => C,
     External_Name => "IC3BUF";

   IC4CON : aliased unsigned  -- p32mx470f512.h:513
     with Import => True,
     Convention => C,
     External_Name => "IC4CON";

   type uu_IC4CONbits_t_struct920 is record
      ICM      : Extensions.Unsigned_3;  -- p32mx470f512.h:516
      ICBNE    : Extensions.Unsigned_1;  -- p32mx470f512.h:517
      ICOV     : Extensions.Unsigned_1;  -- p32mx470f512.h:518
      ICI      : Extensions.Unsigned_2;  -- p32mx470f512.h:519
      ICTMR    : Extensions.Unsigned_1;  -- p32mx470f512.h:520
      C32      : Extensions.Unsigned_1;  -- p32mx470f512.h:521
      FEDGE    : Extensions.Unsigned_1;  -- p32mx470f512.h:522
      anon2438 : Extensions.Unsigned_3;  -- p32mx470f512.h:523
      SIDL     : Extensions.Unsigned_1;  -- p32mx470f512.h:524
      anon2440 : Extensions.Unsigned_1;  -- p32mx470f512.h:525
      ON       : Extensions.Unsigned_1;  -- p32mx470f512.h:526
   end record
     with Convention => C_Pass_By_Copy,
     Pack => True,
     Alignment => 4;
   type uu_IC4CONbits_t_struct921 is record
      ICM0     : Extensions.Unsigned_1;  -- p32mx470f512.h:529
      ICM1     : Extensions.Unsigned_1;  -- p32mx470f512.h:530
      ICM2     : Extensions.Unsigned_1;  -- p32mx470f512.h:531
      anon2448 : Extensions.Unsigned_2;  -- p32mx470f512.h:532
      ICI0     : Extensions.Unsigned_1;  -- p32mx470f512.h:533
      ICI1     : Extensions.Unsigned_1;  -- p32mx470f512.h:534
   end record
     with Convention => C_Pass_By_Copy,
     Pack => True,
     Alignment => 4;
   type uu_IC4CONbits_t_struct922 is record
      anon2454 : Extensions.Unsigned_13;  -- p32mx470f512.h:537
      ICSIDL   : Extensions.Unsigned_1;  -- p32mx470f512.h:538
   end record
     with Convention => C_Pass_By_Copy,
     Pack => True,
     Alignment => 4;
   type uu_IC4CONbits_t_struct923 is record
      w : aliased unsigned;  -- p32mx470f512.h:541
   end record
     with Convention => C_Pass_By_Copy;
   type uu_IC4CONbits_t (discr : unsigned := 0) is record
      case discr is
         when 0 => anon2443 : aliased uu_IC4CONbits_t_struct920;  -- p32mx470f512.h:527
         when 1 => anon2452 : aliased uu_IC4CONbits_t_struct921;  -- p32mx470f512.h:535
         when 2 => anon2457 : aliased uu_IC4CONbits_t_struct922;  -- p32mx470f512.h:539
         when 3 => anon2461 : aliased uu_IC4CONbits_t_struct923;  -- p32mx470f512.h:542
         when others => null;
      end case;
   end record
     with Convention => C_Pass_By_Copy,
     Unchecked_Union => True;  -- p32mx470f512.h:543

   IC4CONbits : aliased uu_IC4CONbits_t  -- p32mx470f512.h:544
     with Import => True,
     Convention => C,
     External_Name => "IC4CON";

   IC4CONCLR : aliased unsigned  -- p32mx470f512.h:545
     with Import => True,
     Convention => C,
     External_Name => "IC4CONCLR";

   IC4CONSET : aliased unsigned  -- p32mx470f512.h:546
     with Import => True,
     Convention => C,
     External_Name => "IC4CONSET";

   IC4CONINV : aliased unsigned  -- p32mx470f512.h:547
     with Import => True,
     Convention => C,
     External_Name => "IC4CONINV";

   IC4BUF : aliased unsigned  -- p32mx470f512.h:548
     with Import => True,
     Convention => C,
     External_Name => "IC4BUF";

   IC5CON : aliased unsigned  -- p32mx470f512.h:549
     with Import => True,
     Convention => C,
     External_Name => "IC5CON";

   type uu_IC5CONbits_t_struct928 is record
      ICM      : Extensions.Unsigned_3;  -- p32mx470f512.h:552
      ICBNE    : Extensions.Unsigned_1;  -- p32mx470f512.h:553
      ICOV     : Extensions.Unsigned_1;  -- p32mx470f512.h:554
      ICI      : Extensions.Unsigned_2;  -- p32mx470f512.h:555
      ICTMR    : Extensions.Unsigned_1;  -- p32mx470f512.h:556
      C32      : Extensions.Unsigned_1;  -- p32mx470f512.h:557
      FEDGE    : Extensions.Unsigned_1;  -- p32mx470f512.h:558
      anon2478 : Extensions.Unsigned_3;  -- p32mx470f512.h:559
      SIDL     : Extensions.Unsigned_1;  -- p32mx470f512.h:560
      anon2480 : Extensions.Unsigned_1;  -- p32mx470f512.h:561
      ON       : Extensions.Unsigned_1;  -- p32mx470f512.h:562
   end record
     with Convention => C_Pass_By_Copy,
     Pack => True,
     Alignment => 4;
   type uu_IC5CONbits_t_struct929 is record
      ICM0     : Extensions.Unsigned_1;  -- p32mx470f512.h:565
      ICM1     : Extensions.Unsigned_1;  -- p32mx470f512.h:566
      ICM2     : Extensions.Unsigned_1;  -- p32mx470f512.h:567
      anon2488 : Extensions.Unsigned_2;  -- p32mx470f512.h:568
      ICI0     : Extensions.Unsigned_1;  -- p32mx470f512.h:569
      ICI1     : Extensions.Unsigned_1;  -- p32mx470f512.h:570
   end record
     with Convention => C_Pass_By_Copy,
     Pack => True,
     Alignment => 4;
   type uu_IC5CONbits_t_struct930 is record
      anon2494 : Extensions.Unsigned_13;  -- p32mx470f512.h:573
      ICSIDL   : Extensions.Unsigned_1;  -- p32mx470f512.h:574
   end record
     with Convention => C_Pass_By_Copy,
     Pack => True,
     Alignment => 4;
   type uu_IC5CONbits_t_struct931 is record
      w : aliased unsigned;  -- p32mx470f512.h:577
   end record
     with Convention => C_Pass_By_Copy;
   type uu_IC5CONbits_t (discr : unsigned := 0) is record
      case discr is
         when 0 => anon2483 : aliased uu_IC5CONbits_t_struct928;  -- p32mx470f512.h:563
         when 1 => anon2492 : aliased uu_IC5CONbits_t_struct929;  -- p32mx470f512.h:571
         when 2 => anon2497 : aliased uu_IC5CONbits_t_struct930;  -- p32mx470f512.h:575
         when 3 => anon2501 : aliased uu_IC5CONbits_t_struct931;  -- p32mx470f512.h:578
         when others => null;
      end case;
   end record
     with Convention => C_Pass_By_Copy,
     Unchecked_Union => True;  -- p32mx470f512.h:579

   IC5CONbits : aliased uu_IC5CONbits_t  -- p32mx470f512.h:580
     with Import => True,
     Convention => C,
     External_Name => "IC5CON";

   IC5CONCLR : aliased unsigned  -- p32mx470f512.h:581
     with Import => True,
     Convention => C,
     External_Name => "IC5CONCLR";

   IC5CONSET : aliased unsigned  -- p32mx470f512.h:582
     with Import => True,
     Convention => C,
     External_Name => "IC5CONSET";

   IC5CONINV : aliased unsigned  -- p32mx470f512.h:583
     with Import => True,
     Convention => C,
     External_Name => "IC5CONINV";

   IC5BUF : aliased unsigned  -- p32mx470f512.h:584
     with Import => True,
     Convention => C,
     External_Name => "IC5BUF";

   OC1CON : aliased unsigned  -- p32mx470f512.h:585
     with Import => True,
     Convention => C,
     External_Name => "OC1CON";

   type uu_OC1CONbits_t_struct936 is record
      OCM      : Extensions.Unsigned_3;  -- p32mx470f512.h:588
      OCTSEL   : Extensions.Unsigned_1;  -- p32mx470f512.h:589
      OCFLT    : Extensions.Unsigned_1;  -- p32mx470f512.h:590
      OC32     : Extensions.Unsigned_1;  -- p32mx470f512.h:591
      anon2515 : Extensions.Unsigned_7;  -- p32mx470f512.h:592
      SIDL     : Extensions.Unsigned_1;  -- p32mx470f512.h:593
      anon2517 : Extensions.Unsigned_1;  -- p32mx470f512.h:594
      ON       : Extensions.Unsigned_1;  -- p32mx470f512.h:595
   end record
     with Convention => C_Pass_By_Copy,
     Pack => True,
     Alignment => 4;
   type uu_OC1CONbits_t_struct938 is record
      OCM0 : Extensions.Unsigned_1;  -- p32mx470f512.h:598
      OCM1 : Extensions.Unsigned_1;  -- p32mx470f512.h:599
      OCM2 : Extensions.Unsigned_1;  -- p32mx470f512.h:600
   end record
     with Convention => C_Pass_By_Copy,
     Pack => True,
     Alignment => 4;
   type uu_OC1CONbits_t_struct939 is record
      anon2528 : Extensions.Unsigned_13;  -- p32mx470f512.h:603
      OCSIDL   : Extensions.Unsigned_1;  -- p32mx470f512.h:604
   end record
     with Convention => C_Pass_By_Copy,
     Pack => True,
     Alignment => 4;
   type uu_OC1CONbits_t_struct940 is record
      w : aliased unsigned;  -- p32mx470f512.h:607
   end record
     with Convention => C_Pass_By_Copy;
   type uu_OC1CONbits_t (discr : unsigned := 0) is record
      case discr is
         when 0 => anon2520 : aliased uu_OC1CONbits_t_struct936;  -- p32mx470f512.h:596
         when 1 => anon2526 : aliased uu_OC1CONbits_t_struct938;  -- p32mx470f512.h:601
         when 2 => anon2531 : aliased uu_OC1CONbits_t_struct939;  -- p32mx470f512.h:605
         when 3 => anon2535 : aliased uu_OC1CONbits_t_struct940;  -- p32mx470f512.h:608
         when others => null;
      end case;
   end record
     with Convention => C_Pass_By_Copy,
     Unchecked_Union => True;  -- p32mx470f512.h:609

   OC1CONbits : aliased uu_OC1CONbits_t  -- p32mx470f512.h:610
     with Import => True,
     Convention => C,
     External_Name => "OC1CON";

   OC1CONCLR : aliased unsigned  -- p32mx470f512.h:611
     with Import => True,
     Convention => C,
     External_Name => "OC1CONCLR";

   OC1CONSET : aliased unsigned  -- p32mx470f512.h:612
     with Import => True,
     Convention => C,
     External_Name => "OC1CONSET";

   OC1CONINV : aliased unsigned  -- p32mx470f512.h:613
     with Import => True,
     Convention => C,
     External_Name => "OC1CONINV";

   OC1R : aliased unsigned  -- p32mx470f512.h:614
     with Import => True,
     Convention => C,
     External_Name => "OC1R";

   OC1RCLR : aliased unsigned  -- p32mx470f512.h:615
     with Import => True,
     Convention => C,
     External_Name => "OC1RCLR";

   OC1RSET : aliased unsigned  -- p32mx470f512.h:616
     with Import => True,
     Convention => C,
     External_Name => "OC1RSET";

   OC1RINV : aliased unsigned  -- p32mx470f512.h:617
     with Import => True,
     Convention => C,
     External_Name => "OC1RINV";

   OC1RS : aliased unsigned  -- p32mx470f512.h:618
     with Import => True,
     Convention => C,
     External_Name => "OC1RS";

   OC1RSCLR : aliased unsigned  -- p32mx470f512.h:619
     with Import => True,
     Convention => C,
     External_Name => "OC1RSCLR";

   OC1RSSET : aliased unsigned  -- p32mx470f512.h:620
     with Import => True,
     Convention => C,
     External_Name => "OC1RSSET";

   OC1RSINV : aliased unsigned  -- p32mx470f512.h:621
     with Import => True,
     Convention => C,
     External_Name => "OC1RSINV";

   OC2CON : aliased unsigned  -- p32mx470f512.h:622
     with Import => True,
     Convention => C,
     External_Name => "OC2CON";

   type uu_OC2CONbits_t_struct945 is record
      OCM      : Extensions.Unsigned_3;  -- p32mx470f512.h:625
      OCTSEL   : Extensions.Unsigned_1;  -- p32mx470f512.h:626
      OCFLT    : Extensions.Unsigned_1;  -- p32mx470f512.h:627
      OC32     : Extensions.Unsigned_1;  -- p32mx470f512.h:628
      anon2556 : Extensions.Unsigned_7;  -- p32mx470f512.h:629
      SIDL     : Extensions.Unsigned_1;  -- p32mx470f512.h:630
      anon2558 : Extensions.Unsigned_1;  -- p32mx470f512.h:631
      ON       : Extensions.Unsigned_1;  -- p32mx470f512.h:632
   end record
     with Convention => C_Pass_By_Copy,
     Pack => True,
     Alignment => 4;
   type uu_OC2CONbits_t_struct946 is record
      OCM0 : Extensions.Unsigned_1;  -- p32mx470f512.h:635
      OCM1 : Extensions.Unsigned_1;  -- p32mx470f512.h:636
      OCM2 : Extensions.Unsigned_1;  -- p32mx470f512.h:637
   end record
     with Convention => C_Pass_By_Copy,
     Pack => True,
     Alignment => 4;
   type uu_OC2CONbits_t_struct947 is record
      anon2569 : Extensions.Unsigned_13;  -- p32mx470f512.h:640
      OCSIDL   : Extensions.Unsigned_1;  -- p32mx470f512.h:641
   end record
     with Convention => C_Pass_By_Copy,
     Pack => True,
     Alignment => 4;
   type uu_OC2CONbits_t_struct948 is record
      w : aliased unsigned;  -- p32mx470f512.h:644
   end record
     with Convention => C_Pass_By_Copy;
   type uu_OC2CONbits_t (discr : unsigned := 0) is record
      case discr is
         when 0 => anon2561 : aliased uu_OC2CONbits_t_struct945;  -- p32mx470f512.h:633
         when 1 => anon2567 : aliased uu_OC2CONbits_t_struct946;  -- p32mx470f512.h:638
         when 2 => anon2572 : aliased uu_OC2CONbits_t_struct947;  -- p32mx470f512.h:642
         when 3 => anon2576 : aliased uu_OC2CONbits_t_struct948;  -- p32mx470f512.h:645
         when others => null;
      end case;
   end record
     with Convention => C_Pass_By_Copy,
     Unchecked_Union => True;  -- p32mx470f512.h:646

   OC2CONbits : aliased uu_OC2CONbits_t  -- p32mx470f512.h:647
     with Import => True,
     Convention => C,
     External_Name => "OC2CON";

   OC2CONCLR : aliased unsigned  -- p32mx470f512.h:648
     with Import => True,
     Convention => C,
     External_Name => "OC2CONCLR";

   OC2CONSET : aliased unsigned  -- p32mx470f512.h:649
     with Import => True,
     Convention => C,
     External_Name => "OC2CONSET";

   OC2CONINV : aliased unsigned  -- p32mx470f512.h:650
     with Import => True,
     Convention => C,
     External_Name => "OC2CONINV";

   OC2R : aliased unsigned  -- p32mx470f512.h:651
     with Import => True,
     Convention => C,
     External_Name => "OC2R";

   OC2RCLR : aliased unsigned  -- p32mx470f512.h:652
     with Import => True,
     Convention => C,
     External_Name => "OC2RCLR";

   OC2RSET : aliased unsigned  -- p32mx470f512.h:653
     with Import => True,
     Convention => C,
     External_Name => "OC2RSET";

   OC2RINV : aliased unsigned  -- p32mx470f512.h:654
     with Import => True,
     Convention => C,
     External_Name => "OC2RINV";

   OC2RS : aliased unsigned  -- p32mx470f512.h:655
     with Import => True,
     Convention => C,
     External_Name => "OC2RS";

   OC2RSCLR : aliased unsigned  -- p32mx470f512.h:656
     with Import => True,
     Convention => C,
     External_Name => "OC2RSCLR";

   OC2RSSET : aliased unsigned  -- p32mx470f512.h:657
     with Import => True,
     Convention => C,
     External_Name => "OC2RSSET";

   OC2RSINV : aliased unsigned  -- p32mx470f512.h:658
     with Import => True,
     Convention => C,
     External_Name => "OC2RSINV";

   OC3CON : aliased unsigned  -- p32mx470f512.h:659
     with Import => True,
     Convention => C,
     External_Name => "OC3CON";

   type uu_OC3CONbits_t_struct953 is record
      OCM      : Extensions.Unsigned_3;  -- p32mx470f512.h:662
      OCTSEL   : Extensions.Unsigned_1;  -- p32mx470f512.h:663
      OCFLT    : Extensions.Unsigned_1;  -- p32mx470f512.h:664
      OC32     : Extensions.Unsigned_1;  -- p32mx470f512.h:665
      anon2597 : Extensions.Unsigned_7;  -- p32mx470f512.h:666
      SIDL     : Extensions.Unsigned_1;  -- p32mx470f512.h:667
      anon2599 : Extensions.Unsigned_1;  -- p32mx470f512.h:668
      ON       : Extensions.Unsigned_1;  -- p32mx470f512.h:669
   end record
     with Convention => C_Pass_By_Copy,
     Pack => True,
     Alignment => 4;
   type uu_OC3CONbits_t_struct954 is record
      OCM0 : Extensions.Unsigned_1;  -- p32mx470f512.h:672
      OCM1 : Extensions.Unsigned_1;  -- p32mx470f512.h:673
      OCM2 : Extensions.Unsigned_1;  -- p32mx470f512.h:674
   end record
     with Convention => C_Pass_By_Copy,
     Pack => True,
     Alignment => 4;
   type uu_OC3CONbits_t_struct955 is record
      anon2610 : Extensions.Unsigned_13;  -- p32mx470f512.h:677
      OCSIDL   : Extensions.Unsigned_1;  -- p32mx470f512.h:678
   end record
     with Convention => C_Pass_By_Copy,
     Pack => True,
     Alignment => 4;
   type uu_OC3CONbits_t_struct956 is record
      w : aliased unsigned;  -- p32mx470f512.h:681
   end record
     with Convention => C_Pass_By_Copy;
   type uu_OC3CONbits_t (discr : unsigned := 0) is record
      case discr is
         when 0 => anon2602 : aliased uu_OC3CONbits_t_struct953;  -- p32mx470f512.h:670
         when 1 => anon2608 : aliased uu_OC3CONbits_t_struct954;  -- p32mx470f512.h:675
         when 2 => anon2613 : aliased uu_OC3CONbits_t_struct955;  -- p32mx470f512.h:679
         when 3 => anon2617 : aliased uu_OC3CONbits_t_struct956;  -- p32mx470f512.h:682
         when others => null;
      end case;
   end record
     with Convention => C_Pass_By_Copy,
     Unchecked_Union => True;  -- p32mx470f512.h:683

   OC3CONbits : aliased uu_OC3CONbits_t  -- p32mx470f512.h:684
     with Import => True,
     Convention => C,
     External_Name => "OC3CON";

   OC3CONCLR : aliased unsigned  -- p32mx470f512.h:685
     with Import => True,
     Convention => C,
     External_Name => "OC3CONCLR";

   OC3CONSET : aliased unsigned  -- p32mx470f512.h:686
     with Import => True,
     Convention => C,
     External_Name => "OC3CONSET";

   OC3CONINV : aliased unsigned  -- p32mx470f512.h:687
     with Import => True,
     Convention => C,
     External_Name => "OC3CONINV";

   OC3R : aliased unsigned  -- p32mx470f512.h:688
     with Import => True,
     Convention => C,
     External_Name => "OC3R";

   OC3RCLR : aliased unsigned  -- p32mx470f512.h:689
     with Import => True,
     Convention => C,
     External_Name => "OC3RCLR";

   OC3RSET : aliased unsigned  -- p32mx470f512.h:690
     with Import => True,
     Convention => C,
     External_Name => "OC3RSET";

   OC3RINV : aliased unsigned  -- p32mx470f512.h:691
     with Import => True,
     Convention => C,
     External_Name => "OC3RINV";

   OC3RS : aliased unsigned  -- p32mx470f512.h:692
     with Import => True,
     Convention => C,
     External_Name => "OC3RS";

   OC3RSCLR : aliased unsigned  -- p32mx470f512.h:693
     with Import => True,
     Convention => C,
     External_Name => "OC3RSCLR";

   OC3RSSET : aliased unsigned  -- p32mx470f512.h:694
     with Import => True,
     Convention => C,
     External_Name => "OC3RSSET";

   OC3RSINV : aliased unsigned  -- p32mx470f512.h:695
     with Import => True,
     Convention => C,
     External_Name => "OC3RSINV";

   OC4CON : aliased unsigned  -- p32mx470f512.h:696
     with Import => True,
     Convention => C,
     External_Name => "OC4CON";

   type uu_OC4CONbits_t_struct961 is record
      OCM      : Extensions.Unsigned_3;  -- p32mx470f512.h:699
      OCTSEL   : Extensions.Unsigned_1;  -- p32mx470f512.h:700
      OCFLT    : Extensions.Unsigned_1;  -- p32mx470f512.h:701
      OC32     : Extensions.Unsigned_1;  -- p32mx470f512.h:702
      anon2638 : Extensions.Unsigned_7;  -- p32mx470f512.h:703
      SIDL     : Extensions.Unsigned_1;  -- p32mx470f512.h:704
      anon2640 : Extensions.Unsigned_1;  -- p32mx470f512.h:705
      ON       : Extensions.Unsigned_1;  -- p32mx470f512.h:706
   end record
     with Convention => C_Pass_By_Copy,
     Pack => True,
     Alignment => 4;
   type uu_OC4CONbits_t_struct962 is record
      OCM0 : Extensions.Unsigned_1;  -- p32mx470f512.h:709
      OCM1 : Extensions.Unsigned_1;  -- p32mx470f512.h:710
      OCM2 : Extensions.Unsigned_1;  -- p32mx470f512.h:711
   end record
     with Convention => C_Pass_By_Copy,
     Pack => True,
     Alignment => 4;
   type uu_OC4CONbits_t_struct963 is record
      anon2651 : Extensions.Unsigned_13;  -- p32mx470f512.h:714
      OCSIDL   : Extensions.Unsigned_1;  -- p32mx470f512.h:715
   end record
     with Convention => C_Pass_By_Copy,
     Pack => True,
     Alignment => 4;
   type uu_OC4CONbits_t_struct964 is record
      w : aliased unsigned;  -- p32mx470f512.h:718
   end record
     with Convention => C_Pass_By_Copy;
   type uu_OC4CONbits_t (discr : unsigned := 0) is record
      case discr is
         when 0 => anon2643 : aliased uu_OC4CONbits_t_struct961;  -- p32mx470f512.h:707
         when 1 => anon2649 : aliased uu_OC4CONbits_t_struct962;  -- p32mx470f512.h:712
         when 2 => anon2654 : aliased uu_OC4CONbits_t_struct963;  -- p32mx470f512.h:716
         when 3 => anon2658 : aliased uu_OC4CONbits_t_struct964;  -- p32mx470f512.h:719
         when others => null;
      end case;
   end record
     with Convention => C_Pass_By_Copy,
     Unchecked_Union => True;  -- p32mx470f512.h:720

   OC4CONbits : aliased uu_OC4CONbits_t  -- p32mx470f512.h:721
     with Import => True,
     Convention => C,
     External_Name => "OC4CON";

   OC4CONCLR : aliased unsigned  -- p32mx470f512.h:722
     with Import => True,
     Convention => C,
     External_Name => "OC4CONCLR";

   OC4CONSET : aliased unsigned  -- p32mx470f512.h:723
     with Import => True,
     Convention => C,
     External_Name => "OC4CONSET";

   OC4CONINV : aliased unsigned  -- p32mx470f512.h:724
     with Import => True,
     Convention => C,
     External_Name => "OC4CONINV";

   OC4R : aliased unsigned  -- p32mx470f512.h:725
     with Import => True,
     Convention => C,
     External_Name => "OC4R";

   OC4RCLR : aliased unsigned  -- p32mx470f512.h:726
     with Import => True,
     Convention => C,
     External_Name => "OC4RCLR";

   OC4RSET : aliased unsigned  -- p32mx470f512.h:727
     with Import => True,
     Convention => C,
     External_Name => "OC4RSET";

   OC4RINV : aliased unsigned  -- p32mx470f512.h:728
     with Import => True,
     Convention => C,
     External_Name => "OC4RINV";

   OC4RS : aliased unsigned  -- p32mx470f512.h:729
     with Import => True,
     Convention => C,
     External_Name => "OC4RS";

   OC4RSCLR : aliased unsigned  -- p32mx470f512.h:730
     with Import => True,
     Convention => C,
     External_Name => "OC4RSCLR";

   OC4RSSET : aliased unsigned  -- p32mx470f512.h:731
     with Import => True,
     Convention => C,
     External_Name => "OC4RSSET";

   OC4RSINV : aliased unsigned  -- p32mx470f512.h:732
     with Import => True,
     Convention => C,
     External_Name => "OC4RSINV";

   OC5CON : aliased unsigned  -- p32mx470f512.h:733
     with Import => True,
     Convention => C,
     External_Name => "OC5CON";

   type uu_OC5CONbits_t_struct969 is record
      OCM      : Extensions.Unsigned_3;  -- p32mx470f512.h:736
      OCTSEL   : Extensions.Unsigned_1;  -- p32mx470f512.h:737
      OCFLT    : Extensions.Unsigned_1;  -- p32mx470f512.h:738
      OC32     : Extensions.Unsigned_1;  -- p32mx470f512.h:739
      anon2679 : Extensions.Unsigned_7;  -- p32mx470f512.h:740
      SIDL     : Extensions.Unsigned_1;  -- p32mx470f512.h:741
      anon2681 : Extensions.Unsigned_1;  -- p32mx470f512.h:742
      ON       : Extensions.Unsigned_1;  -- p32mx470f512.h:743
   end record
     with Convention => C_Pass_By_Copy,
     Pack => True,
     Alignment => 4;
   type uu_OC5CONbits_t_struct970 is record
      OCM0 : Extensions.Unsigned_1;  -- p32mx470f512.h:746
      OCM1 : Extensions.Unsigned_1;  -- p32mx470f512.h:747
      OCM2 : Extensions.Unsigned_1;  -- p32mx470f512.h:748
   end record
     with Convention => C_Pass_By_Copy,
     Pack => True,
     Alignment => 4;
   type uu_OC5CONbits_t_struct971 is record
      anon2692 : Extensions.Unsigned_13;  -- p32mx470f512.h:751
      OCSIDL   : Extensions.Unsigned_1;  -- p32mx470f512.h:752
   end record
     with Convention => C_Pass_By_Copy,
     Pack => True,
     Alignment => 4;
   type uu_OC5CONbits_t_struct972 is record
      w : aliased unsigned;  -- p32mx470f512.h:755
   end record
     with Convention => C_Pass_By_Copy;
   type uu_OC5CONbits_t (discr : unsigned := 0) is record
      case discr is
         when 0 => anon2684 : aliased uu_OC5CONbits_t_struct969;  -- p32mx470f512.h:744
         when 1 => anon2690 : aliased uu_OC5CONbits_t_struct970;  -- p32mx470f512.h:749
         when 2 => anon2695 : aliased uu_OC5CONbits_t_struct971;  -- p32mx470f512.h:753
         when 3 => anon2699 : aliased uu_OC5CONbits_t_struct972;  -- p32mx470f512.h:756
         when others => null;
      end case;
   end record
     with Convention => C_Pass_By_Copy,
     Unchecked_Union => True;  -- p32mx470f512.h:757

   OC5CONbits : aliased uu_OC5CONbits_t  -- p32mx470f512.h:758
     with Import => True,
     Convention => C,
     External_Name => "OC5CON";

   OC5CONCLR : aliased unsigned  -- p32mx470f512.h:759
     with Import => True,
     Convention => C,
     External_Name => "OC5CONCLR";

   OC5CONSET : aliased unsigned  -- p32mx470f512.h:760
     with Import => True,
     Convention => C,
     External_Name => "OC5CONSET";

   OC5CONINV : aliased unsigned  -- p32mx470f512.h:761
     with Import => True,
     Convention => C,
     External_Name => "OC5CONINV";

   OC5R : aliased unsigned  -- p32mx470f512.h:762
     with Import => True,
     Convention => C,
     External_Name => "OC5R";

   OC5RCLR : aliased unsigned  -- p32mx470f512.h:763
     with Import => True,
     Convention => C,
     External_Name => "OC5RCLR";

   OC5RSET : aliased unsigned  -- p32mx470f512.h:764
     with Import => True,
     Convention => C,
     External_Name => "OC5RSET";

   OC5RINV : aliased unsigned  -- p32mx470f512.h:765
     with Import => True,
     Convention => C,
     External_Name => "OC5RINV";

   OC5RS : aliased unsigned  -- p32mx470f512.h:766
     with Import => True,
     Convention => C,
     External_Name => "OC5RS";

   OC5RSCLR : aliased unsigned  -- p32mx470f512.h:767
     with Import => True,
     Convention => C,
     External_Name => "OC5RSCLR";

   OC5RSSET : aliased unsigned  -- p32mx470f512.h:768
     with Import => True,
     Convention => C,
     External_Name => "OC5RSSET";

   OC5RSINV : aliased unsigned  -- p32mx470f512.h:769
     with Import => True,
     Convention => C,
     External_Name => "OC5RSINV";

   I2C1111CON : aliased unsigned  -- p32mx470f512.h:770
     with Import => True,
     Convention => C,
     External_Name => "I2C1111CON";

   type uu_I2C1111CONbits_t_struct977 is record
      SEN      : Extensions.Unsigned_1;  -- p32mx470f512.h:773
      RSEN     : Extensions.Unsigned_1;  -- p32mx470f512.h:774
      PEN      : Extensions.Unsigned_1;  -- p32mx470f512.h:775
      RCEN     : Extensions.Unsigned_1;  -- p32mx470f512.h:776
      ACKEN    : Extensions.Unsigned_1;  -- p32mx470f512.h:777
      ACKDT    : Extensions.Unsigned_1;  -- p32mx470f512.h:778
      STREN    : Extensions.Unsigned_1;  -- p32mx470f512.h:779
      GCEN     : Extensions.Unsigned_1;  -- p32mx470f512.h:780
      SMEN     : Extensions.Unsigned_1;  -- p32mx470f512.h:781
      DISSLW   : Extensions.Unsigned_1;  -- p32mx470f512.h:782
      A10M     : Extensions.Unsigned_1;  -- p32mx470f512.h:783
      STRICT   : Extensions.Unsigned_1;  -- p32mx470f512.h:784
      SCLREL   : Extensions.Unsigned_1;  -- p32mx470f512.h:785
      SIDL     : Extensions.Unsigned_1;  -- p32mx470f512.h:786
      anon2730 : Extensions.Unsigned_1;  -- p32mx470f512.h:787
      ON       : Extensions.Unsigned_1;  -- p32mx470f512.h:788
   end record
     with Convention => C_Pass_By_Copy,
     Pack => True,
     Alignment => 4;
   type uu_I2C1111CONbits_t_struct978 is record
      anon2735 : Extensions.Unsigned_11;  -- p32mx470f512.h:791
      IPMIEN   : Extensions.Unsigned_1;  -- p32mx470f512.h:792
      anon2737 : Extensions.Unsigned_1;  -- p32mx470f512.h:793
      I2CSIDL  : Extensions.Unsigned_1;  -- p32mx470f512.h:794
      anon2739 : Extensions.Unsigned_1;  -- p32mx470f512.h:795
      I2CEN    : Extensions.Unsigned_1;  -- p32mx470f512.h:796
   end record
     with Convention => C_Pass_By_Copy,
     Pack => True,
     Alignment => 4;
   type uu_I2C1111CONbits_t_struct980 is record
      w : aliased unsigned;  -- p32mx470f512.h:799
   end record
     with Convention => C_Pass_By_Copy;
   type uu_I2C1111CONbits_t (discr : unsigned := 0) is record
      case discr is
         when 0 => anon2733 : aliased uu_I2C1111CONbits_t_struct977;  -- p32mx470f512.h:789
         when 1 => anon2742 : aliased uu_I2C1111CONbits_t_struct978;  -- p32mx470f512.h:797
         when 2 => anon2746 : aliased uu_I2C1111CONbits_t_struct980;  -- p32mx470f512.h:800
         when others => null;
      end case;
   end record
     with Convention => C_Pass_By_Copy,
     Unchecked_Union => True;  -- p32mx470f512.h:801

   I2C1111CONbits : aliased uu_I2C1111CONbits_t  -- p32mx470f512.h:802
     with Import => True,
     Convention => C,
     External_Name => "I2C1111CON";

   I2C1CON : aliased unsigned  -- p32mx470f512.h:803
     with Import => True,
     Convention => C,
     External_Name => "I2C1CON";

   type uu_I2C1CONbits_t_struct987 is record
      SEN      : Extensions.Unsigned_1;  -- p32mx470f512.h:806
      RSEN     : Extensions.Unsigned_1;  -- p32mx470f512.h:807
      PEN      : Extensions.Unsigned_1;  -- p32mx470f512.h:808
      RCEN     : Extensions.Unsigned_1;  -- p32mx470f512.h:809
      ACKEN    : Extensions.Unsigned_1;  -- p32mx470f512.h:810
      ACKDT    : Extensions.Unsigned_1;  -- p32mx470f512.h:811
      STREN    : Extensions.Unsigned_1;  -- p32mx470f512.h:812
      GCEN     : Extensions.Unsigned_1;  -- p32mx470f512.h:813
      SMEN     : Extensions.Unsigned_1;  -- p32mx470f512.h:814
      DISSLW   : Extensions.Unsigned_1;  -- p32mx470f512.h:815
      A10M     : Extensions.Unsigned_1;  -- p32mx470f512.h:816
      STRICT   : Extensions.Unsigned_1;  -- p32mx470f512.h:817
      SCLREL   : Extensions.Unsigned_1;  -- p32mx470f512.h:818
      SIDL     : Extensions.Unsigned_1;  -- p32mx470f512.h:819
      anon2766 : Extensions.Unsigned_1;  -- p32mx470f512.h:820
      ON       : Extensions.Unsigned_1;  -- p32mx470f512.h:821
   end record
     with Convention => C_Pass_By_Copy,
     Pack => True,
     Alignment => 4;
   type uu_I2C1CONbits_t_struct988 is record
      anon2771 : Extensions.Unsigned_11;  -- p32mx470f512.h:824
      IPMIEN   : Extensions.Unsigned_1;  -- p32mx470f512.h:825
      anon2773 : Extensions.Unsigned_1;  -- p32mx470f512.h:826
      I2CSIDL  : Extensions.Unsigned_1;  -- p32mx470f512.h:827
      anon2775 : Extensions.Unsigned_1;  -- p32mx470f512.h:828
      I2CEN    : Extensions.Unsigned_1;  -- p32mx470f512.h:829
   end record
     with Convention => C_Pass_By_Copy,
     Pack => True,
     Alignment => 4;
   type uu_I2C1CONbits_t_struct989 is record
      w : aliased unsigned;  -- p32mx470f512.h:832
   end record
     with Convention => C_Pass_By_Copy;
   type uu_I2C1CONbits_t (discr : unsigned := 0) is record
      case discr is
         when 0 => anon2769 : aliased uu_I2C1CONbits_t_struct987;  -- p32mx470f512.h:822
         when 1 => anon2778 : aliased uu_I2C1CONbits_t_struct988;  -- p32mx470f512.h:830
         when 2 => anon2782 : aliased uu_I2C1CONbits_t_struct989;  -- p32mx470f512.h:833
         when others => null;
      end case;
   end record
     with Convention => C_Pass_By_Copy,
     Unchecked_Union => True;  -- p32mx470f512.h:834

   I2C1CONbits : aliased uu_I2C1CONbits_t  -- p32mx470f512.h:835
     with Import => True,
     Convention => C,
     External_Name => "I2C1CON";

   I2C1111CONCLR : aliased unsigned  -- p32mx470f512.h:836
     with Import => True,
     Convention => C,
     External_Name => "I2C1111CONCLR";

   I2C1CONCLR : aliased unsigned  -- p32mx470f512.h:837
     with Import => True,
     Convention => C,
     External_Name => "I2C1CONCLR";

   I2C1111CONSET : aliased unsigned  -- p32mx470f512.h:838
     with Import => True,
     Convention => C,
     External_Name => "I2C1111CONSET";

   I2C1CONSET : aliased unsigned  -- p32mx470f512.h:839
     with Import => True,
     Convention => C,
     External_Name => "I2C1CONSET";

   I2C1111CONINV : aliased unsigned  -- p32mx470f512.h:840
     with Import => True,
     Convention => C,
     External_Name => "I2C1111CONINV";

   I2C1CONINV : aliased unsigned  -- p32mx470f512.h:841
     with Import => True,
     Convention => C,
     External_Name => "I2C1CONINV";

   I2C1111STAT : aliased unsigned  -- p32mx470f512.h:842
     with Import => True,
     Convention => C,
     External_Name => "I2C1111STAT";

   type uu_I2C1111STATbits_t_struct994 is record
      TBF      : Extensions.Unsigned_1;  -- p32mx470f512.h:845
      RBF      : Extensions.Unsigned_1;  -- p32mx470f512.h:846
      R_W      : Extensions.Unsigned_1;  -- p32mx470f512.h:847
      S        : Extensions.Unsigned_1;  -- p32mx470f512.h:848
      P        : Extensions.Unsigned_1;  -- p32mx470f512.h:849
      D_A      : Extensions.Unsigned_1;  -- p32mx470f512.h:850
      I2COV    : Extensions.Unsigned_1;  -- p32mx470f512.h:851
      IWCOL    : Extensions.Unsigned_1;  -- p32mx470f512.h:852
      ADD10    : Extensions.Unsigned_1;  -- p32mx470f512.h:853
      GCSTAT   : Extensions.Unsigned_1;  -- p32mx470f512.h:854
      BCL      : Extensions.Unsigned_1;  -- p32mx470f512.h:855
      anon2805 : Extensions.Unsigned_3;  -- p32mx470f512.h:856
      TRSTAT   : Extensions.Unsigned_1;  -- p32mx470f512.h:857
      ACKSTAT  : Extensions.Unsigned_1;  -- p32mx470f512.h:858
   end record
     with Convention => C_Pass_By_Copy,
     Pack => True,
     Alignment => 4;
   type uu_I2C1111STATbits_t_struct995 is record
      anon2811 : Extensions.Unsigned_6;  -- p32mx470f512.h:861
      I2CPOV   : Extensions.Unsigned_1;  -- p32mx470f512.h:862
   end record
     with Convention => C_Pass_By_Copy,
     Pack => True,
     Alignment => 4;
   type uu_I2C1111STATbits_t_struct997 is record
      w : aliased unsigned;  -- p32mx470f512.h:865
   end record
     with Convention => C_Pass_By_Copy;
   type uu_I2C1111STATbits_t (discr : unsigned := 0) is record
      case discr is
         when 0 => anon2809 : aliased uu_I2C1111STATbits_t_struct994;  -- p32mx470f512.h:859
         when 1 => anon2814 : aliased uu_I2C1111STATbits_t_struct995;  -- p32mx470f512.h:863
         when 2 => anon2818 : aliased uu_I2C1111STATbits_t_struct997;  -- p32mx470f512.h:866
         when others => null;
      end case;
   end record
     with Convention => C_Pass_By_Copy,
     Unchecked_Union => True;  -- p32mx470f512.h:867

   I2C1111STATbits : aliased uu_I2C1111STATbits_t  -- p32mx470f512.h:868
     with Import => True,
     Convention => C,
     External_Name => "I2C1111STAT";

   I2C1STAT : aliased unsigned  -- p32mx470f512.h:869
     with Import => True,
     Convention => C,
     External_Name => "I2C1STAT";

   type uu_I2C1STATbits_t_struct1004 is record
      TBF      : Extensions.Unsigned_1;  -- p32mx470f512.h:872
      RBF      : Extensions.Unsigned_1;  -- p32mx470f512.h:873
      R_W      : Extensions.Unsigned_1;  -- p32mx470f512.h:874
      S        : Extensions.Unsigned_1;  -- p32mx470f512.h:875
      P        : Extensions.Unsigned_1;  -- p32mx470f512.h:876
      D_A      : Extensions.Unsigned_1;  -- p32mx470f512.h:877
      I2COV    : Extensions.Unsigned_1;  -- p32mx470f512.h:878
      IWCOL    : Extensions.Unsigned_1;  -- p32mx470f512.h:879
      ADD10    : Extensions.Unsigned_1;  -- p32mx470f512.h:880
      GCSTAT   : Extensions.Unsigned_1;  -- p32mx470f512.h:881
      BCL      : Extensions.Unsigned_1;  -- p32mx470f512.h:882
      anon2835 : Extensions.Unsigned_3;  -- p32mx470f512.h:883
      TRSTAT   : Extensions.Unsigned_1;  -- p32mx470f512.h:884
      ACKSTAT  : Extensions.Unsigned_1;  -- p32mx470f512.h:885
   end record
     with Convention => C_Pass_By_Copy,
     Pack => True,
     Alignment => 4;
   type uu_I2C1STATbits_t_struct1005 is record
      anon2841 : Extensions.Unsigned_6;  -- p32mx470f512.h:888
      I2CPOV   : Extensions.Unsigned_1;  -- p32mx470f512.h:889
   end record
     with Convention => C_Pass_By_Copy,
     Pack => True,
     Alignment => 4;
   type uu_I2C1STATbits_t_struct1006 is record
      w : aliased unsigned;  -- p32mx470f512.h:892
   end record
     with Convention => C_Pass_By_Copy;
   type uu_I2C1STATbits_t (discr : unsigned := 0) is record
      case discr is
         when 0 => anon2839 : aliased uu_I2C1STATbits_t_struct1004;  -- p32mx470f512.h:886
         when 1 => anon2844 : aliased uu_I2C1STATbits_t_struct1005;  -- p32mx470f512.h:890
         when 2 => anon2848 : aliased uu_I2C1STATbits_t_struct1006;  -- p32mx470f512.h:893
         when others => null;
      end case;
   end record
     with Convention => C_Pass_By_Copy,
     Unchecked_Union => True;  -- p32mx470f512.h:894

   I2C1STATbits : aliased uu_I2C1STATbits_t  -- p32mx470f512.h:895
     with Import => True,
     Convention => C,
     External_Name => "I2C1STAT";

   I2C1111STATCLR : aliased unsigned  -- p32mx470f512.h:896
     with Import => True,
     Convention => C,
     External_Name => "I2C1111STATCLR";

   I2C1STATCLR : aliased unsigned  -- p32mx470f512.h:897
     with Import => True,
     Convention => C,
     External_Name => "I2C1STATCLR";

   I2C1111STATSET : aliased unsigned  -- p32mx470f512.h:898
     with Import => True,
     Convention => C,
     External_Name => "I2C1111STATSET";

   I2C1STATSET : aliased unsigned  -- p32mx470f512.h:899
     with Import => True,
     Convention => C,
     External_Name => "I2C1STATSET";

   I2C1111STATINV : aliased unsigned  -- p32mx470f512.h:900
     with Import => True,
     Convention => C,
     External_Name => "I2C1111STATINV";

   I2C1STATINV : aliased unsigned  -- p32mx470f512.h:901
     with Import => True,
     Convention => C,
     External_Name => "I2C1STATINV";

   I2C1111ADD : aliased unsigned  -- p32mx470f512.h:902
     with Import => True,
     Convention => C,
     External_Name => "I2C1111ADD";

   I2C1ADD : aliased unsigned  -- p32mx470f512.h:903
     with Import => True,
     Convention => C,
     External_Name => "I2C1ADD";

   I2C1111ADDCLR : aliased unsigned  -- p32mx470f512.h:904
     with Import => True,
     Convention => C,
     External_Name => "I2C1111ADDCLR";

   I2C1ADDCLR : aliased unsigned  -- p32mx470f512.h:905
     with Import => True,
     Convention => C,
     External_Name => "I2C1ADDCLR";

   I2C1111ADDSET : aliased unsigned  -- p32mx470f512.h:906
     with Import => True,
     Convention => C,
     External_Name => "I2C1111ADDSET";

   I2C1ADDSET : aliased unsigned  -- p32mx470f512.h:907
     with Import => True,
     Convention => C,
     External_Name => "I2C1ADDSET";

   I2C1111ADDINV : aliased unsigned  -- p32mx470f512.h:908
     with Import => True,
     Convention => C,
     External_Name => "I2C1111ADDINV";

   I2C1ADDINV : aliased unsigned  -- p32mx470f512.h:909
     with Import => True,
     Convention => C,
     External_Name => "I2C1ADDINV";

   I2C1111MSK : aliased unsigned  -- p32mx470f512.h:910
     with Import => True,
     Convention => C,
     External_Name => "I2C1111MSK";

   I2C1MSK : aliased unsigned  -- p32mx470f512.h:911
     with Import => True,
     Convention => C,
     External_Name => "I2C1MSK";

   I2C1111MSKCLR : aliased unsigned  -- p32mx470f512.h:912
     with Import => True,
     Convention => C,
     External_Name => "I2C1111MSKCLR";

   I2C1MSKCLR : aliased unsigned  -- p32mx470f512.h:913
     with Import => True,
     Convention => C,
     External_Name => "I2C1MSKCLR";

   I2C1111MSKSET : aliased unsigned  -- p32mx470f512.h:914
     with Import => True,
     Convention => C,
     External_Name => "I2C1111MSKSET";

   I2C1MSKSET : aliased unsigned  -- p32mx470f512.h:915
     with Import => True,
     Convention => C,
     External_Name => "I2C1MSKSET";

   I2C1111MSKINV : aliased unsigned  -- p32mx470f512.h:916
     with Import => True,
     Convention => C,
     External_Name => "I2C1111MSKINV";

   I2C1MSKINV : aliased unsigned  -- p32mx470f512.h:917
     with Import => True,
     Convention => C,
     External_Name => "I2C1MSKINV";

   I2C1111BRG : aliased unsigned  -- p32mx470f512.h:918
     with Import => True,
     Convention => C,
     External_Name => "I2C1111BRG";

   I2C1BRG : aliased unsigned  -- p32mx470f512.h:919
     with Import => True,
     Convention => C,
     External_Name => "I2C1BRG";

   I2C1111BRGCLR : aliased unsigned  -- p32mx470f512.h:920
     with Import => True,
     Convention => C,
     External_Name => "I2C1111BRGCLR";

   I2C1BRGCLR : aliased unsigned  -- p32mx470f512.h:921
     with Import => True,
     Convention => C,
     External_Name => "I2C1BRGCLR";

   I2C1111BRGSET : aliased unsigned  -- p32mx470f512.h:922
     with Import => True,
     Convention => C,
     External_Name => "I2C1111BRGSET";

   I2C1BRGSET : aliased unsigned  -- p32mx470f512.h:923
     with Import => True,
     Convention => C,
     External_Name => "I2C1BRGSET";

   I2C1111BRGINV : aliased unsigned  -- p32mx470f512.h:924
     with Import => True,
     Convention => C,
     External_Name => "I2C1111BRGINV";

   I2C1BRGINV : aliased unsigned  -- p32mx470f512.h:925
     with Import => True,
     Convention => C,
     External_Name => "I2C1BRGINV";

   I2C1111TRN : aliased unsigned  -- p32mx470f512.h:926
     with Import => True,
     Convention => C,
     External_Name => "I2C1111TRN";

   I2C1TRN : aliased unsigned  -- p32mx470f512.h:927
     with Import => True,
     Convention => C,
     External_Name => "I2C1TRN";

   I2C1111TRNCLR : aliased unsigned  -- p32mx470f512.h:928
     with Import => True,
     Convention => C,
     External_Name => "I2C1111TRNCLR";

   I2C1TRNCLR : aliased unsigned  -- p32mx470f512.h:929
     with Import => True,
     Convention => C,
     External_Name => "I2C1TRNCLR";

   I2C1111TRNSET : aliased unsigned  -- p32mx470f512.h:930
     with Import => True,
     Convention => C,
     External_Name => "I2C1111TRNSET";

   I2C1TRNSET : aliased unsigned  -- p32mx470f512.h:931
     with Import => True,
     Convention => C,
     External_Name => "I2C1TRNSET";

   I2C1111TRNINV : aliased unsigned  -- p32mx470f512.h:932
     with Import => True,
     Convention => C,
     External_Name => "I2C1111TRNINV";

   I2C1TRNINV : aliased unsigned  -- p32mx470f512.h:933
     with Import => True,
     Convention => C,
     External_Name => "I2C1TRNINV";

   I2C1111RCV : aliased unsigned  -- p32mx470f512.h:934
     with Import => True,
     Convention => C,
     External_Name => "I2C1111RCV";

   I2C1RCV : aliased unsigned  -- p32mx470f512.h:935
     with Import => True,
     Convention => C,
     External_Name => "I2C1RCV";

   I2C2CON : aliased unsigned  -- p32mx470f512.h:936
     with Import => True,
     Convention => C,
     External_Name => "I2C2CON";

   type uu_I2C2CONbits_t_struct1011 is record
      SEN      : Extensions.Unsigned_1;  -- p32mx470f512.h:939
      RSEN     : Extensions.Unsigned_1;  -- p32mx470f512.h:940
      PEN      : Extensions.Unsigned_1;  -- p32mx470f512.h:941
      RCEN     : Extensions.Unsigned_1;  -- p32mx470f512.h:942
      ACKEN    : Extensions.Unsigned_1;  -- p32mx470f512.h:943
      ACKDT    : Extensions.Unsigned_1;  -- p32mx470f512.h:944
      STREN    : Extensions.Unsigned_1;  -- p32mx470f512.h:945
      GCEN     : Extensions.Unsigned_1;  -- p32mx470f512.h:946
      SMEN     : Extensions.Unsigned_1;  -- p32mx470f512.h:947
      DISSLW   : Extensions.Unsigned_1;  -- p32mx470f512.h:948
      A10M     : Extensions.Unsigned_1;  -- p32mx470f512.h:949
      STRICT   : Extensions.Unsigned_1;  -- p32mx470f512.h:950
      SCLREL   : Extensions.Unsigned_1;  -- p32mx470f512.h:951
      SIDL     : Extensions.Unsigned_1;  -- p32mx470f512.h:952
      anon2908 : Extensions.Unsigned_1;  -- p32mx470f512.h:953
      ON       : Extensions.Unsigned_1;  -- p32mx470f512.h:954
   end record
     with Convention => C_Pass_By_Copy,
     Pack => True,
     Alignment => 4;
   type uu_I2C2CONbits_t_struct1012 is record
      anon2913 : Extensions.Unsigned_11;  -- p32mx470f512.h:957
      IPMIEN   : Extensions.Unsigned_1;  -- p32mx470f512.h:958
      anon2915 : Extensions.Unsigned_1;  -- p32mx470f512.h:959
      I2CSIDL  : Extensions.Unsigned_1;  -- p32mx470f512.h:960
      anon2917 : Extensions.Unsigned_1;  -- p32mx470f512.h:961
      I2CEN    : Extensions.Unsigned_1;  -- p32mx470f512.h:962
   end record
     with Convention => C_Pass_By_Copy,
     Pack => True,
     Alignment => 4;
   type uu_I2C2CONbits_t_struct1013 is record
      w : aliased unsigned;  -- p32mx470f512.h:965
   end record
     with Convention => C_Pass_By_Copy;
   type uu_I2C2CONbits_t (discr : unsigned := 0) is record
      case discr is
         when 0 => anon2911 : aliased uu_I2C2CONbits_t_struct1011;  -- p32mx470f512.h:955
         when 1 => anon2920 : aliased uu_I2C2CONbits_t_struct1012;  -- p32mx470f512.h:963
         when 2 => anon2924 : aliased uu_I2C2CONbits_t_struct1013;  -- p32mx470f512.h:966
         when others => null;
      end case;
   end record
     with Convention => C_Pass_By_Copy,
     Unchecked_Union => True;  -- p32mx470f512.h:967

   I2C2CONbits : aliased uu_I2C2CONbits_t  -- p32mx470f512.h:968
     with Import => True,
     Convention => C,
     External_Name => "I2C2CON";

   I2CABCON : aliased unsigned  -- p32mx470f512.h:969
     with Import => True,
     Convention => C,
     External_Name => "I2CABCON";

   type uu_I2CABCONbits_t_struct1018 is record
      SEN      : Extensions.Unsigned_1;  -- p32mx470f512.h:972
      RSEN     : Extensions.Unsigned_1;  -- p32mx470f512.h:973
      PEN      : Extensions.Unsigned_1;  -- p32mx470f512.h:974
      RCEN     : Extensions.Unsigned_1;  -- p32mx470f512.h:975
      ACKEN    : Extensions.Unsigned_1;  -- p32mx470f512.h:976
      ACKDT    : Extensions.Unsigned_1;  -- p32mx470f512.h:977
      STREN    : Extensions.Unsigned_1;  -- p32mx470f512.h:978
      GCEN     : Extensions.Unsigned_1;  -- p32mx470f512.h:979
      SMEN     : Extensions.Unsigned_1;  -- p32mx470f512.h:980
      DISSLW   : Extensions.Unsigned_1;  -- p32mx470f512.h:981
      A10M     : Extensions.Unsigned_1;  -- p32mx470f512.h:982
      STRICT   : Extensions.Unsigned_1;  -- p32mx470f512.h:983
      SCLREL   : Extensions.Unsigned_1;  -- p32mx470f512.h:984
      SIDL     : Extensions.Unsigned_1;  -- p32mx470f512.h:985
      anon2944 : Extensions.Unsigned_1;  -- p32mx470f512.h:986
      ON       : Extensions.Unsigned_1;  -- p32mx470f512.h:987
   end record
     with Convention => C_Pass_By_Copy,
     Pack => True,
     Alignment => 4;
   type uu_I2CABCONbits_t_struct1019 is record
      anon2949 : Extensions.Unsigned_11;  -- p32mx470f512.h:990
      IPMIEN   : Extensions.Unsigned_1;  -- p32mx470f512.h:991
      anon2951 : Extensions.Unsigned_1;  -- p32mx470f512.h:992
      I2CSIDL  : Extensions.Unsigned_1;  -- p32mx470f512.h:993
      anon2953 : Extensions.Unsigned_1;  -- p32mx470f512.h:994
      I2CEN    : Extensions.Unsigned_1;  -- p32mx470f512.h:995
   end record
     with Convention => C_Pass_By_Copy,
     Pack => True,
     Alignment => 4;
   type uu_I2CABCONbits_t_struct1020 is record
      w : aliased unsigned;  -- p32mx470f512.h:998
   end record
     with Convention => C_Pass_By_Copy;
   type uu_I2CABCONbits_t (discr : unsigned := 0) is record
      case discr is
         when 0 => anon2947 : aliased uu_I2CABCONbits_t_struct1018;  -- p32mx470f512.h:988
         when 1 => anon2956 : aliased uu_I2CABCONbits_t_struct1019;  -- p32mx470f512.h:996
         when 2 => anon2960 : aliased uu_I2CABCONbits_t_struct1020;  -- p32mx470f512.h:999
         when others => null;
      end case;
   end record
     with Convention => C_Pass_By_Copy,
     Unchecked_Union => True;  -- p32mx470f512.h:1000

   I2CABCONbits : aliased uu_I2CABCONbits_t  -- p32mx470f512.h:1001
     with Import => True,
     Convention => C,
     External_Name => "I2CABCON";

   I2C2CONCLR : aliased unsigned  -- p32mx470f512.h:1002
     with Import => True,
     Convention => C,
     External_Name => "I2C2CONCLR";

   I2CABCONCLR : aliased unsigned  -- p32mx470f512.h:1003
     with Import => True,
     Convention => C,
     External_Name => "I2CABCONCLR";

   I2C2CONSET : aliased unsigned  -- p32mx470f512.h:1004
     with Import => True,
     Convention => C,
     External_Name => "I2C2CONSET";

   I2CABCONSET : aliased unsigned  -- p32mx470f512.h:1005
     with Import => True,
     Convention => C,
     External_Name => "I2CABCONSET";

   I2C2CONINV : aliased unsigned  -- p32mx470f512.h:1006
     with Import => True,
     Convention => C,
     External_Name => "I2C2CONINV";

   I2CABCONINV : aliased unsigned  -- p32mx470f512.h:1007
     with Import => True,
     Convention => C,
     External_Name => "I2CABCONINV";

   I2C2STAT : aliased unsigned  -- p32mx470f512.h:1008
     with Import => True,
     Convention => C,
     External_Name => "I2C2STAT";

   type uu_I2C2STATbits_t_struct1025 is record
      TBF      : Extensions.Unsigned_1;  -- p32mx470f512.h:1011
      RBF      : Extensions.Unsigned_1;  -- p32mx470f512.h:1012
      R_W      : Extensions.Unsigned_1;  -- p32mx470f512.h:1013
      S        : Extensions.Unsigned_1;  -- p32mx470f512.h:1014
      P        : Extensions.Unsigned_1;  -- p32mx470f512.h:1015
      D_A      : Extensions.Unsigned_1;  -- p32mx470f512.h:1016
      I2COV    : Extensions.Unsigned_1;  -- p32mx470f512.h:1017
      IWCOL    : Extensions.Unsigned_1;  -- p32mx470f512.h:1018
      ADD10    : Extensions.Unsigned_1;  -- p32mx470f512.h:1019
      GCSTAT   : Extensions.Unsigned_1;  -- p32mx470f512.h:1020
      BCL      : Extensions.Unsigned_1;  -- p32mx470f512.h:1021
      anon2983 : Extensions.Unsigned_3;  -- p32mx470f512.h:1022
      TRSTAT   : Extensions.Unsigned_1;  -- p32mx470f512.h:1023
      ACKSTAT  : Extensions.Unsigned_1;  -- p32mx470f512.h:1024
   end record
     with Convention => C_Pass_By_Copy,
     Pack => True,
     Alignment => 4;
   type uu_I2C2STATbits_t_struct1026 is record
      anon2989 : Extensions.Unsigned_6;  -- p32mx470f512.h:1027
      I2CPOV   : Extensions.Unsigned_1;  -- p32mx470f512.h:1028
   end record
     with Convention => C_Pass_By_Copy,
     Pack => True,
     Alignment => 4;
   type uu_I2C2STATbits_t_struct1027 is record
      w : aliased unsigned;  -- p32mx470f512.h:1031
   end record
     with Convention => C_Pass_By_Copy;
   type uu_I2C2STATbits_t (discr : unsigned := 0) is record
      case discr is
         when 0 => anon2987 : aliased uu_I2C2STATbits_t_struct1025;  -- p32mx470f512.h:1025
         when 1 => anon2992 : aliased uu_I2C2STATbits_t_struct1026;  -- p32mx470f512.h:1029
         when 2 => anon2996 : aliased uu_I2C2STATbits_t_struct1027;  -- p32mx470f512.h:1032
         when others => null;
      end case;
   end record
     with Convention => C_Pass_By_Copy,
     Unchecked_Union => True;  -- p32mx470f512.h:1033

   I2C2STATbits : aliased uu_I2C2STATbits_t  -- p32mx470f512.h:1034
     with Import => True,
     Convention => C,
     External_Name => "I2C2STAT";

   I2CABSTAT : aliased unsigned  -- p32mx470f512.h:1035
     with Import => True,
     Convention => C,
     External_Name => "I2CABSTAT";

   type uu_I2CABSTATbits_t_struct1032 is record
      TBF      : Extensions.Unsigned_1;  -- p32mx470f512.h:1038
      RBF      : Extensions.Unsigned_1;  -- p32mx470f512.h:1039
      R_W      : Extensions.Unsigned_1;  -- p32mx470f512.h:1040
      S        : Extensions.Unsigned_1;  -- p32mx470f512.h:1041
      P        : Extensions.Unsigned_1;  -- p32mx470f512.h:1042
      D_A      : Extensions.Unsigned_1;  -- p32mx470f512.h:1043
      I2COV    : Extensions.Unsigned_1;  -- p32mx470f512.h:1044
      IWCOL    : Extensions.Unsigned_1;  -- p32mx470f512.h:1045
      ADD10    : Extensions.Unsigned_1;  -- p32mx470f512.h:1046
      GCSTAT   : Extensions.Unsigned_1;  -- p32mx470f512.h:1047
      BCL      : Extensions.Unsigned_1;  -- p32mx470f512.h:1048
      anon3013 : Extensions.Unsigned_3;  -- p32mx470f512.h:1049
      TRSTAT   : Extensions.Unsigned_1;  -- p32mx470f512.h:1050
      ACKSTAT  : Extensions.Unsigned_1;  -- p32mx470f512.h:1051
   end record
     with Convention => C_Pass_By_Copy,
     Pack => True,
     Alignment => 4;
   type uu_I2CABSTATbits_t_struct1033 is record
      anon3019 : Extensions.Unsigned_6;  -- p32mx470f512.h:1054
      I2CPOV   : Extensions.Unsigned_1;  -- p32mx470f512.h:1055
   end record
     with Convention => C_Pass_By_Copy,
     Pack => True,
     Alignment => 4;
   type uu_I2CABSTATbits_t_struct1034 is record
      w : aliased unsigned;  -- p32mx470f512.h:1058
   end record
     with Convention => C_Pass_By_Copy;
   type uu_I2CABSTATbits_t (discr : unsigned := 0) is record
      case discr is
         when 0 => anon3017 : aliased uu_I2CABSTATbits_t_struct1032;  -- p32mx470f512.h:1052
         when 1 => anon3022 : aliased uu_I2CABSTATbits_t_struct1033;  -- p32mx470f512.h:1056
         when 2 => anon3026 : aliased uu_I2CABSTATbits_t_struct1034;  -- p32mx470f512.h:1059
         when others => null;
      end case;
   end record
     with Convention => C_Pass_By_Copy,
     Unchecked_Union => True;  -- p32mx470f512.h:1060

   I2CABSTATbits : aliased uu_I2CABSTATbits_t  -- p32mx470f512.h:1061
     with Import => True,
     Convention => C,
     External_Name => "I2CABSTAT";

   I2C2STATCLR : aliased unsigned  -- p32mx470f512.h:1062
     with Import => True,
     Convention => C,
     External_Name => "I2C2STATCLR";

   I2CABSTATCLR : aliased unsigned  -- p32mx470f512.h:1063
     with Import => True,
     Convention => C,
     External_Name => "I2CABSTATCLR";

   I2C2STATSET : aliased unsigned  -- p32mx470f512.h:1064
     with Import => True,
     Convention => C,
     External_Name => "I2C2STATSET";

   I2CABSTATSET : aliased unsigned  -- p32mx470f512.h:1065
     with Import => True,
     Convention => C,
     External_Name => "I2CABSTATSET";

   I2C2STATINV : aliased unsigned  -- p32mx470f512.h:1066
     with Import => True,
     Convention => C,
     External_Name => "I2C2STATINV";

   I2CABSTATINV : aliased unsigned  -- p32mx470f512.h:1067
     with Import => True,
     Convention => C,
     External_Name => "I2CABSTATINV";

   I2C2ADD : aliased unsigned  -- p32mx470f512.h:1068
     with Import => True,
     Convention => C,
     External_Name => "I2C2ADD";

   I2CABADD : aliased unsigned  -- p32mx470f512.h:1069
     with Import => True,
     Convention => C,
     External_Name => "I2CABADD";

   I2C2ADDCLR : aliased unsigned  -- p32mx470f512.h:1070
     with Import => True,
     Convention => C,
     External_Name => "I2C2ADDCLR";

   I2CABADDCLR : aliased unsigned  -- p32mx470f512.h:1071
     with Import => True,
     Convention => C,
     External_Name => "I2CABADDCLR";

   I2C2ADDSET : aliased unsigned  -- p32mx470f512.h:1072
     with Import => True,
     Convention => C,
     External_Name => "I2C2ADDSET";

   I2CABADDSET : aliased unsigned  -- p32mx470f512.h:1073
     with Import => True,
     Convention => C,
     External_Name => "I2CABADDSET";

   I2C2ADDINV : aliased unsigned  -- p32mx470f512.h:1074
     with Import => True,
     Convention => C,
     External_Name => "I2C2ADDINV";

   I2CABADDINV : aliased unsigned  -- p32mx470f512.h:1075
     with Import => True,
     Convention => C,
     External_Name => "I2CABADDINV";

   I2C2MSK : aliased unsigned  -- p32mx470f512.h:1076
     with Import => True,
     Convention => C,
     External_Name => "I2C2MSK";

   I2CABMSK : aliased unsigned  -- p32mx470f512.h:1077
     with Import => True,
     Convention => C,
     External_Name => "I2CABMSK";

   I2C2MSKCLR : aliased unsigned  -- p32mx470f512.h:1078
     with Import => True,
     Convention => C,
     External_Name => "I2C2MSKCLR";

   I2CABMSKCLR : aliased unsigned  -- p32mx470f512.h:1079
     with Import => True,
     Convention => C,
     External_Name => "I2CABMSKCLR";

   I2C2MSKSET : aliased unsigned  -- p32mx470f512.h:1080
     with Import => True,
     Convention => C,
     External_Name => "I2C2MSKSET";

   I2CABMSKSET : aliased unsigned  -- p32mx470f512.h:1081
     with Import => True,
     Convention => C,
     External_Name => "I2CABMSKSET";

   I2C2MSKINV : aliased unsigned  -- p32mx470f512.h:1082
     with Import => True,
     Convention => C,
     External_Name => "I2C2MSKINV";

   I2CABMSKINV : aliased unsigned  -- p32mx470f512.h:1083
     with Import => True,
     Convention => C,
     External_Name => "I2CABMSKINV";

   I2C2BRG : aliased unsigned  -- p32mx470f512.h:1084
     with Import => True,
     Convention => C,
     External_Name => "I2C2BRG";

   I2CABBRG : aliased unsigned  -- p32mx470f512.h:1085
     with Import => True,
     Convention => C,
     External_Name => "I2CABBRG";

   I2C2BRGCLR : aliased unsigned  -- p32mx470f512.h:1086
     with Import => True,
     Convention => C,
     External_Name => "I2C2BRGCLR";

   I2CABBRGCLR : aliased unsigned  -- p32mx470f512.h:1087
     with Import => True,
     Convention => C,
     External_Name => "I2CABBRGCLR";

   I2C2BRGSET : aliased unsigned  -- p32mx470f512.h:1088
     with Import => True,
     Convention => C,
     External_Name => "I2C2BRGSET";

   I2CABBRGSET : aliased unsigned  -- p32mx470f512.h:1089
     with Import => True,
     Convention => C,
     External_Name => "I2CABBRGSET";

   I2C2BRGINV : aliased unsigned  -- p32mx470f512.h:1090
     with Import => True,
     Convention => C,
     External_Name => "I2C2BRGINV";

   I2CABBRGINV : aliased unsigned  -- p32mx470f512.h:1091
     with Import => True,
     Convention => C,
     External_Name => "I2CABBRGINV";

   I2C2TRN : aliased unsigned  -- p32mx470f512.h:1092
     with Import => True,
     Convention => C,
     External_Name => "I2C2TRN";

   I2CABTRN : aliased unsigned  -- p32mx470f512.h:1093
     with Import => True,
     Convention => C,
     External_Name => "I2CABTRN";

   I2C2TRNCLR : aliased unsigned  -- p32mx470f512.h:1094
     with Import => True,
     Convention => C,
     External_Name => "I2C2TRNCLR";

   I2CABTRNCLR : aliased unsigned  -- p32mx470f512.h:1095
     with Import => True,
     Convention => C,
     External_Name => "I2CABTRNCLR";

   I2C2TRNSET : aliased unsigned  -- p32mx470f512.h:1096
     with Import => True,
     Convention => C,
     External_Name => "I2C2TRNSET";

   I2CABTRNSET : aliased unsigned  -- p32mx470f512.h:1097
     with Import => True,
     Convention => C,
     External_Name => "I2CABTRNSET";

   I2C2TRNINV : aliased unsigned  -- p32mx470f512.h:1098
     with Import => True,
     Convention => C,
     External_Name => "I2C2TRNINV";

   I2CABTRNINV : aliased unsigned  -- p32mx470f512.h:1099
     with Import => True,
     Convention => C,
     External_Name => "I2CABTRNINV";

   I2C2RCV : aliased unsigned  -- p32mx470f512.h:1100
     with Import => True,
     Convention => C,
     External_Name => "I2C2RCV";

   I2CABRCV : aliased unsigned  -- p32mx470f512.h:1101
     with Import => True,
     Convention => C,
     External_Name => "I2CABRCV";

   SPI1CON : aliased unsigned  -- p32mx470f512.h:1102
     with Import => True,
     Convention => C,
     External_Name => "SPI1CON";

   type uu_SPI1CONbits_t_struct1041 is record
      SRXISEL  : Extensions.Unsigned_2;  -- p32mx470f512.h:1105
      STXISEL  : Extensions.Unsigned_2;  -- p32mx470f512.h:1106
      DISSDI   : Extensions.Unsigned_1;  -- p32mx470f512.h:1107
      MSTEN    : Extensions.Unsigned_1;  -- p32mx470f512.h:1108
      CKP      : Extensions.Unsigned_1;  -- p32mx470f512.h:1109
      SSEN     : Extensions.Unsigned_1;  -- p32mx470f512.h:1110
      CKE      : Extensions.Unsigned_1;  -- p32mx470f512.h:1111
      SMP      : Extensions.Unsigned_1;  -- p32mx470f512.h:1112
      MODE16   : Extensions.Unsigned_1;  -- p32mx470f512.h:1113
      MODE32   : Extensions.Unsigned_1;  -- p32mx470f512.h:1114
      DISSDO   : Extensions.Unsigned_1;  -- p32mx470f512.h:1115
      SIDL     : Extensions.Unsigned_1;  -- p32mx470f512.h:1116
      anon3084 : Extensions.Unsigned_1;  -- p32mx470f512.h:1117
      ON       : Extensions.Unsigned_1;  -- p32mx470f512.h:1118
      ENHBUF   : Extensions.Unsigned_1;  -- p32mx470f512.h:1119
      SPIFE    : Extensions.Unsigned_1;  -- p32mx470f512.h:1120
      anon3088 : Extensions.Unsigned_5;  -- p32mx470f512.h:1121
      MCLKSEL  : Extensions.Unsigned_1;  -- p32mx470f512.h:1122
      FRMCNT   : Extensions.Unsigned_3;  -- p32mx470f512.h:1123
      FRMSYPW  : Extensions.Unsigned_1;  -- p32mx470f512.h:1124
      MSSEN    : Extensions.Unsigned_1;  -- p32mx470f512.h:1125
      FRMPOL   : Extensions.Unsigned_1;  -- p32mx470f512.h:1126
      FRMSYNC  : Extensions.Unsigned_1;  -- p32mx470f512.h:1127
      FRMEN    : Extensions.Unsigned_1;  -- p32mx470f512.h:1128
   end record
     with Convention => C_Pass_By_Copy,
     Pack => True,
     Alignment => 4;
   type uu_SPI1CONbits_t_struct1042 is record
      w : aliased unsigned;  -- p32mx470f512.h:1131
   end record
     with Convention => C_Pass_By_Copy;
   type uu_SPI1CONbits_t (discr : unsigned := 0) is record
      case discr is
         when 0 => anon3097 : aliased uu_SPI1CONbits_t_struct1041;  -- p32mx470f512.h:1129
         when 1 => anon3101 : aliased uu_SPI1CONbits_t_struct1042;  -- p32mx470f512.h:1132
         when others => null;
      end case;
   end record
     with Convention => C_Pass_By_Copy,
     Unchecked_Union => True;  -- p32mx470f512.h:1133

   SPI1CONbits : aliased uu_SPI1CONbits_t  -- p32mx470f512.h:1134
     with Import => True,
     Convention => C,
     External_Name => "SPI1CON";

   SPI1CONCLR : aliased unsigned  -- p32mx470f512.h:1135
     with Import => True,
     Convention => C,
     External_Name => "SPI1CONCLR";

   SPI1CONSET : aliased unsigned  -- p32mx470f512.h:1136
     with Import => True,
     Convention => C,
     External_Name => "SPI1CONSET";

   SPI1CONINV : aliased unsigned  -- p32mx470f512.h:1137
     with Import => True,
     Convention => C,
     External_Name => "SPI1CONINV";

   SPI1STAT : aliased unsigned  -- p32mx470f512.h:1138
     with Import => True,
     Convention => C,
     External_Name => "SPI1STAT";

   type uu_SPI1STATbits_t_struct1047 is record
      SPIRBF   : Extensions.Unsigned_1;  -- p32mx470f512.h:1141
      SPITBF   : Extensions.Unsigned_1;  -- p32mx470f512.h:1142
      anon3112 : Extensions.Unsigned_1;  -- p32mx470f512.h:1143
      SPITBE   : Extensions.Unsigned_1;  -- p32mx470f512.h:1144
      anon3114 : Extensions.Unsigned_1;  -- p32mx470f512.h:1145
      SPIRBE   : Extensions.Unsigned_1;  -- p32mx470f512.h:1146
      SPIROV   : Extensions.Unsigned_1;  -- p32mx470f512.h:1147
      SRMT     : Extensions.Unsigned_1;  -- p32mx470f512.h:1148
      SPITUR   : Extensions.Unsigned_1;  -- p32mx470f512.h:1149
      anon3119 : Extensions.Unsigned_2;  -- p32mx470f512.h:1150
      SPIBUSY  : Extensions.Unsigned_1;  -- p32mx470f512.h:1151
      FRMERR   : Extensions.Unsigned_1;  -- p32mx470f512.h:1152
      anon3122 : Extensions.Unsigned_3;  -- p32mx470f512.h:1153
      TXBUFELM : Extensions.Unsigned_5;  -- p32mx470f512.h:1154
      anon3124 : Extensions.Unsigned_3;  -- p32mx470f512.h:1155
      RXBUFELM : Extensions.Unsigned_5;  -- p32mx470f512.h:1156
   end record
     with Convention => C_Pass_By_Copy,
     Pack => True,
     Alignment => 4;
   type uu_SPI1STATbits_t_struct1048 is record
      w : aliased unsigned;  -- p32mx470f512.h:1159
   end record
     with Convention => C_Pass_By_Copy;
   type uu_SPI1STATbits_t (discr : unsigned := 0) is record
      case discr is
         when 0 => anon3127 : aliased uu_SPI1STATbits_t_struct1047;  -- p32mx470f512.h:1157
         when 1 => anon3131 : aliased uu_SPI1STATbits_t_struct1048;  -- p32mx470f512.h:1160
         when others => null;
      end case;
   end record
     with Convention => C_Pass_By_Copy,
     Unchecked_Union => True;  -- p32mx470f512.h:1161

   SPI1STATbits : aliased uu_SPI1STATbits_t  -- p32mx470f512.h:1162
     with Import => True,
     Convention => C,
     External_Name => "SPI1STAT";

   SPI1STATCLR : aliased unsigned  -- p32mx470f512.h:1163
     with Import => True,
     Convention => C,
     External_Name => "SPI1STATCLR";

   SPI1STATSET : aliased unsigned  -- p32mx470f512.h:1164
     with Import => True,
     Convention => C,
     External_Name => "SPI1STATSET";

   SPI1STATINV : aliased unsigned  -- p32mx470f512.h:1165
     with Import => True,
     Convention => C,
     External_Name => "SPI1STATINV";

   SPI1BUF : aliased unsigned  -- p32mx470f512.h:1166
     with Import => True,
     Convention => C,
     External_Name => "SPI1BUF";

   SPI1BRG : aliased unsigned  -- p32mx470f512.h:1167
     with Import => True,
     Convention => C,
     External_Name => "SPI1BRG";

   SPI1BRGCLR : aliased unsigned  -- p32mx470f512.h:1168
     with Import => True,
     Convention => C,
     External_Name => "SPI1BRGCLR";

   SPI1BRGSET : aliased unsigned  -- p32mx470f512.h:1169
     with Import => True,
     Convention => C,
     External_Name => "SPI1BRGSET";

   SPI1BRGINV : aliased unsigned  -- p32mx470f512.h:1170
     with Import => True,
     Convention => C,
     External_Name => "SPI1BRGINV";

   SPI1CON2 : aliased unsigned  -- p32mx470f512.h:1171
     with Import => True,
     Convention => C,
     External_Name => "SPI1CON2";

   type uu_SPI1CON2bits_t_struct1053 is record
      AUDMOD    : Extensions.Unsigned_2;  -- p32mx470f512.h:1174
      anon3146  : Extensions.Unsigned_1;  -- p32mx470f512.h:1175
      AUDMONO   : Extensions.Unsigned_1;  -- p32mx470f512.h:1176
      anon3148  : Extensions.Unsigned_3;  -- p32mx470f512.h:1177
      AUDEN     : Extensions.Unsigned_1;  -- p32mx470f512.h:1178
      IGNTUR    : Extensions.Unsigned_1;  -- p32mx470f512.h:1179
      IGNROV    : Extensions.Unsigned_1;  -- p32mx470f512.h:1180
      SPITUREN  : Extensions.Unsigned_1;  -- p32mx470f512.h:1181
      SPIROVEN  : Extensions.Unsigned_1;  -- p32mx470f512.h:1182
      FRMERREN  : Extensions.Unsigned_1;  -- p32mx470f512.h:1183
      anon3155  : Extensions.Unsigned_2;  -- p32mx470f512.h:1184
      SPISGNEXT : Extensions.Unsigned_1;  -- p32mx470f512.h:1185
   end record
     with Convention => C_Pass_By_Copy,
     Pack => True,
     Alignment => 4;
   type uu_SPI1CON2bits_t_struct1054 is record
      AUDMOD0 : Extensions.Unsigned_1;  -- p32mx470f512.h:1188
      AUDMOD1 : Extensions.Unsigned_1;  -- p32mx470f512.h:1189
   end record
     with Convention => C_Pass_By_Copy,
     Pack => True,
     Alignment => 4;
   type uu_SPI1CON2bits_t_struct1055 is record
      w : aliased unsigned;  -- p32mx470f512.h:1192
   end record
     with Convention => C_Pass_By_Copy;
   type uu_SPI1CON2bits_t (discr : unsigned := 0) is record
      case discr is
         when 0 => anon3158 : aliased uu_SPI1CON2bits_t_struct1053;  -- p32mx470f512.h:1186
         when 1 => anon3163 : aliased uu_SPI1CON2bits_t_struct1054;  -- p32mx470f512.h:1190
         when 2 => anon3167 : aliased uu_SPI1CON2bits_t_struct1055;  -- p32mx470f512.h:1193
         when others => null;
      end case;
   end record
     with Convention => C_Pass_By_Copy,
     Unchecked_Union => True;  -- p32mx470f512.h:1194

   SPI1CON2bits : aliased uu_SPI1CON2bits_t  -- p32mx470f512.h:1195
     with Import => True,
     Convention => C,
     External_Name => "SPI1CON2";

   SPI1CON2CLR : aliased unsigned  -- p32mx470f512.h:1196
     with Import => True,
     Convention => C,
     External_Name => "SPI1CON2CLR";

   SPI1CON2SET : aliased unsigned  -- p32mx470f512.h:1197
     with Import => True,
     Convention => C,
     External_Name => "SPI1CON2SET";

   SPI1CON2INV : aliased unsigned  -- p32mx470f512.h:1198
     with Import => True,
     Convention => C,
     External_Name => "SPI1CON2INV";

   SPI2CON : aliased unsigned  -- p32mx470f512.h:1199
     with Import => True,
     Convention => C,
     External_Name => "SPI2CON";

   type uu_SPI2CONbits_t_struct1060 is record
      SRXISEL  : Extensions.Unsigned_2;  -- p32mx470f512.h:1202
      STXISEL  : Extensions.Unsigned_2;  -- p32mx470f512.h:1203
      DISSDI   : Extensions.Unsigned_1;  -- p32mx470f512.h:1204
      MSTEN    : Extensions.Unsigned_1;  -- p32mx470f512.h:1205
      CKP      : Extensions.Unsigned_1;  -- p32mx470f512.h:1206
      SSEN     : Extensions.Unsigned_1;  -- p32mx470f512.h:1207
      CKE      : Extensions.Unsigned_1;  -- p32mx470f512.h:1208
      SMP      : Extensions.Unsigned_1;  -- p32mx470f512.h:1209
      MODE16   : Extensions.Unsigned_1;  -- p32mx470f512.h:1210
      MODE32   : Extensions.Unsigned_1;  -- p32mx470f512.h:1211
      DISSDO   : Extensions.Unsigned_1;  -- p32mx470f512.h:1212
      SIDL     : Extensions.Unsigned_1;  -- p32mx470f512.h:1213
      anon3188 : Extensions.Unsigned_1;  -- p32mx470f512.h:1214
      ON       : Extensions.Unsigned_1;  -- p32mx470f512.h:1215
      ENHBUF   : Extensions.Unsigned_1;  -- p32mx470f512.h:1216
      SPIFE    : Extensions.Unsigned_1;  -- p32mx470f512.h:1217
      anon3192 : Extensions.Unsigned_5;  -- p32mx470f512.h:1218
      MCLKSEL  : Extensions.Unsigned_1;  -- p32mx470f512.h:1219
      FRMCNT   : Extensions.Unsigned_3;  -- p32mx470f512.h:1220
      FRMSYPW  : Extensions.Unsigned_1;  -- p32mx470f512.h:1221
      MSSEN    : Extensions.Unsigned_1;  -- p32mx470f512.h:1222
      FRMPOL   : Extensions.Unsigned_1;  -- p32mx470f512.h:1223
      FRMSYNC  : Extensions.Unsigned_1;  -- p32mx470f512.h:1224
      FRMEN    : Extensions.Unsigned_1;  -- p32mx470f512.h:1225
   end record
     with Convention => C_Pass_By_Copy,
     Pack => True,
     Alignment => 4;
   type uu_SPI2CONbits_t_struct1061 is record
      w : aliased unsigned;  -- p32mx470f512.h:1228
   end record
     with Convention => C_Pass_By_Copy;
   type uu_SPI2CONbits_t (discr : unsigned := 0) is record
      case discr is
         when 0 => anon3201 : aliased uu_SPI2CONbits_t_struct1060;  -- p32mx470f512.h:1226
         when 1 => anon3205 : aliased uu_SPI2CONbits_t_struct1061;  -- p32mx470f512.h:1229
         when others => null;
      end case;
   end record
     with Convention => C_Pass_By_Copy,
     Unchecked_Union => True;  -- p32mx470f512.h:1230

   SPI2CONbits : aliased uu_SPI2CONbits_t  -- p32mx470f512.h:1231
     with Import => True,
     Convention => C,
     External_Name => "SPI2CON";

   SPI2CONCLR : aliased unsigned  -- p32mx470f512.h:1232
     with Import => True,
     Convention => C,
     External_Name => "SPI2CONCLR";

   SPI2CONSET : aliased unsigned  -- p32mx470f512.h:1233
     with Import => True,
     Convention => C,
     External_Name => "SPI2CONSET";

   SPI2CONINV : aliased unsigned  -- p32mx470f512.h:1234
     with Import => True,
     Convention => C,
     External_Name => "SPI2CONINV";

   SPI2STAT : aliased unsigned  -- p32mx470f512.h:1235
     with Import => True,
     Convention => C,
     External_Name => "SPI2STAT";

   type uu_SPI2STATbits_t_struct1066 is record
      SPIRBF   : Extensions.Unsigned_1;  -- p32mx470f512.h:1238
      SPITBF   : Extensions.Unsigned_1;  -- p32mx470f512.h:1239
      anon3216 : Extensions.Unsigned_1;  -- p32mx470f512.h:1240
      SPITBE   : Extensions.Unsigned_1;  -- p32mx470f512.h:1241
      anon3218 : Extensions.Unsigned_1;  -- p32mx470f512.h:1242
      SPIRBE   : Extensions.Unsigned_1;  -- p32mx470f512.h:1243
      SPIROV   : Extensions.Unsigned_1;  -- p32mx470f512.h:1244
      SRMT     : Extensions.Unsigned_1;  -- p32mx470f512.h:1245
      SPITUR   : Extensions.Unsigned_1;  -- p32mx470f512.h:1246
      anon3223 : Extensions.Unsigned_2;  -- p32mx470f512.h:1247
      SPIBUSY  : Extensions.Unsigned_1;  -- p32mx470f512.h:1248
      FRMERR   : Extensions.Unsigned_1;  -- p32mx470f512.h:1249
      anon3226 : Extensions.Unsigned_3;  -- p32mx470f512.h:1250
      TXBUFELM : Extensions.Unsigned_5;  -- p32mx470f512.h:1251
      anon3228 : Extensions.Unsigned_3;  -- p32mx470f512.h:1252
      RXBUFELM : Extensions.Unsigned_5;  -- p32mx470f512.h:1253
   end record
     with Convention => C_Pass_By_Copy,
     Pack => True,
     Alignment => 4;
   type uu_SPI2STATbits_t_struct1067 is record
      w : aliased unsigned;  -- p32mx470f512.h:1256
   end record
     with Convention => C_Pass_By_Copy;
   type uu_SPI2STATbits_t (discr : unsigned := 0) is record
      case discr is
         when 0 => anon3231 : aliased uu_SPI2STATbits_t_struct1066;  -- p32mx470f512.h:1254
         when 1 => anon3235 : aliased uu_SPI2STATbits_t_struct1067;  -- p32mx470f512.h:1257
         when others => null;
      end case;
   end record
     with Convention => C_Pass_By_Copy,
     Unchecked_Union => True;  -- p32mx470f512.h:1258

   SPI2STATbits : aliased uu_SPI2STATbits_t  -- p32mx470f512.h:1259
     with Import => True,
     Convention => C,
     External_Name => "SPI2STAT";

   SPI2STATCLR : aliased unsigned  -- p32mx470f512.h:1260
     with Import => True,
     Convention => C,
     External_Name => "SPI2STATCLR";

   SPI2STATSET : aliased unsigned  -- p32mx470f512.h:1261
     with Import => True,
     Convention => C,
     External_Name => "SPI2STATSET";

   SPI2STATINV : aliased unsigned  -- p32mx470f512.h:1262
     with Import => True,
     Convention => C,
     External_Name => "SPI2STATINV";

   SPI2BUF : aliased unsigned with  -- p32mx470f512.h:1263
     Import => True,
     Convention => C,
     External_Name => "SPI2BUF";

   SPI2BRG : aliased unsigned with  -- p32mx470f512.h:1264
     Import => True,
     Convention => C,
     External_Name => "SPI2BRG";

   SPI2BRGCLR : aliased unsigned  -- p32mx470f512.h:1265
     with Import => True,
     Convention => C,
     External_Name => "SPI2BRGCLR";

   SPI2BRGSET : aliased unsigned  -- p32mx470f512.h:1266
     with Import => True,
     Convention => C,
     External_Name => "SPI2BRGSET";

   SPI2BRGINV : aliased unsigned  -- p32mx470f512.h:1267
     with Import => True,
     Convention => C,
     External_Name => "SPI2BRGINV";

   SPI2CON2 : aliased unsigned  -- p32mx470f512.h:1268
     with Import => True,
     Convention => C,
     External_Name => "SPI2CON2";

   type uu_SPI2CON2bits_t_struct1072 is record
      AUDMOD    : Extensions.Unsigned_2;  -- p32mx470f512.h:1271
      anon3250  : Extensions.Unsigned_1;  -- p32mx470f512.h:1272
      AUDMONO   : Extensions.Unsigned_1;  -- p32mx470f512.h:1273
      anon3252  : Extensions.Unsigned_3;  -- p32mx470f512.h:1274
      AUDEN     : Extensions.Unsigned_1;  -- p32mx470f512.h:1275
      IGNTUR    : Extensions.Unsigned_1;  -- p32mx470f512.h:1276
      IGNROV    : Extensions.Unsigned_1;  -- p32mx470f512.h:1277
      SPITUREN  : Extensions.Unsigned_1;  -- p32mx470f512.h:1278
      SPIROVEN  : Extensions.Unsigned_1;  -- p32mx470f512.h:1279
      FRMERREN  : Extensions.Unsigned_1;  -- p32mx470f512.h:1280
      anon3259  : Extensions.Unsigned_2;  -- p32mx470f512.h:1281
      SPISGNEXT : Extensions.Unsigned_1;  -- p32mx470f512.h:1282
   end record
     with Convention => C_Pass_By_Copy,
     Pack => True,
     Alignment => 4;
   type uu_SPI2CON2bits_t_struct1073 is record
      AUDMOD0 : Extensions.Unsigned_1;  -- p32mx470f512.h:1285
      AUDMOD1 : Extensions.Unsigned_1;  -- p32mx470f512.h:1286
   end record
     with Convention => C_Pass_By_Copy,
     Pack => True,
     Alignment => 4;
   type uu_SPI2CON2bits_t_struct1074 is record
      w : aliased unsigned;  -- p32mx470f512.h:1289
   end record
     with Convention => C_Pass_By_Copy;
   type uu_SPI2CON2bits_t (discr : unsigned := 0) is record
      case discr is
         when 0 => anon3262 : aliased uu_SPI2CON2bits_t_struct1072;  -- p32mx470f512.h:1283
         when 1 => anon3267 : aliased uu_SPI2CON2bits_t_struct1073;  -- p32mx470f512.h:1287
         when 2 => anon3271 : aliased uu_SPI2CON2bits_t_struct1074;  -- p32mx470f512.h:1290
         when others => null;
      end case;
   end record
     with Convention => C_Pass_By_Copy,
     Unchecked_Union => True;  -- p32mx470f512.h:1291

   SPI2CON2bits : aliased uu_SPI2CON2bits_t  -- p32mx470f512.h:1292
     with Import => True,
     Convention => C,
     External_Name => "SPI2CON2";

   SPI2CON2CLR : aliased unsigned  -- p32mx470f512.h:1293
     with Import => True,
     Convention => C,
     External_Name => "SPI2CON2CLR";

   SPI2CON2SET : aliased unsigned  -- p32mx470f512.h:1294
     with Import => True,
     Convention => C,
     External_Name => "SPI2CON2SET";

   SPI2CON2INV : aliased unsigned  -- p32mx470f512.h:1295
     with Import => True,
     Convention => C,
     External_Name => "SPI2CON2INV";

   U1MODE : aliased unsigned  -- p32mx470f512.h:1296
     with Import => True,
     Convention => C,
     External_Name => "U1MODE";

   type uu_U1MODEbits_t_struct1079 is record
      STSEL    : Extensions.Unsigned_1;  -- p32mx470f512.h:1299
      PDSEL    : Extensions.Unsigned_2;  -- p32mx470f512.h:1300
      BRGH     : Extensions.Unsigned_1;  -- p32mx470f512.h:1301
      RXINV    : Extensions.Unsigned_1;  -- p32mx470f512.h:1302
      ABAUD    : Extensions.Unsigned_1;  -- p32mx470f512.h:1303
      LPBACK   : Extensions.Unsigned_1;  -- p32mx470f512.h:1304
      WAKE     : Extensions.Unsigned_1;  -- p32mx470f512.h:1305
      UEN      : Extensions.Unsigned_2;  -- p32mx470f512.h:1306
      anon3288 : Extensions.Unsigned_1;  -- p32mx470f512.h:1307
      RTSMD    : Extensions.Unsigned_1;  -- p32mx470f512.h:1308
      IREN     : Extensions.Unsigned_1;  -- p32mx470f512.h:1309
      SIDL     : Extensions.Unsigned_1;  -- p32mx470f512.h:1310
      anon3292 : Extensions.Unsigned_1;  -- p32mx470f512.h:1311
      ON       : Extensions.Unsigned_1;  -- p32mx470f512.h:1312
   end record
     with Convention => C_Pass_By_Copy,
     Pack => True,
     Alignment => 4;
   type uu_U1MODEbits_t_struct1080 is record
      anon3297 : Extensions.Unsigned_1;  -- p32mx470f512.h:1315
      PDSEL0   : Extensions.Unsigned_1;  -- p32mx470f512.h:1316
      PDSEL1   : Extensions.Unsigned_1;  -- p32mx470f512.h:1317
      anon3300 : Extensions.Unsigned_5;  -- p32mx470f512.h:1318
      UEN0     : Extensions.Unsigned_1;  -- p32mx470f512.h:1319
      UEN1     : Extensions.Unsigned_1;  -- p32mx470f512.h:1320
   end record
     with Convention => C_Pass_By_Copy,
     Pack => True,
     Alignment => 4;
   type uu_U1MODEbits_t_struct1081 is record
      anon3306 : Extensions.Unsigned_13;  -- p32mx470f512.h:1323
      USIDL    : Extensions.Unsigned_1;  -- p32mx470f512.h:1324
      anon3308 : Extensions.Unsigned_1;  -- p32mx470f512.h:1325
      UARTEN   : Extensions.Unsigned_1;  -- p32mx470f512.h:1326
   end record
     with Convention => C_Pass_By_Copy,
     Pack => True,
     Alignment => 4;
   type uu_U1MODEbits_t_struct1082 is record
      w : aliased unsigned;  -- p32mx470f512.h:1329
   end record
     with Convention => C_Pass_By_Copy;
   type uu_U1MODEbits_t (discr : unsigned := 0) is record
      case discr is
         when 0 => anon3295 : aliased uu_U1MODEbits_t_struct1079;  -- p32mx470f512.h:1313
         when 1 => anon3304 : aliased uu_U1MODEbits_t_struct1080;  -- p32mx470f512.h:1321
         when 2 => anon3311 : aliased uu_U1MODEbits_t_struct1081;  -- p32mx470f512.h:1327
         when 3 => anon3315 : aliased uu_U1MODEbits_t_struct1082;  -- p32mx470f512.h:1330
         when others => null;
      end case;
   end record
     with Convention => C_Pass_By_Copy,
     Unchecked_Union => True;  -- p32mx470f512.h:1331

   U1MODEbits : aliased uu_U1MODEbits_t  -- p32mx470f512.h:1332
     with Import => True,
     Convention => C,
     External_Name => "U1MODE";

   UDCMODE : aliased unsigned  -- p32mx470f512.h:1333
     with Import => True,
     Convention => C,
     External_Name => "UDCMODE";

   type uu_UDCMODEbits_t_struct1087 is record
      STSEL    : Extensions.Unsigned_1;  -- p32mx470f512.h:1336
      PDSEL    : Extensions.Unsigned_2;  -- p32mx470f512.h:1337
      BRGH     : Extensions.Unsigned_1;  -- p32mx470f512.h:1338
      RXINV    : Extensions.Unsigned_1;  -- p32mx470f512.h:1339
      ABAUD    : Extensions.Unsigned_1;  -- p32mx470f512.h:1340
      LPBACK   : Extensions.Unsigned_1;  -- p32mx470f512.h:1341
      WAKE     : Extensions.Unsigned_1;  -- p32mx470f512.h:1342
      UEN      : Extensions.Unsigned_2;  -- p32mx470f512.h:1343
      anon3329 : Extensions.Unsigned_1;  -- p32mx470f512.h:1344
      RTSMD    : Extensions.Unsigned_1;  -- p32mx470f512.h:1345
      IREN     : Extensions.Unsigned_1;  -- p32mx470f512.h:1346
      SIDL     : Extensions.Unsigned_1;  -- p32mx470f512.h:1347
      anon3333 : Extensions.Unsigned_1;  -- p32mx470f512.h:1348
      ON       : Extensions.Unsigned_1;  -- p32mx470f512.h:1349
   end record
     with Convention => C_Pass_By_Copy,
     Pack => True,
     Alignment => 4;
   type uu_UDCMODEbits_t_struct1088 is record
      anon3338 : Extensions.Unsigned_1;  -- p32mx470f512.h:1352
      PDSEL0   : Extensions.Unsigned_1;  -- p32mx470f512.h:1353
      PDSEL1   : Extensions.Unsigned_1;  -- p32mx470f512.h:1354
      anon3341 : Extensions.Unsigned_5;  -- p32mx470f512.h:1355
      UEN0     : Extensions.Unsigned_1;  -- p32mx470f512.h:1356
      UEN1     : Extensions.Unsigned_1;  -- p32mx470f512.h:1357
   end record
     with Convention => C_Pass_By_Copy,
     Pack => True,
     Alignment => 4;
   type uu_UDCMODEbits_t_struct1089 is record
      anon3347 : Extensions.Unsigned_13;  -- p32mx470f512.h:1360
      USIDL    : Extensions.Unsigned_1;  -- p32mx470f512.h:1361
      anon3349 : Extensions.Unsigned_1;  -- p32mx470f512.h:1362
      UARTEN   : Extensions.Unsigned_1;  -- p32mx470f512.h:1363
   end record
     with Convention => C_Pass_By_Copy,
     Pack => True,
     Alignment => 4;
   type uu_UDCMODEbits_t_struct1090 is record
      w : aliased unsigned;  -- p32mx470f512.h:1366
   end record
     with Convention => C_Pass_By_Copy;
   type uu_UDCMODEbits_t (discr : unsigned := 0) is record
      case discr is
         when 0 => anon3336 : aliased uu_UDCMODEbits_t_struct1087;  -- p32mx470f512.h:1350
         when 1 => anon3345 : aliased uu_UDCMODEbits_t_struct1088;  -- p32mx470f512.h:1358
         when 2 => anon3352 : aliased uu_UDCMODEbits_t_struct1089;  -- p32mx470f512.h:1364
         when 3 => anon3356 : aliased uu_UDCMODEbits_t_struct1090;  -- p32mx470f512.h:1367
         when others => null;
      end case;
   end record
     with Convention => C_Pass_By_Copy,
     Unchecked_Union => True;  -- p32mx470f512.h:1368

   UDCMODEbits : aliased uu_UDCMODEbits_t  -- p32mx470f512.h:1369
     with Import => True,
     Convention => C,
     External_Name => "UDCMODE";

   U1MODECLR : aliased unsigned  -- p32mx470f512.h:1370
     with Import => True,
     Convention => C,
     External_Name => "U1MODECLR";

   UDCMODECLR : aliased unsigned  -- p32mx470f512.h:1371
     with Import => True,
     Convention => C,
     External_Name => "UDCMODECLR";

   U1MODESET : aliased unsigned  -- p32mx470f512.h:1372
     with Import => True,
     Convention => C,
     External_Name => "U1MODESET";

   UDCMODESET : aliased unsigned  -- p32mx470f512.h:1373
     with Import => True,
     Convention => C,
     External_Name => "UDCMODESET";

   U1MODEINV : aliased unsigned  -- p32mx470f512.h:1374
     with Import => True,
     Convention => C,
     External_Name => "U1MODEINV";

   UDCMODEINV : aliased unsigned  -- p32mx470f512.h:1375
     with Import => True,
     Convention => C,
     External_Name => "UDCMODEINV";

   U1STA : aliased unsigned  -- p32mx470f512.h:1376
     with Import => True,
     Convention => C,
     External_Name => "U1STA";

   type uu_U1STAbits_t_struct1095 is record
      URXDA   : Extensions.Unsigned_1;  -- p32mx470f512.h:1379
      OERR    : Extensions.Unsigned_1;  -- p32mx470f512.h:1380
      FERR    : Extensions.Unsigned_1;  -- p32mx470f512.h:1381
      PERR    : Extensions.Unsigned_1;  -- p32mx470f512.h:1382
      RIDLE   : Extensions.Unsigned_1;  -- p32mx470f512.h:1383
      ADDEN   : Extensions.Unsigned_1;  -- p32mx470f512.h:1384
      URXISEL : Extensions.Unsigned_2;  -- p32mx470f512.h:1385
      TRMT    : Extensions.Unsigned_1;  -- p32mx470f512.h:1386
      UTXBF   : Extensions.Unsigned_1;  -- p32mx470f512.h:1387
      UTXEN   : Extensions.Unsigned_1;  -- p32mx470f512.h:1388
      UTXBRK  : Extensions.Unsigned_1;  -- p32mx470f512.h:1389
      URXEN   : Extensions.Unsigned_1;  -- p32mx470f512.h:1390
      UTXINV  : Extensions.Unsigned_1;  -- p32mx470f512.h:1391
      UTXISEL : Extensions.Unsigned_2;  -- p32mx470f512.h:1392
      ADDR    : aliased unsigned_char;  -- p32mx470f512.h:1393
      ADM_EN  : Extensions.Unsigned_1;  -- p32mx470f512.h:1394
   end record
     with Convention => C_Pass_By_Copy,
     Pack => True,
     Alignment => 4;
   type uu_U1STAbits_t_struct1096 is record
      anon3387 : Extensions.Unsigned_6;  -- p32mx470f512.h:1397
      URXISEL0 : Extensions.Unsigned_1;  -- p32mx470f512.h:1398
      URXISEL1 : Extensions.Unsigned_1;  -- p32mx470f512.h:1399
      anon3390 : Extensions.Unsigned_6;  -- p32mx470f512.h:1400
      UTXISEL0 : Extensions.Unsigned_1;  -- p32mx470f512.h:1401
      UTXISEL1 : Extensions.Unsigned_1;  -- p32mx470f512.h:1402
   end record
     with Convention => C_Pass_By_Copy,
     Pack => True,
     Alignment => 4;
   type uu_U1STAbits_t_struct1097 is record
      anon3396 : Extensions.Unsigned_14;  -- p32mx470f512.h:1405
      UTXSEL   : Extensions.Unsigned_2;  -- p32mx470f512.h:1406
   end record
     with Convention => C_Pass_By_Copy,
     Pack => True,
     Alignment => 4;
   type uu_U1STAbits_t_struct1099 is record
      w : aliased unsigned;  -- p32mx470f512.h:1409
   end record
     with Convention => C_Pass_By_Copy;
   type uu_U1STAbits_t (discr : unsigned := 0) is record
      case discr is
         when 0 => anon3385 : aliased uu_U1STAbits_t_struct1095;  -- p32mx470f512.h:1395
         when 1 => anon3394 : aliased uu_U1STAbits_t_struct1096;  -- p32mx470f512.h:1403
         when 2 => anon3399 : aliased uu_U1STAbits_t_struct1097;  -- p32mx470f512.h:1407
         when 3 => anon3403 : aliased uu_U1STAbits_t_struct1099;  -- p32mx470f512.h:1410
         when others => null;
      end case;
   end record
     with Convention => C_Pass_By_Copy,
     Unchecked_Union => True;  -- p32mx470f512.h:1411

   U1STAbits : aliased uu_U1STAbits_t  -- p32mx470f512.h:1412
     with Import => True,
     Convention => C,
     External_Name => "U1STA";

   UDCSTA : aliased unsigned  -- p32mx470f512.h:1413
     with Import => True,
     Convention => C,
     External_Name => "UDCSTA";

   type uu_UDCSTAbits_t_struct1104 is record
      URXDA   : Extensions.Unsigned_1;  -- p32mx470f512.h:1416
      OERR    : Extensions.Unsigned_1;  -- p32mx470f512.h:1417
      FERR    : Extensions.Unsigned_1;  -- p32mx470f512.h:1418
      PERR    : Extensions.Unsigned_1;  -- p32mx470f512.h:1419
      RIDLE   : Extensions.Unsigned_1;  -- p32mx470f512.h:1420
      ADDEN   : Extensions.Unsigned_1;  -- p32mx470f512.h:1421
      URXISEL : Extensions.Unsigned_2;  -- p32mx470f512.h:1422
      TRMT    : Extensions.Unsigned_1;  -- p32mx470f512.h:1423
      UTXBF   : Extensions.Unsigned_1;  -- p32mx470f512.h:1424
      UTXEN   : Extensions.Unsigned_1;  -- p32mx470f512.h:1425
      UTXBRK  : Extensions.Unsigned_1;  -- p32mx470f512.h:1426
      URXEN   : Extensions.Unsigned_1;  -- p32mx470f512.h:1427
      UTXINV  : Extensions.Unsigned_1;  -- p32mx470f512.h:1428
      UTXISEL : Extensions.Unsigned_2;  -- p32mx470f512.h:1429
      ADDR    : aliased unsigned_char;  -- p32mx470f512.h:1430
      ADM_EN  : Extensions.Unsigned_1;  -- p32mx470f512.h:1431
   end record
     with Convention => C_Pass_By_Copy,
     Pack => True,
     Alignment => 4;
   type uu_UDCSTAbits_t_struct1105 is record
      anon3428 : Extensions.Unsigned_6;  -- p32mx470f512.h:1434
      URXISEL0 : Extensions.Unsigned_1;  -- p32mx470f512.h:1435
      URXISEL1 : Extensions.Unsigned_1;  -- p32mx470f512.h:1436
      anon3431 : Extensions.Unsigned_6;  -- p32mx470f512.h:1437
      UTXISEL0 : Extensions.Unsigned_1;  -- p32mx470f512.h:1438
      UTXISEL1 : Extensions.Unsigned_1;  -- p32mx470f512.h:1439
   end record
     with Convention => C_Pass_By_Copy,
     Pack => True,
     Alignment => 4;
   type uu_UDCSTAbits_t_struct1106 is record
      anon3437 : Extensions.Unsigned_14;  -- p32mx470f512.h:1442
      UTXSEL   : Extensions.Unsigned_2;  -- p32mx470f512.h:1443
   end record
     with Convention => C_Pass_By_Copy,
     Pack => True,
     Alignment => 4;
   type uu_UDCSTAbits_t_struct1107 is record
      w : aliased unsigned;  -- p32mx470f512.h:1446
   end record
     with Convention => C_Pass_By_Copy;
   type uu_UDCSTAbits_t (discr : unsigned := 0) is record
      case discr is
         when 0 => anon3426 : aliased uu_UDCSTAbits_t_struct1104;  -- p32mx470f512.h:1432
         when 1 => anon3435 : aliased uu_UDCSTAbits_t_struct1105;  -- p32mx470f512.h:1440
         when 2 => anon3440 : aliased uu_UDCSTAbits_t_struct1106;  -- p32mx470f512.h:1444
         when 3 => anon3444 : aliased uu_UDCSTAbits_t_struct1107;  -- p32mx470f512.h:1447
         when others => null;
      end case;
   end record
     with Convention => C_Pass_By_Copy,
     Unchecked_Union => True;  -- p32mx470f512.h:1448

   UDCSTAbits : aliased uu_UDCSTAbits_t  -- p32mx470f512.h:1449
     with Import => True,
     Convention => C,
     External_Name => "UDCSTA";

   U1STACLR : aliased unsigned  -- p32mx470f512.h:1450
     with Import => True,
     Convention => C,
     External_Name => "U1STACLR";

   UDCSTACLR : aliased unsigned  -- p32mx470f512.h:1451
     with Import => True,
     Convention => C,
     External_Name => "UDCSTACLR";

   U1STASET : aliased unsigned  -- p32mx470f512.h:1452
     with Import => True,
     Convention => C,
     External_Name => "U1STASET";

   UDCSTASET : aliased unsigned  -- p32mx470f512.h:1453
     with Import => True,
     Convention => C,
     External_Name => "UDCSTASET";

   U1STAINV : aliased unsigned  -- p32mx470f512.h:1454
     with Import => True,
     Convention => C,
     External_Name => "U1STAINV";

   UDCSTAINV : aliased unsigned  -- p32mx470f512.h:1455
     with Import => True,
     Convention => C,
     External_Name => "UDCSTAINV";

   U1TXREG : aliased unsigned  -- p32mx470f512.h:1456
     with Import => True,
     Convention => C,
     External_Name => "U1TXREG";

   UDCTXREG : aliased unsigned  -- p32mx470f512.h:1457
     with Import => True,
     Convention => C,
     External_Name => "UDCTXREG";

   U1RXREG : aliased unsigned  -- p32mx470f512.h:1458
     with Import => True,
     Convention => C,
     External_Name => "U1RXREG";

   UDCRXREG : aliased unsigned  -- p32mx470f512.h:1459
     with Import => True,
     Convention => C,
     External_Name => "UDCRXREG";

   U1BRG : aliased unsigned  -- p32mx470f512.h:1460
     with Import => True,
     Convention => C,
     External_Name => "U1BRG";

   UDCBRG : aliased unsigned  -- p32mx470f512.h:1461
     with Import => True,
     Convention => C,
     External_Name => "UDCBRG";

   U1BRGCLR : aliased unsigned  -- p32mx470f512.h:1462
     with Import => True,
     Convention => C,
     External_Name => "U1BRGCLR";

   UDCBRGCLR : aliased unsigned  -- p32mx470f512.h:1463
     with Import => True,
     Convention => C,
     External_Name => "UDCBRGCLR";

   U1BRGSET : aliased unsigned  -- p32mx470f512.h:1464
     with Import => True,
     Convention => C,
     External_Name => "U1BRGSET";

   UDCBRGSET : aliased unsigned  -- p32mx470f512.h:1465
     with Import => True,
     Convention => C,
     External_Name => "UDCBRGSET";

   U1BRGINV : aliased unsigned  -- p32mx470f512.h:1466
     with Import => True,
     Convention => C,
     External_Name => "U1BRGINV";

   UDCBRGINV : aliased unsigned  -- p32mx470f512.h:1467
     with Import => True,
     Convention => C,
     External_Name => "UDCBRGINV";

   U2MODE : aliased unsigned  -- p32mx470f512.h:1468
     with Import => True,
     Convention => C,
     External_Name => "U2MODE";

   type uu_U2MODEbits_t_struct1112 is record
      STSEL    : Extensions.Unsigned_1;  -- p32mx470f512.h:1471
      PDSEL    : Extensions.Unsigned_2;  -- p32mx470f512.h:1472
      BRGH     : Extensions.Unsigned_1;  -- p32mx470f512.h:1473
      RXINV    : Extensions.Unsigned_1;  -- p32mx470f512.h:1474
      ABAUD    : Extensions.Unsigned_1;  -- p32mx470f512.h:1475
      LPBACK   : Extensions.Unsigned_1;  -- p32mx470f512.h:1476
      WAKE     : Extensions.Unsigned_1;  -- p32mx470f512.h:1477
      UEN      : Extensions.Unsigned_2;  -- p32mx470f512.h:1478
      anon3476 : Extensions.Unsigned_1;  -- p32mx470f512.h:1479
      RTSMD    : Extensions.Unsigned_1;  -- p32mx470f512.h:1480
      IREN     : Extensions.Unsigned_1;  -- p32mx470f512.h:1481
      SIDL     : Extensions.Unsigned_1;  -- p32mx470f512.h:1482
      anon3480 : Extensions.Unsigned_1;  -- p32mx470f512.h:1483
      ON       : Extensions.Unsigned_1;  -- p32mx470f512.h:1484
   end record
     with Convention => C_Pass_By_Copy,
     Pack => True,
     Alignment => 4;
   type uu_U2MODEbits_t_struct1113 is record
      anon3485 : Extensions.Unsigned_1;  -- p32mx470f512.h:1487
      PDSEL0   : Extensions.Unsigned_1;  -- p32mx470f512.h:1488
      PDSEL1   : Extensions.Unsigned_1;  -- p32mx470f512.h:1489
      anon3488 : Extensions.Unsigned_5;  -- p32mx470f512.h:1490
      UEN0     : Extensions.Unsigned_1;  -- p32mx470f512.h:1491
      UEN1     : Extensions.Unsigned_1;  -- p32mx470f512.h:1492
   end record
     with Convention => C_Pass_By_Copy,
     Pack => True,
     Alignment => 4;
   type uu_U2MODEbits_t_struct1114 is record
      anon3494 : Extensions.Unsigned_13;  -- p32mx470f512.h:1495
      USIDL    : Extensions.Unsigned_1;  -- p32mx470f512.h:1496
      anon3496 : Extensions.Unsigned_1;  -- p32mx470f512.h:1497
      UARTEN   : Extensions.Unsigned_1;  -- p32mx470f512.h:1498
   end record
     with Convention => C_Pass_By_Copy,
     Pack => True,
     Alignment => 4;
   type uu_U2MODEbits_t_struct1115 is record
      w : aliased unsigned;  -- p32mx470f512.h:1501
   end record
     with Convention => C_Pass_By_Copy;
   type uu_U2MODEbits_t (discr : unsigned := 0) is record
      case discr is
         when 0 => anon3483 : aliased uu_U2MODEbits_t_struct1112;  -- p32mx470f512.h:1485
         when 1 => anon3492 : aliased uu_U2MODEbits_t_struct1113;  -- p32mx470f512.h:1493
         when 2 => anon3499 : aliased uu_U2MODEbits_t_struct1114;  -- p32mx470f512.h:1499
         when 3 => anon3503 : aliased uu_U2MODEbits_t_struct1115;  -- p32mx470f512.h:1502
         when others => null;
      end case;
   end record
     with Convention => C_Pass_By_Copy,
     Unchecked_Union => True;  -- p32mx470f512.h:1503

   U2MODEbits : aliased uu_U2MODEbits_t  -- p32mx470f512.h:1504
     with Import => True,
     Convention => C,
     External_Name => "U2MODE";

   U8932MODE : aliased unsigned  -- p32mx470f512.h:1505
     with Import => True,
     Convention => C,
     External_Name => "U8932MODE";

   type uu_U8932MODEbits_t_struct1120 is record
      STSEL    : Extensions.Unsigned_1;  -- p32mx470f512.h:1508
      PDSEL    : Extensions.Unsigned_2;  -- p32mx470f512.h:1509
      BRGH     : Extensions.Unsigned_1;  -- p32mx470f512.h:1510
      RXINV    : Extensions.Unsigned_1;  -- p32mx470f512.h:1511
      ABAUD    : Extensions.Unsigned_1;  -- p32mx470f512.h:1512
      LPBACK   : Extensions.Unsigned_1;  -- p32mx470f512.h:1513
      WAKE     : Extensions.Unsigned_1;  -- p32mx470f512.h:1514
      UEN      : Extensions.Unsigned_2;  -- p32mx470f512.h:1515
      anon3517 : Extensions.Unsigned_1;  -- p32mx470f512.h:1516
      RTSMD    : Extensions.Unsigned_1;  -- p32mx470f512.h:1517
      IREN     : Extensions.Unsigned_1;  -- p32mx470f512.h:1518
      SIDL     : Extensions.Unsigned_1;  -- p32mx470f512.h:1519
      anon3521 : Extensions.Unsigned_1;  -- p32mx470f512.h:1520
      ON       : Extensions.Unsigned_1;  -- p32mx470f512.h:1521
   end record
     with Convention => C_Pass_By_Copy,
     Pack => True,
     Alignment => 4;
   type uu_U8932MODEbits_t_struct1121 is record
      anon3526 : Extensions.Unsigned_1;  -- p32mx470f512.h:1524
      PDSEL0   : Extensions.Unsigned_1;  -- p32mx470f512.h:1525
      PDSEL1   : Extensions.Unsigned_1;  -- p32mx470f512.h:1526
      anon3529 : Extensions.Unsigned_5;  -- p32mx470f512.h:1527
      UEN0     : Extensions.Unsigned_1;  -- p32mx470f512.h:1528
      UEN1     : Extensions.Unsigned_1;  -- p32mx470f512.h:1529
   end record
     with Convention => C_Pass_By_Copy,
     Pack => True,
     Alignment => 4;
   type uu_U8932MODEbits_t_struct1122 is record
      anon3535 : Extensions.Unsigned_13;  -- p32mx470f512.h:1532
      USIDL    : Extensions.Unsigned_1;  -- p32mx470f512.h:1533
      anon3537 : Extensions.Unsigned_1;  -- p32mx470f512.h:1534
      UARTEN   : Extensions.Unsigned_1;  -- p32mx470f512.h:1535
   end record
     with Convention => C_Pass_By_Copy,
     Pack => True,
     Alignment => 4;
   type uu_U8932MODEbits_t_struct1123 is record
      w : aliased unsigned;  -- p32mx470f512.h:1538
   end record
     with Convention => C_Pass_By_Copy;
   type uu_U8932MODEbits_t (discr : unsigned := 0) is record
      case discr is
         when 0 => anon3524 : aliased uu_U8932MODEbits_t_struct1120;  -- p32mx470f512.h:1522
         when 1 => anon3533 : aliased uu_U8932MODEbits_t_struct1121;  -- p32mx470f512.h:1530
         when 2 => anon3540 : aliased uu_U8932MODEbits_t_struct1122;  -- p32mx470f512.h:1536
         when 3 => anon3544 : aliased uu_U8932MODEbits_t_struct1123;  -- p32mx470f512.h:1539
         when others => null;
      end case;
   end record
     with Convention => C_Pass_By_Copy,
     Unchecked_Union => True;  -- p32mx470f512.h:1540

   U8932MODEbits : aliased uu_U8932MODEbits_t  -- p32mx470f512.h:1541
     with Import => True,
     Convention => C,
     External_Name => "U8932MODE";

   U2MODECLR : aliased unsigned  -- p32mx470f512.h:1542
     with Import => True,
     Convention => C,
     External_Name => "U2MODECLR";

   U8932MODECLR : aliased unsigned  -- p32mx470f512.h:1543
     with Import => True,
     Convention => C,
     External_Name => "U8932MODECLR";

   U2MODESET : aliased unsigned  -- p32mx470f512.h:1544
     with Import => True,
     Convention => C,
     External_Name => "U2MODESET";

   U8932MODESET : aliased unsigned  -- p32mx470f512.h:1545
     with Import => True,
     Convention => C,
     External_Name => "U8932MODESET";

   U2MODEINV : aliased unsigned  -- p32mx470f512.h:1546
     with Import => True,
     Convention => C,
     External_Name => "U2MODEINV";

   U8932MODEINV : aliased unsigned  -- p32mx470f512.h:1547
     with Import => True,
     Convention => C,
     External_Name => "U8932MODEINV";

   U2STA : aliased unsigned  -- p32mx470f512.h:1548
     with Import => True,
     Convention => C,
     External_Name => "U2STA";

   type uu_U2STAbits_t_struct1128 is record
      URXDA   : Extensions.Unsigned_1;  -- p32mx470f512.h:1551
      OERR    : Extensions.Unsigned_1;  -- p32mx470f512.h:1552
      FERR    : Extensions.Unsigned_1;  -- p32mx470f512.h:1553
      PERR    : Extensions.Unsigned_1;  -- p32mx470f512.h:1554
      RIDLE   : Extensions.Unsigned_1;  -- p32mx470f512.h:1555
      ADDEN   : Extensions.Unsigned_1;  -- p32mx470f512.h:1556
      URXISEL : Extensions.Unsigned_2;  -- p32mx470f512.h:1557
      TRMT    : Extensions.Unsigned_1;  -- p32mx470f512.h:1558
      UTXBF   : Extensions.Unsigned_1;  -- p32mx470f512.h:1559
      UTXEN   : Extensions.Unsigned_1;  -- p32mx470f512.h:1560
      UTXBRK  : Extensions.Unsigned_1;  -- p32mx470f512.h:1561
      URXEN   : Extensions.Unsigned_1;  -- p32mx470f512.h:1562
      UTXINV  : Extensions.Unsigned_1;  -- p32mx470f512.h:1563
      UTXISEL : Extensions.Unsigned_2;  -- p32mx470f512.h:1564
      ADDR    : aliased unsigned_char;  -- p32mx470f512.h:1565
      ADM_EN  : Extensions.Unsigned_1;  -- p32mx470f512.h:1566
   end record
     with Convention => C_Pass_By_Copy,
     Pack => True,
     Alignment => 4;
   type uu_U2STAbits_t_struct1129 is record
      anon3575 : Extensions.Unsigned_6;  -- p32mx470f512.h:1569
      URXISEL0 : Extensions.Unsigned_1;  -- p32mx470f512.h:1570
      URXISEL1 : Extensions.Unsigned_1;  -- p32mx470f512.h:1571
      anon3578 : Extensions.Unsigned_6;  -- p32mx470f512.h:1572
      UTXISEL0 : Extensions.Unsigned_1;  -- p32mx470f512.h:1573
      UTXISEL1 : Extensions.Unsigned_1;  -- p32mx470f512.h:1574
   end record
     with Convention => C_Pass_By_Copy,
     Pack => True,
     Alignment => 4;
   type uu_U2STAbits_t_struct1130 is record
      anon3584 : Extensions.Unsigned_14;  -- p32mx470f512.h:1577
      UTXSEL   : Extensions.Unsigned_2;  -- p32mx470f512.h:1578
   end record
     with Convention => C_Pass_By_Copy,
     Pack => True,
     Alignment => 4;
   type uu_U2STAbits_t_struct1131 is record
      w : aliased unsigned;  -- p32mx470f512.h:1581
   end record
     with Convention => C_Pass_By_Copy;
   type uu_U2STAbits_t (discr : unsigned := 0) is record
      case discr is
         when 0 => anon3573 : aliased uu_U2STAbits_t_struct1128;  -- p32mx470f512.h:1567
         when 1 => anon3582 : aliased uu_U2STAbits_t_struct1129;  -- p32mx470f512.h:1575
         when 2 => anon3587 : aliased uu_U2STAbits_t_struct1130;  -- p32mx470f512.h:1579
         when 3 => anon3591 : aliased uu_U2STAbits_t_struct1131;  -- p32mx470f512.h:1582
         when others => null;
      end case;
   end record
     with Convention => C_Pass_By_Copy,
     Unchecked_Union => True;  -- p32mx470f512.h:1583

   U2STAbits : aliased uu_U2STAbits_t  -- p32mx470f512.h:1584
     with Import => True,
     Convention => C,
     External_Name => "U2STA";

   U8932STA : aliased unsigned  -- p32mx470f512.h:1585
     with Import => True,
     Convention => C,
     External_Name => "U8932STA";

   type uu_U8932STAbits_t_struct1136 is record
      URXDA   : Extensions.Unsigned_1;  -- p32mx470f512.h:1588
      OERR    : Extensions.Unsigned_1;  -- p32mx470f512.h:1589
      FERR    : Extensions.Unsigned_1;  -- p32mx470f512.h:1590
      PERR    : Extensions.Unsigned_1;  -- p32mx470f512.h:1591
      RIDLE   : Extensions.Unsigned_1;  -- p32mx470f512.h:1592
      ADDEN   : Extensions.Unsigned_1;  -- p32mx470f512.h:1593
      URXISEL : Extensions.Unsigned_2;  -- p32mx470f512.h:1594
      TRMT    : Extensions.Unsigned_1;  -- p32mx470f512.h:1595
      UTXBF   : Extensions.Unsigned_1;  -- p32mx470f512.h:1596
      UTXEN   : Extensions.Unsigned_1;  -- p32mx470f512.h:1597
      UTXBRK  : Extensions.Unsigned_1;  -- p32mx470f512.h:1598
      URXEN   : Extensions.Unsigned_1;  -- p32mx470f512.h:1599
      UTXINV  : Extensions.Unsigned_1;  -- p32mx470f512.h:1600
      UTXISEL : Extensions.Unsigned_2;  -- p32mx470f512.h:1601
      ADDR    : aliased unsigned_char;  -- p32mx470f512.h:1602
      ADM_EN  : Extensions.Unsigned_1;  -- p32mx470f512.h:1603
   end record
     with Convention => C_Pass_By_Copy,
     Pack => True,
     Alignment => 4;
   type uu_U8932STAbits_t_struct1137 is record
      anon3616 : Extensions.Unsigned_6;  -- p32mx470f512.h:1606
      URXISEL0 : Extensions.Unsigned_1;  -- p32mx470f512.h:1607
      URXISEL1 : Extensions.Unsigned_1;  -- p32mx470f512.h:1608
      anon3619 : Extensions.Unsigned_6;  -- p32mx470f512.h:1609
      UTXISEL0 : Extensions.Unsigned_1;  -- p32mx470f512.h:1610
      UTXISEL1 : Extensions.Unsigned_1;  -- p32mx470f512.h:1611
   end record
     with Convention => C_Pass_By_Copy,
     Pack => True,
     Alignment => 4;
   type uu_U8932STAbits_t_struct1138 is record
      anon3625 : Extensions.Unsigned_14;  -- p32mx470f512.h:1614
      UTXSEL   : Extensions.Unsigned_2;  -- p32mx470f512.h:1615
   end record
     with Convention => C_Pass_By_Copy,
     Pack => True,
     Alignment => 4;
   type uu_U8932STAbits_t_struct1139 is record
      w : aliased unsigned;  -- p32mx470f512.h:1618
   end record
     with Convention => C_Pass_By_Copy;
   type uu_U8932STAbits_t (discr : unsigned := 0) is record
      case discr is
         when 0 => anon3614 : aliased uu_U8932STAbits_t_struct1136;  -- p32mx470f512.h:1604
         when 1 => anon3623 : aliased uu_U8932STAbits_t_struct1137;  -- p32mx470f512.h:1612
         when 2 => anon3628 : aliased uu_U8932STAbits_t_struct1138;  -- p32mx470f512.h:1616
         when 3 => anon3632 : aliased uu_U8932STAbits_t_struct1139;  -- p32mx470f512.h:1619
         when others => null;
      end case;
   end record
     with Convention => C_Pass_By_Copy,
     Unchecked_Union => True;  -- p32mx470f512.h:1620

   U8932STAbits : aliased uu_U8932STAbits_t  -- p32mx470f512.h:1621
     with Import => True,
     Convention => C,
     External_Name => "U8932STA";

   U2STACLR : aliased unsigned  -- p32mx470f512.h:1622
     with Import => True,
     Convention => C,
     External_Name => "U2STACLR";

   U8932STACLR : aliased unsigned  -- p32mx470f512.h:1623
     with Import => True,
     Convention => C,
     External_Name => "U8932STACLR";

   U2STASET : aliased unsigned  -- p32mx470f512.h:1624
     with Import => True,
     Convention => C,
     External_Name => "U2STASET";

   U8932STASET : aliased unsigned  -- p32mx470f512.h:1625
     with Import => True,
     Convention => C,
     External_Name => "U8932STASET";

   U2STAINV : aliased unsigned  -- p32mx470f512.h:1626
     with Import => True,
     Convention => C,
     External_Name => "U2STAINV";

   U8932STAINV : aliased unsigned  -- p32mx470f512.h:1627
     with Import => True,
     Convention => C,
     External_Name => "U8932STAINV";

   U2TXREG : aliased unsigned  -- p32mx470f512.h:1628
     with Import => True,
     Convention => C,
     External_Name => "U2TXREG";

   U8932TXREG : aliased unsigned  -- p32mx470f512.h:1629
     with Import => True,
     Convention => C,
     External_Name => "U8932TXREG";

   U2RXREG : aliased unsigned  -- p32mx470f512.h:1630
     with Import => True,
     Convention => C,
     External_Name => "U2RXREG";

   U8932RXREG : aliased unsigned  -- p32mx470f512.h:1631
     with Import => True,
     Convention => C,
     External_Name => "U8932RXREG";

   U2BRG : aliased unsigned  -- p32mx470f512.h:1632
     with Import => True,
     Convention => C,
     External_Name => "U2BRG";

   U8932BRG : aliased unsigned  -- p32mx470f512.h:1633
     with Import => True,
     Convention => C,
     External_Name => "U8932BRG";

   U2BRGCLR : aliased unsigned  -- p32mx470f512.h:1634
     with Import => True,
     Convention => C,
     External_Name => "U2BRGCLR";

   U8932BRGCLR : aliased unsigned  -- p32mx470f512.h:1635
     with Import => True,
     Convention => C,
     External_Name => "U8932BRGCLR";

   U2BRGSET : aliased unsigned  -- p32mx470f512.h:1636
     with Import => True,
     Convention => C,
     External_Name => "U2BRGSET";

   U8932BRGSET : aliased unsigned  -- p32mx470f512.h:1637
     with Import => True,
     Convention => C,
     External_Name => "U8932BRGSET";

   U2BRGINV : aliased unsigned  -- p32mx470f512.h:1638
     with Import => True,
     Convention => C,
     External_Name => "U2BRGINV";

   U8932BRGINV : aliased unsigned  -- p32mx470f512.h:1639
     with Import => True,
     Convention => C,
     External_Name => "U8932BRGINV";

   U39MODE : aliased unsigned  -- p32mx470f512.h:1640
     with Import => True,
     Convention => C,
     External_Name => "U39MODE";

   type uu_U39MODEbits_t_struct1144 is record
      STSEL    : Extensions.Unsigned_1;  -- p32mx470f512.h:1643
      PDSEL    : Extensions.Unsigned_2;  -- p32mx470f512.h:1644
      BRGH     : Extensions.Unsigned_1;  -- p32mx470f512.h:1645
      RXINV    : Extensions.Unsigned_1;  -- p32mx470f512.h:1646
      ABAUD    : Extensions.Unsigned_1;  -- p32mx470f512.h:1647
      LPBACK   : Extensions.Unsigned_1;  -- p32mx470f512.h:1648
      WAKE     : Extensions.Unsigned_1;  -- p32mx470f512.h:1649
      UEN      : Extensions.Unsigned_2;  -- p32mx470f512.h:1650
      anon3664 : Extensions.Unsigned_1;  -- p32mx470f512.h:1651
      RTSMD    : Extensions.Unsigned_1;  -- p32mx470f512.h:1652
      IREN     : Extensions.Unsigned_1;  -- p32mx470f512.h:1653
      SIDL     : Extensions.Unsigned_1;  -- p32mx470f512.h:1654
      anon3668 : Extensions.Unsigned_1;  -- p32mx470f512.h:1655
      ON       : Extensions.Unsigned_1;  -- p32mx470f512.h:1656
   end record
     with Convention => C_Pass_By_Copy,
     Pack => True,
     Alignment => 4;
   type uu_U39MODEbits_t_struct1145 is record
      anon3673 : Extensions.Unsigned_1;  -- p32mx470f512.h:1659
      PDSEL0   : Extensions.Unsigned_1;  -- p32mx470f512.h:1660
      PDSEL1   : Extensions.Unsigned_1;  -- p32mx470f512.h:1661
      anon3676 : Extensions.Unsigned_5;  -- p32mx470f512.h:1662
      UEN0     : Extensions.Unsigned_1;  -- p32mx470f512.h:1663
      UEN1     : Extensions.Unsigned_1;  -- p32mx470f512.h:1664
   end record
     with Convention => C_Pass_By_Copy,
     Pack => True,
     Alignment => 4;
   type uu_U39MODEbits_t_struct1146 is record
      anon3682 : Extensions.Unsigned_13;  -- p32mx470f512.h:1667
      USIDL    : Extensions.Unsigned_1;  -- p32mx470f512.h:1668
      anon3684 : Extensions.Unsigned_1;  -- p32mx470f512.h:1669
      UARTEN   : Extensions.Unsigned_1;  -- p32mx470f512.h:1670
   end record
     with Convention => C_Pass_By_Copy,
     Pack => True,
     Alignment => 4;
   type uu_U39MODEbits_t_struct1147 is record
      w : aliased unsigned;  -- p32mx470f512.h:1673
   end record
     with Convention => C_Pass_By_Copy;
   type uu_U39MODEbits_t (discr : unsigned := 0) is record
      case discr is
         when 0 => anon3671 : aliased uu_U39MODEbits_t_struct1144;  -- p32mx470f512.h:1657
         when 1 => anon3680 : aliased uu_U39MODEbits_t_struct1145;  -- p32mx470f512.h:1665
         when 2 => anon3687 : aliased uu_U39MODEbits_t_struct1146;  -- p32mx470f512.h:1671
         when 3 => anon3691 : aliased uu_U39MODEbits_t_struct1147;  -- p32mx470f512.h:1674
         when others => null;
      end case;
   end record
     with Convention => C_Pass_By_Copy,
     Unchecked_Union => True;  -- p32mx470f512.h:1675

   U39MODEbits : aliased uu_U39MODEbits_t  -- p32mx470f512.h:1676
     with Import => True,
     Convention => C,
     External_Name => "U39MODE";

   U3MODE : aliased unsigned  -- p32mx470f512.h:1677
     with Import => True,
     Convention => C,
     External_Name => "U3MODE";

   type uu_U3MODEbits_t_struct1152 is record
      STSEL    : Extensions.Unsigned_1;  -- p32mx470f512.h:1680
      PDSEL    : Extensions.Unsigned_2;  -- p32mx470f512.h:1681
      BRGH     : Extensions.Unsigned_1;  -- p32mx470f512.h:1682
      RXINV    : Extensions.Unsigned_1;  -- p32mx470f512.h:1683
      ABAUD    : Extensions.Unsigned_1;  -- p32mx470f512.h:1684
      LPBACK   : Extensions.Unsigned_1;  -- p32mx470f512.h:1685
      WAKE     : Extensions.Unsigned_1;  -- p32mx470f512.h:1686
      UEN      : Extensions.Unsigned_2;  -- p32mx470f512.h:1687
      anon3705 : Extensions.Unsigned_1;  -- p32mx470f512.h:1688
      RTSMD    : Extensions.Unsigned_1;  -- p32mx470f512.h:1689
      IREN     : Extensions.Unsigned_1;  -- p32mx470f512.h:1690
      SIDL     : Extensions.Unsigned_1;  -- p32mx470f512.h:1691
      anon3709 : Extensions.Unsigned_1;  -- p32mx470f512.h:1692
      ON       : Extensions.Unsigned_1;  -- p32mx470f512.h:1693
   end record
     with Convention => C_Pass_By_Copy,
     Pack => True,
     Alignment => 4;
   type uu_U3MODEbits_t_struct1153 is record
      anon3714 : Extensions.Unsigned_1;  -- p32mx470f512.h:1696
      PDSEL0   : Extensions.Unsigned_1;  -- p32mx470f512.h:1697
      PDSEL1   : Extensions.Unsigned_1;  -- p32mx470f512.h:1698
      anon3717 : Extensions.Unsigned_5;  -- p32mx470f512.h:1699
      UEN0     : Extensions.Unsigned_1;  -- p32mx470f512.h:1700
      UEN1     : Extensions.Unsigned_1;  -- p32mx470f512.h:1701
   end record
     with Convention => C_Pass_By_Copy,
     Pack => True,
     Alignment => 4;
   type uu_U3MODEbits_t_struct1154 is record
      anon3723 : Extensions.Unsigned_13;  -- p32mx470f512.h:1704
      USIDL    : Extensions.Unsigned_1;  -- p32mx470f512.h:1705
      anon3725 : Extensions.Unsigned_1;  -- p32mx470f512.h:1706
      UARTEN   : Extensions.Unsigned_1;  -- p32mx470f512.h:1707
   end record
     with Convention => C_Pass_By_Copy,
     Pack => True,
     Alignment => 4;
   type uu_U3MODEbits_t_struct1155 is record
      w : aliased unsigned;  -- p32mx470f512.h:1710
   end record
     with Convention => C_Pass_By_Copy;
   type uu_U3MODEbits_t (discr : unsigned := 0) is record
      case discr is
         when 0 => anon3712 : aliased uu_U3MODEbits_t_struct1152;  -- p32mx470f512.h:1694
         when 1 => anon3721 : aliased uu_U3MODEbits_t_struct1153;  -- p32mx470f512.h:1702
         when 2 => anon3728 : aliased uu_U3MODEbits_t_struct1154;  -- p32mx470f512.h:1708
         when 3 => anon3732 : aliased uu_U3MODEbits_t_struct1155;  -- p32mx470f512.h:1711
         when others => null;
      end case;
   end record
     with Convention => C_Pass_By_Copy,
     Unchecked_Union => True;  -- p32mx470f512.h:1712

   U3MODEbits : aliased uu_U3MODEbits_t  -- p32mx470f512.h:1713
     with Import => True,
     Convention => C,
     External_Name => "U3MODE";

   U39MODECLR : aliased unsigned  -- p32mx470f512.h:1714
     with Import => True,
     Convention => C,
     External_Name => "U39MODECLR";

   U3MODECLR : aliased unsigned  -- p32mx470f512.h:1715
     with Import => True,
     Convention => C,
     External_Name => "U3MODECLR";

   U39MODESET : aliased unsigned  -- p32mx470f512.h:1716
     with Import => True,
     Convention => C,
     External_Name => "U39MODESET";

   U3MODESET : aliased unsigned  -- p32mx470f512.h:1717
     with Import => True,
     Convention => C,
     External_Name => "U3MODESET";

   U39MODEINV : aliased unsigned  -- p32mx470f512.h:1718
     with Import => True,
     Convention => C,
     External_Name => "U39MODEINV";

   U3MODEINV : aliased unsigned  -- p32mx470f512.h:1719
     with Import => True,
     Convention => C,
     External_Name => "U3MODEINV";

   U39STA : aliased unsigned  -- p32mx470f512.h:1720
     with Import => True,
     Convention => C,
     External_Name => "U39STA";

   type uu_U39STAbits_t_struct1160 is record
      URXDA   : Extensions.Unsigned_1;  -- p32mx470f512.h:1723
      OERR    : Extensions.Unsigned_1;  -- p32mx470f512.h:1724
      FERR    : Extensions.Unsigned_1;  -- p32mx470f512.h:1725
      PERR    : Extensions.Unsigned_1;  -- p32mx470f512.h:1726
      RIDLE   : Extensions.Unsigned_1;  -- p32mx470f512.h:1727
      ADDEN   : Extensions.Unsigned_1;  -- p32mx470f512.h:1728
      URXISEL : Extensions.Unsigned_2;  -- p32mx470f512.h:1729
      TRMT    : Extensions.Unsigned_1;  -- p32mx470f512.h:1730
      UTXBF   : Extensions.Unsigned_1;  -- p32mx470f512.h:1731
      UTXEN   : Extensions.Unsigned_1;  -- p32mx470f512.h:1732
      UTXBRK  : Extensions.Unsigned_1;  -- p32mx470f512.h:1733
      URXEN   : Extensions.Unsigned_1;  -- p32mx470f512.h:1734
      UTXINV  : Extensions.Unsigned_1;  -- p32mx470f512.h:1735
      UTXISEL : Extensions.Unsigned_2;  -- p32mx470f512.h:1736
      ADDR    : aliased unsigned_char;  -- p32mx470f512.h:1737
      ADM_EN  : Extensions.Unsigned_1;  -- p32mx470f512.h:1738
   end record
     with Convention => C_Pass_By_Copy,
     Pack => True,
     Alignment => 4;
   type uu_U39STAbits_t_struct1161 is record
      anon3763 : Extensions.Unsigned_6;  -- p32mx470f512.h:1741
      URXISEL0 : Extensions.Unsigned_1;  -- p32mx470f512.h:1742
      URXISEL1 : Extensions.Unsigned_1;  -- p32mx470f512.h:1743
      anon3766 : Extensions.Unsigned_6;  -- p32mx470f512.h:1744
      UTXISEL0 : Extensions.Unsigned_1;  -- p32mx470f512.h:1745
      UTXISEL1 : Extensions.Unsigned_1;  -- p32mx470f512.h:1746
   end record
     with Convention => C_Pass_By_Copy,
     Pack => True,
     Alignment => 4;
   type uu_U39STAbits_t_struct1162 is record
      anon3772 : Extensions.Unsigned_14;  -- p32mx470f512.h:1749
      UTXSEL   : Extensions.Unsigned_2;  -- p32mx470f512.h:1750
   end record
     with Convention => C_Pass_By_Copy,
     Pack => True,
     Alignment => 4;
   type uu_U39STAbits_t_struct1163 is record
      w : aliased unsigned;  -- p32mx470f512.h:1753
   end record
     with Convention => C_Pass_By_Copy;
   type uu_U39STAbits_t (discr : unsigned := 0) is record
      case discr is
         when 0 => anon3761 : aliased uu_U39STAbits_t_struct1160;  -- p32mx470f512.h:1739
         when 1 => anon3770 : aliased uu_U39STAbits_t_struct1161;  -- p32mx470f512.h:1747
         when 2 => anon3775 : aliased uu_U39STAbits_t_struct1162;  -- p32mx470f512.h:1751
         when 3 => anon3779 : aliased uu_U39STAbits_t_struct1163;  -- p32mx470f512.h:1754
         when others => null;
      end case;
   end record
     with Convention => C_Pass_By_Copy,
     Unchecked_Union => True;  -- p32mx470f512.h:1755

   U39STAbits : aliased uu_U39STAbits_t  -- p32mx470f512.h:1756
     with Import => True,
     Convention => C,
     External_Name => "U39STA";

   U3STA : aliased unsigned  -- p32mx470f512.h:1757
     with Import => True,
     Convention => C,
     External_Name => "U3STA";

   type uu_U3STAbits_t_struct1168 is record
      URXDA   : Extensions.Unsigned_1;  -- p32mx470f512.h:1760
      OERR    : Extensions.Unsigned_1;  -- p32mx470f512.h:1761
      FERR    : Extensions.Unsigned_1;  -- p32mx470f512.h:1762
      PERR    : Extensions.Unsigned_1;  -- p32mx470f512.h:1763
      RIDLE   : Extensions.Unsigned_1;  -- p32mx470f512.h:1764
      ADDEN   : Extensions.Unsigned_1;  -- p32mx470f512.h:1765
      URXISEL : Extensions.Unsigned_2;  -- p32mx470f512.h:1766
      TRMT    : Extensions.Unsigned_1;  -- p32mx470f512.h:1767
      UTXBF   : Extensions.Unsigned_1;  -- p32mx470f512.h:1768
      UTXEN   : Extensions.Unsigned_1;  -- p32mx470f512.h:1769
      UTXBRK  : Extensions.Unsigned_1;  -- p32mx470f512.h:1770
      URXEN   : Extensions.Unsigned_1;  -- p32mx470f512.h:1771
      UTXINV  : Extensions.Unsigned_1;  -- p32mx470f512.h:1772
      UTXISEL : Extensions.Unsigned_2;  -- p32mx470f512.h:1773
      ADDR    : aliased unsigned_char;  -- p32mx470f512.h:1774
      ADM_EN  : Extensions.Unsigned_1;  -- p32mx470f512.h:1775
   end record
     with Convention => C_Pass_By_Copy,
     Pack => True,
     Alignment => 4;
   type uu_U3STAbits_t_struct1169 is record
      anon3804 : Extensions.Unsigned_6;  -- p32mx470f512.h:1778
      URXISEL0 : Extensions.Unsigned_1;  -- p32mx470f512.h:1779
      URXISEL1 : Extensions.Unsigned_1;  -- p32mx470f512.h:1780
      anon3807 : Extensions.Unsigned_6;  -- p32mx470f512.h:1781
      UTXISEL0 : Extensions.Unsigned_1;  -- p32mx470f512.h:1782
      UTXISEL1 : Extensions.Unsigned_1;  -- p32mx470f512.h:1783
   end record
     with Convention => C_Pass_By_Copy,
     Pack => True,
     Alignment => 4;
   type uu_U3STAbits_t_struct1170 is record
      anon3813 : Extensions.Unsigned_14;  -- p32mx470f512.h:1786
      UTXSEL   : Extensions.Unsigned_2;  -- p32mx470f512.h:1787
   end record
     with Convention => C_Pass_By_Copy,
     Pack => True,
     Alignment => 4;
   type uu_U3STAbits_t_struct1171 is record
      w : aliased unsigned;  -- p32mx470f512.h:1790
   end record
     with Convention => C_Pass_By_Copy;
   type uu_U3STAbits_t (discr : unsigned := 0) is record
      case discr is
         when 0 => anon3802 : aliased uu_U3STAbits_t_struct1168;  -- p32mx470f512.h:1776
         when 1 => anon3811 : aliased uu_U3STAbits_t_struct1169;  -- p32mx470f512.h:1784
         when 2 => anon3816 : aliased uu_U3STAbits_t_struct1170;  -- p32mx470f512.h:1788
         when 3 => anon3820 : aliased uu_U3STAbits_t_struct1171;  -- p32mx470f512.h:1791
         when others => null;
      end case;
   end record
     with Convention => C_Pass_By_Copy,
     Unchecked_Union => True;  -- p32mx470f512.h:1792

   U3STAbits : aliased uu_U3STAbits_t  -- p32mx470f512.h:1793
     with Import => True,
     Convention => C,
     External_Name => "U3STA";

   U39STACLR : aliased unsigned  -- p32mx470f512.h:1794
     with Import => True,
     Convention => C,
     External_Name => "U39STACLR";

   U3STACLR : aliased unsigned  -- p32mx470f512.h:1795
     with Import => True,
     Convention => C,
     External_Name => "U3STACLR";

   U39STASET : aliased unsigned  -- p32mx470f512.h:1796
     with Import => True,
     Convention => C,
     External_Name => "U39STASET";

   U3STASET : aliased unsigned  -- p32mx470f512.h:1797
     with Import => True,
     Convention => C,
     External_Name => "U3STASET";

   U39STAINV : aliased unsigned  -- p32mx470f512.h:1798
     with Import => True,
     Convention => C,
     External_Name => "U39STAINV";

   U3STAINV : aliased unsigned  -- p32mx470f512.h:1799
     with Import => True,
     Convention => C,
     External_Name => "U3STAINV";

   U39TXREG : aliased unsigned  -- p32mx470f512.h:1800
     with Import => True,
     Convention => C,
     External_Name => "U39TXREG";

   U3TXREG : aliased unsigned  -- p32mx470f512.h:1801
     with Import => True,
     Convention => C,
     External_Name => "U3TXREG";

   U39RXREG : aliased unsigned  -- p32mx470f512.h:1802
     with Import => True,
     Convention => C,
     External_Name => "U39RXREG";

   U3RXREG : aliased unsigned  -- p32mx470f512.h:1803
     with Import => True,
     Convention => C,
     External_Name => "U3RXREG";

   U39BRG : aliased unsigned  -- p32mx470f512.h:1804
     with Import => True,
     Convention => C,
     External_Name => "U39BRG";

   U3BRG : aliased unsigned  -- p32mx470f512.h:1805
     with Import => True,
     Convention => C,
     External_Name => "U3BRG";

   U39BRGCLR : aliased unsigned  -- p32mx470f512.h:1806
     with Import => True,
     Convention => C,
     External_Name => "U39BRGCLR";

   U3BRGCLR : aliased unsigned  -- p32mx470f512.h:1807
     with Import => True,
     Convention => C,
     External_Name => "U3BRGCLR";

   U39BRGSET : aliased unsigned  -- p32mx470f512.h:1808
     with Import => True,
     Convention => C,
     External_Name => "U39BRGSET";

   U3BRGSET : aliased unsigned  -- p32mx470f512.h:1809
     with Import => True,
     Convention => C,
     External_Name => "U3BRGSET";

   U39BRGINV : aliased unsigned  -- p32mx470f512.h:1810
     with Import => True,
     Convention => C,
     External_Name => "U39BRGINV";

   U3BRGINV : aliased unsigned  -- p32mx470f512.h:1811
     with Import => True,
     Convention => C,
     External_Name => "U3BRGINV";

   U4MODE : aliased unsigned  -- p32mx470f512.h:1812
     with Import => True,
     Convention => C,
     External_Name => "U4MODE";

   type uu_U4MODEbits_t_struct1176 is record
      STSEL    : Extensions.Unsigned_1;  -- p32mx470f512.h:1815
      PDSEL    : Extensions.Unsigned_2;  -- p32mx470f512.h:1816
      BRGH     : Extensions.Unsigned_1;  -- p32mx470f512.h:1817
      RXINV    : Extensions.Unsigned_1;  -- p32mx470f512.h:1818
      ABAUD    : Extensions.Unsigned_1;  -- p32mx470f512.h:1819
      LPBACK   : Extensions.Unsigned_1;  -- p32mx470f512.h:1820
      WAKE     : Extensions.Unsigned_1;  -- p32mx470f512.h:1821
      UEN      : Extensions.Unsigned_2;  -- p32mx470f512.h:1822
      anon3852 : Extensions.Unsigned_1;  -- p32mx470f512.h:1823
      RTSMD    : Extensions.Unsigned_1;  -- p32mx470f512.h:1824
      IREN     : Extensions.Unsigned_1;  -- p32mx470f512.h:1825
      SIDL     : Extensions.Unsigned_1;  -- p32mx470f512.h:1826
      anon3856 : Extensions.Unsigned_1;  -- p32mx470f512.h:1827
      ON       : Extensions.Unsigned_1;  -- p32mx470f512.h:1828
   end record
     with Convention => C_Pass_By_Copy,
     Pack => True,
     Alignment => 4;
   type uu_U4MODEbits_t_struct1177 is record
      anon3861 : Extensions.Unsigned_1;  -- p32mx470f512.h:1831
      PDSEL0   : Extensions.Unsigned_1;  -- p32mx470f512.h:1832
      PDSEL1   : Extensions.Unsigned_1;  -- p32mx470f512.h:1833
      anon3864 : Extensions.Unsigned_5;  -- p32mx470f512.h:1834
      UEN0     : Extensions.Unsigned_1;  -- p32mx470f512.h:1835
      UEN1     : Extensions.Unsigned_1;  -- p32mx470f512.h:1836
   end record
     with Convention => C_Pass_By_Copy,
     Pack => True,
     Alignment => 4;
   type uu_U4MODEbits_t_struct1178 is record
      anon3870 : Extensions.Unsigned_13;  -- p32mx470f512.h:1839
      USIDL    : Extensions.Unsigned_1;  -- p32mx470f512.h:1840
      anon3872 : Extensions.Unsigned_1;  -- p32mx470f512.h:1841
      UARTEN   : Extensions.Unsigned_1;  -- p32mx470f512.h:1842
   end record
     with Convention => C_Pass_By_Copy,
     Pack => True,
     Alignment => 4;
   type uu_U4MODEbits_t_struct1179 is record
      w : aliased unsigned;  -- p32mx470f512.h:1845
   end record
     with Convention => C_Pass_By_Copy;
   type uu_U4MODEbits_t (discr : unsigned := 0) is record
      case discr is
         when 0 => anon3859 : aliased uu_U4MODEbits_t_struct1176;  -- p32mx470f512.h:1829
         when 1 => anon3868 : aliased uu_U4MODEbits_t_struct1177;  -- p32mx470f512.h:1837
         when 2 => anon3875 : aliased uu_U4MODEbits_t_struct1178;  -- p32mx470f512.h:1843
         when 3 => anon3879 : aliased uu_U4MODEbits_t_struct1179;  -- p32mx470f512.h:1846
         when others => null;
      end case;
   end record
     with Convention => C_Pass_By_Copy,
     Unchecked_Union => True;  -- p32mx470f512.h:1847

   U4MODEbits : aliased uu_U4MODEbits_t  -- p32mx470f512.h:1848
     with Import => True,
     Convention => C,
     External_Name => "U4MODE";

   UodMODE : aliased unsigned  -- p32mx470f512.h:1849
     with Import => True,
     Convention => C,
     External_Name => "UodMODE";

   type uu_UodMODEbits_t_struct1184 is record
      STSEL    : Extensions.Unsigned_1;  -- p32mx470f512.h:1852
      PDSEL    : Extensions.Unsigned_2;  -- p32mx470f512.h:1853
      BRGH     : Extensions.Unsigned_1;  -- p32mx470f512.h:1854
      RXINV    : Extensions.Unsigned_1;  -- p32mx470f512.h:1855
      ABAUD    : Extensions.Unsigned_1;  -- p32mx470f512.h:1856
      LPBACK   : Extensions.Unsigned_1;  -- p32mx470f512.h:1857
      WAKE     : Extensions.Unsigned_1;  -- p32mx470f512.h:1858
      UEN      : Extensions.Unsigned_2;  -- p32mx470f512.h:1859
      anon3893 : Extensions.Unsigned_1;  -- p32mx470f512.h:1860
      RTSMD    : Extensions.Unsigned_1;  -- p32mx470f512.h:1861
      IREN     : Extensions.Unsigned_1;  -- p32mx470f512.h:1862
      SIDL     : Extensions.Unsigned_1;  -- p32mx470f512.h:1863
      anon3897 : Extensions.Unsigned_1;  -- p32mx470f512.h:1864
      ON       : Extensions.Unsigned_1;  -- p32mx470f512.h:1865
   end record
     with Convention => C_Pass_By_Copy,
     Pack => True,
     Alignment => 4;
   type uu_UodMODEbits_t_struct1185 is record
      anon3902 : Extensions.Unsigned_1;  -- p32mx470f512.h:1868
      PDSEL0   : Extensions.Unsigned_1;  -- p32mx470f512.h:1869
      PDSEL1   : Extensions.Unsigned_1;  -- p32mx470f512.h:1870
      anon3905 : Extensions.Unsigned_5;  -- p32mx470f512.h:1871
      UEN0     : Extensions.Unsigned_1;  -- p32mx470f512.h:1872
      UEN1     : Extensions.Unsigned_1;  -- p32mx470f512.h:1873
   end record
     with Convention => C_Pass_By_Copy,
     Pack => True,
     Alignment => 4;
   type uu_UodMODEbits_t_struct1186 is record
      anon3911 : Extensions.Unsigned_13;  -- p32mx470f512.h:1876
      USIDL    : Extensions.Unsigned_1;  -- p32mx470f512.h:1877
      anon3913 : Extensions.Unsigned_1;  -- p32mx470f512.h:1878
      UARTEN   : Extensions.Unsigned_1;  -- p32mx470f512.h:1879
   end record
     with Convention => C_Pass_By_Copy,
     Pack => True,
     Alignment => 4;
   type uu_UodMODEbits_t_struct1187 is record
      w : aliased unsigned;  -- p32mx470f512.h:1882
   end record
     with Convention => C_Pass_By_Copy;
   type uu_UodMODEbits_t (discr : unsigned := 0) is record
      case discr is
         when 0 => anon3900 : aliased uu_UodMODEbits_t_struct1184;  -- p32mx470f512.h:1866
         when 1 => anon3909 : aliased uu_UodMODEbits_t_struct1185;  -- p32mx470f512.h:1874
         when 2 => anon3916 : aliased uu_UodMODEbits_t_struct1186;  -- p32mx470f512.h:1880
         when 3 => anon3920 : aliased uu_UodMODEbits_t_struct1187;  -- p32mx470f512.h:1883
         when others => null;
      end case;
   end record
     with Convention => C_Pass_By_Copy,
     Unchecked_Union => True;  -- p32mx470f512.h:1884

   UodMODEbits : aliased uu_UodMODEbits_t  -- p32mx470f512.h:1885
     with Import => True,
     Convention => C,
     External_Name => "UodMODE";

   U4MODECLR : aliased unsigned  -- p32mx470f512.h:1886
     with Import => True,
     Convention => C,
     External_Name => "U4MODECLR";

   UodMODECLR : aliased unsigned  -- p32mx470f512.h:1887
     with Import => True,
     Convention => C,
     External_Name => "UodMODECLR";

   U4MODESET : aliased unsigned  -- p32mx470f512.h:1888
     with Import => True,
     Convention => C,
     External_Name => "U4MODESET";

   UodMODESET : aliased unsigned  -- p32mx470f512.h:1889
     with Import => True,
     Convention => C,
     External_Name => "UodMODESET";

   U4MODEINV : aliased unsigned  -- p32mx470f512.h:1890
     with Import => True,
     Convention => C,
     External_Name => "U4MODEINV";

   UodMODEINV : aliased unsigned  -- p32mx470f512.h:1891
     with Import => True,
     Convention => C,
     External_Name => "UodMODEINV";

   U4STA : aliased unsigned  -- p32mx470f512.h:1892
     with Import => True,
     Convention => C,
     External_Name => "U4STA";

   type uu_U4STAbits_t_struct1192 is record
      URXDA   : Extensions.Unsigned_1;  -- p32mx470f512.h:1895
      OERR    : Extensions.Unsigned_1;  -- p32mx470f512.h:1896
      FERR    : Extensions.Unsigned_1;  -- p32mx470f512.h:1897
      PERR    : Extensions.Unsigned_1;  -- p32mx470f512.h:1898
      RIDLE   : Extensions.Unsigned_1;  -- p32mx470f512.h:1899
      ADDEN   : Extensions.Unsigned_1;  -- p32mx470f512.h:1900
      URXISEL : Extensions.Unsigned_2;  -- p32mx470f512.h:1901
      TRMT    : Extensions.Unsigned_1;  -- p32mx470f512.h:1902
      UTXBF   : Extensions.Unsigned_1;  -- p32mx470f512.h:1903
      UTXEN   : Extensions.Unsigned_1;  -- p32mx470f512.h:1904
      UTXBRK  : Extensions.Unsigned_1;  -- p32mx470f512.h:1905
      URXEN   : Extensions.Unsigned_1;  -- p32mx470f512.h:1906
      UTXINV  : Extensions.Unsigned_1;  -- p32mx470f512.h:1907
      UTXISEL : Extensions.Unsigned_2;  -- p32mx470f512.h:1908
      ADDR    : aliased unsigned_char;  -- p32mx470f512.h:1909
      ADM_EN  : Extensions.Unsigned_1;  -- p32mx470f512.h:1910
   end record
     with Convention => C_Pass_By_Copy,
     Pack => True,
     Alignment => 4;
   type uu_U4STAbits_t_struct1193 is record
      anon3951 : Extensions.Unsigned_6;  -- p32mx470f512.h:1913
      URXISEL0 : Extensions.Unsigned_1;  -- p32mx470f512.h:1914
      URXISEL1 : Extensions.Unsigned_1;  -- p32mx470f512.h:1915
      anon3954 : Extensions.Unsigned_6;  -- p32mx470f512.h:1916
      UTXISEL0 : Extensions.Unsigned_1;  -- p32mx470f512.h:1917
      UTXISEL1 : Extensions.Unsigned_1;  -- p32mx470f512.h:1918
   end record
     with Convention => C_Pass_By_Copy,
     Pack => True,
     Alignment => 4;
   type uu_U4STAbits_t_struct1194 is record
      anon3960 : Extensions.Unsigned_14;  -- p32mx470f512.h:1921
      UTXSEL   : Extensions.Unsigned_2;  -- p32mx470f512.h:1922
   end record
     with Convention => C_Pass_By_Copy,
     Pack => True,
     Alignment => 4;
   type uu_U4STAbits_t_struct1195 is record
      w : aliased unsigned;  -- p32mx470f512.h:1925
   end record
     with Convention => C_Pass_By_Copy;
   type uu_U4STAbits_t (discr : unsigned := 0) is record
      case discr is
         when 0 => anon3949 : aliased uu_U4STAbits_t_struct1192;  -- p32mx470f512.h:1911
         when 1 => anon3958 : aliased uu_U4STAbits_t_struct1193;  -- p32mx470f512.h:1919
         when 2 => anon3963 : aliased uu_U4STAbits_t_struct1194;  -- p32mx470f512.h:1923
         when 3 => anon3967 : aliased uu_U4STAbits_t_struct1195;  -- p32mx470f512.h:1926
         when others => null;
      end case;
   end record
     with Convention => C_Pass_By_Copy,
     Unchecked_Union => True;  -- p32mx470f512.h:1927

   U4STAbits : aliased uu_U4STAbits_t  -- p32mx470f512.h:1928
     with Import => True,
     Convention => C,
     External_Name => "U4STA";

   UodSTA : aliased unsigned  -- p32mx470f512.h:1929
     with Import => True,
     Convention => C,
     External_Name => "UodSTA";

   type uu_UodSTAbits_t_struct1200 is record
      URXDA   : Extensions.Unsigned_1;  -- p32mx470f512.h:1932
      OERR    : Extensions.Unsigned_1;  -- p32mx470f512.h:1933
      FERR    : Extensions.Unsigned_1;  -- p32mx470f512.h:1934
      PERR    : Extensions.Unsigned_1;  -- p32mx470f512.h:1935
      RIDLE   : Extensions.Unsigned_1;  -- p32mx470f512.h:1936
      ADDEN   : Extensions.Unsigned_1;  -- p32mx470f512.h:1937
      URXISEL : Extensions.Unsigned_2;  -- p32mx470f512.h:1938
      TRMT    : Extensions.Unsigned_1;  -- p32mx470f512.h:1939
      UTXBF   : Extensions.Unsigned_1;  -- p32mx470f512.h:1940
      UTXEN   : Extensions.Unsigned_1;  -- p32mx470f512.h:1941
      UTXBRK  : Extensions.Unsigned_1;  -- p32mx470f512.h:1942
      URXEN   : Extensions.Unsigned_1;  -- p32mx470f512.h:1943
      UTXINV  : Extensions.Unsigned_1;  -- p32mx470f512.h:1944
      UTXISEL : Extensions.Unsigned_2;  -- p32mx470f512.h:1945
      ADDR    : aliased unsigned_char;  -- p32mx470f512.h:1946
      ADM_EN  : Extensions.Unsigned_1;  -- p32mx470f512.h:1947
   end record
     with Convention => C_Pass_By_Copy,
     Pack => True,
     Alignment => 4;
   type uu_UodSTAbits_t_struct1201 is record
      anon3992 : Extensions.Unsigned_6;  -- p32mx470f512.h:1950
      URXISEL0 : Extensions.Unsigned_1;  -- p32mx470f512.h:1951
      URXISEL1 : Extensions.Unsigned_1;  -- p32mx470f512.h:1952
      anon3995 : Extensions.Unsigned_6;  -- p32mx470f512.h:1953
      UTXISEL0 : Extensions.Unsigned_1;  -- p32mx470f512.h:1954
      UTXISEL1 : Extensions.Unsigned_1;  -- p32mx470f512.h:1955
   end record
     with Convention => C_Pass_By_Copy,
     Pack => True,
     Alignment => 4;
   type uu_UodSTAbits_t_struct1202 is record
      anon4001 : Extensions.Unsigned_14;  -- p32mx470f512.h:1958
      UTXSEL   : Extensions.Unsigned_2;  -- p32mx470f512.h:1959
   end record
     with Convention => C_Pass_By_Copy,
     Pack => True,
     Alignment => 4;
   type uu_UodSTAbits_t_struct1203 is record
      w : aliased unsigned;  -- p32mx470f512.h:1962
   end record
     with Convention => C_Pass_By_Copy;
   type uu_UodSTAbits_t (discr : unsigned := 0) is record
      case discr is
         when 0 => anon3990 : aliased uu_UodSTAbits_t_struct1200;  -- p32mx470f512.h:1948
         when 1 => anon3999 : aliased uu_UodSTAbits_t_struct1201;  -- p32mx470f512.h:1956
         when 2 => anon4004 : aliased uu_UodSTAbits_t_struct1202;  -- p32mx470f512.h:1960
         when 3 => anon4008 : aliased uu_UodSTAbits_t_struct1203;  -- p32mx470f512.h:1963
         when others => null;
      end case;
   end record
     with Convention => C_Pass_By_Copy,
     Unchecked_Union => True;  -- p32mx470f512.h:1964

   UodSTAbits : aliased uu_UodSTAbits_t  -- p32mx470f512.h:1965
     with Import => True,
     Convention => C,
     External_Name => "UodSTA";

   U4STACLR : aliased unsigned  -- p32mx470f512.h:1966
     with Import => True,
     Convention => C,
     External_Name => "U4STACLR";

   UodSTACLR : aliased unsigned  -- p32mx470f512.h:1967
     with Import => True,
     Convention => C,
     External_Name => "UodSTACLR";

   U4STASET : aliased unsigned  -- p32mx470f512.h:1968
     with Import => True,
     Convention => C,
     External_Name => "U4STASET";

   UodSTASET : aliased unsigned  -- p32mx470f512.h:1969
     with Import => True,
     Convention => C,
     External_Name => "UodSTASET";

   U4STAINV : aliased unsigned  -- p32mx470f512.h:1970
     with Import => True,
     Convention => C,
     External_Name => "U4STAINV";

   UodSTAINV : aliased unsigned  -- p32mx470f512.h:1971
     with Import => True,
     Convention => C,
     External_Name => "UodSTAINV";

   U4TXREG : aliased unsigned  -- p32mx470f512.h:1972
     with Import => True,
     Convention => C,
     External_Name => "U4TXREG";

   UodTXREG : aliased unsigned  -- p32mx470f512.h:1973
     with Import => True,
     Convention => C,
     External_Name => "UodTXREG";

   U4RXREG : aliased unsigned  -- p32mx470f512.h:1974
     with Import => True,
     Convention => C,
     External_Name => "U4RXREG";

   UodRXREG : aliased unsigned  -- p32mx470f512.h:1975
     with Import => True,
     Convention => C,
     External_Name => "UodRXREG";

   U4BRG : aliased unsigned  -- p32mx470f512.h:1976
     with Import => True,
     Convention => C,
     External_Name => "U4BRG";

   UodBRG : aliased unsigned  -- p32mx470f512.h:1977
     with Import => True,
     Convention => C,
     External_Name => "UodBRG";

   U4BRGCLR : aliased unsigned  -- p32mx470f512.h:1978
     with Import => True,
     Convention => C,
     External_Name => "U4BRGCLR";

   UodBRGCLR : aliased unsigned  -- p32mx470f512.h:1979
     with Import => True,
     Convention => C,
     External_Name => "UodBRGCLR";

   U4BRGSET : aliased unsigned  -- p32mx470f512.h:1980
     with Import => True,
     Convention => C,
     External_Name => "U4BRGSET";

   UodBRGSET : aliased unsigned  -- p32mx470f512.h:1981
     with Import => True,
     Convention => C,
     External_Name => "UodBRGSET";

   U4BRGINV : aliased unsigned  -- p32mx470f512.h:1982
     with Import => True,
     Convention => C,
     External_Name => "U4BRGINV";

   UodBRGINV : aliased unsigned  -- p32mx470f512.h:1983
     with Import => True,
     Convention => C,
     External_Name => "UodBRGINV";

   PMCON : aliased unsigned  -- p32mx470f512.h:1984
     with Import => True,
     Convention => C,
     External_Name => "PMCON";

   type uu_PMCONbits_t_struct1208 is record
      RDSP     : Extensions.Unsigned_1;  -- p32mx470f512.h:1987
      WRSP     : Extensions.Unsigned_1;  -- p32mx470f512.h:1988
      anon4034 : Extensions.Unsigned_1;  -- p32mx470f512.h:1989
      CS1P     : Extensions.Unsigned_1;  -- p32mx470f512.h:1990
      CS2P     : Extensions.Unsigned_1;  -- p32mx470f512.h:1991
      ALP      : Extensions.Unsigned_1;  -- p32mx470f512.h:1992
      CSF      : Extensions.Unsigned_2;  -- p32mx470f512.h:1993
      PTRDEN   : Extensions.Unsigned_1;  -- p32mx470f512.h:1994
      PTWREN   : Extensions.Unsigned_1;  -- p32mx470f512.h:1995
      PMPTTL   : Extensions.Unsigned_1;  -- p32mx470f512.h:1996
      ADRMUX   : Extensions.Unsigned_2;  -- p32mx470f512.h:1997
      SIDL     : Extensions.Unsigned_1;  -- p32mx470f512.h:1998
      anon4044 : Extensions.Unsigned_1;  -- p32mx470f512.h:1999
      ON       : Extensions.Unsigned_1;  -- p32mx470f512.h:2000
   end record
     with Convention => C_Pass_By_Copy,
     Pack => True,
     Alignment => 4;
   type uu_PMCONbits_t_struct1209 is record
      anon4049 : Extensions.Unsigned_6;  -- p32mx470f512.h:2003
      CSF0     : Extensions.Unsigned_1;  -- p32mx470f512.h:2004
      CSF1     : Extensions.Unsigned_1;  -- p32mx470f512.h:2005
      anon4052 : Extensions.Unsigned_3;  -- p32mx470f512.h:2006
      ADRMUX0  : Extensions.Unsigned_1;  -- p32mx470f512.h:2007
      ADRMUX1  : Extensions.Unsigned_1;  -- p32mx470f512.h:2008
   end record
     with Convention => C_Pass_By_Copy,
     Pack => True,
     Alignment => 4;
   type uu_PMCONbits_t_struct1210 is record
      anon4058 : Extensions.Unsigned_13;  -- p32mx470f512.h:2011
      PSIDL    : Extensions.Unsigned_1;  -- p32mx470f512.h:2012
      anon4060 : Extensions.Unsigned_1;  -- p32mx470f512.h:2013
      PMPEN    : Extensions.Unsigned_1;  -- p32mx470f512.h:2014
   end record
     with Convention => C_Pass_By_Copy,
     Pack => True,
     Alignment => 4;
   type uu_PMCONbits_t_struct1211 is record
      w : aliased unsigned;  -- p32mx470f512.h:2017
   end record
     with Convention => C_Pass_By_Copy;
   type uu_PMCONbits_t (discr : unsigned := 0) is record
      case discr is
         when 0 => anon4047 : aliased uu_PMCONbits_t_struct1208;  -- p32mx470f512.h:2001
         when 1 => anon4056 : aliased uu_PMCONbits_t_struct1209;  -- p32mx470f512.h:2009
         when 2 => anon4063 : aliased uu_PMCONbits_t_struct1210;  -- p32mx470f512.h:2015
         when 3 => anon4067 : aliased uu_PMCONbits_t_struct1211;  -- p32mx470f512.h:2018
         when others => null;
      end case;
   end record
     with Convention => C_Pass_By_Copy,
     Unchecked_Union => True;  -- p32mx470f512.h:2019

   PMCONbits : aliased uu_PMCONbits_t  -- p32mx470f512.h:2020
     with Import => True,
     Convention => C,
     External_Name => "PMCON";

   PMCONCLR : aliased unsigned  -- p32mx470f512.h:2021
     with Import => True,
     Convention => C,
     External_Name => "PMCONCLR";

   PMCONSET : aliased unsigned  -- p32mx470f512.h:2022
     with Import => True,
     Convention => C,
     External_Name => "PMCONSET";

   PMCONINV : aliased unsigned  -- p32mx470f512.h:2023
     with Import => True,
     Convention => C,
     External_Name => "PMCONINV";

   PMMODE : aliased unsigned  -- p32mx470f512.h:2024
     with Import => True,
     Convention => C,
     External_Name => "PMMODE";

   type uu_PMMODEbits_t_struct1216 is record
      WAITE  : Extensions.Unsigned_2;  -- p32mx470f512.h:2027
      WAITM  : Extensions.Unsigned_4;  -- p32mx470f512.h:2028
      WAITB  : Extensions.Unsigned_2;  -- p32mx470f512.h:2029
      MODE   : Extensions.Unsigned_2;  -- p32mx470f512.h:2030
      MODE16 : Extensions.Unsigned_1;  -- p32mx470f512.h:2031
      INCM   : Extensions.Unsigned_2;  -- p32mx470f512.h:2032
      IRQM   : Extensions.Unsigned_2;  -- p32mx470f512.h:2033
      BUSY   : Extensions.Unsigned_1;  -- p32mx470f512.h:2034
   end record
     with Convention => C_Pass_By_Copy,
     Pack => True,
     Alignment => 4;
   type uu_PMMODEbits_t_struct1217 is record
      WAITE0   : Extensions.Unsigned_1;  -- p32mx470f512.h:2037
      WAITE1   : Extensions.Unsigned_1;  -- p32mx470f512.h:2038
      WAITM0   : Extensions.Unsigned_1;  -- p32mx470f512.h:2039
      WAITM1   : Extensions.Unsigned_1;  -- p32mx470f512.h:2040
      WAITM2   : Extensions.Unsigned_1;  -- p32mx470f512.h:2041
      WAITM3   : Extensions.Unsigned_1;  -- p32mx470f512.h:2042
      WAITB0   : Extensions.Unsigned_1;  -- p32mx470f512.h:2043
      WAITB1   : Extensions.Unsigned_1;  -- p32mx470f512.h:2044
      MODE0    : Extensions.Unsigned_1;  -- p32mx470f512.h:2045
      MODE1    : Extensions.Unsigned_1;  -- p32mx470f512.h:2046
      anon4097 : Extensions.Unsigned_1;  -- p32mx470f512.h:2047
      INCM0    : Extensions.Unsigned_1;  -- p32mx470f512.h:2048
      INCM1    : Extensions.Unsigned_1;  -- p32mx470f512.h:2049
      IRQM0    : Extensions.Unsigned_1;  -- p32mx470f512.h:2050
      IRQM1    : Extensions.Unsigned_1;  -- p32mx470f512.h:2051
   end record
     with Convention => C_Pass_By_Copy,
     Pack => True,
     Alignment => 4;
   type uu_PMMODEbits_t_struct1218 is record
      w : aliased unsigned;  -- p32mx470f512.h:2054
   end record
     with Convention => C_Pass_By_Copy;
   type uu_PMMODEbits_t (discr : unsigned := 0) is record
      case discr is
         when 0 => anon4085 : aliased uu_PMMODEbits_t_struct1216;  -- p32mx470f512.h:2035
         when 1 => anon4103 : aliased uu_PMMODEbits_t_struct1217;  -- p32mx470f512.h:2052
         when 2 => anon4107 : aliased uu_PMMODEbits_t_struct1218;  -- p32mx470f512.h:2055
         when others => null;
      end case;
   end record
     with Convention => C_Pass_By_Copy,
     Unchecked_Union => True;  -- p32mx470f512.h:2056

   PMMODEbits : aliased uu_PMMODEbits_t  -- p32mx470f512.h:2057
     with Import => True,
     Convention => C,
     External_Name => "PMMODE";

   PMMODECLR : aliased unsigned  -- p32mx470f512.h:2058
     with Import => True,
     Convention => C,
     External_Name => "PMMODECLR";

   PMMODESET : aliased unsigned  -- p32mx470f512.h:2059
     with Import => True,
     Convention => C,
     External_Name => "PMMODESET";

   PMMODEINV : aliased unsigned  -- p32mx470f512.h:2060
     with Import => True,
     Convention => C,
     External_Name => "PMMODEINV";

   PMADDR : aliased unsigned  -- p32mx470f512.h:2061
     with Import => True,
     Convention => C,
     External_Name => "PMADDR";

   type uu_PMADDRbits_t_struct1223 is record
      ADDR : Extensions.Unsigned_14;  -- p32mx470f512.h:2064
      CS   : Extensions.Unsigned_2;  -- p32mx470f512.h:2065
   end record
     with Convention => C_Pass_By_Copy,
     Pack => True,
     Alignment => 4;
   type uu_PMADDRbits_t_struct1224 is record
      PADDR : Extensions.Unsigned_14;  -- p32mx470f512.h:2068
   end record
     with Convention => C_Pass_By_Copy,
     Pack => True,
     Alignment => 4;
   type uu_PMADDRbits_t_struct1225 is record
      anon4125 : Extensions.Unsigned_14;  -- p32mx470f512.h:2071
      CS1      : Extensions.Unsigned_1;  -- p32mx470f512.h:2072
      CS2      : Extensions.Unsigned_1;  -- p32mx470f512.h:2073
   end record
     with Convention => C_Pass_By_Copy,
     Pack => True,
     Alignment => 4;
   type uu_PMADDRbits_t_struct1226 is record
      w : aliased unsigned;  -- p32mx470f512.h:2076
   end record
     with Convention => C_Pass_By_Copy;
   type uu_PMADDRbits_t (discr : unsigned := 0) is record
      case discr is
         when 0 => anon4119 : aliased uu_PMADDRbits_t_struct1223;  -- p32mx470f512.h:2066
         when 1 => anon4123 : aliased uu_PMADDRbits_t_struct1224;  -- p32mx470f512.h:2069
         when 2 => anon4129 : aliased uu_PMADDRbits_t_struct1225;  -- p32mx470f512.h:2074
         when 3 => anon4133 : aliased uu_PMADDRbits_t_struct1226;  -- p32mx470f512.h:2077
         when others => null;
      end case;
   end record
     with Convention => C_Pass_By_Copy,
     Unchecked_Union => True;  -- p32mx470f512.h:2078

   PMADDRbits : aliased uu_PMADDRbits_t  -- p32mx470f512.h:2079
     with Import => True,
     Convention => C,
     External_Name => "PMADDR";

   PMADDRCLR : aliased unsigned  -- p32mx470f512.h:2080
     with Import => True,
     Convention => C,
     External_Name => "PMADDRCLR";

   PMADDRSET : aliased unsigned  -- p32mx470f512.h:2081
     with Import => True,
     Convention => C,
     External_Name => "PMADDRSET";

   PMADDRINV : aliased unsigned  -- p32mx470f512.h:2082
     with Import => True,
     Convention => C,
     External_Name => "PMADDRINV";

   PMDOUT : aliased unsigned  -- p32mx470f512.h:2083
     with Import => True,
     Convention => C,
     External_Name => "PMDOUT";

   type uu_PMDOUTbits_t_struct1231 is record
      DATAOUT : aliased unsigned;  -- p32mx470f512.h:2086
   end record
     with Convention => C_Pass_By_Copy;
   type uu_PMDOUTbits_t_struct1232 is record
      w : aliased unsigned;  -- p32mx470f512.h:2089
   end record
     with Convention => C_Pass_By_Copy;
   type uu_PMDOUTbits_t (discr : unsigned := 0) is record
      case discr is
         when 0 => anon4144 : aliased uu_PMDOUTbits_t_struct1231;  -- p32mx470f512.h:2087
         when 1 => anon4148 : aliased uu_PMDOUTbits_t_struct1232;  -- p32mx470f512.h:2090
         when others => null;
      end case;
   end record
     with Convention => C_Pass_By_Copy,
     Unchecked_Union => True;  -- p32mx470f512.h:2091

   PMDOUTbits : aliased uu_PMDOUTbits_t  -- p32mx470f512.h:2092
     with Import => True,
     Convention => C,
     External_Name => "PMDOUT";

   PMDOUTCLR : aliased unsigned  -- p32mx470f512.h:2093
     with Import => True,
     Convention => C,
     External_Name => "PMDOUTCLR";

   PMDOUTSET : aliased unsigned  -- p32mx470f512.h:2094
     with Import => True,
     Convention => C,
     External_Name => "PMDOUTSET";

   PMDOUTINV : aliased unsigned  -- p32mx470f512.h:2095
     with Import => True,
     Convention => C,
     External_Name => "PMDOUTINV";

   PMDIN : aliased unsigned  -- p32mx470f512.h:2096
     with Import => True,
     Convention => C,
     External_Name => "PMDIN";

   type uu_PMDINbits_t_struct1237 is record
      DATAIN : aliased unsigned;  -- p32mx470f512.h:2099
   end record
     with Convention => C_Pass_By_Copy;

   type uu_PMDINbits_t_struct1238 is record
      w : aliased unsigned;  -- p32mx470f512.h:2102
   end record
     with Convention => C_Pass_By_Copy;

   type uu_PMDINbits_t (discr : unsigned := 0) is record
      case discr is
         when 0 => anon4159 : aliased uu_PMDINbits_t_struct1237;  -- p32mx470f512.h:2100
         when 1 => anon4163 : aliased uu_PMDINbits_t_struct1238;  -- p32mx470f512.h:2103
         when others => null;
      end case;
   end record
     with Convention => C_Pass_By_Copy,
     Unchecked_Union => True;  -- p32mx470f512.h:2104

   PMDINbits : aliased uu_PMDINbits_t  -- p32mx470f512.h:2105
     with Import => True,
     Convention => C,
     External_Name => "PMDIN";

   PMDINCLR : aliased unsigned  -- p32mx470f512.h:2106
     with Import => True,
     Convention => C,
     External_Name => "PMDINCLR";

   PMDINSET : aliased unsigned  -- p32mx470f512.h:2107
     with Import => True,
     Convention => C,
     External_Name => "PMDINSET";

   PMDININV : aliased unsigned  -- p32mx470f512.h:2108
     with Import => True,
     Convention => C,
     External_Name => "PMDININV";

   PMAEN : aliased unsigned  -- p32mx470f512.h:2109
     with Import => True,
     Convention => C,
     External_Name => "PMAEN";

   type uu_PMAENbits_t_struct1243 is record
      PTEN : aliased unsigned_short;  -- p32mx470f512.h:2112
   end record
     with Convention => C_Pass_By_Copy;
   type uu_PMAENbits_t_struct1244 is record
      PTEN0  : Extensions.Unsigned_1;  -- p32mx470f512.h:2115
      PTEN1  : Extensions.Unsigned_1;  -- p32mx470f512.h:2116
      PTEN2  : Extensions.Unsigned_1;  -- p32mx470f512.h:2117
      PTEN3  : Extensions.Unsigned_1;  -- p32mx470f512.h:2118
      PTEN4  : Extensions.Unsigned_1;  -- p32mx470f512.h:2119
      PTEN5  : Extensions.Unsigned_1;  -- p32mx470f512.h:2120
      PTEN6  : Extensions.Unsigned_1;  -- p32mx470f512.h:2121
      PTEN7  : Extensions.Unsigned_1;  -- p32mx470f512.h:2122
      PTEN8  : Extensions.Unsigned_1;  -- p32mx470f512.h:2123
      PTEN9  : Extensions.Unsigned_1;  -- p32mx470f512.h:2124
      PTEN10 : Extensions.Unsigned_1;  -- p32mx470f512.h:2125
      PTEN11 : Extensions.Unsigned_1;  -- p32mx470f512.h:2126
      PTEN12 : Extensions.Unsigned_1;  -- p32mx470f512.h:2127
      PTEN13 : Extensions.Unsigned_1;  -- p32mx470f512.h:2128
      PTEN14 : Extensions.Unsigned_1;  -- p32mx470f512.h:2129
      PTEN15 : Extensions.Unsigned_1;  -- p32mx470f512.h:2130
   end record
     with Convention => C_Pass_By_Copy,
     Pack => True,
     Alignment => 4;
   type uu_PMAENbits_t_struct1245 is record
      w : aliased unsigned;  -- p32mx470f512.h:2133
   end record
     with Convention => C_Pass_By_Copy;
   type uu_PMAENbits_t (discr : unsigned := 0) is record
      case discr is
         when 0 => anon4174 : aliased uu_PMAENbits_t_struct1243;  -- p32mx470f512.h:2113
         when 1 => anon4193 : aliased uu_PMAENbits_t_struct1244;  -- p32mx470f512.h:2131
         when 2 => anon4197 : aliased uu_PMAENbits_t_struct1245;  -- p32mx470f512.h:2134
         when others => null;
      end case;
   end record
     with Convention => C_Pass_By_Copy,
     Unchecked_Union => True;  -- p32mx470f512.h:2135

   PMAENbits : aliased uu_PMAENbits_t  -- p32mx470f512.h:2136
     with Import => True,
     Convention => C,
     External_Name => "PMAEN";

   PMAENCLR : aliased unsigned  -- p32mx470f512.h:2137
     with Import => True,
     Convention => C,
     External_Name => "PMAENCLR";

   PMAENSET : aliased unsigned  -- p32mx470f512.h:2138
     with Import => True,
     Convention => C,
     External_Name => "PMAENSET";

   PMAENINV : aliased unsigned  -- p32mx470f512.h:2139
     with Import => True,
     Convention => C,
     External_Name => "PMAENINV";

   PMSTAT : aliased unsigned  -- p32mx470f512.h:2140
     with Import => True,
     Convention => C,
     External_Name => "PMSTAT";

   type uu_PMSTATbits_t_struct1250 is record
      OB0E     : Extensions.Unsigned_1;  -- p32mx470f512.h:2143
      OB1E     : Extensions.Unsigned_1;  -- p32mx470f512.h:2144
      OB2E     : Extensions.Unsigned_1;  -- p32mx470f512.h:2145
      OB3E     : Extensions.Unsigned_1;  -- p32mx470f512.h:2146
      anon4210 : Extensions.Unsigned_2;  -- p32mx470f512.h:2147
      OBUF     : Extensions.Unsigned_1;  -- p32mx470f512.h:2148
      OBE      : Extensions.Unsigned_1;  -- p32mx470f512.h:2149
      IB0F     : Extensions.Unsigned_1;  -- p32mx470f512.h:2150
      IB1F     : Extensions.Unsigned_1;  -- p32mx470f512.h:2151
      IB2F     : Extensions.Unsigned_1;  -- p32mx470f512.h:2152
      IB3F     : Extensions.Unsigned_1;  -- p32mx470f512.h:2153
      anon4217 : Extensions.Unsigned_2;  -- p32mx470f512.h:2154
      IBOV     : Extensions.Unsigned_1;  -- p32mx470f512.h:2155
      IBF      : Extensions.Unsigned_1;  -- p32mx470f512.h:2156
   end record
     with Convention => C_Pass_By_Copy,
     Pack => True,
     Alignment => 4;
   type uu_PMSTATbits_t_struct1251 is record
      w : aliased unsigned;  -- p32mx470f512.h:2159
   end record
     with Convention => C_Pass_By_Copy;
   type uu_PMSTATbits_t (discr : unsigned := 0) is record
      case discr is
         when 0 => anon4221 : aliased uu_PMSTATbits_t_struct1250;  -- p32mx470f512.h:2157
         when 1 => anon4225 : aliased uu_PMSTATbits_t_struct1251;  -- p32mx470f512.h:2160
         when others => null;
      end case;
   end record
     with Convention => C_Pass_By_Copy,
     Unchecked_Union => True;  -- p32mx470f512.h:2161

   PMSTATbits : aliased uu_PMSTATbits_t  -- p32mx470f512.h:2162
     with Import => True,
     Convention => C,
     External_Name => "PMSTAT";

   PMSTATCLR : aliased unsigned  -- p32mx470f512.h:2163
     with Import => True,
     Convention => C,
     External_Name => "PMSTATCLR";

   PMSTATSET : aliased unsigned  -- p32mx470f512.h:2164
     with Import => True,
     Convention => C,
     External_Name => "PMSTATSET";

   PMSTATINV : aliased unsigned  -- p32mx470f512.h:2165
     with Import => True,
     Convention => C,
     External_Name => "PMSTATINV";

   AD1CON1 : aliased unsigned  -- p32mx470f512.h:2166
     with Import => True,
     Convention => C,
     External_Name => "AD1CON1";

   type uu_AD1CON1bits_t_struct1256 is record
      DONE     : Extensions.Unsigned_1;  -- p32mx470f512.h:2169
      SAMP     : Extensions.Unsigned_1;  -- p32mx470f512.h:2170
      ASAM     : Extensions.Unsigned_1;  -- p32mx470f512.h:2171
      anon4237 : Extensions.Unsigned_1;  -- p32mx470f512.h:2172
      CLRASAM  : Extensions.Unsigned_1;  -- p32mx470f512.h:2173
      SSRC     : Extensions.Unsigned_3;  -- p32mx470f512.h:2174
      FORM     : Extensions.Unsigned_3;  -- p32mx470f512.h:2175
      anon4241 : Extensions.Unsigned_2;  -- p32mx470f512.h:2176
      SIDL     : Extensions.Unsigned_1;  -- p32mx470f512.h:2177
      anon4243 : Extensions.Unsigned_1;  -- p32mx470f512.h:2178
      ON       : Extensions.Unsigned_1;  -- p32mx470f512.h:2179
   end record
     with Convention => C_Pass_By_Copy,
     Pack => True,
     Alignment => 4;
   type uu_AD1CON1bits_t_struct1257 is record
      anon4248 : Extensions.Unsigned_5;  -- p32mx470f512.h:2182
      SSRC0    : Extensions.Unsigned_1;  -- p32mx470f512.h:2183
      SSRC1    : Extensions.Unsigned_1;  -- p32mx470f512.h:2184
      SSRC2    : Extensions.Unsigned_1;  -- p32mx470f512.h:2185
      FORM0    : Extensions.Unsigned_1;  -- p32mx470f512.h:2186
      FORM1    : Extensions.Unsigned_1;  -- p32mx470f512.h:2187
      FORM2    : Extensions.Unsigned_1;  -- p32mx470f512.h:2188
   end record
     with Convention => C_Pass_By_Copy,
     Pack => True,
     Alignment => 4;
   type uu_AD1CON1bits_t_struct1258 is record
      anon4258 : Extensions.Unsigned_13;  -- p32mx470f512.h:2191
      ADSIDL   : Extensions.Unsigned_1;  -- p32mx470f512.h:2192
      anon4260 : Extensions.Unsigned_1;  -- p32mx470f512.h:2193
      ADON     : Extensions.Unsigned_1;  -- p32mx470f512.h:2194
   end record
     with Convention => C_Pass_By_Copy,
     Pack => True,
     Alignment => 4;
   type uu_AD1CON1bits_t_struct1259 is record
      w : aliased unsigned;  -- p32mx470f512.h:2197
   end record
     with Convention => C_Pass_By_Copy;
   type uu_AD1CON1bits_t (discr : unsigned := 0) is record
      case discr is
         when 0 => anon4246 : aliased uu_AD1CON1bits_t_struct1256;  -- p32mx470f512.h:2180
         when 1 => anon4256 : aliased uu_AD1CON1bits_t_struct1257;  -- p32mx470f512.h:2189
         when 2 => anon4263 : aliased uu_AD1CON1bits_t_struct1258;  -- p32mx470f512.h:2195
         when 3 => anon4267 : aliased uu_AD1CON1bits_t_struct1259;  -- p32mx470f512.h:2198
         when others => null;
      end case;
   end record
     with Convention => C_Pass_By_Copy,
     Unchecked_Union => True;  -- p32mx470f512.h:2199

   AD1CON1bits : aliased uu_AD1CON1bits_t  -- p32mx470f512.h:2200
     with Import => True,
     Convention => C,
     External_Name => "AD1CON1";

   AD1CON1CLR : aliased unsigned  -- p32mx470f512.h:2201
     with Import => True,
     Convention => C,
     External_Name => "AD1CON1CLR";

   AD1CON1SET : aliased unsigned  -- p32mx470f512.h:2202
     with Import => True,
     Convention => C,
     External_Name => "AD1CON1SET";

   AD1CON1INV : aliased unsigned  -- p32mx470f512.h:2203
     with Import => True,
     Convention => C,
     External_Name => "AD1CON1INV";

   AD1CON2 : aliased unsigned  -- p32mx470f512.h:2204
     with Import => True,
     Convention => C,
     External_Name => "AD1CON2";

   type uu_AD1CON2bits_t_struct1264 is record
      ALTS     : Extensions.Unsigned_1;  -- p32mx470f512.h:2207
      BUFM     : Extensions.Unsigned_1;  -- p32mx470f512.h:2208
      SMPI     : Extensions.Unsigned_4;  -- p32mx470f512.h:2209
      anon4279 : Extensions.Unsigned_1;  -- p32mx470f512.h:2210
      BUFS     : Extensions.Unsigned_1;  -- p32mx470f512.h:2211
      anon4281 : Extensions.Unsigned_2;  -- p32mx470f512.h:2212
      CSCNA    : Extensions.Unsigned_1;  -- p32mx470f512.h:2213
      anon4283 : Extensions.Unsigned_1;  -- p32mx470f512.h:2214
      OFFCAL   : Extensions.Unsigned_1;  -- p32mx470f512.h:2215
      VCFG     : Extensions.Unsigned_3;  -- p32mx470f512.h:2216
   end record
     with Convention => C_Pass_By_Copy,
     Pack => True,
     Alignment => 4;
   type uu_AD1CON2bits_t_struct1265 is record
      anon4289 : Extensions.Unsigned_2;  -- p32mx470f512.h:2219
      SMPI0    : Extensions.Unsigned_1;  -- p32mx470f512.h:2220
      SMPI1    : Extensions.Unsigned_1;  -- p32mx470f512.h:2221
      SMPI2    : Extensions.Unsigned_1;  -- p32mx470f512.h:2222
      SMPI3    : Extensions.Unsigned_1;  -- p32mx470f512.h:2223
      anon4294 : Extensions.Unsigned_7;  -- p32mx470f512.h:2224
      VCFG0    : Extensions.Unsigned_1;  -- p32mx470f512.h:2225
      VCFG1    : Extensions.Unsigned_1;  -- p32mx470f512.h:2226
      VCFG2    : Extensions.Unsigned_1;  -- p32mx470f512.h:2227
   end record
     with Convention => C_Pass_By_Copy,
     Pack => True,
     Alignment => 4;
   type uu_AD1CON2bits_t_struct1266 is record
      w : aliased unsigned;  -- p32mx470f512.h:2230
   end record
     with Convention => C_Pass_By_Copy;
   type uu_AD1CON2bits_t (discr : unsigned := 0) is record
      case discr is
         when 0 => anon4287 : aliased uu_AD1CON2bits_t_struct1264;  -- p32mx470f512.h:2217
         when 1 => anon4299 : aliased uu_AD1CON2bits_t_struct1265;  -- p32mx470f512.h:2228
         when 2 => anon4303 : aliased uu_AD1CON2bits_t_struct1266;  -- p32mx470f512.h:2231
         when others => null;
      end case;
   end record
     with Convention => C_Pass_By_Copy,
     Unchecked_Union => True;  -- p32mx470f512.h:2232

   AD1CON2bits : aliased uu_AD1CON2bits_t  -- p32mx470f512.h:2233
     with Import => True,
     Convention => C,
     External_Name => "AD1CON2";

   AD1CON2CLR : aliased unsigned  -- p32mx470f512.h:2234
     with Import => True,
     Convention => C,
     External_Name => "AD1CON2CLR";

   AD1CON2SET : aliased unsigned  -- p32mx470f512.h:2235
     with Import => True,
     Convention => C,
     External_Name => "AD1CON2SET";

   AD1CON2INV : aliased unsigned  -- p32mx470f512.h:2236
     with Import => True,
     Convention => C,
     External_Name => "AD1CON2INV";

   AD1CON3 : aliased unsigned  -- p32mx470f512.h:2237
     with Import => True,
     Convention => C,
     External_Name => "AD1CON3";

   type uu_AD1CON3bits_t_struct1271 is record
      ADCS     : aliased unsigned_char;  -- p32mx470f512.h:2240
      SAMC     : Extensions.Unsigned_5;  -- p32mx470f512.h:2241
      anon4314 : Extensions.Unsigned_2;  -- p32mx470f512.h:2242
      ADRC     : Extensions.Unsigned_1;  -- p32mx470f512.h:2243
   end record
     with Convention => C_Pass_By_Copy,
     Pack => True,
     Alignment => 4;
   type uu_AD1CON3bits_t_struct1272 is record
      ADCS0 : Extensions.Unsigned_1;  -- p32mx470f512.h:2246
      ADCS1 : Extensions.Unsigned_1;  -- p32mx470f512.h:2247
      ADCS2 : Extensions.Unsigned_1;  -- p32mx470f512.h:2248
      ADCS3 : Extensions.Unsigned_1;  -- p32mx470f512.h:2249
      ADCS4 : Extensions.Unsigned_1;  -- p32mx470f512.h:2250
      ADCS5 : Extensions.Unsigned_1;  -- p32mx470f512.h:2251
      ADCS6 : Extensions.Unsigned_1;  -- p32mx470f512.h:2252
      ADCS7 : Extensions.Unsigned_1;  -- p32mx470f512.h:2253
      SAMC0 : Extensions.Unsigned_1;  -- p32mx470f512.h:2254
      SAMC1 : Extensions.Unsigned_1;  -- p32mx470f512.h:2255
      SAMC2 : Extensions.Unsigned_1;  -- p32mx470f512.h:2256
      SAMC3 : Extensions.Unsigned_1;  -- p32mx470f512.h:2257
      SAMC4 : Extensions.Unsigned_1;  -- p32mx470f512.h:2258
   end record
     with Convention => C_Pass_By_Copy,
     Pack => True,
     Alignment => 4;
   type uu_AD1CON3bits_t_struct1273 is record
      w : aliased unsigned;  -- p32mx470f512.h:2261
   end record
     with Convention => C_Pass_By_Copy;
   type uu_AD1CON3bits_t (discr : unsigned := 0) is record
      case discr is
         when 0 => anon4317 : aliased uu_AD1CON3bits_t_struct1271;  -- p32mx470f512.h:2244
         when 1 => anon4333 : aliased uu_AD1CON3bits_t_struct1272;  -- p32mx470f512.h:2259
         when 2 => anon4337 : aliased uu_AD1CON3bits_t_struct1273;  -- p32mx470f512.h:2262
         when others => null;
      end case;
   end record
     with Convention => C_Pass_By_Copy,
     Unchecked_Union => True;  -- p32mx470f512.h:2263

   AD1CON3bits : aliased uu_AD1CON3bits_t  -- p32mx470f512.h:2264
     with Import => True,
     Convention => C,
     External_Name => "AD1CON3";

   AD1CON3CLR : aliased unsigned  -- p32mx470f512.h:2265
     with Import => True,
     Convention => C,
     External_Name => "AD1CON3CLR";

   AD1CON3SET : aliased unsigned  -- p32mx470f512.h:2266
     with Import => True,
     Convention => C,
     External_Name => "AD1CON3SET";

   AD1CON3INV : aliased unsigned  -- p32mx470f512.h:2267
     with Import => True,
     Convention => C,
     External_Name => "AD1CON3INV";

   AD1CHS : aliased unsigned  -- p32mx470f512.h:2268
     with Import => True,
     Convention => C,
     External_Name => "AD1CHS";

   type uu_AD1CHSbits_t_struct1278 is record
      parent   : aliased unsigned_short;
      CH0SA    : Extensions.Unsigned_4;  -- p32mx470f512.h:2272
      anon4348 : Extensions.Unsigned_3;  -- p32mx470f512.h:2273
      CH0NA    : Extensions.Unsigned_1;  -- p32mx470f512.h:2274
      CH0SB    : Extensions.Unsigned_4;  -- p32mx470f512.h:2275
      anon4351 : Extensions.Unsigned_3;  -- p32mx470f512.h:2276
      CH0NB    : Extensions.Unsigned_1;  -- p32mx470f512.h:2277
   end record
     with Convention => C_Pass_By_Copy,
     Pack => True,
     Alignment => 4;
   type uu_AD1CHSbits_t_struct1279 is record
      parent   : aliased unsigned_short;
      CH0SA0   : Extensions.Unsigned_1;  -- p32mx470f512.h:2281
      CH0SA1   : Extensions.Unsigned_1;  -- p32mx470f512.h:2282
      CH0SA2   : Extensions.Unsigned_1;  -- p32mx470f512.h:2283
      CH0SA3   : Extensions.Unsigned_1;  -- p32mx470f512.h:2284
      anon4361 : Extensions.Unsigned_4;  -- p32mx470f512.h:2285
      CH0SB0   : Extensions.Unsigned_1;  -- p32mx470f512.h:2286
      CH0SB1   : Extensions.Unsigned_1;  -- p32mx470f512.h:2287
      CH0SB2   : Extensions.Unsigned_1;  -- p32mx470f512.h:2288
      CH0SB3   : Extensions.Unsigned_1;  -- p32mx470f512.h:2289
   end record
     with Convention => C_Pass_By_Copy,
     Pack => True,
     Alignment => 4;
   type uu_AD1CHSbits_t_struct1280 is record
      w : aliased unsigned;  -- p32mx470f512.h:2292
   end record
     with Convention => C_Pass_By_Copy;
   type uu_AD1CHSbits_t (discr : unsigned := 0) is record
      case discr is
         when 0 => anon4354 : aliased uu_AD1CHSbits_t_struct1278;  -- p32mx470f512.h:2278
         when 1 => anon4367 : aliased uu_AD1CHSbits_t_struct1279;  -- p32mx470f512.h:2290
         when 2 => anon4371 : aliased uu_AD1CHSbits_t_struct1280;  -- p32mx470f512.h:2293
         when others => null;
      end case;
   end record
     with Convention => C_Pass_By_Copy,
     Unchecked_Union => True;  -- p32mx470f512.h:2294

   AD1CHSbits : aliased uu_AD1CHSbits_t  -- p32mx470f512.h:2295
     with Import => True,
     Convention => C,
     External_Name => "AD1CHS";

   AD1CHSCLR : aliased unsigned  -- p32mx470f512.h:2296
     with Import => True,
     Convention => C,
     External_Name => "AD1CHSCLR";

   AD1CHSSET : aliased unsigned  -- p32mx470f512.h:2297
     with Import => True,
     Convention => C,
     External_Name => "AD1CHSSET";

   AD1CHSINV : aliased unsigned  -- p32mx470f512.h:2298
     with Import => True,
     Convention => C,
     External_Name => "AD1CHSINV";

   AD1CSSL : aliased unsigned  -- p32mx470f512.h:2299
     with Import => True,
     Convention => C,
     External_Name => "AD1CSSL";

   type uu_AD1CSSLbits_t_struct1285 is record
      CSSL : Extensions.Unsigned_31;  -- p32mx470f512.h:2302
   end record
     with Convention => C_Pass_By_Copy,
     Pack => True,
     Alignment => 4;
   type uu_AD1CSSLbits_t_struct1287 is record
      CSSL0  : Extensions.Unsigned_1;  -- p32mx470f512.h:2305
      CSSL1  : Extensions.Unsigned_1;  -- p32mx470f512.h:2306
      CSSL2  : Extensions.Unsigned_1;  -- p32mx470f512.h:2307
      CSSL3  : Extensions.Unsigned_1;  -- p32mx470f512.h:2308
      CSSL4  : Extensions.Unsigned_1;  -- p32mx470f512.h:2309
      CSSL5  : Extensions.Unsigned_1;  -- p32mx470f512.h:2310
      CSSL6  : Extensions.Unsigned_1;  -- p32mx470f512.h:2311
      CSSL7  : Extensions.Unsigned_1;  -- p32mx470f512.h:2312
      CSSL8  : Extensions.Unsigned_1;  -- p32mx470f512.h:2313
      CSSL9  : Extensions.Unsigned_1;  -- p32mx470f512.h:2314
      CSSL10 : Extensions.Unsigned_1;  -- p32mx470f512.h:2315
      CSSL11 : Extensions.Unsigned_1;  -- p32mx470f512.h:2316
      CSSL12 : Extensions.Unsigned_1;  -- p32mx470f512.h:2317
      CSSL13 : Extensions.Unsigned_1;  -- p32mx470f512.h:2318
      CSSL14 : Extensions.Unsigned_1;  -- p32mx470f512.h:2319
      CSSL15 : Extensions.Unsigned_1;  -- p32mx470f512.h:2320
      CSSL16 : Extensions.Unsigned_1;  -- p32mx470f512.h:2321
      CSSL17 : Extensions.Unsigned_1;  -- p32mx470f512.h:2322
      CSSL18 : Extensions.Unsigned_1;  -- p32mx470f512.h:2323
      CSSL19 : Extensions.Unsigned_1;  -- p32mx470f512.h:2324
      CSSL20 : Extensions.Unsigned_1;  -- p32mx470f512.h:2325
      CSSL21 : Extensions.Unsigned_1;  -- p32mx470f512.h:2326
      CSSL22 : Extensions.Unsigned_1;  -- p32mx470f512.h:2327
      CSSL23 : Extensions.Unsigned_1;  -- p32mx470f512.h:2328
      CSSL24 : Extensions.Unsigned_1;  -- p32mx470f512.h:2329
      CSSL25 : Extensions.Unsigned_1;  -- p32mx470f512.h:2330
      CSSL26 : Extensions.Unsigned_1;  -- p32mx470f512.h:2331
      CSSL27 : Extensions.Unsigned_1;  -- p32mx470f512.h:2332
      CSSL28 : Extensions.Unsigned_1;  -- p32mx470f512.h:2333
      CSSL29 : Extensions.Unsigned_1;  -- p32mx470f512.h:2334
      CSSL30 : Extensions.Unsigned_1;  -- p32mx470f512.h:2335
   end record
     with Convention => C_Pass_By_Copy,
     Pack => True,
     Alignment => 4;
   type uu_AD1CSSLbits_t_struct1288 is record
      w : aliased unsigned;  -- p32mx470f512.h:2338
   end record
     with Convention => C_Pass_By_Copy;
   type uu_AD1CSSLbits_t (discr : unsigned := 0) is record
      case discr is
         when 0 => anon4382 : aliased uu_AD1CSSLbits_t_struct1285;  -- p32mx470f512.h:2303
         when 1 => anon4416 : aliased uu_AD1CSSLbits_t_struct1287;  -- p32mx470f512.h:2336
         when 2 => anon4420 : aliased uu_AD1CSSLbits_t_struct1288;  -- p32mx470f512.h:2339
         when others => null;
      end case;
   end record
     with Convention => C_Pass_By_Copy,
     Unchecked_Union => True;  -- p32mx470f512.h:2340

   AD1CSSLbits : aliased uu_AD1CSSLbits_t  -- p32mx470f512.h:2341
     with Import => True,
     Convention => C,
     External_Name => "AD1CSSL";

   AD1CSSLCLR : aliased unsigned  -- p32mx470f512.h:2342
     with Import => True,
     Convention => C,
     External_Name => "AD1CSSLCLR";

   AD1CSSLSET : aliased unsigned  -- p32mx470f512.h:2343
     with Import => True,
     Convention => C,
     External_Name => "AD1CSSLSET";

   AD1CSSLINV : aliased unsigned  -- p32mx470f512.h:2344
     with Import => True,
     Convention => C,
     External_Name => "AD1CSSLINV";

   ADC1BUF0 : aliased unsigned  -- p32mx470f512.h:2345
     with Import => True,
     Convention => C,
     External_Name => "ADC1BUF0";

   ADC1BUF1 : aliased unsigned  -- p32mx470f512.h:2346
     with Import => True,
     Convention => C,
     External_Name => "ADC1BUF1";

   ADC1BUF2 : aliased unsigned  -- p32mx470f512.h:2347
     with Import => True,
     Convention => C,
     External_Name => "ADC1BUF2";

   ADC1BUF3 : aliased unsigned  -- p32mx470f512.h:2348
     with Import => True,
     Convention => C,
     External_Name => "ADC1BUF3";

   ADC1BUF4 : aliased unsigned  -- p32mx470f512.h:2349
     with Import => True,
     Convention => C,
     External_Name => "ADC1BUF4";

   ADC1BUF5 : aliased unsigned  -- p32mx470f512.h:2350
     with Import => True,
     Convention => C,
     External_Name => "ADC1BUF5";

   ADC1BUF6 : aliased unsigned  -- p32mx470f512.h:2351
     with Import => True,
     Convention => C,
     External_Name => "ADC1BUF6";

   ADC1BUF7 : aliased unsigned  -- p32mx470f512.h:2352
     with Import => True,
     Convention => C,
     External_Name => "ADC1BUF7";

   ADC1BUF8 : aliased unsigned  -- p32mx470f512.h:2353
     with Import => True,
     Convention => C,
     External_Name => "ADC1BUF8";

   ADC1BUF9 : aliased unsigned  -- p32mx470f512.h:2354
     with Import => True,
     Convention => C,
     External_Name => "ADC1BUF9";

   ADC1BUFA : aliased unsigned  -- p32mx470f512.h:2355
     with Import => True,
     Convention => C,
     External_Name => "ADC1BUFA";

   ADC1BUFB : aliased unsigned  -- p32mx470f512.h:2356
     with Import => True,
     Convention => C,
     External_Name => "ADC1BUFB";

   ADC1BUFC : aliased unsigned  -- p32mx470f512.h:2357
     with Import => True,
     Convention => C,
     External_Name => "ADC1BUFC";

   ADC1BUFD : aliased unsigned  -- p32mx470f512.h:2358
     with Import => True,
     Convention => C,
     External_Name => "ADC1BUFD";

   ADC1BUFE : aliased unsigned  -- p32mx470f512.h:2359
     with Import => True,
     Convention => C,
     External_Name => "ADC1BUFE";

   ADC1BUFF : aliased unsigned  -- p32mx470f512.h:2360
     with Import => True,
     Convention => C,
     External_Name => "ADC1BUFF";

   CVRCON : aliased unsigned  -- p32mx470f512.h:2361
     with Import => True,
     Convention => C,
     External_Name => "CVRCON";

   type uu_CVRCONbits_t_struct1293 is record
      CVR      : Extensions.Unsigned_4;  -- p32mx470f512.h:2364
      CVRSS    : Extensions.Unsigned_1;  -- p32mx470f512.h:2365
      CVRR     : Extensions.Unsigned_1;  -- p32mx470f512.h:2366
      CVROE    : Extensions.Unsigned_1;  -- p32mx470f512.h:2367
      anon4449 : Extensions.Unsigned_1;  -- p32mx470f512.h:2368
      BGSEL    : Extensions.Unsigned_2;  -- p32mx470f512.h:2369
      VREFSEL  : Extensions.Unsigned_1;  -- p32mx470f512.h:2370
      anon4452 : Extensions.Unsigned_4;  -- p32mx470f512.h:2371
      ON       : Extensions.Unsigned_1;  -- p32mx470f512.h:2372
   end record
     with Convention => C_Pass_By_Copy,
     Pack => True,
     Alignment => 4;
   type uu_CVRCONbits_t_struct1294 is record
      CVR0     : Extensions.Unsigned_1;  -- p32mx470f512.h:2375
      CVR1     : Extensions.Unsigned_1;  -- p32mx470f512.h:2376
      CVR2     : Extensions.Unsigned_1;  -- p32mx470f512.h:2377
      CVR3     : Extensions.Unsigned_1;  -- p32mx470f512.h:2378
      anon4461 : Extensions.Unsigned_4;  -- p32mx470f512.h:2379
      BGSEL0   : Extensions.Unsigned_1;  -- p32mx470f512.h:2380
      BGSEL1   : Extensions.Unsigned_1;  -- p32mx470f512.h:2381
   end record
     with Convention => C_Pass_By_Copy,
     Pack => True,
     Alignment => 4;
   type uu_CVRCONbits_t_struct1295 is record
      w : aliased unsigned;  -- p32mx470f512.h:2384
   end record
     with Convention => C_Pass_By_Copy;
   type uu_CVRCONbits_t (discr : unsigned := 0) is record
      case discr is
         when 0 => anon4455 : aliased uu_CVRCONbits_t_struct1293;  -- p32mx470f512.h:2373
         when 1 => anon4465 : aliased uu_CVRCONbits_t_struct1294;  -- p32mx470f512.h:2382
         when 2 => anon4469 : aliased uu_CVRCONbits_t_struct1295;  -- p32mx470f512.h:2385
         when others => null;
      end case;
   end record
     with Convention => C_Pass_By_Copy,
     Unchecked_Union => True;  -- p32mx470f512.h:2386

   CVRCONbits : aliased uu_CVRCONbits_t  -- p32mx470f512.h:2387
     with Import => True,
     Convention => C,
     External_Name => "CVRCON";

   CVRCONCLR : aliased unsigned  -- p32mx470f512.h:2388
     with Import => True,
     Convention => C,
     External_Name => "CVRCONCLR";

   CVRCONSET : aliased unsigned  -- p32mx470f512.h:2389
     with Import => True,
     Convention => C,
     External_Name => "CVRCONSET";

   CVRCONINV : aliased unsigned  -- p32mx470f512.h:2390
     with Import => True,
     Convention => C,
     External_Name => "CVRCONINV";

   CM1CON : aliased unsigned  -- p32mx470f512.h:2391
     with Import => True,
     Convention => C,
     External_Name => "CM1CON";

   type uu_CM1CONbits_t_struct1300 is record
      CCH      : Extensions.Unsigned_2;  -- p32mx470f512.h:2394
      anon4479 : Extensions.Unsigned_2;  -- p32mx470f512.h:2395
      CREF     : Extensions.Unsigned_1;  -- p32mx470f512.h:2396
      anon4481 : Extensions.Unsigned_1;  -- p32mx470f512.h:2397
      EVPOL    : Extensions.Unsigned_2;  -- p32mx470f512.h:2398
      COUT     : Extensions.Unsigned_1;  -- p32mx470f512.h:2399
      anon4484 : Extensions.Unsigned_3;  -- p32mx470f512.h:2400
      CLPWR    : Extensions.Unsigned_1;  -- p32mx470f512.h:2401
      CPOL     : Extensions.Unsigned_1;  -- p32mx470f512.h:2402
      COE      : Extensions.Unsigned_1;  -- p32mx470f512.h:2403
      ON       : Extensions.Unsigned_1;  -- p32mx470f512.h:2404
   end record
     with Convention => C_Pass_By_Copy,
     Pack => True,
     Alignment => 4;
   type uu_CM1CONbits_t_struct1301 is record
      CCH0     : Extensions.Unsigned_1;  -- p32mx470f512.h:2407
      CCH1     : Extensions.Unsigned_1;  -- p32mx470f512.h:2408
      anon4494 : Extensions.Unsigned_4;  -- p32mx470f512.h:2409
      EVPOL0   : Extensions.Unsigned_1;  -- p32mx470f512.h:2410
      EVPOL1   : Extensions.Unsigned_1;  -- p32mx470f512.h:2411
   end record
     with Convention => C_Pass_By_Copy,
     Pack => True,
     Alignment => 4;
   type uu_CM1CONbits_t_struct1302 is record
      w : aliased unsigned;  -- p32mx470f512.h:2414
   end record
     with Convention => C_Pass_By_Copy;
   type uu_CM1CONbits_t (discr : unsigned := 0) is record
      case discr is
         when 0 => anon4490 : aliased uu_CM1CONbits_t_struct1300;  -- p32mx470f512.h:2405
         when 1 => anon4498 : aliased uu_CM1CONbits_t_struct1301;  -- p32mx470f512.h:2412
         when 2 => anon4502 : aliased uu_CM1CONbits_t_struct1302;  -- p32mx470f512.h:2415
         when others => null;
      end case;
   end record
     with Convention => C_Pass_By_Copy,
     Unchecked_Union => True;  -- p32mx470f512.h:2416

   CM1CONbits : aliased uu_CM1CONbits_t  -- p32mx470f512.h:2417
     with Import => True,
     Convention => C,
     External_Name => "CM1CON";

   CM1CONCLR : aliased unsigned  -- p32mx470f512.h:2418
     with Import => True,
     Convention => C,
     External_Name => "CM1CONCLR";

   CM1CONSET : aliased unsigned  -- p32mx470f512.h:2419
     with Import => True,
     Convention => C,
     External_Name => "CM1CONSET";

   CM1CONINV : aliased unsigned  -- p32mx470f512.h:2420
     with Import => True,
     Convention => C,
     External_Name => "CM1CONINV";

   CM2CON : aliased unsigned  -- p32mx470f512.h:2421
     with Import => True,
     Convention => C,
     External_Name => "CM2CON";

   type uu_CM2CONbits_t_struct1307 is record
      CCH      : Extensions.Unsigned_2;  -- p32mx470f512.h:2424
      anon4512 : Extensions.Unsigned_2;  -- p32mx470f512.h:2425
      CREF     : Extensions.Unsigned_1;  -- p32mx470f512.h:2426
      anon4514 : Extensions.Unsigned_1;  -- p32mx470f512.h:2427
      EVPOL    : Extensions.Unsigned_2;  -- p32mx470f512.h:2428
      COUT     : Extensions.Unsigned_1;  -- p32mx470f512.h:2429
      anon4517 : Extensions.Unsigned_3;  -- p32mx470f512.h:2430
      CLPWR    : Extensions.Unsigned_1;  -- p32mx470f512.h:2431
      CPOL     : Extensions.Unsigned_1;  -- p32mx470f512.h:2432
      COE      : Extensions.Unsigned_1;  -- p32mx470f512.h:2433
      ON       : Extensions.Unsigned_1;  -- p32mx470f512.h:2434
   end record
     with Convention => C_Pass_By_Copy,
     Pack => True,
     Alignment => 4;
   type uu_CM2CONbits_t_struct1308 is record
      CCH0     : Extensions.Unsigned_1;  -- p32mx470f512.h:2437
      CCH1     : Extensions.Unsigned_1;  -- p32mx470f512.h:2438
      anon4527 : Extensions.Unsigned_4;  -- p32mx470f512.h:2439
      EVPOL0   : Extensions.Unsigned_1;  -- p32mx470f512.h:2440
      EVPOL1   : Extensions.Unsigned_1;  -- p32mx470f512.h:2441
   end record
     with Convention => C_Pass_By_Copy,
     Pack => True,
     Alignment => 4;
   type uu_CM2CONbits_t_struct1309 is record
      w : aliased unsigned;  -- p32mx470f512.h:2444
   end record
     with Convention => C_Pass_By_Copy;
   type uu_CM2CONbits_t (discr : unsigned := 0) is record
      case discr is
         when 0 => anon4523 : aliased uu_CM2CONbits_t_struct1307;  -- p32mx470f512.h:2435
         when 1 => anon4531 : aliased uu_CM2CONbits_t_struct1308;  -- p32mx470f512.h:2442
         when 2 => anon4535 : aliased uu_CM2CONbits_t_struct1309;  -- p32mx470f512.h:2445
         when others => null;
      end case;
   end record
     with Convention => C_Pass_By_Copy,
     Unchecked_Union => True;  -- p32mx470f512.h:2446

   CM2CONbits : aliased uu_CM2CONbits_t  -- p32mx470f512.h:2447
     with Import => True,
     Convention => C,
     External_Name => "CM2CON";

   CM2CONCLR : aliased unsigned  -- p32mx470f512.h:2448
     with Import => True,
     Convention => C,
     External_Name => "CM2CONCLR";

   CM2CONSET : aliased unsigned  -- p32mx470f512.h:2449
     with Import => True,
     Convention => C,
     External_Name => "CM2CONSET";

   CM2CONINV : aliased unsigned  -- p32mx470f512.h:2450
     with Import => True,
     Convention => C,
     External_Name => "CM2CONINV";

   CMSTAT : aliased unsigned  -- p32mx470f512.h:2451
     with Import => True,
     Convention => C,
     External_Name => "CMSTAT";

   type uu_CMSTATbits_t_struct1314 is record
      C1OUT    : Extensions.Unsigned_1;  -- p32mx470f512.h:2454
      C2OUT    : Extensions.Unsigned_1;  -- p32mx470f512.h:2455
      C3OUT    : Extensions.Unsigned_1;  -- p32mx470f512.h:2456
      C4OUT    : Extensions.Unsigned_1;  -- p32mx470f512.h:2457
      C5OUT    : Extensions.Unsigned_1;  -- p32mx470f512.h:2458
      C6OUT    : Extensions.Unsigned_1;  -- p32mx470f512.h:2459
      anon4550 : Extensions.Unsigned_7;  -- p32mx470f512.h:2460
      SIDL     : Extensions.Unsigned_1;  -- p32mx470f512.h:2461
   end record
     with Convention => C_Pass_By_Copy,
     Pack => True,
     Alignment => 4;
   type uu_CMSTATbits_t_struct1315 is record
      w : aliased unsigned;  -- p32mx470f512.h:2464
   end record
     with Convention => C_Pass_By_Copy;
   type uu_CMSTATbits_t (discr : unsigned := 0) is record
      case discr is
         when 0 => anon4553 : aliased uu_CMSTATbits_t_struct1314;  -- p32mx470f512.h:2462
         when 1 => anon4557 : aliased uu_CMSTATbits_t_struct1315;  -- p32mx470f512.h:2465
         when others => null;
      end case;
   end record
     with Convention => C_Pass_By_Copy,
     Unchecked_Union => True;  -- p32mx470f512.h:2466

   CMSTATbits : aliased uu_CMSTATbits_t  -- p32mx470f512.h:2467
     with Import => True,
     Convention => C,
     External_Name => "CMSTAT";

   CMSTATCLR : aliased unsigned  -- p32mx470f512.h:2468
     with Import => True,
     Convention => C,
     External_Name => "CMSTATCLR";

   CMSTATSET : aliased unsigned  -- p32mx470f512.h:2469
     with Import => True,
     Convention => C,
     External_Name => "CMSTATSET";

   CMSTATINV : aliased unsigned  -- p32mx470f512.h:2470
     with Import => True,
     Convention => C,
     External_Name => "CMSTATINV";

   CTMUCON : aliased unsigned  -- p32mx470f512.h:2471
     with Import => True,
     Convention => C,
     External_Name => "CTMUCON";

   type uu_CTMUCONbits_t_struct1320 is record
      IRNG     : Extensions.Unsigned_2;  -- p32mx470f512.h:2474
      ITRIM    : Extensions.Unsigned_6;  -- p32mx470f512.h:2475
      CTTRIG   : Extensions.Unsigned_1;  -- p32mx470f512.h:2476
      IDISSEN  : Extensions.Unsigned_1;  -- p32mx470f512.h:2477
      EDGSEQEN : Extensions.Unsigned_1;  -- p32mx470f512.h:2478
      EDGEN    : Extensions.Unsigned_1;  -- p32mx470f512.h:2479
      TGEN     : Extensions.Unsigned_1;  -- p32mx470f512.h:2480
      CTMUSIDL : Extensions.Unsigned_1;  -- p32mx470f512.h:2481
      anon4574 : Extensions.Unsigned_1;  -- p32mx470f512.h:2482
      ON       : Extensions.Unsigned_1;  -- p32mx470f512.h:2483
      anon4576 : Extensions.Unsigned_2;  -- p32mx470f512.h:2484
      EDG2SEL  : Extensions.Unsigned_4;  -- p32mx470f512.h:2485
      EDG2POL  : Extensions.Unsigned_1;  -- p32mx470f512.h:2486
      EDG2MOD  : Extensions.Unsigned_1;  -- p32mx470f512.h:2487
      EDG1STAT : Extensions.Unsigned_1;  -- p32mx470f512.h:2488
      EDG2STAT : Extensions.Unsigned_1;  -- p32mx470f512.h:2489
      EDG1SEL  : Extensions.Unsigned_4;  -- p32mx470f512.h:2490
      EDG1POL  : Extensions.Unsigned_1;  -- p32mx470f512.h:2491
      EDG1MOD  : Extensions.Unsigned_1;  -- p32mx470f512.h:2492
   end record
     with Convention => C_Pass_By_Copy,
     Pack => True,
     Alignment => 4;
   type uu_CTMUCONbits_t_struct1321 is record
      w : aliased unsigned;  -- p32mx470f512.h:2495
   end record
     with Convention => C_Pass_By_Copy;
   type uu_CTMUCONbits_t (discr : unsigned := 0) is record
      case discr is
         when 0 => anon4586 : aliased uu_CTMUCONbits_t_struct1320;  -- p32mx470f512.h:2493
         when 1 => anon4590 : aliased uu_CTMUCONbits_t_struct1321;  -- p32mx470f512.h:2496
         when others => null;
      end case;
   end record
     with Convention => C_Pass_By_Copy,
     Unchecked_Union => True;  -- p32mx470f512.h:2497

   CTMUCONbits : aliased uu_CTMUCONbits_t  -- p32mx470f512.h:2498
     with Import => True,
     Convention => C,
     External_Name => "CTMUCON";

   CTMUCONCLR : aliased unsigned  -- p32mx470f512.h:2499
     with Import => True,
     Convention => C,
     External_Name => "CTMUCONCLR";

   CTMUCONSET : aliased unsigned  -- p32mx470f512.h:2500
     with Import => True,
     Convention => C,
     External_Name => "CTMUCONSET";

   CTMUCONINV : aliased unsigned  -- p32mx470f512.h:2501
     with Import => True,
     Convention => C,
     External_Name => "CTMUCONINV";

   OSCCON : aliased unsigned  -- p32mx470f512.h:2502
     with Import => True,
     Convention => C,
     External_Name => "OSCCON";

   type uu_OSCCONbits_t_struct1326 is record
      OSWEN    : Extensions.Unsigned_1;  -- p32mx470f512.h:2505
      SOSCEN   : Extensions.Unsigned_1;  -- p32mx470f512.h:2506
      UFRCEN   : Extensions.Unsigned_1;  -- p32mx470f512.h:2507
      CF       : Extensions.Unsigned_1;  -- p32mx470f512.h:2508
      SLPEN    : Extensions.Unsigned_1;  -- p32mx470f512.h:2509
      SLOCK    : Extensions.Unsigned_1;  -- p32mx470f512.h:2510
      ULOCK    : Extensions.Unsigned_1;  -- p32mx470f512.h:2511
      CLKLOCK  : Extensions.Unsigned_1;  -- p32mx470f512.h:2512
      NOSC     : Extensions.Unsigned_3;  -- p32mx470f512.h:2513
      anon4608 : Extensions.Unsigned_1;  -- p32mx470f512.h:2514
      COSC     : Extensions.Unsigned_3;  -- p32mx470f512.h:2515
      anon4610 : Extensions.Unsigned_1;  -- p32mx470f512.h:2516
      PLLMULT  : Extensions.Unsigned_3;  -- p32mx470f512.h:2517
      PBDIV    : Extensions.Unsigned_2;  -- p32mx470f512.h:2518
      PBDIVRDY : Extensions.Unsigned_1;  -- p32mx470f512.h:2519
      SOSCRDY  : Extensions.Unsigned_1;  -- p32mx470f512.h:2520
      anon4615 : Extensions.Unsigned_1;  -- p32mx470f512.h:2521
      FRCDIV   : Extensions.Unsigned_3;  -- p32mx470f512.h:2522
      PLLODIV  : Extensions.Unsigned_3;  -- p32mx470f512.h:2523
   end record
     with Convention => C_Pass_By_Copy,
     Pack => True,
     Alignment => 4;
   type uu_OSCCONbits_t_struct1327 is record
      parent   : aliased unsigned_char;
      NOSC0    : Extensions.Unsigned_1;  -- p32mx470f512.h:2527
      NOSC1    : Extensions.Unsigned_1;  -- p32mx470f512.h:2528
      NOSC2    : Extensions.Unsigned_1;  -- p32mx470f512.h:2529
      anon4625 : Extensions.Unsigned_1;  -- p32mx470f512.h:2530
      COSC0    : Extensions.Unsigned_1;  -- p32mx470f512.h:2531
      COSC1    : Extensions.Unsigned_1;  -- p32mx470f512.h:2532
      COSC2    : Extensions.Unsigned_1;  -- p32mx470f512.h:2533
      anon4629 : Extensions.Unsigned_1;  -- p32mx470f512.h:2534
      PLLMULT0 : Extensions.Unsigned_1;  -- p32mx470f512.h:2535
      PLLMULT1 : Extensions.Unsigned_1;  -- p32mx470f512.h:2536
      PLLMULT2 : Extensions.Unsigned_1;  -- p32mx470f512.h:2537
      PBDIV0   : Extensions.Unsigned_1;  -- p32mx470f512.h:2538
      PBDIV1   : Extensions.Unsigned_1;  -- p32mx470f512.h:2539
      anon4635 : Extensions.Unsigned_3;  -- p32mx470f512.h:2540
      FRCDIV0  : Extensions.Unsigned_1;  -- p32mx470f512.h:2541
      FRCDIV1  : Extensions.Unsigned_1;  -- p32mx470f512.h:2542
      FRCDIV2  : Extensions.Unsigned_1;  -- p32mx470f512.h:2543
      PLLODIV0 : Extensions.Unsigned_1;  -- p32mx470f512.h:2544
      PLLODIV1 : Extensions.Unsigned_1;  -- p32mx470f512.h:2545
      PLLODIV2 : Extensions.Unsigned_1;  -- p32mx470f512.h:2546
   end record
     with Convention => C_Pass_By_Copy,
     Pack => True,
     Alignment => 4;
   type uu_OSCCONbits_t_struct1328 is record
      w : aliased unsigned;  -- p32mx470f512.h:2549
   end record
     with Convention => C_Pass_By_Copy;
   type uu_OSCCONbits_t (discr : unsigned := 0) is record
      case discr is
         when 0 => anon4619 : aliased uu_OSCCONbits_t_struct1326;  -- p32mx470f512.h:2524
         when 1 => anon4643 : aliased uu_OSCCONbits_t_struct1327;  -- p32mx470f512.h:2547
         when 2 => anon4647 : aliased uu_OSCCONbits_t_struct1328;  -- p32mx470f512.h:2550
         when others => null;
      end case;
   end record
     with Convention => C_Pass_By_Copy,
     Unchecked_Union => True;  -- p32mx470f512.h:2551

   OSCCONbits : aliased uu_OSCCONbits_t  -- p32mx470f512.h:2552
     with Import => True,
     Convention => C,
     External_Name => "OSCCON";

   OSCCONCLR : aliased unsigned  -- p32mx470f512.h:2553
     with Import => True,
     Convention => C,
     External_Name => "OSCCONCLR";

   OSCCONSET : aliased unsigned  -- p32mx470f512.h:2554
     with Import => True,
     Convention => C,
     External_Name => "OSCCONSET";

   OSCCONINV : aliased unsigned  -- p32mx470f512.h:2555
     with Import => True,
     Convention => C,
     External_Name => "OSCCONINV";

   OSCTUN : aliased unsigned  -- p32mx470f512.h:2556
     with Import => True,
     Convention => C,
     External_Name => "OSCTUN";

   type uu_OSCTUNbits_t_struct1333 is record
      TUN : Extensions.Unsigned_6;  -- p32mx470f512.h:2559
   end record
     with Convention => C_Pass_By_Copy,
     Pack => True,
     Alignment => 4;
   type uu_OSCTUNbits_t_struct1334 is record
      TUN0 : Extensions.Unsigned_1;  -- p32mx470f512.h:2562
      TUN1 : Extensions.Unsigned_1;  -- p32mx470f512.h:2563
      TUN2 : Extensions.Unsigned_1;  -- p32mx470f512.h:2564
      TUN3 : Extensions.Unsigned_1;  -- p32mx470f512.h:2565
      TUN4 : Extensions.Unsigned_1;  -- p32mx470f512.h:2566
      TUN5 : Extensions.Unsigned_1;  -- p32mx470f512.h:2567
   end record
     with Convention => C_Pass_By_Copy,
     Pack => True,
     Alignment => 4;
   type uu_OSCTUNbits_t_struct1335 is record
      w : aliased unsigned;  -- p32mx470f512.h:2570
   end record
     with Convention => C_Pass_By_Copy;
   type uu_OSCTUNbits_t (discr : unsigned := 0) is record
      case discr is
         when 0 => anon4658 : aliased uu_OSCTUNbits_t_struct1333;  -- p32mx470f512.h:2560
         when 1 => anon4667 : aliased uu_OSCTUNbits_t_struct1334;  -- p32mx470f512.h:2568
         when 2 => anon4671 : aliased uu_OSCTUNbits_t_struct1335;  -- p32mx470f512.h:2571
         when others => null;
      end case;
   end record
     with Convention => C_Pass_By_Copy,
     Unchecked_Union => True;  -- p32mx470f512.h:2572

   OSCTUNbits : aliased uu_OSCTUNbits_t  -- p32mx470f512.h:2573
     with Import => True,
     Convention => C,
     External_Name => "OSCTUN";

   OSCTUNCLR : aliased unsigned  -- p32mx470f512.h:2574
     with Import => True,
     Convention => C,
     External_Name => "OSCTUNCLR";

   OSCTUNSET : aliased unsigned  -- p32mx470f512.h:2575
     with Import => True,
     Convention => C,
     External_Name => "OSCTUNSET";

   OSCTUNINV : aliased unsigned  -- p32mx470f512.h:2576
     with Import => True,
     Convention => C,
     External_Name => "OSCTUNINV";

   REFOCON : aliased unsigned  -- p32mx470f512.h:2577
     with Import => True,
     Convention => C,
     External_Name => "REFOCON";

   type uu_REFOCONbits_t_struct1340 is record
      ROSEL    : Extensions.Unsigned_4;  -- p32mx470f512.h:2580
      anon4681 : Extensions.Unsigned_4;  -- p32mx470f512.h:2581
      ACTIVE   : Extensions.Unsigned_1;  -- p32mx470f512.h:2582
      DIVSWEN  : Extensions.Unsigned_1;  -- p32mx470f512.h:2583
      anon4684 : Extensions.Unsigned_1;  -- p32mx470f512.h:2584
      RSLP     : Extensions.Unsigned_1;  -- p32mx470f512.h:2585
      OE       : Extensions.Unsigned_1;  -- p32mx470f512.h:2586
      SIDL     : Extensions.Unsigned_1;  -- p32mx470f512.h:2587
      anon4688 : Extensions.Unsigned_1;  -- p32mx470f512.h:2588
      ON       : Extensions.Unsigned_1;  -- p32mx470f512.h:2589
      RODIV    : Extensions.Unsigned_15;  -- p32mx470f512.h:2590
   end record
     with Convention => C_Pass_By_Copy,
     Pack => True,
     Alignment => 4;
   type uu_REFOCONbits_t_struct1342 is record
      w : aliased unsigned;  -- p32mx470f512.h:2593
   end record
     with Convention => C_Pass_By_Copy;
   type uu_REFOCONbits_t (discr : unsigned := 0) is record
      case discr is
         when 0 => anon4692 : aliased uu_REFOCONbits_t_struct1340;  -- p32mx470f512.h:2591
         when 1 => anon4696 : aliased uu_REFOCONbits_t_struct1342;  -- p32mx470f512.h:2594
         when others => null;
      end case;
   end record
     with Convention => C_Pass_By_Copy,
     Unchecked_Union => True;  -- p32mx470f512.h:2595

   REFOCONbits : aliased uu_REFOCONbits_t  -- p32mx470f512.h:2596
     with Import => True,
     Convention => C,
     External_Name => "REFOCON";

   REFOCONCLR : aliased unsigned  -- p32mx470f512.h:2597
     with Import => True,
     Convention => C,
     External_Name => "REFOCONCLR";

   REFOCONSET : aliased unsigned  -- p32mx470f512.h:2598
     with Import => True,
     Convention => C,
     External_Name => "REFOCONSET";

   REFOCONINV : aliased unsigned  -- p32mx470f512.h:2599
     with Import => True,
     Convention => C,
     External_Name => "REFOCONINV";

   REFOTRIM : aliased unsigned  -- p32mx470f512.h:2600
     with Import => True,
     Convention => C,
     External_Name => "REFOTRIM";

   type uu_REFOTRIMbits_t_struct1347 is record
      anon4705 : Extensions.Unsigned_23;  -- p32mx470f512.h:2603
      ROTRIM   : Extensions.Unsigned_9;  -- p32mx470f512.h:2604
   end record
     with Convention => C_Pass_By_Copy,
     Pack => True,
     Alignment => 4;
   type uu_REFOTRIMbits_t_struct1350 is record
      w : aliased unsigned;  -- p32mx470f512.h:2607
   end record
     with Convention => C_Pass_By_Copy;
   type uu_REFOTRIMbits_t (discr : unsigned := 0) is record
      case discr is
         when 0 => anon4708 : aliased uu_REFOTRIMbits_t_struct1347;  -- p32mx470f512.h:2605
         when 1 => anon4712 : aliased uu_REFOTRIMbits_t_struct1350;  -- p32mx470f512.h:2608
         when others => null;
      end case;
   end record
     with Convention => C_Pass_By_Copy,
     Unchecked_Union => True;  -- p32mx470f512.h:2609

   REFOTRIMbits : aliased uu_REFOTRIMbits_t  -- p32mx470f512.h:2610
     with Import => True,
     Convention => C,
     External_Name => "REFOTRIM";

   REFOTRIMCLR : aliased unsigned  -- p32mx470f512.h:2611
     with Import => True,
     Convention => C,
     External_Name => "REFOTRIMCLR";

   REFOTRIMSET : aliased unsigned  -- p32mx470f512.h:2612
     with Import => True,
     Convention => C,
     External_Name => "REFOTRIMSET";

   REFOTRIMINV : aliased unsigned  -- p32mx470f512.h:2613
     with Import => True,
     Convention => C,
     External_Name => "REFOTRIMINV";

   CFGCON : aliased unsigned  -- p32mx470f512.h:2614
     with Import => True,
     Convention => C,
     External_Name => "CFGCON";

   type uu_CFGCONbits_t is record
      TDOEN    : Extensions.Unsigned_1;  -- p32mx470f512.h:2616
      anon4721 : Extensions.Unsigned_1;  -- p32mx470f512.h:2617
      TROEN    : Extensions.Unsigned_1;  -- p32mx470f512.h:2618
      JTAGEN   : Extensions.Unsigned_1;  -- p32mx470f512.h:2619
      field_5  : aliased unsigned_char;
      PMDLOCK  : Extensions.Unsigned_1;  -- p32mx470f512.h:2621
      IOLOCK   : Extensions.Unsigned_1;  -- p32mx470f512.h:2622
   end record
     with Convention => C_Pass_By_Copy,
     Pack => True,
     Alignment => 4;  -- p32mx470f512.h:2623

   CFGCONbits : aliased uu_CFGCONbits_t  -- p32mx470f512.h:2624
     with Import => True,
     Convention => C,
     External_Name => "CFGCON";

   DDPCON : aliased unsigned  -- p32mx470f512.h:2625
     with Import => True,
     Convention => C,
     External_Name => "DDPCON";

   type uu_DDPCONbits_t is record
      TDOEN    : Extensions.Unsigned_1;  -- p32mx470f512.h:2627
      anon4733 : Extensions.Unsigned_1;  -- p32mx470f512.h:2628
      TROEN    : Extensions.Unsigned_1;  -- p32mx470f512.h:2629
      JTAGEN   : Extensions.Unsigned_1;  -- p32mx470f512.h:2630
      field_5  : aliased unsigned_char;
      PMDLOCK  : Extensions.Unsigned_1;  -- p32mx470f512.h:2632
      IOLOCK   : Extensions.Unsigned_1;  -- p32mx470f512.h:2633
   end record
     with Convention => C_Pass_By_Copy,
     Pack => True,
     Alignment => 4;  -- p32mx470f512.h:2634

   DDPCONbits : aliased uu_DDPCONbits_t  -- p32mx470f512.h:2635
     with Import => True,
     Convention => C,
     External_Name => "DDPCON";

   DEVID : aliased unsigned  -- p32mx470f512.h:2636
     with Import => True,
     Convention => C,
     External_Name => "DEVID";

   type uu_DEVIDbits_t is record
      DEVID : Extensions.Unsigned_28;  -- p32mx470f512.h:2638
      VER   : Extensions.Unsigned_4;  -- p32mx470f512.h:2639
   end record
     with Convention => C_Pass_By_Copy,
     Pack => True,
     Alignment => 4;  -- p32mx470f512.h:2640

   DEVIDbits : aliased uu_DEVIDbits_t  -- p32mx470f512.h:2641
     with Import => True,
     Convention => C,
     External_Name => "DEVID";

   SYSKEY : aliased unsigned  -- p32mx470f512.h:2642
     with Import => True,
     Convention => C,
     External_Name => "SYSKEY";

   SYSKEYCLR : aliased unsigned  -- p32mx470f512.h:2643
     with Import => True,
     Convention => C,
     External_Name => "SYSKEYCLR";

   SYSKEYSET : aliased unsigned  -- p32mx470f512.h:2644
     with Import => True,
     Convention => C,
     External_Name => "SYSKEYSET";

   SYSKEYINV : aliased unsigned  -- p32mx470f512.h:2645
     with Import => True,
     Convention => C,
     External_Name => "SYSKEYINV";

   PMD1 : aliased unsigned  -- p32mx470f512.h:2646
     with Import => True,
     Convention => C,
     External_Name => "PMD1";

   type uu_PMD1bits_t is record
      AD1MD    : Extensions.Unsigned_1;  -- p32mx470f512.h:2648
      anon4756 : Extensions.Unsigned_7;  -- p32mx470f512.h:2649
      CTMUMD   : Extensions.Unsigned_1;  -- p32mx470f512.h:2650
      anon4758 : Extensions.Unsigned_3;  -- p32mx470f512.h:2651
      CVRMD    : Extensions.Unsigned_1;  -- p32mx470f512.h:2652
   end record
     with Convention => C_Pass_By_Copy,
     Pack => True,
     Alignment => 4;  -- p32mx470f512.h:2653

   PMD1bits : aliased uu_PMD1bits_t  -- p32mx470f512.h:2654
     with Import => True,
     Convention => C,
     External_Name => "PMD1";

   PMD1CLR : aliased unsigned  -- p32mx470f512.h:2655
     with Import => True,
     Convention => C,
     External_Name => "PMD1CLR";

   PMD1SET : aliased unsigned  -- p32mx470f512.h:2656
     with Import => True,
     Convention => C,
     External_Name => "PMD1SET";

   PMD1INV : aliased unsigned  -- p32mx470f512.h:2657
     with Import => True,
     Convention => C,
     External_Name => "PMD1INV";

   PMD2 : aliased unsigned  -- p32mx470f512.h:2658
     with Import => True,
     Convention => C,
     External_Name => "PMD2";

   type uu_PMD2bits_t is record
      CMP1MD : Extensions.Unsigned_1;  -- p32mx470f512.h:2660
      CMP2MD : Extensions.Unsigned_1;  -- p32mx470f512.h:2661
   end record
     with Convention => C_Pass_By_Copy,
     Pack => True,
     Alignment => 4;  -- p32mx470f512.h:2662

   PMD2bits : aliased uu_PMD2bits_t  -- p32mx470f512.h:2663
     with Import => True,
     Convention => C,
     External_Name => "PMD2";

   PMD2CLR : aliased unsigned  -- p32mx470f512.h:2664
     with Import => True,
     Convention => C,
     External_Name => "PMD2CLR";

   PMD2SET : aliased unsigned  -- p32mx470f512.h:2665
     with Import => True,
     Convention => C,
     External_Name => "PMD2SET";

   PMD2INV : aliased unsigned  -- p32mx470f512.h:2666
     with Import => True,
     Convention => C,
     External_Name => "PMD2INV";

   PMD3 : aliased unsigned  -- p32mx470f512.h:2667
     with Import => True,
     Convention => C,
     External_Name => "PMD3";

   type uu_PMD3bits_t is record
      IC1MD    : Extensions.Unsigned_1;  -- p32mx470f512.h:2669
      IC2MD    : Extensions.Unsigned_1;  -- p32mx470f512.h:2670
      IC3MD    : Extensions.Unsigned_1;  -- p32mx470f512.h:2671
      IC4MD    : Extensions.Unsigned_1;  -- p32mx470f512.h:2672
      IC5MD    : Extensions.Unsigned_1;  -- p32mx470f512.h:2673
      anon4783 : Extensions.Unsigned_11;  -- p32mx470f512.h:2674
      OC1MD    : Extensions.Unsigned_1;  -- p32mx470f512.h:2675
      OC2MD    : Extensions.Unsigned_1;  -- p32mx470f512.h:2676
      OC3MD    : Extensions.Unsigned_1;  -- p32mx470f512.h:2677
      OC4MD    : Extensions.Unsigned_1;  -- p32mx470f512.h:2678
      OC5MD    : Extensions.Unsigned_1;  -- p32mx470f512.h:2679
   end record
     with Convention => C_Pass_By_Copy,
     Pack => True,
     Alignment => 4;  -- p32mx470f512.h:2680

   PMD3bits : aliased uu_PMD3bits_t  -- p32mx470f512.h:2681
     with Import => True,
     Convention => C,
     External_Name => "PMD3";

   PMD3CLR : aliased unsigned  -- p32mx470f512.h:2682
     with Import => True,
     Convention => C,
     External_Name => "PMD3CLR";

   PMD3SET : aliased unsigned  -- p32mx470f512.h:2683
     with Import => True,
     Convention => C,
     External_Name => "PMD3SET";

   PMD3INV : aliased unsigned  -- p32mx470f512.h:2684
     with Import => True,
     Convention => C,
     External_Name => "PMD3INV";

   PMD4 : aliased unsigned  -- p32mx470f512.h:2685
     with Import => True,
     Convention => C,
     External_Name => "PMD4";

   type uu_PMD4bits_t is record
      T1MD : Extensions.Unsigned_1;  -- p32mx470f512.h:2687
      T2MD : Extensions.Unsigned_1;  -- p32mx470f512.h:2688
      T3MD : Extensions.Unsigned_1;  -- p32mx470f512.h:2689
      T4MD : Extensions.Unsigned_1;  -- p32mx470f512.h:2690
      T5MD : Extensions.Unsigned_1;  -- p32mx470f512.h:2691
   end record
     with Convention => C_Pass_By_Copy,
     Pack => True,
     Alignment => 4;  -- p32mx470f512.h:2692

   PMD4bits : aliased uu_PMD4bits_t  -- p32mx470f512.h:2693
     with Import => True,
     Convention => C,
     External_Name => "PMD4";

   PMD4CLR : aliased unsigned  -- p32mx470f512.h:2694
     with Import => True,
     Convention => C,
     External_Name => "PMD4CLR";

   PMD4SET : aliased unsigned  -- p32mx470f512.h:2695
     with Import => True,
     Convention => C,
     External_Name => "PMD4SET";

   PMD4INV : aliased unsigned  -- p32mx470f512.h:2696
     with Import => True,
     Convention => C,
     External_Name => "PMD4INV";

   PMD5 : aliased unsigned  -- p32mx470f512.h:2697
     with Import => True,
     Convention => C,
     External_Name => "PMD5";

   type uu_PMD5bits_t is record
      U1MD     : Extensions.Unsigned_1;  -- p32mx470f512.h:2699
      U2MD     : Extensions.Unsigned_1;  -- p32mx470f512.h:2700
      U3MD     : Extensions.Unsigned_1;  -- p32mx470f512.h:2701
      U4MD     : Extensions.Unsigned_1;  -- p32mx470f512.h:2702
      anon4814 : Extensions.Unsigned_4;  -- p32mx470f512.h:2703
      SPI1MD   : Extensions.Unsigned_1;  -- p32mx470f512.h:2704
      SPI2MD   : Extensions.Unsigned_1;  -- p32mx470f512.h:2705
      anon4817 : Extensions.Unsigned_6;  -- p32mx470f512.h:2706
      I2C1MD   : Extensions.Unsigned_1;  -- p32mx470f512.h:2707
      I2C2MD   : Extensions.Unsigned_1;  -- p32mx470f512.h:2708
      anon4820 : Extensions.Unsigned_6;  -- p32mx470f512.h:2709
      USB1MD   : Extensions.Unsigned_1;  -- p32mx470f512.h:2710
   end record
     with Convention => C_Pass_By_Copy,
     Pack => True,
     Alignment => 4;  -- p32mx470f512.h:2711

   PMD5bits : aliased uu_PMD5bits_t  -- p32mx470f512.h:2712
     with Import => True,
     Convention => C,
     External_Name => "PMD5";

   PMD5CLR : aliased unsigned  -- p32mx470f512.h:2713
     with Import => True,
     Convention => C,
     External_Name => "PMD5CLR";

   PMD5SET : aliased unsigned  -- p32mx470f512.h:2714
     with Import => True,
     Convention => C,
     External_Name => "PMD5SET";

   PMD5INV : aliased unsigned  -- p32mx470f512.h:2715
     with Import => True,
     Convention => C,
     External_Name => "PMD5INV";

   PMD6 : aliased unsigned  -- p32mx470f512.h:2716
     with Import => True,
     Convention => C,
     External_Name => "PMD6";

   type uu_PMD6bits_t is record
      RTCCMD   : Extensions.Unsigned_1;  -- p32mx470f512.h:2718
      REFOMD   : Extensions.Unsigned_1;  -- p32mx470f512.h:2719
      anon4832 : Extensions.Unsigned_14;  -- p32mx470f512.h:2720
      PMPMD    : Extensions.Unsigned_1;  -- p32mx470f512.h:2721
   end record
     with Convention => C_Pass_By_Copy,
     Pack => True,
     Alignment => 4;  -- p32mx470f512.h:2722

   PMD6bits : aliased uu_PMD6bits_t  -- p32mx470f512.h:2723
     with Import => True,
     Convention => C,
     External_Name => "PMD6";

   PMD6CLR : aliased unsigned  -- p32mx470f512.h:2724
     with Import => True,
     Convention => C,
     External_Name => "PMD6CLR";

   PMD6SET : aliased unsigned  -- p32mx470f512.h:2725
     with Import => True,
     Convention => C,
     External_Name => "PMD6SET";

   PMD6INV : aliased unsigned  -- p32mx470f512.h:2726
     with Import => True,
     Convention => C,
     External_Name => "PMD6INV";

   NVMCON : aliased unsigned  -- p32mx470f512.h:2727
     with Import => True,
     Convention => C,
     External_Name => "NVMCON";

   type uu_NVMCONbits_t_struct1392 is record
      NVMOP    : Extensions.Unsigned_4;  -- p32mx470f512.h:2730
      anon4844 : Extensions.Unsigned_7;  -- p32mx470f512.h:2731
      LVDSTAT  : Extensions.Unsigned_1;  -- p32mx470f512.h:2732
      LVDERR   : Extensions.Unsigned_1;  -- p32mx470f512.h:2733
      WRERR    : Extensions.Unsigned_1;  -- p32mx470f512.h:2734
      WREN     : Extensions.Unsigned_1;  -- p32mx470f512.h:2735
      WR       : Extensions.Unsigned_1;  -- p32mx470f512.h:2736
   end record
     with Convention => C_Pass_By_Copy,
     Pack => True,
     Alignment => 4;
   type uu_NVMCONbits_t_struct1393 is record
      NVMOP0 : Extensions.Unsigned_1;  -- p32mx470f512.h:2739
      NVMOP1 : Extensions.Unsigned_1;  -- p32mx470f512.h:2740
      NVMOP2 : Extensions.Unsigned_1;  -- p32mx470f512.h:2741
      NVMOP3 : Extensions.Unsigned_1;  -- p32mx470f512.h:2742
   end record
     with Convention => C_Pass_By_Copy,
     Pack => True,
     Alignment => 4;
   type uu_NVMCONbits_t_struct1394 is record
      PROGOP : Extensions.Unsigned_4;  -- p32mx470f512.h:2745
   end record
     with Convention => C_Pass_By_Copy,
     Pack => True,
     Alignment => 4;
   type uu_NVMCONbits_t_struct1395 is record
      PROGOP0 : Extensions.Unsigned_1;  -- p32mx470f512.h:2748
      PROGOP1 : Extensions.Unsigned_1;  -- p32mx470f512.h:2749
      PROGOP2 : Extensions.Unsigned_1;  -- p32mx470f512.h:2750
      PROGOP3 : Extensions.Unsigned_1;  -- p32mx470f512.h:2751
   end record
     with Convention => C_Pass_By_Copy,
     Pack => True,
     Alignment => 4;
   type uu_NVMCONbits_t_struct1396 is record
      w : aliased unsigned;  -- p32mx470f512.h:2754
   end record
     with Convention => C_Pass_By_Copy;
   type uu_NVMCONbits_t (discr : unsigned := 0) is record
      case discr is
         when 0 => anon4851 : aliased uu_NVMCONbits_t_struct1392;  -- p32mx470f512.h:2737
         when 1 => anon4858 : aliased uu_NVMCONbits_t_struct1393;  -- p32mx470f512.h:2743
         when 2 => anon4862 : aliased uu_NVMCONbits_t_struct1394;  -- p32mx470f512.h:2746
         when 3 => anon4869 : aliased uu_NVMCONbits_t_struct1395;  -- p32mx470f512.h:2752
         when 4 => anon4873 : aliased uu_NVMCONbits_t_struct1396;  -- p32mx470f512.h:2755
         when others => null;
      end case;
   end record
     with Convention => C_Pass_By_Copy,
     Unchecked_Union => True;  -- p32mx470f512.h:2756

   NVMCONbits : aliased uu_NVMCONbits_t  -- p32mx470f512.h:2757
     with Import => True,
     Convention => C,
     External_Name => "NVMCON";

   NVMCONCLR : aliased unsigned  -- p32mx470f512.h:2758
     with Import => True,
     Convention => C,
     External_Name => "NVMCONCLR";

   NVMCONSET : aliased unsigned  -- p32mx470f512.h:2759
     with Import => True,
     Convention => C,
     External_Name => "NVMCONSET";

   NVMCONINV : aliased unsigned  -- p32mx470f512.h:2760
     with Import => True,
     Convention => C,
     External_Name => "NVMCONINV";

   NVMKEY : aliased unsigned  -- p32mx470f512.h:2761
     with Import => True,
     Convention => C,
     External_Name => "NVMKEY";

   NVMADDR : aliased unsigned  -- p32mx470f512.h:2762
     with Import => True,
     Convention => C,
     External_Name => "NVMADDR";

   NVMADDRCLR : aliased unsigned  -- p32mx470f512.h:2763
     with Import => True,
     Convention => C,
     External_Name => "NVMADDRCLR";

   NVMADDRSET : aliased unsigned  -- p32mx470f512.h:2764
     with Import => True,
     Convention => C,
     External_Name => "NVMADDRSET";

   NVMADDRINV : aliased unsigned  -- p32mx470f512.h:2765
     with Import => True,
     Convention => C,
     External_Name => "NVMADDRINV";

   NVMDATA : aliased unsigned  -- p32mx470f512.h:2766
     with Import => True,
     Convention => C,
     External_Name => "NVMDATA";

   NVMSRCADDR : aliased unsigned  -- p32mx470f512.h:2767
     with Import => True,
     Convention => C,
     External_Name => "NVMSRCADDR";

   RCON : aliased unsigned;  -- p32mx470f512.h:2768
   --       with Import => True,
   --       Convention => C,
   --       External_Name => "RCON";

   type uu_RCONbits_t_struct1401 is record
      POR      : Extensions.Unsigned_1;  -- p32mx470f512.h:2771
      BOR      : Extensions.Unsigned_1;  -- p32mx470f512.h:2772
      IDLE     : Extensions.Unsigned_1;  -- p32mx470f512.h:2773
      SLEEP    : Extensions.Unsigned_1;  -- p32mx470f512.h:2774
      WDTO     : Extensions.Unsigned_1;  -- p32mx470f512.h:2775
      anon4894 : Extensions.Unsigned_1;  -- p32mx470f512.h:2776
      SWR      : Extensions.Unsigned_1;  -- p32mx470f512.h:2777
      EXTR     : Extensions.Unsigned_1;  -- p32mx470f512.h:2778
      VREGS    : Extensions.Unsigned_1;  -- p32mx470f512.h:2779
      CMR      : Extensions.Unsigned_1;  -- p32mx470f512.h:2780
      anon4899 : Extensions.Unsigned_19;  -- p32mx470f512.h:2781
      HVDR     : Extensions.Unsigned_1;  -- p32mx470f512.h:2782
   end record
     with Convention => C_Pass_By_Copy,
     Pack => True,
     Alignment => 4;
   type uu_RCONbits_t_struct1403 is record
      w : aliased unsigned;  -- p32mx470f512.h:2785
   end record
     with Convention => C_Pass_By_Copy;
   type uu_RCONbits_t (discr : unsigned := 0) is record
      case discr is
         when 0 => anon4902 : aliased uu_RCONbits_t_struct1401;  -- p32mx470f512.h:2783
         when 1 => anon4906 : aliased uu_RCONbits_t_struct1403;  -- p32mx470f512.h:2786
         when others => null;
      end case;
   end record
     with Convention => C_Pass_By_Copy,
     Unchecked_Union => True;  -- p32mx470f512.h:2787

   RCONbits : aliased uu_RCONbits_t  -- p32mx470f512.h:2788
     with Import => True,
     Convention => C,
     External_Name => "RCON";

   RCONCLR : aliased unsigned  -- p32mx470f512.h:2789
     with Import => True,
     Convention => C,
     External_Name => "RCONCLR";

   RCONSET : aliased unsigned  -- p32mx470f512.h:2790
     with Import => True,
     Convention => C,
     External_Name => "RCONSET";

   RCONINV : aliased unsigned  -- p32mx470f512.h:2791
     with Import => True,
     Convention => C,
     External_Name => "RCONINV";

   RSWRST : aliased unsigned  -- p32mx470f512.h:2792
     with Import => True,
     Convention => C,
     External_Name => "RSWRST";

   type uu_RSWRSTbits_t_struct1408 is record
      SWRST : Extensions.Unsigned_1;  -- p32mx470f512.h:2795
   end record
     with Convention => C_Pass_By_Copy,
     Pack => True,
     Alignment => 4;
   type uu_RSWRSTbits_t_struct1409 is record
      w : aliased unsigned;  -- p32mx470f512.h:2798
   end record
     with Convention => C_Pass_By_Copy;
   type uu_RSWRSTbits_t (discr : unsigned := 0) is record
      case discr is
         when 0 => anon4917 : aliased uu_RSWRSTbits_t_struct1408;  -- p32mx470f512.h:2796
         when 1 => anon4921 : aliased uu_RSWRSTbits_t_struct1409;  -- p32mx470f512.h:2799
         when others => null;
      end case;
   end record
     with Convention => C_Pass_By_Copy,
     Unchecked_Union => True;  -- p32mx470f512.h:2800

   RSWRSTbits : aliased uu_RSWRSTbits_t  -- p32mx470f512.h:2801
     with Import => True,
     Convention => C,
     External_Name => "RSWRST";

   RSWRSTCLR : aliased unsigned  -- p32mx470f512.h:2802
     with Import => True,
     Convention => C,
     External_Name => "RSWRSTCLR";

   RSWRSTSET : aliased unsigned  -- p32mx470f512.h:2803
     with Import => True,
     Convention => C,
     External_Name => "RSWRSTSET";

   RSWRSTINV : aliased unsigned  -- p32mx470f512.h:2804
     with Import => True,
     Convention => C,
     External_Name => "RSWRSTINV";

   INT1R : aliased unsigned  -- p32mx470f512.h:2805
     with Import => True,
     Convention => C,
     External_Name => "INT1R";

   type uu_INT1Rbits_t is record
      INT1R : Extensions.Unsigned_4;  -- p32mx470f512.h:2807
   end record
     with Convention => C_Pass_By_Copy,
     Pack => True,
     Alignment => 4;  -- p32mx470f512.h:2808

   INT1Rbits : aliased uu_INT1Rbits_t  -- p32mx470f512.h:2809
     with Import => True,
     Convention => C,
     External_Name => "INT1R";

   INT2R : aliased unsigned  -- p32mx470f512.h:2810
     with Import => True,
     Convention => C,
     External_Name => "INT2R";

   type uu_INT2Rbits_t is record
      INT2R : Extensions.Unsigned_4;  -- p32mx470f512.h:2812
   end record
     with Convention => C_Pass_By_Copy,
     Pack => True,
     Alignment => 4;  -- p32mx470f512.h:2813

   INT2Rbits : aliased uu_INT2Rbits_t  -- p32mx470f512.h:2814
     with Import => True,
     Convention => C,
     External_Name => "INT2R";

   INT3R : aliased unsigned  -- p32mx470f512.h:2815
     with Import => True,
     Convention => C,
     External_Name => "INT3R";

   type uu_INT3Rbits_t is record
      INT3R : Extensions.Unsigned_4;  -- p32mx470f512.h:2817
   end record
     with Convention => C_Pass_By_Copy,
     Pack => True,
     Alignment => 4;  -- p32mx470f512.h:2818

   INT3Rbits : aliased uu_INT3Rbits_t  -- p32mx470f512.h:2819
     with Import => True,
     Convention => C,
     External_Name => "INT3R";

   INT4R : aliased unsigned  -- p32mx470f512.h:2820
     with Import => True,
     Convention => C,
     External_Name => "INT4R";

   type uu_INT4Rbits_t is record
      INT4R : Extensions.Unsigned_4;  -- p32mx470f512.h:2822
   end record
     with Convention => C_Pass_By_Copy,
     Pack => True,
     Alignment => 4;  -- p32mx470f512.h:2823

   INT4Rbits : aliased uu_INT4Rbits_t  -- p32mx470f512.h:2824
     with Import => True,
     Convention => C,
     External_Name => "INT4R";

   T2CKR : aliased unsigned  -- p32mx470f512.h:2825
     with Import => True,
     Convention => C,
     External_Name => "T2CKR";

   type uu_T2CKRbits_t is record
      T2CKR : Extensions.Unsigned_4;  -- p32mx470f512.h:2827
   end record
     with Convention => C_Pass_By_Copy,
     Pack => True,
     Alignment => 4;  -- p32mx470f512.h:2828

   T2CKRbits : aliased uu_T2CKRbits_t  -- p32mx470f512.h:2829
     with Import => True,
     Convention => C,
     External_Name => "T2CKR";

   T3CKR : aliased unsigned  -- p32mx470f512.h:2830
     with Import => True,
     Convention => C,
     External_Name => "T3CKR";

   type uu_T3CKRbits_t is record
      T3CKR : Extensions.Unsigned_4;  -- p32mx470f512.h:2832
   end record
     with Convention => C_Pass_By_Copy,
     Pack => True,
     Alignment => 4;  -- p32mx470f512.h:2833

   T3CKRbits : aliased uu_T3CKRbits_t  -- p32mx470f512.h:2834
     with Import => True,
     Convention => C,
     External_Name => "T3CKR";

   T4CKR : aliased unsigned  -- p32mx470f512.h:2835
     with Import => True,
     Convention => C,
     External_Name => "T4CKR";

   type uu_T4CKRbits_t is record
      T4CKR : Extensions.Unsigned_4;  -- p32mx470f512.h:2837
   end record
     with Convention => C_Pass_By_Copy,
     Pack => True,
     Alignment => 4;  -- p32mx470f512.h:2838

   T4CKRbits : aliased uu_T4CKRbits_t  -- p32mx470f512.h:2839
     with Import => True,
     Convention => C,
     External_Name => "T4CKR";

   T5CKR : aliased unsigned  -- p32mx470f512.h:2840
     with Import => True,
     Convention => C,
     External_Name => "T5CKR";

   type uu_T5CKRbits_t is record
      T5CKR : Extensions.Unsigned_4;  -- p32mx470f512.h:2842
   end record
     with Convention => C_Pass_By_Copy,
     Pack => True,
     Alignment => 4;  -- p32mx470f512.h:2843

   T5CKRbits : aliased uu_T5CKRbits_t  -- p32mx470f512.h:2844
     with Import => True,
     Convention => C,
     External_Name => "T5CKR";

   IC1R : aliased unsigned  -- p32mx470f512.h:2845
     with Import => True,
     Convention => C,
     External_Name => "IC1R";

   type uu_IC1Rbits_t is record
      IC1R : Extensions.Unsigned_4;  -- p32mx470f512.h:2847
   end record
     with Convention => C_Pass_By_Copy,
     Pack => True,
     Alignment => 4;  -- p32mx470f512.h:2848

   IC1Rbits : aliased uu_IC1Rbits_t  -- p32mx470f512.h:2849
     with Import => True,
     Convention => C,
     External_Name => "IC1R";

   IC2R : aliased unsigned  -- p32mx470f512.h:2850
     with Import => True,
     Convention => C,
     External_Name => "IC2R";

   type uu_IC2Rbits_t is record
      IC2R : Extensions.Unsigned_4;  -- p32mx470f512.h:2852
   end record
     with Convention => C_Pass_By_Copy,
     Pack => True,
     Alignment => 4;  -- p32mx470f512.h:2853

   IC2Rbits : aliased uu_IC2Rbits_t  -- p32mx470f512.h:2854
     with Import => True,
     Convention => C,
     External_Name => "IC2R";

   IC3R : aliased unsigned  -- p32mx470f512.h:2855
     with Import => True,
     Convention => C,
     External_Name => "IC3R";

   type uu_IC3Rbits_t is record
      IC3R : Extensions.Unsigned_4;  -- p32mx470f512.h:2857
   end record
     with Convention => C_Pass_By_Copy,
     Pack => True,
     Alignment => 4;  -- p32mx470f512.h:2858

   IC3Rbits : aliased uu_IC3Rbits_t  -- p32mx470f512.h:2859
     with Import => True,
     Convention => C,
     External_Name => "IC3R";

   IC4R : aliased unsigned  -- p32mx470f512.h:2860
     with Import => True,
     Convention => C,
     External_Name => "IC4R";

   type uu_IC4Rbits_t is record
      IC4R : Extensions.Unsigned_4;  -- p32mx470f512.h:2862
   end record
     with Convention => C_Pass_By_Copy,
     Pack => True,
     Alignment => 4;  -- p32mx470f512.h:2863

   IC4Rbits : aliased uu_IC4Rbits_t  -- p32mx470f512.h:2864
     with Import => True,
     Convention => C,
     External_Name => "IC4R";

   IC5R : aliased unsigned  -- p32mx470f512.h:2865
     with Import => True,
     Convention => C,
     External_Name => "IC5R";

   type uu_IC5Rbits_t is record
      IC5R : Extensions.Unsigned_4;  -- p32mx470f512.h:2867
   end record
     with Convention => C_Pass_By_Copy,
     Pack => True,
     Alignment => 4;  -- p32mx470f512.h:2868

   IC5Rbits : aliased uu_IC5Rbits_t  -- p32mx470f512.h:2869
     with Import => True,
     Convention => C,
     External_Name => "IC5R";

   OCFAR : aliased unsigned  -- p32mx470f512.h:2870
     with Import => True,
     Convention => C,
     External_Name => "OCFAR";

   type uu_OCFARbits_t is record
      OCFAR : Extensions.Unsigned_4;  -- p32mx470f512.h:2872
   end record
     with Convention => C_Pass_By_Copy,
     Pack => True,
     Alignment => 4;  -- p32mx470f512.h:2873

   OCFARbits : aliased uu_OCFARbits_t  -- p32mx470f512.h:2874
     with Import => True,
     Convention => C,
     External_Name => "OCFAR";

   OCFBR : aliased unsigned  -- p32mx470f512.h:2875
     with Import => True,
     Convention => C,
     External_Name => "OCFBR";

   type uu_OCFBRbits_t is record
      OCFBR : Extensions.Unsigned_4;  -- p32mx470f512.h:2877
   end record
     with Convention => C_Pass_By_Copy,
     Pack => True,
     Alignment => 4;  -- p32mx470f512.h:2878

   OCFBRbits : aliased uu_OCFBRbits_t  -- p32mx470f512.h:2879
     with Import => True,
     Convention => C,
     External_Name => "OCFBR";

   U1RXR : aliased unsigned  -- p32mx470f512.h:2880
     with Import => True,
     Convention => C,
     External_Name => "U1RXR";

   type uu_U1RXRbits_t is record
      U1RXR : Extensions.Unsigned_4;  -- p32mx470f512.h:2882
   end record
     with Convention => C_Pass_By_Copy,
     Pack => True,
     Alignment => 4;  -- p32mx470f512.h:2883

   U1RXRbits : aliased uu_U1RXRbits_t  -- p32mx470f512.h:2884
     with Import => True,
     Convention => C,
     External_Name => "U1RXR";

   U1CTSR : aliased unsigned  -- p32mx470f512.h:2885
     with Import => True,
     Convention => C,
     External_Name => "U1CTSR";

   type uu_U1CTSRbits_t is record
      U1CTSR : Extensions.Unsigned_4;  -- p32mx470f512.h:2887
   end record
     with Convention => C_Pass_By_Copy,
     Pack => True,
     Alignment => 4;  -- p32mx470f512.h:2888

   U1CTSRbits : aliased uu_U1CTSRbits_t  -- p32mx470f512.h:2889
     with Import => True,
     Convention => C,
     External_Name => "U1CTSR";

   U2RXR : aliased unsigned  -- p32mx470f512.h:2890
     with Import => True,
     Convention => C,
     External_Name => "U2RXR";

   type uu_U2RXRbits_t is record
      U2RXR : Extensions.Unsigned_4;  -- p32mx470f512.h:2892
   end record
     with Convention => C_Pass_By_Copy,
     Pack => True,
     Alignment => 4;  -- p32mx470f512.h:2893

   U2RXRbits : aliased uu_U2RXRbits_t  -- p32mx470f512.h:2894
     with Import => True,
     Convention => C,
     External_Name => "U2RXR";

   U2CTSR : aliased unsigned  -- p32mx470f512.h:2895
     with Import => True,
     Convention => C,
     External_Name => "U2CTSR";

   type uu_U2CTSRbits_t is record
      U2CTSR : Extensions.Unsigned_4;  -- p32mx470f512.h:2897
   end record
     with Convention => C_Pass_By_Copy,
     Pack => True,
     Alignment => 4;  -- p32mx470f512.h:2898

   U2CTSRbits : aliased uu_U2CTSRbits_t  -- p32mx470f512.h:2899
     with Import => True,
     Convention => C,
     External_Name => "U2CTSR";

   U3RXR : aliased unsigned  -- p32mx470f512.h:2900
     with Import => True,
     Convention => C,
     External_Name => "U3RXR";

   type uu_U3RXRbits_t is record
      U3RXR : Extensions.Unsigned_4;  -- p32mx470f512.h:2902
   end record
     with Convention => C_Pass_By_Copy,
     Pack => True,
     Alignment => 4;  -- p32mx470f512.h:2903

   U3RXRbits : aliased uu_U3RXRbits_t  -- p32mx470f512.h:2904
     with Import => True,
     Convention => C,
     External_Name => "U3RXR";

   U3CTSR : aliased unsigned  -- p32mx470f512.h:2905
     with Import => True,
     Convention => C,
     External_Name => "U3CTSR";

   type uu_U3CTSRbits_t is record
      U3CTSR : Extensions.Unsigned_4;  -- p32mx470f512.h:2907
   end record
     with Convention => C_Pass_By_Copy,
     Pack => True,
     Alignment => 4;  -- p32mx470f512.h:2908

   U3CTSRbits : aliased uu_U3CTSRbits_t  -- p32mx470f512.h:2909
     with Import => True,
     Convention => C,
     External_Name => "U3CTSR";

   U4RXR : aliased unsigned  -- p32mx470f512.h:2910
     with Import => True,
     Convention => C,
     External_Name => "U4RXR";

   type uu_U4RXRbits_t is record
      U4RXR : Extensions.Unsigned_4;  -- p32mx470f512.h:2912
   end record
     with Convention => C_Pass_By_Copy,
     Pack => True,
     Alignment => 4;  -- p32mx470f512.h:2913

   U4RXRbits : aliased uu_U4RXRbits_t  -- p32mx470f512.h:2914
     with Import => True,
     Convention => C,
     External_Name => "U4RXR";

   U4CTSR : aliased unsigned  -- p32mx470f512.h:2915
     with Import => True,
     Convention => C,
     External_Name => "U4CTSR";

   type uu_U4CTSRbits_t is record
      U4CTSR : Extensions.Unsigned_4;  -- p32mx470f512.h:2917
   end record
     with Convention => C_Pass_By_Copy,
     Pack => True,
     Alignment => 4;  -- p32mx470f512.h:2918

   U4CTSRbits : aliased uu_U4CTSRbits_t  -- p32mx470f512.h:2919
     with Import => True,
     Convention => C,
     External_Name => "U4CTSR";

   U5RXR : aliased unsigned  -- p32mx470f512.h:2920
     with Import => True,
     Convention => C,
     External_Name => "U5RXR";

   type uu_U5RXRbits_t is record
      U5RXR : Extensions.Unsigned_4;  -- p32mx470f512.h:2922
   end record
     with Convention => C_Pass_By_Copy,
     Pack => True,
     Alignment => 4;  -- p32mx470f512.h:2923

   U5RXRbits : aliased uu_U5RXRbits_t  -- p32mx470f512.h:2924
     with Import => True,
     Convention => C,
     External_Name => "U5RXR";

   U5CTSR : aliased unsigned  -- p32mx470f512.h:2925
     with Import => True,
     Convention => C,
     External_Name => "U5CTSR";

   type uu_U5CTSRbits_t is record
      U5CTSR : Extensions.Unsigned_4;  -- p32mx470f512.h:2927
   end record
     with Convention => C_Pass_By_Copy,
     Pack => True,
     Alignment => 4;  -- p32mx470f512.h:2928

   U5CTSRbits : aliased uu_U5CTSRbits_t  -- p32mx470f512.h:2929
     with Import => True,
     Convention => C,
     External_Name => "U5CTSR";

   SDI1R : aliased unsigned  -- p32mx470f512.h:2930
     with Import => True,
     Convention => C,
     External_Name => "SDI1R";

   type uu_SDI1Rbits_t is record
      SDI1R : Extensions.Unsigned_4;  -- p32mx470f512.h:2932
   end record
     with Convention => C_Pass_By_Copy,
     Pack => True,
     Alignment => 4;  -- p32mx470f512.h:2933

   SDI1Rbits : aliased uu_SDI1Rbits_t  -- p32mx470f512.h:2934
     with Import => True,
     Convention => C,
     External_Name => "SDI1R";

   SS1R : aliased unsigned  -- p32mx470f512.h:2935
     with Import => True,
     Convention => C,
     External_Name => "SS1R";

   type uu_SS1Rbits_t is record
      SS1R : Extensions.Unsigned_4;  -- p32mx470f512.h:2937
   end record
     with Convention => C_Pass_By_Copy,
     Pack => True,
     Alignment => 4;  -- p32mx470f512.h:2938

   SS1Rbits : aliased uu_SS1Rbits_t  -- p32mx470f512.h:2939
     with Import => True,
     Convention => C,
     External_Name => "SS1R";

   SDI2R : aliased unsigned  -- p32mx470f512.h:2940
     with Import => True,
     Convention => C,
     External_Name => "SDI2R";

   type uu_SDI2Rbits_t is record
      SDI2R : Extensions.Unsigned_4;  -- p32mx470f512.h:2942
   end record
     with Convention => C_Pass_By_Copy,
     Pack => True,
     Alignment => 4;  -- p32mx470f512.h:2943

   SDI2Rbits : aliased uu_SDI2Rbits_t  -- p32mx470f512.h:2944
     with Import => True,
     Convention => C,
     External_Name => "SDI2R";

   SS2R : aliased unsigned  -- p32mx470f512.h:2945
     with Import => True,
     Convention => C,
     External_Name => "SS2R";

   type uu_SS2Rbits_t is record
      SS2R : Extensions.Unsigned_4;  -- p32mx470f512.h:2947
   end record
     with Convention => C_Pass_By_Copy,
     Pack => True,
     Alignment => 4;  -- p32mx470f512.h:2948

   SS2Rbits : aliased uu_SS2Rbits_t  -- p32mx470f512.h:2949
     with Import => True,
     Convention => C,
     External_Name => "SS2R";

   REFCLKIR : aliased unsigned  -- p32mx470f512.h:2950
     with Import => True,
     Convention => C,
     External_Name => "REFCLKIR";

   type uu_REFCLKIRbits_t is record
      REFCLKIR : Extensions.Unsigned_4;  -- p32mx470f512.h:2952
   end record
     with Convention => C_Pass_By_Copy,
     Pack => True,
     Alignment => 4;  -- p32mx470f512.h:2953

   REFCLKIRbits : aliased uu_REFCLKIRbits_t  -- p32mx470f512.h:2954
     with Import => True,
     Convention => C,
     External_Name => "REFCLKIR";

   RPB0R : aliased unsigned  -- p32mx470f512.h:2955
     with Import => True,
     Convention => C,
     External_Name => "RPB0R";

   type uu_RPB0Rbits_t is record
      RPB0R : Extensions.Unsigned_4;  -- p32mx470f512.h:2957
   end record
     with Convention => C_Pass_By_Copy,
     Pack => True,
     Alignment => 4;  -- p32mx470f512.h:2958

   RPB0Rbits : aliased uu_RPB0Rbits_t  -- p32mx470f512.h:2959
     with Import => True,
     Convention => C,
     External_Name => "RPB0R";

   RPB1R : aliased unsigned  -- p32mx470f512.h:2960
     with Import => True,
     Convention => C,
     External_Name => "RPB1R";

   type uu_RPB1Rbits_t is record
      RPB1R : Extensions.Unsigned_4;  -- p32mx470f512.h:2962
   end record
     with Convention => C_Pass_By_Copy,
     Pack => True,
     Alignment => 4;  -- p32mx470f512.h:2963

   RPB1Rbits : aliased uu_RPB1Rbits_t  -- p32mx470f512.h:2964
     with Import => True,
     Convention => C,
     External_Name => "RPB1R";

   RPB2R : aliased unsigned  -- p32mx470f512.h:2965
     with Import => True,
     Convention => C,
     External_Name => "RPB2R";

   type uu_RPB2Rbits_t is record
      RPB2R : Extensions.Unsigned_4;  -- p32mx470f512.h:2967
   end record
     with Convention => C_Pass_By_Copy,
     Pack => True,
     Alignment => 4;  -- p32mx470f512.h:2968

   RPB2Rbits : aliased uu_RPB2Rbits_t  -- p32mx470f512.h:2969
     with Import => True,
     Convention => C,
     External_Name => "RPB2R";

   RPB3R : aliased unsigned  -- p32mx470f512.h:2970
     with Import => True,
     Convention => C,
     External_Name => "RPB3R";

   type uu_RPB3Rbits_t is record
      RPB3R : Extensions.Unsigned_4;  -- p32mx470f512.h:2972
   end record
     with Convention => C_Pass_By_Copy,
     Pack => True,
     Alignment => 4;  -- p32mx470f512.h:2973

   RPB3Rbits : aliased uu_RPB3Rbits_t  -- p32mx470f512.h:2974
     with Import => True,
     Convention => C,
     External_Name => "RPB3R";

   RPB5R : aliased unsigned  -- p32mx470f512.h:2975
     with Import => True,
     Convention => C,
     External_Name => "RPB5R";

   type uu_RPB5Rbits_t is record
      RPB5R : Extensions.Unsigned_4;  -- p32mx470f512.h:2977
   end record
     with Convention => C_Pass_By_Copy,
     Pack => True,
     Alignment => 4;  -- p32mx470f512.h:2978

   RPB5Rbits : aliased uu_RPB5Rbits_t  -- p32mx470f512.h:2979
     with Import => True,
     Convention => C,
     External_Name => "RPB5R";

   RPB6R : aliased unsigned  -- p32mx470f512.h:2980
     with Import => True,
     Convention => C,
     External_Name => "RPB6R";

   type uu_RPB6Rbits_t is record
      RPB6R : Extensions.Unsigned_4;  -- p32mx470f512.h:2982
   end record
     with Convention => C_Pass_By_Copy,
     Pack => True,
     Alignment => 4;  -- p32mx470f512.h:2983

   RPB6Rbits : aliased uu_RPB6Rbits_t  -- p32mx470f512.h:2984
     with Import => True,
     Convention => C,
     External_Name => "RPB6R";

   RPB7R : aliased unsigned  -- p32mx470f512.h:2985
     with Import => True,
     Convention => C,
     External_Name => "RPB7R";

   type uu_RPB7Rbits_t is record
      RPB7R : Extensions.Unsigned_4;  -- p32mx470f512.h:2987
   end record
     with Convention => C_Pass_By_Copy,
     Pack => True,
     Alignment => 4;  -- p32mx470f512.h:2988

   RPB7Rbits : aliased uu_RPB7Rbits_t  -- p32mx470f512.h:2989
     with Import => True,
     Convention => C,
     External_Name => "RPB7R";

   RPB8R : aliased unsigned  -- p32mx470f512.h:2990
     with Import => True,
     Convention => C,
     External_Name => "RPB8R";

   type uu_RPB8Rbits_t is record
      RPB8R : Extensions.Unsigned_4;  -- p32mx470f512.h:2992
   end record
     with Convention => C_Pass_By_Copy,
     Pack => True,
     Alignment => 4;  -- p32mx470f512.h:2993

   RPB8Rbits : aliased uu_RPB8Rbits_t  -- p32mx470f512.h:2994
     with Import => True,
     Convention => C,
     External_Name => "RPB8R";

   RPB9R : aliased unsigned  -- p32mx470f512.h:2995
     with Import => True,
     Convention => C,
     External_Name => "RPB9R";

   type uu_RPB9Rbits_t is record
      RPB9R : Extensions.Unsigned_4;  -- p32mx470f512.h:2997
   end record
     with Convention => C_Pass_By_Copy,
     Pack => True,
     Alignment => 4;  -- p32mx470f512.h:2998

   RPB9Rbits : aliased uu_RPB9Rbits_t  -- p32mx470f512.h:2999
     with Import => True,
     Convention => C,
     External_Name => "RPB9R";

   RPB10R : aliased unsigned  -- p32mx470f512.h:3000
     with Import => True,
     Convention => C,
     External_Name => "RPB10R";

   type uu_RPB10Rbits_t is record
      RPB10R : Extensions.Unsigned_4;  -- p32mx470f512.h:3002
   end record
     with Convention => C_Pass_By_Copy,
     Pack => True,
     Alignment => 4;  -- p32mx470f512.h:3003

   RPB10Rbits : aliased uu_RPB10Rbits_t  -- p32mx470f512.h:3004
     with Import => True,
     Convention => C,
     External_Name => "RPB10R";

   RPB14R : aliased unsigned  -- p32mx470f512.h:3005
     with Import => True,
     Convention => C,
     External_Name => "RPB14R";

   type uu_RPB14Rbits_t is record
      RPB14R : Extensions.Unsigned_4;  -- p32mx470f512.h:3007
   end record
     with Convention => C_Pass_By_Copy,
     Pack => True,
     Alignment => 4;  -- p32mx470f512.h:3008

   RPB14Rbits : aliased uu_RPB14Rbits_t  -- p32mx470f512.h:3009
     with Import => True,
     Convention => C,
     External_Name => "RPB14R";

   RPB15R : aliased unsigned  -- p32mx470f512.h:3010
     with Import => True,
     Convention => C,
     External_Name => "RPB15R";

   type uu_RPB15Rbits_t is record
      RPB15R : Extensions.Unsigned_4;  -- p32mx470f512.h:3012
   end record
     with Convention => C_Pass_By_Copy,
     Pack => True,
     Alignment => 4;  -- p32mx470f512.h:3013

   RPB15Rbits : aliased uu_RPB15Rbits_t  -- p32mx470f512.h:3014
     with Import => True,
     Convention => C,
     External_Name => "RPB15R";

   RPD0R : aliased unsigned  -- p32mx470f512.h:3015
     with Import => True,
     Convention => C,
     External_Name => "RPD0R";

   type uu_RPD0Rbits_t is record
      RPD0R : Extensions.Unsigned_4;  -- p32mx470f512.h:3017
   end record
     with Convention => C_Pass_By_Copy,
     Pack => True,
     Alignment => 4;  -- p32mx470f512.h:3018

   RPD0Rbits : aliased uu_RPD0Rbits_t  -- p32mx470f512.h:3019
     with Import => True,
     Convention => C,
     External_Name => "RPD0R";

   RPD1R : aliased unsigned  -- p32mx470f512.h:3020
     with Import => True,
     Convention => C,
     External_Name => "RPD1R";

   type uu_RPD1Rbits_t is record
      RPD1R : Extensions.Unsigned_4;  -- p32mx470f512.h:3022
   end record
     with Convention => C_Pass_By_Copy,
     Pack => True,
     Alignment => 4;  -- p32mx470f512.h:3023

   RPD1Rbits : aliased uu_RPD1Rbits_t  -- p32mx470f512.h:3024
     with Import => True,
     Convention => C,
     External_Name => "RPD1R";

   RPD2R : aliased unsigned  -- p32mx470f512.h:3025
     with Import => True,
     Convention => C,
     External_Name => "RPD2R";

   type uu_RPD2Rbits_t is record
      RPD2R : Extensions.Unsigned_4;  -- p32mx470f512.h:3027
   end record
     with Convention => C_Pass_By_Copy,
     Pack => True,
     Alignment => 4;  -- p32mx470f512.h:3028

   RPD2Rbits : aliased uu_RPD2Rbits_t  -- p32mx470f512.h:3029
     with Import => True,
     Convention => C,
     External_Name => "RPD2R";

   RPD3R : aliased unsigned  -- p32mx470f512.h:3030
     with Import => True,
     Convention => C,
     External_Name => "RPD3R";

   type uu_RPD3Rbits_t is record
      RPD3R : Extensions.Unsigned_4;  -- p32mx470f512.h:3032
   end record
     with Convention => C_Pass_By_Copy,
     Pack => True,
     Alignment => 4;  -- p32mx470f512.h:3033

   RPD3Rbits : aliased uu_RPD3Rbits_t  -- p32mx470f512.h:3034
     with Import => True,
     Convention => C,
     External_Name => "RPD3R";

   RPD4R : aliased unsigned  -- p32mx470f512.h:3035
     with Import => True,
     Convention => C,
     External_Name => "RPD4R";

   type uu_RPD4Rbits_t is record
      RPD4R : Extensions.Unsigned_4;  -- p32mx470f512.h:3037
   end record
     with Convention => C_Pass_By_Copy,
     Pack => True,
     Alignment => 4;  -- p32mx470f512.h:3038

   RPD4Rbits : aliased uu_RPD4Rbits_t  -- p32mx470f512.h:3039
     with Import => True,
     Convention => C,
     External_Name => "RPD4R";

   RPD5R : aliased unsigned  -- p32mx470f512.h:3040
     with Import => True,
     Convention => C,
     External_Name => "RPD5R";

   type uu_RPD5Rbits_t is record
      RPD5R : Extensions.Unsigned_4;  -- p32mx470f512.h:3042
   end record
     with Convention => C_Pass_By_Copy,
     Pack => True,
     Alignment => 4;  -- p32mx470f512.h:3043

   RPD5Rbits : aliased uu_RPD5Rbits_t  -- p32mx470f512.h:3044
     with Import => True,
     Convention => C,
     External_Name => "RPD5R";

   RPD8R : aliased unsigned  -- p32mx470f512.h:3045
     with Import => True,
     Convention => C,
     External_Name => "RPD8R";

   type uu_RPD8Rbits_t is record
      RPD8R : Extensions.Unsigned_4;  -- p32mx470f512.h:3047
   end record
     with Convention => C_Pass_By_Copy,
     Pack => True,
     Alignment => 4;  -- p32mx470f512.h:3048

   RPD8Rbits : aliased uu_RPD8Rbits_t  -- p32mx470f512.h:3049
     with Import => True,
     Convention => C,
     External_Name => "RPD8R";

   RPD9R : aliased unsigned  -- p32mx470f512.h:3050
     with Import => True,
     Convention => C,
     External_Name => "RPD9R";

   type uu_RPD9Rbits_t is record
      RPD9R : Extensions.Unsigned_4;  -- p32mx470f512.h:3052
   end record
     with Convention => C_Pass_By_Copy,
     Pack => True,
     Alignment => 4;  -- p32mx470f512.h:3053

   RPD9Rbits : aliased uu_RPD9Rbits_t  -- p32mx470f512.h:3054
     with Import => True,
     Convention => C,
     External_Name => "RPD9R";

   RPD10R : aliased unsigned  -- p32mx470f512.h:3055
     with Import => True,
     Convention => C,
     External_Name => "RPD10R";

   type uu_RPD10Rbits_t is record
      RPD10R : Extensions.Unsigned_4;  -- p32mx470f512.h:3057
   end record
     with Convention => C_Pass_By_Copy,
     Pack => True,
     Alignment => 4;  -- p32mx470f512.h:3058

   RPD10Rbits : aliased uu_RPD10Rbits_t  -- p32mx470f512.h:3059
     with Import => True,
     Convention => C,
     External_Name => "RPD10R";

   RPD11R : aliased unsigned  -- p32mx470f512.h:3060
     with Import => True,
     Convention => C,
     External_Name => "RPD11R";

   type uu_RPD11Rbits_t is record
      RPD11R : Extensions.Unsigned_4;  -- p32mx470f512.h:3062
   end record
     with Convention => C_Pass_By_Copy,
     Pack => True,
     Alignment => 4;  -- p32mx470f512.h:3063

   RPD11Rbits : aliased uu_RPD11Rbits_t  -- p32mx470f512.h:3064
     with Import => True,
     Convention => C,
     External_Name => "RPD11R";

   RPD12R : aliased unsigned  -- p32mx470f512.h:3065
     with Import => True,
     Convention => C,
     External_Name => "RPD12R";

   type uu_RPD12Rbits_t is record
      RPD12R : Extensions.Unsigned_4;  -- p32mx470f512.h:3067
   end record
     with Convention => C_Pass_By_Copy,
     Pack => True,
     Alignment => 4;  -- p32mx470f512.h:3068

   RPD12Rbits : aliased uu_RPD12Rbits_t  -- p32mx470f512.h:3069
     with Import => True,
     Convention => C,
     External_Name => "RPD12R";

   RPD14R : aliased unsigned  -- p32mx470f512.h:3070
     with Import => True,
     Convention => C,
     External_Name => "RPD14R";

   type uu_RPD14Rbits_t is record
      RPD14R : Extensions.Unsigned_4;  -- p32mx470f512.h:3072
   end record
     with Convention => C_Pass_By_Copy,
     Pack => True,
     Alignment => 4;  -- p32mx470f512.h:3073

   RPD14Rbits : aliased uu_RPD14Rbits_t  -- p32mx470f512.h:3074
     with Import => True,
     Convention => C,
     External_Name => "RPD14R";

   RPD15R : aliased unsigned  -- p32mx470f512.h:3075
     with Import => True,
     Convention => C,
     External_Name => "RPD15R";

   type uu_RPD15Rbits_t is record
      RPD15R : Extensions.Unsigned_4;  -- p32mx470f512.h:3077
   end record
     with Convention => C_Pass_By_Copy,
     Pack => True,
     Alignment => 4;  -- p32mx470f512.h:3078

   RPD15Rbits : aliased uu_RPD15Rbits_t  -- p32mx470f512.h:3079
     with Import => True,
     Convention => C,
     External_Name => "RPD15R";

   RPE3R : aliased unsigned  -- p32mx470f512.h:3080
     with Import => True,
     Convention => C,
     External_Name => "RPE3R";

   type uu_RPE3Rbits_t is record
      RPE3R : Extensions.Unsigned_4;  -- p32mx470f512.h:3082
   end record
     with Convention => C_Pass_By_Copy,
     Pack => True,
     Alignment => 4;  -- p32mx470f512.h:3083

   RPE3Rbits : aliased uu_RPE3Rbits_t  -- p32mx470f512.h:3084
     with Import => True,
     Convention => C,
     External_Name => "RPE3R";

   RPE5R : aliased unsigned  -- p32mx470f512.h:3085
     with Import => True,
     Convention => C,
     External_Name => "RPE5R";

   type uu_RPE5Rbits_t is record
      RPE5R : Extensions.Unsigned_4;  -- p32mx470f512.h:3087
   end record
     with Convention => C_Pass_By_Copy,
     Pack => True,
     Alignment => 4;  -- p32mx470f512.h:3088

   RPE5Rbits : aliased uu_RPE5Rbits_t  -- p32mx470f512.h:3089
     with Import => True,
     Convention => C,
     External_Name => "RPE5R";

   RPE8R : aliased unsigned  -- p32mx470f512.h:3090
     with Import => True,
     Convention => C,
     External_Name => "RPE8R";

   type uu_RPE8Rbits_t is record
      RPE8R : Extensions.Unsigned_4;  -- p32mx470f512.h:3092
   end record
     with Convention => C_Pass_By_Copy,
     Pack => True,
     Alignment => 4;  -- p32mx470f512.h:3093

   RPE8Rbits : aliased uu_RPE8Rbits_t  -- p32mx470f512.h:3094
     with Import => True,
     Convention => C,
     External_Name => "RPE8R";

   RPE9R : aliased unsigned  -- p32mx470f512.h:3095
     with Import => True,
     Convention => C,
     External_Name => "RPE9R";

   type uu_RPE9Rbits_t is record
      RPE9R : Extensions.Unsigned_4;  -- p32mx470f512.h:3097
   end record
     with Convention => C_Pass_By_Copy,
     Pack => True,
     Alignment => 4;  -- p32mx470f512.h:3098

   RPE9Rbits : aliased uu_RPE9Rbits_t  -- p32mx470f512.h:3099
     with Import => True,
     Convention => C,
     External_Name => "RPE9R";

   RPF0R : aliased unsigned  -- p32mx470f512.h:3100
     with Import => True,
     Convention => C,
     External_Name => "RPF0R";

   type uu_RPF0Rbits_t is record
      RPF0R : Extensions.Unsigned_4;  -- p32mx470f512.h:3102
   end record
     with Convention => C_Pass_By_Copy,
     Pack => True,
     Alignment => 4;  -- p32mx470f512.h:3103

   RPF0Rbits : aliased uu_RPF0Rbits_t  -- p32mx470f512.h:3104
     with Import => True,
     Convention => C,
     External_Name => "RPF0R";

   RPF1R : aliased unsigned  -- p32mx470f512.h:3105
     with Import => True,
     Convention => C,
     External_Name => "RPF1R";

   type uu_RPF1Rbits_t is record
      RPF1R : Extensions.Unsigned_4;  -- p32mx470f512.h:3107
   end record
     with Convention => C_Pass_By_Copy,
     Pack => True,
     Alignment => 4;  -- p32mx470f512.h:3108

   RPF1Rbits : aliased uu_RPF1Rbits_t  -- p32mx470f512.h:3109
     with Import => True,
     Convention => C,
     External_Name => "RPF1R";

   RPF2R : aliased unsigned  -- p32mx470f512.h:3110
     with Import => True,
     Convention => C,
     External_Name => "RPF2R";

   type uu_RPF2Rbits_t is record
      RPF2R : Extensions.Unsigned_4;  -- p32mx470f512.h:3112
   end record
     with Convention => C_Pass_By_Copy,
     Pack => True,
     Alignment => 4;  -- p32mx470f512.h:3113

   RPF2Rbits : aliased uu_RPF2Rbits_t  -- p32mx470f512.h:3114
     with Import => True,
     Convention => C,
     External_Name => "RPF2R";

   RPF3R : aliased unsigned  -- p32mx470f512.h:3115
     with Import => True,
     Convention => C,
     External_Name => "RPF3R";

   type uu_RPF3Rbits_t is record
      RPF3R : Extensions.Unsigned_4;  -- p32mx470f512.h:3117
   end record
     with Convention => C_Pass_By_Copy,
     Pack => True,
     Alignment => 4;  -- p32mx470f512.h:3118

   RPF3Rbits : aliased uu_RPF3Rbits_t  -- p32mx470f512.h:3119
     with Import => True,
     Convention => C,
     External_Name => "RPF3R";

   RPF4R : aliased unsigned  -- p32mx470f512.h:3120
     with Import => True,
     Convention => C,
     External_Name => "RPF4R";

   type uu_RPF4Rbits_t is record
      RPF4R : Extensions.Unsigned_4;  -- p32mx470f512.h:3122
   end record
     with Convention => C_Pass_By_Copy,
     Pack => True,
     Alignment => 4;  -- p32mx470f512.h:3123

   RPF4Rbits : aliased uu_RPF4Rbits_t  -- p32mx470f512.h:3124
     with Import => True,
     Convention => C,
     External_Name => "RPF4R";

   RPF5R : aliased unsigned  -- p32mx470f512.h:3125
     with Import => True,
     Convention => C,
     External_Name => "RPF5R";

   type uu_RPF5Rbits_t is record
      RPF5R : Extensions.Unsigned_4;  -- p32mx470f512.h:3127
   end record
     with Convention => C_Pass_By_Copy,
     Pack => True,
     Alignment => 4;  -- p32mx470f512.h:3128

   RPF5Rbits : aliased uu_RPF5Rbits_t  -- p32mx470f512.h:3129
     with Import => True,
     Convention => C,
     External_Name => "RPF5R";

   RPF6R : aliased unsigned  -- p32mx470f512.h:3130
     with Import => True,
     Convention => C,
     External_Name => "RPF6R";

   type uu_RPF6Rbits_t is record
      RPF6R : Extensions.Unsigned_4;  -- p32mx470f512.h:3132
   end record
     with Convention => C_Pass_By_Copy,
     Pack => True,
     Alignment => 4;  -- p32mx470f512.h:3133

   RPF6Rbits : aliased uu_RPF6Rbits_t  -- p32mx470f512.h:3134
     with Import => True,
     Convention => C,
     External_Name => "RPF6R";

   RPG6R : aliased unsigned  -- p32mx470f512.h:3135
     with Import => True,
     Convention => C,
     External_Name => "RPG6R";

   type uu_RPG6Rbits_t is record
      RPG6R : Extensions.Unsigned_4;  -- p32mx470f512.h:3137
   end record
     with Convention => C_Pass_By_Copy,
     Pack => True,
     Alignment => 4;  -- p32mx470f512.h:3138

   RPG6Rbits : aliased uu_RPG6Rbits_t  -- p32mx470f512.h:3139
     with Import => True,
     Convention => C,
     External_Name => "RPG6R";

   RPG7R : aliased unsigned  -- p32mx470f512.h:3140
     with Import => True,
     Convention => C,
     External_Name => "RPG7R";

   type uu_RPG7Rbits_t is record
      RPG7R : Extensions.Unsigned_4;  -- p32mx470f512.h:3142
   end record
     with Convention => C_Pass_By_Copy,
     Pack => True,
     Alignment => 4;  -- p32mx470f512.h:3143

   RPG7Rbits : aliased uu_RPG7Rbits_t  -- p32mx470f512.h:3144
     with Import => True,
     Convention => C,
     External_Name => "RPG7R";

   RPG8R : aliased unsigned  -- p32mx470f512.h:3145
     with Import => True,
     Convention => C,
     External_Name => "RPG8R";

   type uu_RPG8Rbits_t is record
      RPG8R : Extensions.Unsigned_4;  -- p32mx470f512.h:3147
   end record
     with Convention => C_Pass_By_Copy,
     Pack => True,
     Alignment => 4;  -- p32mx470f512.h:3148

   RPG8Rbits : aliased uu_RPG8Rbits_t  -- p32mx470f512.h:3149
     with Import => True,
     Convention => C,
     External_Name => "RPG8R";

   RPG9R : aliased unsigned  -- p32mx470f512.h:3150
     with Import => True,
     Convention => C,
     External_Name => "RPG9R";

   type uu_RPG9Rbits_t is record
      RPG9R : Extensions.Unsigned_4;  -- p32mx470f512.h:3152
   end record
     with Convention => C_Pass_By_Copy,
     Pack => True,
     Alignment => 4;  -- p32mx470f512.h:3153

   RPG9Rbits : aliased uu_RPG9Rbits_t  -- p32mx470f512.h:3154
     with Import => True,
     Convention => C,
     External_Name => "RPG9R";

   INTCON : aliased unsigned  -- p32mx470f512.h:3155
     with Import => True,
     Convention => C,
     External_Name => "INTCON";

   type uu_INTCONbits_t_struct1694 is record
      INT0EP   : Extensions.Unsigned_1;  -- p32mx470f512.h:3158
      INT1EP   : Extensions.Unsigned_1;  -- p32mx470f512.h:3159
      INT2EP   : Extensions.Unsigned_1;  -- p32mx470f512.h:3160
      INT3EP   : Extensions.Unsigned_1;  -- p32mx470f512.h:3161
      INT4EP   : Extensions.Unsigned_1;  -- p32mx470f512.h:3162
      anon5355 : Extensions.Unsigned_3;  -- p32mx470f512.h:3163
      TPC      : Extensions.Unsigned_3;  -- p32mx470f512.h:3164
      anon5357 : Extensions.Unsigned_1;  -- p32mx470f512.h:3165
      MVEC     : Extensions.Unsigned_1;  -- p32mx470f512.h:3166
      anon5359 : Extensions.Unsigned_3;  -- p32mx470f512.h:3167
      SS0      : Extensions.Unsigned_1;  -- p32mx470f512.h:3168
   end record
     with Convention => C_Pass_By_Copy,
     Pack => True,
     Alignment => 4;
   type uu_INTCONbits_t_struct1695 is record
      w : aliased unsigned;  -- p32mx470f512.h:3171
   end record
     with Convention => C_Pass_By_Copy;
   type uu_INTCONbits_t (discr : unsigned := 0) is record
      case discr is
         when 0 => anon5362 : aliased uu_INTCONbits_t_struct1694;  -- p32mx470f512.h:3169
         when 1 => anon5366 : aliased uu_INTCONbits_t_struct1695;  -- p32mx470f512.h:3172
         when others => null;
      end case;
   end record
     with Convention => C_Pass_By_Copy,
     Unchecked_Union => True;  -- p32mx470f512.h:3173

   INTCONbits : aliased uu_INTCONbits_t  -- p32mx470f512.h:3174
     with Import => True,
     Convention => C,
     External_Name => "INTCON";

   INTCONCLR : aliased unsigned  -- p32mx470f512.h:3175
     with Import => True,
     Convention => C,
     External_Name => "INTCONCLR";

   INTCONSET : aliased unsigned  -- p32mx470f512.h:3176
     with Import => True,
     Convention => C,
     External_Name => "INTCONSET";

   INTCONINV : aliased unsigned  -- p32mx470f512.h:3177
     with Import => True,
     Convention => C,
     External_Name => "INTCONINV";

   INTSTAT : aliased unsigned  -- p32mx470f512.h:3178
     with Import => True,
     Convention => C,
     External_Name => "INTSTAT";

   type uu_INTSTATbits_t is record
      VEC      : Extensions.Unsigned_6;  -- p32mx470f512.h:3180
      anon5375 : Extensions.Unsigned_2;  -- p32mx470f512.h:3181
      SRIPL    : Extensions.Unsigned_3;  -- p32mx470f512.h:3182
   end record
     with Convention => C_Pass_By_Copy,
     Pack => True,
     Alignment => 4;  -- p32mx470f512.h:3183

   INTSTATbits : aliased uu_INTSTATbits_t  -- p32mx470f512.h:3184
     with Import => True,
     Convention => C,
     External_Name => "INTSTAT";

   IPTMR : aliased unsigned  -- p32mx470f512.h:3185
     with Import => True,
     Convention => C,
     External_Name => "IPTMR";

   IPTMRCLR : aliased unsigned  -- p32mx470f512.h:3186
     with Import => True,
     Convention => C,
     External_Name => "IPTMRCLR";

   IPTMRSET : aliased unsigned  -- p32mx470f512.h:3187
     with Import => True,
     Convention => C,
     External_Name => "IPTMRSET";

   IPTMRINV : aliased unsigned  -- p32mx470f512.h:3188
     with Import => True,
     Convention => C,
     External_Name => "IPTMRINV";

   IFS0 : aliased unsigned  -- p32mx470f512.h:3189
     with Import => True,
     Convention => C,
     External_Name => "IFS0";

   type uu_IFS0bits_t_struct1704 is record
      CTIF   : Extensions.Unsigned_1;  -- p32mx470f512.h:3192
      CS0IF  : Extensions.Unsigned_1;  -- p32mx470f512.h:3193
      CS1IF  : Extensions.Unsigned_1;  -- p32mx470f512.h:3194
      INT0IF : Extensions.Unsigned_1;  -- p32mx470f512.h:3195
      T1IF   : Extensions.Unsigned_1;  -- p32mx470f512.h:3196
      IC1EIF : Extensions.Unsigned_1;  -- p32mx470f512.h:3197
      IC1IF  : Extensions.Unsigned_1;  -- p32mx470f512.h:3198
      OC1IF  : Extensions.Unsigned_1;  -- p32mx470f512.h:3199
      INT1IF : Extensions.Unsigned_1;  -- p32mx470f512.h:3200
      T2IF   : Extensions.Unsigned_1;  -- p32mx470f512.h:3201
      IC2EIF : Extensions.Unsigned_1;  -- p32mx470f512.h:3202
      IC2IF  : Extensions.Unsigned_1;  -- p32mx470f512.h:3203
      OC2IF  : Extensions.Unsigned_1;  -- p32mx470f512.h:3204
      INT2IF : Extensions.Unsigned_1;  -- p32mx470f512.h:3205
      T3IF   : Extensions.Unsigned_1;  -- p32mx470f512.h:3206
      IC3EIF : Extensions.Unsigned_1;  -- p32mx470f512.h:3207
      IC3IF  : Extensions.Unsigned_1;  -- p32mx470f512.h:3208
      OC3IF  : Extensions.Unsigned_1;  -- p32mx470f512.h:3209
      INT3IF : Extensions.Unsigned_1;  -- p32mx470f512.h:3210
      T4IF   : Extensions.Unsigned_1;  -- p32mx470f512.h:3211
      IC4EIF : Extensions.Unsigned_1;  -- p32mx470f512.h:3212
      IC4IF  : Extensions.Unsigned_1;  -- p32mx470f512.h:3213
      OC4IF  : Extensions.Unsigned_1;  -- p32mx470f512.h:3214
      INT4IF : Extensions.Unsigned_1;  -- p32mx470f512.h:3215
      T5IF   : Extensions.Unsigned_1;  -- p32mx470f512.h:3216
      IC5EIF : Extensions.Unsigned_1;  -- p32mx470f512.h:3217
      IC5IF  : Extensions.Unsigned_1;  -- p32mx470f512.h:3218
      OC5IF  : Extensions.Unsigned_1;  -- p32mx470f512.h:3219
      AD1IF  : Extensions.Unsigned_1;  -- p32mx470f512.h:3220
      FSCMIF : Extensions.Unsigned_1;  -- p32mx470f512.h:3221
      RTCCIF : Extensions.Unsigned_1;  -- p32mx470f512.h:3222
      FCEIF  : Extensions.Unsigned_1;  -- p32mx470f512.h:3223
   end record
     with Convention => C_Pass_By_Copy,
     Pack => True,
     Alignment => 4;
   type uu_IFS0bits_t_struct1705 is record
      w : aliased unsigned;  -- p32mx470f512.h:3226
   end record
     with Convention => C_Pass_By_Copy;

   type uu_IFS0bits_t (discr : unsigned := 0) is record
      case discr is
         when 0 => anon5420 : aliased uu_IFS0bits_t_struct1704;  -- p32mx470f512.h:3224
         when 1 => anon5424 : aliased uu_IFS0bits_t_struct1705;  -- p32mx470f512.h:3227
         when others => null;
      end case;
   end record
     with Convention => C_Pass_By_Copy,
     Unchecked_Union => True;  -- p32mx470f512.h:3228

   IFS0bits : aliased uu_IFS0bits_t  -- p32mx470f512.h:3229
     with Import => True,
     Convention => C,
     External_Name => "IFS0";

   IFS0CLR : aliased unsigned  -- p32mx470f512.h:3230
     with Import => True,
     Convention => C,
     External_Name => "IFS0CLR";

   IFS0SET : aliased unsigned  -- p32mx470f512.h:3231
     with Import => True,
     Convention => C,
     External_Name => "IFS0SET";

   IFS0INV : aliased unsigned  -- p32mx470f512.h:3232
     with Import => True,
     Convention => C,
     External_Name => "IFS0INV";

   IFS1 : aliased unsigned  -- p32mx470f512.h:3233
     with Import => True,
     Convention => C,
     External_Name => "IFS1";

   type uu_IFS1bits_t_struct1710 is record
      CMP1IF   : Extensions.Unsigned_1;  -- p32mx470f512.h:3236
      CMP2IF   : Extensions.Unsigned_1;  -- p32mx470f512.h:3237
      USBIF    : Extensions.Unsigned_1;  -- p32mx470f512.h:3238
      SPI1EIF  : Extensions.Unsigned_1;  -- p32mx470f512.h:3239
      SPI1RXIF : Extensions.Unsigned_1;  -- p32mx470f512.h:3240
      SPI1TXIF : Extensions.Unsigned_1;  -- p32mx470f512.h:3241
      U1EIF    : Extensions.Unsigned_1;  -- p32mx470f512.h:3242
      U1RXIF   : Extensions.Unsigned_1;  -- p32mx470f512.h:3243
      U1TXIF   : Extensions.Unsigned_1;  -- p32mx470f512.h:3244
      I2C1BIF  : Extensions.Unsigned_1;  -- p32mx470f512.h:3245
      I2C1SIF  : Extensions.Unsigned_1;  -- p32mx470f512.h:3246
      I2C1MIF  : Extensions.Unsigned_1;  -- p32mx470f512.h:3247
      CNAIF    : Extensions.Unsigned_1;  -- p32mx470f512.h:3248
      CNBIF    : Extensions.Unsigned_1;  -- p32mx470f512.h:3249
      CNCIF    : Extensions.Unsigned_1;  -- p32mx470f512.h:3250
      CNDIF    : Extensions.Unsigned_1;  -- p32mx470f512.h:3251
      CNEIF    : Extensions.Unsigned_1;  -- p32mx470f512.h:3252
      CNFIF    : Extensions.Unsigned_1;  -- p32mx470f512.h:3253
      CNGIF    : Extensions.Unsigned_1;  -- p32mx470f512.h:3254
      PMPIF    : Extensions.Unsigned_1;  -- p32mx470f512.h:3255
      PMPEIF   : Extensions.Unsigned_1;  -- p32mx470f512.h:3256
      SPI2EIF  : Extensions.Unsigned_1;  -- p32mx470f512.h:3257
      SPI2RXIF : Extensions.Unsigned_1;  -- p32mx470f512.h:3258
      SPI2TXIF : Extensions.Unsigned_1;  -- p32mx470f512.h:3259
      U2EIF    : Extensions.Unsigned_1;  -- p32mx470f512.h:3260
      U2RXIF   : Extensions.Unsigned_1;  -- p32mx470f512.h:3261
      U2TXIF   : Extensions.Unsigned_1;  -- p32mx470f512.h:3262
      I2C2BIF  : Extensions.Unsigned_1;  -- p32mx470f512.h:3263
      I2C2SIF  : Extensions.Unsigned_1;  -- p32mx470f512.h:3264
      I2C2MIF  : Extensions.Unsigned_1;  -- p32mx470f512.h:3265
      U3EIF    : Extensions.Unsigned_1;  -- p32mx470f512.h:3266
      U3RXIF   : Extensions.Unsigned_1;  -- p32mx470f512.h:3267
   end record
     with Convention => C_Pass_By_Copy,
     Pack => True,
     Alignment => 4;
   type uu_IFS1bits_t_struct1711 is record
      w : aliased unsigned;  -- p32mx470f512.h:3270
   end record
     with Convention => C_Pass_By_Copy;
   type uu_IFS1bits_t (discr : unsigned := 0) is record
      case discr is
         when 0 => anon5466 : aliased uu_IFS1bits_t_struct1710;  -- p32mx470f512.h:3268
         when 1 => anon5470 : aliased uu_IFS1bits_t_struct1711;  -- p32mx470f512.h:3271
         when others => null;
      end case;
   end record
     with Convention => C_Pass_By_Copy,
     Unchecked_Union => True;  -- p32mx470f512.h:3272

   IFS1bits : aliased uu_IFS1bits_t  -- p32mx470f512.h:3273
     with Import => True,
     Convention => C,
     External_Name => "IFS1";

   IFS1CLR : aliased unsigned  -- p32mx470f512.h:3274
     with Import => True,
     Convention => C,
     External_Name => "IFS1CLR";

   IFS1SET : aliased unsigned  -- p32mx470f512.h:3275
     with Import => True,
     Convention => C,
     External_Name => "IFS1SET";

   IFS1INV : aliased unsigned  -- p32mx470f512.h:3276
     with Import => True,
     Convention => C,
     External_Name => "IFS1INV";

   IFS2 : aliased unsigned  -- p32mx470f512.h:3277
     with Import => True,
     Convention => C,
     External_Name => "IFS2";

   type uu_IFS2bits_t is record
      U3TXIF   : Extensions.Unsigned_1;  -- p32mx470f512.h:3279
      U4EIF    : Extensions.Unsigned_1;  -- p32mx470f512.h:3280
      U4RXIF   : Extensions.Unsigned_1;  -- p32mx470f512.h:3281
      U4TXIF   : Extensions.Unsigned_1;  -- p32mx470f512.h:3282
      anon5482 : Extensions.Unsigned_3;  -- p32mx470f512.h:3283
      CTMUIF   : Extensions.Unsigned_1;  -- p32mx470f512.h:3284
      DMA0IF   : Extensions.Unsigned_1;  -- p32mx470f512.h:3285
      DMA1IF   : Extensions.Unsigned_1;  -- p32mx470f512.h:3286
      DMA2IF   : Extensions.Unsigned_1;  -- p32mx470f512.h:3287
      DMA3IF   : Extensions.Unsigned_1;  -- p32mx470f512.h:3288
   end record
     with Convention => C_Pass_By_Copy,
     Pack => True,
     Alignment => 4;  -- p32mx470f512.h:3289

   IFS2bits : aliased uu_IFS2bits_t  -- p32mx470f512.h:3290
     with Import => True,
     Convention => C,
     External_Name => "IFS2";

   IFS2CLR : aliased unsigned  -- p32mx470f512.h:3291
     with Import => True,
     Convention => C,
     External_Name => "IFS2CLR";

   IFS2SET : aliased unsigned  -- p32mx470f512.h:3292
     with Import => True,
     Convention => C,
     External_Name => "IFS2SET";

   IFS2INV : aliased unsigned  -- p32mx470f512.h:3293
     with Import => True,
     Convention => C,
     External_Name => "IFS2INV";

   IEC0 : aliased unsigned  -- p32mx470f512.h:3294
     with Import => True,
     Convention => C,
     External_Name => "IEC0";

   type uu_IEC0bits_t_struct1720 is record
      CTIE   : Extensions.Unsigned_1;  -- p32mx470f512.h:3297
      CS0IE  : Extensions.Unsigned_1;  -- p32mx470f512.h:3298
      CS1IE  : Extensions.Unsigned_1;  -- p32mx470f512.h:3299
      INT0IE : Extensions.Unsigned_1;  -- p32mx470f512.h:3300
      T1IE   : Extensions.Unsigned_1;  -- p32mx470f512.h:3301
      IC1EIE : Extensions.Unsigned_1;  -- p32mx470f512.h:3302
      IC1IE  : Extensions.Unsigned_1;  -- p32mx470f512.h:3303
      OC1IE  : Extensions.Unsigned_1;  -- p32mx470f512.h:3304
      INT1IE : Extensions.Unsigned_1;  -- p32mx470f512.h:3305
      T2IE   : Extensions.Unsigned_1;  -- p32mx470f512.h:3306
      IC2EIE : Extensions.Unsigned_1;  -- p32mx470f512.h:3307
      IC2IE  : Extensions.Unsigned_1;  -- p32mx470f512.h:3308
      OC2IE  : Extensions.Unsigned_1;  -- p32mx470f512.h:3309
      INT2IE : Extensions.Unsigned_1;  -- p32mx470f512.h:3310
      T3IE   : Extensions.Unsigned_1;  -- p32mx470f512.h:3311
      IC3EIE : Extensions.Unsigned_1;  -- p32mx470f512.h:3312
      IC3IE  : Extensions.Unsigned_1;  -- p32mx470f512.h:3313
      OC3IE  : Extensions.Unsigned_1;  -- p32mx470f512.h:3314
      INT3IE : Extensions.Unsigned_1;  -- p32mx470f512.h:3315
      T4IE   : Extensions.Unsigned_1;  -- p32mx470f512.h:3316
      IC4EIE : Extensions.Unsigned_1;  -- p32mx470f512.h:3317
      IC4IE  : Extensions.Unsigned_1;  -- p32mx470f512.h:3318
      OC4IE  : Extensions.Unsigned_1;  -- p32mx470f512.h:3319
      INT4IE : Extensions.Unsigned_1;  -- p32mx470f512.h:3320
      T5IE   : Extensions.Unsigned_1;  -- p32mx470f512.h:3321
      IC5EIE : Extensions.Unsigned_1;  -- p32mx470f512.h:3322
      IC5IE  : Extensions.Unsigned_1;  -- p32mx470f512.h:3323
      OC5IE  : Extensions.Unsigned_1;  -- p32mx470f512.h:3324
      AD1IE  : Extensions.Unsigned_1;  -- p32mx470f512.h:3325
      FSCMIE : Extensions.Unsigned_1;  -- p32mx470f512.h:3326
      RTCCIE : Extensions.Unsigned_1;  -- p32mx470f512.h:3327
      FCEIE  : Extensions.Unsigned_1;  -- p32mx470f512.h:3328
   end record
     with Convention => C_Pass_By_Copy,
     Pack => True,
     Alignment => 4;
   type uu_IEC0bits_t_struct1721 is record
      w : aliased unsigned;  -- p32mx470f512.h:3331
   end record
     with Convention => C_Pass_By_Copy;
   type uu_IEC0bits_t (discr : unsigned := 0) is record
      case discr is
         when 0 => anon5530 : aliased uu_IEC0bits_t_struct1720;  -- p32mx470f512.h:3329
         when 1 => anon5534 : aliased uu_IEC0bits_t_struct1721;  -- p32mx470f512.h:3332
         when others => null;
      end case;
   end record
     with Convention => C_Pass_By_Copy,
     Unchecked_Union => True;  -- p32mx470f512.h:3333

   IEC0bits : aliased uu_IEC0bits_t  -- p32mx470f512.h:3334
     with Import => True,
     Convention => C,
     External_Name => "IEC0";

   IEC0CLR : aliased unsigned  -- p32mx470f512.h:3335
     with Import => True,
     Convention => C,
     External_Name => "IEC0CLR";

   IEC0SET : aliased unsigned  -- p32mx470f512.h:3336
     with Import => True,
     Convention => C,
     External_Name => "IEC0SET";

   IEC0INV : aliased unsigned  -- p32mx470f512.h:3337
     with Import => True,
     Convention => C,
     External_Name => "IEC0INV";

   IEC1 : aliased unsigned  -- p32mx470f512.h:3338
     with Import => True,
     Convention => C,
     External_Name => "IEC1";

   type uu_IEC1bits_t_struct1726 is record
      CMP1IE   : Extensions.Unsigned_1;  -- p32mx470f512.h:3341
      CMP2IE   : Extensions.Unsigned_1;  -- p32mx470f512.h:3342
      USBIE    : Extensions.Unsigned_1;  -- p32mx470f512.h:3343
      SPI1EIE  : Extensions.Unsigned_1;  -- p32mx470f512.h:3344
      SPI1RXIE : Extensions.Unsigned_1;  -- p32mx470f512.h:3345
      SPI1TXIE : Extensions.Unsigned_1;  -- p32mx470f512.h:3346
      U1EIE    : Extensions.Unsigned_1;  -- p32mx470f512.h:3347
      U1RXIE   : Extensions.Unsigned_1;  -- p32mx470f512.h:3348
      U1TXIE   : Extensions.Unsigned_1;  -- p32mx470f512.h:3349
      I2C1BIE  : Extensions.Unsigned_1;  -- p32mx470f512.h:3350
      I2C1SIE  : Extensions.Unsigned_1;  -- p32mx470f512.h:3351
      I2C1MIE  : Extensions.Unsigned_1;  -- p32mx470f512.h:3352
      CNAIE    : Extensions.Unsigned_1;  -- p32mx470f512.h:3353
      CNBIE    : Extensions.Unsigned_1;  -- p32mx470f512.h:3354
      CNCIE    : Extensions.Unsigned_1;  -- p32mx470f512.h:3355
      CNDIE    : Extensions.Unsigned_1;  -- p32mx470f512.h:3356
      CNEIE    : Extensions.Unsigned_1;  -- p32mx470f512.h:3357
      CNFIE    : Extensions.Unsigned_1;  -- p32mx470f512.h:3358
      CNGIE    : Extensions.Unsigned_1;  -- p32mx470f512.h:3359
      PMPIE    : Extensions.Unsigned_1;  -- p32mx470f512.h:3360
      PMPEIE   : Extensions.Unsigned_1;  -- p32mx470f512.h:3361
      SPI2EIE  : Extensions.Unsigned_1;  -- p32mx470f512.h:3362
      SPI2RXIE : Extensions.Unsigned_1;  -- p32mx470f512.h:3363
      SPI2TXIE : Extensions.Unsigned_1;  -- p32mx470f512.h:3364
      U2EIE    : Extensions.Unsigned_1;  -- p32mx470f512.h:3365
      U2RXIE   : Extensions.Unsigned_1;  -- p32mx470f512.h:3366
      U2TXIE   : Extensions.Unsigned_1;  -- p32mx470f512.h:3367
      I2C2BIE  : Extensions.Unsigned_1;  -- p32mx470f512.h:3368
      I2C2SIE  : Extensions.Unsigned_1;  -- p32mx470f512.h:3369
      I2CMIE   : Extensions.Unsigned_1;  -- p32mx470f512.h:3370
      U3EIE    : Extensions.Unsigned_1;  -- p32mx470f512.h:3371
      U3RXIE   : Extensions.Unsigned_1;  -- p32mx470f512.h:3372
   end record
     with Convention => C_Pass_By_Copy,
     Pack => True,
     Alignment => 4;
   type uu_IEC1bits_t_struct1727 is record
      w : aliased unsigned;  -- p32mx470f512.h:3375
   end record
     with Convention => C_Pass_By_Copy;
   type uu_IEC1bits_t (discr : unsigned := 0) is record
      case discr is
         when 0 => anon5576 : aliased uu_IEC1bits_t_struct1726;  -- p32mx470f512.h:3373
         when 1 => anon5580 : aliased uu_IEC1bits_t_struct1727;  -- p32mx470f512.h:3376
         when others => null;
      end case;
   end record
     with Convention => C_Pass_By_Copy,
     Unchecked_Union => True;  -- p32mx470f512.h:3377

   IEC1bits : aliased uu_IEC1bits_t  -- p32mx470f512.h:3378
     with Import => True,
     Convention => C,
     External_Name => "IEC1";

   IEC1CLR : aliased unsigned  -- p32mx470f512.h:3379
     with Import => True,
     Convention => C,
     External_Name => "IEC1CLR";

   IEC1SET : aliased unsigned  -- p32mx470f512.h:3380
     with Import => True,
     Convention => C,
     External_Name => "IEC1SET";

   IEC1INV : aliased unsigned  -- p32mx470f512.h:3381
     with Import => True,
     Convention => C,
     External_Name => "IEC1INV";

   IEC2 : aliased unsigned  -- p32mx470f512.h:3382
     with Import => True,
     Convention => C,
     External_Name => "IEC2";

   type uu_IEC2bits_t is record
      U3TXIE   : Extensions.Unsigned_1;  -- p32mx470f512.h:3384
      U4EIE    : Extensions.Unsigned_1;  -- p32mx470f512.h:3385
      U4RXIE   : Extensions.Unsigned_1;  -- p32mx470f512.h:3386
      U4TXIE   : Extensions.Unsigned_1;  -- p32mx470f512.h:3387
      anon5592 : Extensions.Unsigned_3;  -- p32mx470f512.h:3388
      CTMUIE   : Extensions.Unsigned_1;  -- p32mx470f512.h:3389
      DMA0IE   : Extensions.Unsigned_1;  -- p32mx470f512.h:3390
      DMA1IE   : Extensions.Unsigned_1;  -- p32mx470f512.h:3391
      DMA2IE   : Extensions.Unsigned_1;  -- p32mx470f512.h:3392
      DMA3IE   : Extensions.Unsigned_1;  -- p32mx470f512.h:3393
   end record
     with Convention => C_Pass_By_Copy,
     Pack => True,
     Alignment => 4;  -- p32mx470f512.h:3394

   IEC2bits : aliased uu_IEC2bits_t  -- p32mx470f512.h:3395
     with Import => True,
     Convention => C,
     External_Name => "IEC2";

   IEC2CLR : aliased unsigned  -- p32mx470f512.h:3396
     with Import => True,
     Convention => C,
     External_Name => "IEC2CLR";

   IEC2SET : aliased unsigned  -- p32mx470f512.h:3397
     with Import => True,
     Convention => C,
     External_Name => "IEC2SET";

   IEC2INV : aliased unsigned  -- p32mx470f512.h:3398
     with Import => True,
     Convention => C,
     External_Name => "IEC2INV";

   IPC0 : aliased unsigned  -- p32mx470f512.h:3399
     with Import => True,
     Convention => C,
     External_Name => "IPC0";

   type uu_IPC0bits_t_struct1736 is record
      CTIS     : Extensions.Unsigned_2;  -- p32mx470f512.h:3402
      CTIP     : Extensions.Unsigned_3;  -- p32mx470f512.h:3403
      anon5609 : Extensions.Unsigned_3;  -- p32mx470f512.h:3404
      CS0IS    : Extensions.Unsigned_2;  -- p32mx470f512.h:3405
      CS0IP    : Extensions.Unsigned_3;  -- p32mx470f512.h:3406
      anon5612 : Extensions.Unsigned_3;  -- p32mx470f512.h:3407
      CS1IS    : Extensions.Unsigned_2;  -- p32mx470f512.h:3408
      CS1IP    : Extensions.Unsigned_3;  -- p32mx470f512.h:3409
      anon5615 : Extensions.Unsigned_3;  -- p32mx470f512.h:3410
      INT0IS   : Extensions.Unsigned_2;  -- p32mx470f512.h:3411
      INT0IP   : Extensions.Unsigned_3;  -- p32mx470f512.h:3412
   end record
     with Convention => C_Pass_By_Copy,
     Pack => True,
     Alignment => 4;
   type uu_IPC0bits_t_struct1737 is record
      w : aliased unsigned;  -- p32mx470f512.h:3415
   end record
     with Convention => C_Pass_By_Copy;
   type uu_IPC0bits_t (discr : unsigned := 0) is record
      case discr is
         when 0 => anon5619 : aliased uu_IPC0bits_t_struct1736;  -- p32mx470f512.h:3413
         when 1 => anon5623 : aliased uu_IPC0bits_t_struct1737;  -- p32mx470f512.h:3416
         when others => null;
      end case;
   end record
     with Convention => C_Pass_By_Copy,
     Unchecked_Union => True;  -- p32mx470f512.h:3417

   IPC0bits : aliased uu_IPC0bits_t  -- p32mx470f512.h:3418
     with Import => True,
     Convention => C,
     External_Name => "IPC0";

   IPC0CLR : aliased unsigned  -- p32mx470f512.h:3419
     with Import => True,
     Convention => C,
     External_Name => "IPC0CLR";

   IPC0SET : aliased unsigned  -- p32mx470f512.h:3420
     with Import => True,
     Convention => C,
     External_Name => "IPC0SET";

   IPC0INV : aliased unsigned  -- p32mx470f512.h:3421
     with Import => True,
     Convention => C,
     External_Name => "IPC0INV";

   IPC1 : aliased unsigned  -- p32mx470f512.h:3422
     with Import => True,
     Convention => C,
     External_Name => "IPC1";

   type uu_IPC1bits_t_struct1742 is record
      T1IS     : Extensions.Unsigned_2;  -- p32mx470f512.h:3425
      T1IP     : Extensions.Unsigned_3;  -- p32mx470f512.h:3426
      anon5634 : Extensions.Unsigned_3;  -- p32mx470f512.h:3427
      IC1IS    : Extensions.Unsigned_2;  -- p32mx470f512.h:3428
      IC1IP    : Extensions.Unsigned_3;  -- p32mx470f512.h:3429
      anon5637 : Extensions.Unsigned_3;  -- p32mx470f512.h:3430
      OC1IS    : Extensions.Unsigned_2;  -- p32mx470f512.h:3431
      OC1IP    : Extensions.Unsigned_3;  -- p32mx470f512.h:3432
      anon5640 : Extensions.Unsigned_3;  -- p32mx470f512.h:3433
      INT1IS   : Extensions.Unsigned_2;  -- p32mx470f512.h:3434
      INT1IP   : Extensions.Unsigned_3;  -- p32mx470f512.h:3435
   end record
     with Convention => C_Pass_By_Copy,
     Pack => True,
     Alignment => 4;
   type uu_IPC1bits_t_struct1743 is record
      w : aliased unsigned;  -- p32mx470f512.h:3438
   end record
     with Convention => C_Pass_By_Copy;
   type uu_IPC1bits_t (discr : unsigned := 0) is record
      case discr is
         when 0 => anon5644 : aliased uu_IPC1bits_t_struct1742;  -- p32mx470f512.h:3436
         when 1 => anon5648 : aliased uu_IPC1bits_t_struct1743;  -- p32mx470f512.h:3439
         when others => null;
      end case;
   end record
     with Convention => C_Pass_By_Copy,
     Unchecked_Union => True;  -- p32mx470f512.h:3440

   IPC1bits : aliased uu_IPC1bits_t  -- p32mx470f512.h:3441
     with Import => True,
     Convention => C,
     External_Name => "IPC1";

   IPC1CLR : aliased unsigned  -- p32mx470f512.h:3442
     with Import => True,
     Convention => C,
     External_Name => "IPC1CLR";

   IPC1SET : aliased unsigned  -- p32mx470f512.h:3443
     with Import => True,
     Convention => C,
     External_Name => "IPC1SET";

   IPC1INV : aliased unsigned  -- p32mx470f512.h:3444
     with Import => True,
     Convention => C,
     External_Name => "IPC1INV";

   IPC2 : aliased unsigned  -- p32mx470f512.h:3445
     with Import => True,
     Convention => C,
     External_Name => "IPC2";

   type uu_IPC2bits_t_struct1748 is record
      T2IS     : Extensions.Unsigned_2;  -- p32mx470f512.h:3448
      T2IP     : Extensions.Unsigned_3;  -- p32mx470f512.h:3449
      anon5659 : Extensions.Unsigned_3;  -- p32mx470f512.h:3450
      IC2IS    : Extensions.Unsigned_2;  -- p32mx470f512.h:3451
      IC2IP    : Extensions.Unsigned_3;  -- p32mx470f512.h:3452
      anon5662 : Extensions.Unsigned_3;  -- p32mx470f512.h:3453
      OC2IS    : Extensions.Unsigned_2;  -- p32mx470f512.h:3454
      OC2IP    : Extensions.Unsigned_3;  -- p32mx470f512.h:3455
      anon5665 : Extensions.Unsigned_3;  -- p32mx470f512.h:3456
      INT2IS   : Extensions.Unsigned_2;  -- p32mx470f512.h:3457
      INT2IP   : Extensions.Unsigned_3;  -- p32mx470f512.h:3458
   end record
     with Convention => C_Pass_By_Copy,
     Pack => True,
     Alignment => 4;
   type uu_IPC2bits_t_struct1749 is record
      w : aliased unsigned;  -- p32mx470f512.h:3461
   end record
     with Convention => C_Pass_By_Copy;
   type uu_IPC2bits_t (discr : unsigned := 0) is record
      case discr is
         when 0 => anon5669 : aliased uu_IPC2bits_t_struct1748;  -- p32mx470f512.h:3459
         when 1 => anon5673 : aliased uu_IPC2bits_t_struct1749;  -- p32mx470f512.h:3462
         when others => null;
      end case;
   end record
     with Convention => C_Pass_By_Copy,
     Unchecked_Union => True;  -- p32mx470f512.h:3463

   IPC2bits : aliased uu_IPC2bits_t  -- p32mx470f512.h:3464
     with Import => True,
     Convention => C,
     External_Name => "IPC2";

   IPC2CLR : aliased unsigned  -- p32mx470f512.h:3465
     with Import => True,
     Convention => C,
     External_Name => "IPC2CLR";

   IPC2SET : aliased unsigned  -- p32mx470f512.h:3466
     with Import => True,
     Convention => C,
     External_Name => "IPC2SET";

   IPC2INV : aliased unsigned  -- p32mx470f512.h:3467
     with Import => True,
     Convention => C,
     External_Name => "IPC2INV";

   IPC3 : aliased unsigned  -- p32mx470f512.h:3468
     with Import => True,
     Convention => C,
     External_Name => "IPC3";

   type uu_IPC3bits_t_struct1754 is record
      T3IS     : Extensions.Unsigned_2;  -- p32mx470f512.h:3471
      T3IP     : Extensions.Unsigned_3;  -- p32mx470f512.h:3472
      anon5684 : Extensions.Unsigned_3;  -- p32mx470f512.h:3473
      IC3IS    : Extensions.Unsigned_2;  -- p32mx470f512.h:3474
      IC3IP    : Extensions.Unsigned_3;  -- p32mx470f512.h:3475
      anon5687 : Extensions.Unsigned_3;  -- p32mx470f512.h:3476
      OC3IS    : Extensions.Unsigned_2;  -- p32mx470f512.h:3477
      OC3IP    : Extensions.Unsigned_3;  -- p32mx470f512.h:3478
      anon5690 : Extensions.Unsigned_3;  -- p32mx470f512.h:3479
      INT3IS   : Extensions.Unsigned_2;  -- p32mx470f512.h:3480
      INT3IP   : Extensions.Unsigned_3;  -- p32mx470f512.h:3481
   end record
     with Convention => C_Pass_By_Copy,
     Pack => True,
     Alignment => 4;
   type uu_IPC3bits_t_struct1755 is record
      w : aliased unsigned;  -- p32mx470f512.h:3484
   end record
     with Convention => C_Pass_By_Copy;
   type uu_IPC3bits_t (discr : unsigned := 0) is record
      case discr is
         when 0 => anon5694 : aliased uu_IPC3bits_t_struct1754;  -- p32mx470f512.h:3482
         when 1 => anon5698 : aliased uu_IPC3bits_t_struct1755;  -- p32mx470f512.h:3485
         when others => null;
      end case;
   end record
     with Convention => C_Pass_By_Copy,
     Unchecked_Union => True;  -- p32mx470f512.h:3486

   IPC3bits : aliased uu_IPC3bits_t  -- p32mx470f512.h:3487
     with Import => True,
     Convention => C,
     External_Name => "IPC3";

   IPC3CLR : aliased unsigned  -- p32mx470f512.h:3488
     with Import => True,
     Convention => C,
     External_Name => "IPC3CLR";

   IPC3SET : aliased unsigned  -- p32mx470f512.h:3489
     with Import => True,
     Convention => C,
     External_Name => "IPC3SET";

   IPC3INV : aliased unsigned  -- p32mx470f512.h:3490
     with Import => True,
     Convention => C,
     External_Name => "IPC3INV";

   IPC4 : aliased unsigned  -- p32mx470f512.h:3491
     with Import => True,
     Convention => C,
     External_Name => "IPC4";

   type uu_IPC4bits_t_struct1760 is record
      T4IS     : Extensions.Unsigned_2;  -- p32mx470f512.h:3494
      T4IP     : Extensions.Unsigned_3;  -- p32mx470f512.h:3495
      anon5709 : Extensions.Unsigned_3;  -- p32mx470f512.h:3496
      IC4IS    : Extensions.Unsigned_2;  -- p32mx470f512.h:3497
      IC4IP    : Extensions.Unsigned_3;  -- p32mx470f512.h:3498
      anon5712 : Extensions.Unsigned_3;  -- p32mx470f512.h:3499
      OC4IS    : Extensions.Unsigned_2;  -- p32mx470f512.h:3500
      OC4IP    : Extensions.Unsigned_3;  -- p32mx470f512.h:3501
      anon5715 : Extensions.Unsigned_3;  -- p32mx470f512.h:3502
      INT4IS   : Extensions.Unsigned_2;  -- p32mx470f512.h:3503
      INT4IP   : Extensions.Unsigned_3;  -- p32mx470f512.h:3504
   end record
     with Convention => C_Pass_By_Copy,
     Pack => True,
     Alignment => 4;
   type uu_IPC4bits_t_struct1761 is record
      w : aliased unsigned;  -- p32mx470f512.h:3507
   end record
     with Convention => C_Pass_By_Copy;
   type uu_IPC4bits_t (discr : unsigned := 0) is record
      case discr is
         when 0 => anon5719 : aliased uu_IPC4bits_t_struct1760;  -- p32mx470f512.h:3505
         when 1 => anon5723 : aliased uu_IPC4bits_t_struct1761;  -- p32mx470f512.h:3508
         when others => null;
      end case;
   end record
     with Convention => C_Pass_By_Copy,
     Unchecked_Union => True;  -- p32mx470f512.h:3509

   IPC4bits : aliased uu_IPC4bits_t  -- p32mx470f512.h:3510
     with Import => True,
     Convention => C,
     External_Name => "IPC4";

   IPC4CLR : aliased unsigned  -- p32mx470f512.h:3511
     with Import => True,
     Convention => C,
     External_Name => "IPC4CLR";

   IPC4SET : aliased unsigned  -- p32mx470f512.h:3512
     with Import => True,
     Convention => C,
     External_Name => "IPC4SET";

   IPC4INV : aliased unsigned  -- p32mx470f512.h:3513
     with Import => True,
     Convention => C,
     External_Name => "IPC4INV";

   IPC5 : aliased unsigned  -- p32mx470f512.h:3514
     with Import => True,
     Convention => C,
     External_Name => "IPC5";

   type uu_IPC5bits_t_struct1766 is record
      T5IS     : Extensions.Unsigned_2;  -- p32mx470f512.h:3517
      T5IP     : Extensions.Unsigned_3;  -- p32mx470f512.h:3518
      anon5734 : Extensions.Unsigned_3;  -- p32mx470f512.h:3519
      IC5IS    : Extensions.Unsigned_2;  -- p32mx470f512.h:3520
      IC5IP    : Extensions.Unsigned_3;  -- p32mx470f512.h:3521
      anon5737 : Extensions.Unsigned_3;  -- p32mx470f512.h:3522
      OC5IS    : Extensions.Unsigned_2;  -- p32mx470f512.h:3523
      OC5IP    : Extensions.Unsigned_3;  -- p32mx470f512.h:3524
      anon5740 : Extensions.Unsigned_3;  -- p32mx470f512.h:3525
      AD1IS    : Extensions.Unsigned_2;  -- p32mx470f512.h:3526
      AD1IP    : Extensions.Unsigned_3;  -- p32mx470f512.h:3527
   end record
     with Convention => C_Pass_By_Copy,
     Pack => True,
     Alignment => 4;
   type uu_IPC5bits_t_struct1767 is record
      w : aliased unsigned;  -- p32mx470f512.h:3530
   end record
     with Convention => C_Pass_By_Copy;
   type uu_IPC5bits_t (discr : unsigned := 0) is record
      case discr is
         when 0 => anon5744 : aliased uu_IPC5bits_t_struct1766;  -- p32mx470f512.h:3528
         when 1 => anon5748 : aliased uu_IPC5bits_t_struct1767;  -- p32mx470f512.h:3531
         when others => null;
      end case;
   end record
     with Convention => C_Pass_By_Copy,
     Unchecked_Union => True;  -- p32mx470f512.h:3532

   IPC5bits : aliased uu_IPC5bits_t  -- p32mx470f512.h:3533
     with Import => True,
     Convention => C,
     External_Name => "IPC5";

   IPC5CLR : aliased unsigned  -- p32mx470f512.h:3534
     with Import => True,
     Convention => C,
     External_Name => "IPC5CLR";

   IPC5SET : aliased unsigned  -- p32mx470f512.h:3535
     with Import => True,
     Convention => C,
     External_Name => "IPC5SET";

   IPC5INV : aliased unsigned  -- p32mx470f512.h:3536
     with Import => True,
     Convention => C,
     External_Name => "IPC5INV";

   IPC6 : aliased unsigned  -- p32mx470f512.h:3537
     with Import => True,
     Convention => C,
     External_Name => "IPC6";

   type uu_IPC6bits_t_struct1772 is record
      FSCMIS   : Extensions.Unsigned_2;  -- p32mx470f512.h:3540
      FSCMIP   : Extensions.Unsigned_3;  -- p32mx470f512.h:3541
      anon5759 : Extensions.Unsigned_3;  -- p32mx470f512.h:3542
      RTCCIS   : Extensions.Unsigned_2;  -- p32mx470f512.h:3543
      RTCCIP   : Extensions.Unsigned_3;  -- p32mx470f512.h:3544
      anon5762 : Extensions.Unsigned_3;  -- p32mx470f512.h:3545
      FCEIS    : Extensions.Unsigned_2;  -- p32mx470f512.h:3546
      FCEIP    : Extensions.Unsigned_3;  -- p32mx470f512.h:3547
      anon5765 : Extensions.Unsigned_3;  -- p32mx470f512.h:3548
      CMP1IS   : Extensions.Unsigned_2;  -- p32mx470f512.h:3549
      CMP1IP   : Extensions.Unsigned_3;  -- p32mx470f512.h:3550
   end record
     with Convention => C_Pass_By_Copy,
     Pack => True,
     Alignment => 4;
   type uu_IPC6bits_t_struct1773 is record
      w : aliased unsigned;  -- p32mx470f512.h:3553
   end record
     with Convention => C_Pass_By_Copy;
   type uu_IPC6bits_t (discr : unsigned := 0) is record
      case discr is
         when 0 => anon5769 : aliased uu_IPC6bits_t_struct1772;  -- p32mx470f512.h:3551
         when 1 => anon5773 : aliased uu_IPC6bits_t_struct1773;  -- p32mx470f512.h:3554
         when others => null;
      end case;
   end record
     with Convention => C_Pass_By_Copy,
     Unchecked_Union => True;  -- p32mx470f512.h:3555

   IPC6bits : aliased uu_IPC6bits_t  -- p32mx470f512.h:3556
     with Import => True,
     Convention => C,
     External_Name => "IPC6";

   IPC6CLR : aliased unsigned  -- p32mx470f512.h:3557
     with Import => True,
     Convention => C,
     External_Name => "IPC6CLR";

   IPC6SET : aliased unsigned  -- p32mx470f512.h:3558
     with Import => True,
     Convention => C,
     External_Name => "IPC6SET";

   IPC6INV : aliased unsigned  -- p32mx470f512.h:3559
     with Import => True,
     Convention => C,
     External_Name => "IPC6INV";

   IPC7 : aliased unsigned  -- p32mx470f512.h:3560
     with Import => True,
     Convention => C,
     External_Name => "IPC7";

   type uu_IPC7bits_t_struct1778 is record
      CMP2IS   : Extensions.Unsigned_2;  -- p32mx470f512.h:3563
      CMP2IP   : Extensions.Unsigned_3;  -- p32mx470f512.h:3564
      anon5784 : Extensions.Unsigned_3;  -- p32mx470f512.h:3565
      USBIS    : Extensions.Unsigned_2;  -- p32mx470f512.h:3566
      USBIP    : Extensions.Unsigned_3;  -- p32mx470f512.h:3567
      anon5787 : Extensions.Unsigned_3;  -- p32mx470f512.h:3568
      SPI1IS   : Extensions.Unsigned_2;  -- p32mx470f512.h:3569
      SPI1IP   : Extensions.Unsigned_3;  -- p32mx470f512.h:3570
      anon5790 : Extensions.Unsigned_3;  -- p32mx470f512.h:3571
      U1IS     : Extensions.Unsigned_2;  -- p32mx470f512.h:3572
      U1IP     : Extensions.Unsigned_3;  -- p32mx470f512.h:3573
   end record
     with Convention => C_Pass_By_Copy,
     Pack => True,
     Alignment => 4;
   type uu_IPC7bits_t_struct1779 is record
      w : aliased unsigned;  -- p32mx470f512.h:3576
   end record
     with Convention => C_Pass_By_Copy;
   type uu_IPC7bits_t (discr : unsigned := 0) is record
      case discr is
         when 0 => anon5794 : aliased uu_IPC7bits_t_struct1778;  -- p32mx470f512.h:3574
         when 1 => anon5798 : aliased uu_IPC7bits_t_struct1779;  -- p32mx470f512.h:3577
         when others => null;
      end case;
   end record
     with Convention => C_Pass_By_Copy,
     Unchecked_Union => True;  -- p32mx470f512.h:3578

   IPC7bits : aliased uu_IPC7bits_t  -- p32mx470f512.h:3579
     with Import => True,
     Convention => C,
     External_Name => "IPC7";

   IPC7CLR : aliased unsigned  -- p32mx470f512.h:3580
     with Import => True,
     Convention => C,
     External_Name => "IPC7CLR";

   IPC7SET : aliased unsigned  -- p32mx470f512.h:3581
     with Import => True,
     Convention => C,
     External_Name => "IPC7SET";

   IPC7INV : aliased unsigned  -- p32mx470f512.h:3582
     with Import => True,
     Convention => C,
     External_Name => "IPC7INV";

   IPC8 : aliased unsigned  -- p32mx470f512.h:3583
     with Import => True,
     Convention => C,
     External_Name => "IPC8";

   type uu_IPC8bits_t_struct1784 is record
      I2C1IS   : Extensions.Unsigned_2;  -- p32mx470f512.h:3586
      I2C1IP   : Extensions.Unsigned_3;  -- p32mx470f512.h:3587
      anon5809 : Extensions.Unsigned_3;  -- p32mx470f512.h:3588
      CNIS     : Extensions.Unsigned_2;  -- p32mx470f512.h:3589
      CNIP     : Extensions.Unsigned_3;  -- p32mx470f512.h:3590
      anon5812 : Extensions.Unsigned_3;  -- p32mx470f512.h:3591
      PMPIS    : Extensions.Unsigned_2;  -- p32mx470f512.h:3592
      PMPIP    : Extensions.Unsigned_3;  -- p32mx470f512.h:3593
      anon5815 : Extensions.Unsigned_3;  -- p32mx470f512.h:3594
      SPI2IS   : Extensions.Unsigned_2;  -- p32mx470f512.h:3595
      SPI2IP   : Extensions.Unsigned_3;  -- p32mx470f512.h:3596
   end record
     with Convention => C_Pass_By_Copy,
     Pack => True,
     Alignment => 4;
   type uu_IPC8bits_t_struct1785 is record
      w : aliased unsigned;  -- p32mx470f512.h:3599
   end record
     with Convention => C_Pass_By_Copy;
   type uu_IPC8bits_t (discr : unsigned := 0) is record
      case discr is
         when 0 => anon5819 : aliased uu_IPC8bits_t_struct1784;  -- p32mx470f512.h:3597
         when 1 => anon5823 : aliased uu_IPC8bits_t_struct1785;  -- p32mx470f512.h:3600
         when others => null;
      end case;
   end record
     with Convention => C_Pass_By_Copy,
     Unchecked_Union => True;  -- p32mx470f512.h:3601

   IPC8bits : aliased uu_IPC8bits_t  -- p32mx470f512.h:3602
     with Import => True,
     Convention => C,
     External_Name => "IPC8";

   IPC8CLR : aliased unsigned  -- p32mx470f512.h:3603
     with Import => True,
     Convention => C,
     External_Name => "IPC8CLR";

   IPC8SET : aliased unsigned  -- p32mx470f512.h:3604
     with Import => True,
     Convention => C,
     External_Name => "IPC8SET";

   IPC8INV : aliased unsigned  -- p32mx470f512.h:3605
     with Import => True,
     Convention => C,
     External_Name => "IPC8INV";

   IPC9 : aliased unsigned  -- p32mx470f512.h:3606
     with Import => True,
     Convention => C,
     External_Name => "IPC9";

   type uu_IPC9bits_t_struct1790 is record
      U2IS     : Extensions.Unsigned_2;  -- p32mx470f512.h:3609
      U2IP     : Extensions.Unsigned_3;  -- p32mx470f512.h:3610
      anon5834 : Extensions.Unsigned_3;  -- p32mx470f512.h:3611
      I2C2IS   : Extensions.Unsigned_2;  -- p32mx470f512.h:3612
      I2C2IP   : Extensions.Unsigned_3;  -- p32mx470f512.h:3613
      anon5837 : Extensions.Unsigned_3;  -- p32mx470f512.h:3614
      U3IS     : Extensions.Unsigned_2;  -- p32mx470f512.h:3615
      U3IP     : Extensions.Unsigned_3;  -- p32mx470f512.h:3616
      anon5840 : Extensions.Unsigned_3;  -- p32mx470f512.h:3617
      U4IS     : Extensions.Unsigned_2;  -- p32mx470f512.h:3618
      U4IP     : Extensions.Unsigned_3;  -- p32mx470f512.h:3619
   end record
     with Convention => C_Pass_By_Copy,
     Pack => True,
     Alignment => 4;
   type uu_IPC9bits_t_struct1791 is record
      w : aliased unsigned;  -- p32mx470f512.h:3622
   end record
     with Convention => C_Pass_By_Copy;
   type uu_IPC9bits_t (discr : unsigned := 0) is record
      case discr is
         when 0 => anon5844 : aliased uu_IPC9bits_t_struct1790;  -- p32mx470f512.h:3620
         when 1 => anon5848 : aliased uu_IPC9bits_t_struct1791;  -- p32mx470f512.h:3623
         when others => null;
      end case;
   end record
     with Convention => C_Pass_By_Copy,
     Unchecked_Union => True;  -- p32mx470f512.h:3624

   IPC9bits : aliased uu_IPC9bits_t  -- p32mx470f512.h:3625
     with Import => True,
     Convention => C,
     External_Name => "IPC9";

   IPC9CLR : aliased unsigned  -- p32mx470f512.h:3626
     with Import => True,
     Convention => C,
     External_Name => "IPC9CLR";

   IPC9SET : aliased unsigned  -- p32mx470f512.h:3627
     with Import => True,
     Convention => C,
     External_Name => "IPC9SET";

   IPC9INV : aliased unsigned  -- p32mx470f512.h:3628
     with Import => True,
     Convention => C,
     External_Name => "IPC9INV";

   IPC10 : aliased unsigned  -- p32mx470f512.h:3629
     with Import => True,
     Convention => C,
     External_Name => "IPC10";

   type uu_IPC10bits_t_struct1796 is record
      parent   : aliased unsigned_char;
      CTMUIP   : Extensions.Unsigned_2;  -- p32mx470f512.h:3633
      CTMUIS   : Extensions.Unsigned_3;  -- p32mx470f512.h:3634
      anon5860 : Extensions.Unsigned_3;  -- p32mx470f512.h:3635
      DMA0IS   : Extensions.Unsigned_2;  -- p32mx470f512.h:3636
      DMA0IP   : Extensions.Unsigned_3;  -- p32mx470f512.h:3637
      anon5863 : Extensions.Unsigned_3;  -- p32mx470f512.h:3638
      DMA1IS   : Extensions.Unsigned_2;  -- p32mx470f512.h:3639
      DMA1IP   : Extensions.Unsigned_3;  -- p32mx470f512.h:3640
   end record
     with Convention => C_Pass_By_Copy,
     Pack => True,
     Alignment => 4;
   type uu_IPC10bits_t_struct1797 is record
      w : aliased unsigned;  -- p32mx470f512.h:3643
   end record
     with Convention => C_Pass_By_Copy;
   type uu_IPC10bits_t (discr : unsigned := 0) is record
      case discr is
         when 0 => anon5867 : aliased uu_IPC10bits_t_struct1796;  -- p32mx470f512.h:3641
         when 1 => anon5871 : aliased uu_IPC10bits_t_struct1797;  -- p32mx470f512.h:3644
         when others => null;
      end case;
   end record
     with Convention => C_Pass_By_Copy,
     Unchecked_Union => True;  -- p32mx470f512.h:3645

   IPC10bits : aliased uu_IPC10bits_t  -- p32mx470f512.h:3646
     with Import => True,
     Convention => C,
     External_Name => "IPC10";

   IPC10CLR : aliased unsigned  -- p32mx470f512.h:3647
     with Import => True,
     Convention => C,
     External_Name => "IPC10CLR";

   IPC10SET : aliased unsigned  -- p32mx470f512.h:3648
     with Import => True,
     Convention => C,
     External_Name => "IPC10SET";

   IPC10INV : aliased unsigned  -- p32mx470f512.h:3649
     with Import => True,
     Convention => C,
     External_Name => "IPC10INV";

   IPC11 : aliased unsigned  -- p32mx470f512.h:3650
     with Import => True,
     Convention => C,
     External_Name => "IPC11";

   type uu_IPC11bits_t_struct1802 is record
      DMA2IS   : Extensions.Unsigned_2;  -- p32mx470f512.h:3653
      DMA2IP   : Extensions.Unsigned_3;  -- p32mx470f512.h:3654
      anon5882 : Extensions.Unsigned_3;  -- p32mx470f512.h:3655
      DMA3IS   : Extensions.Unsigned_2;  -- p32mx470f512.h:3656
      DMA3IP   : Extensions.Unsigned_3;  -- p32mx470f512.h:3657
   end record
     with Convention => C_Pass_By_Copy,
     Pack => True,
     Alignment => 4;
   type uu_IPC11bits_t_struct1803 is record
      w : aliased unsigned;  -- p32mx470f512.h:3660
   end record
     with Convention => C_Pass_By_Copy;
   type uu_IPC11bits_t (discr : unsigned := 0) is record
      case discr is
         when 0 => anon5886 : aliased uu_IPC11bits_t_struct1802;  -- p32mx470f512.h:3658
         when 1 => anon5890 : aliased uu_IPC11bits_t_struct1803;  -- p32mx470f512.h:3661
         when others => null;
      end case;
   end record
     with Convention => C_Pass_By_Copy,
     Unchecked_Union => True;  -- p32mx470f512.h:3662

   IPC11bits : aliased uu_IPC11bits_t  -- p32mx470f512.h:3663
     with Import => True,
     Convention => C,
     External_Name => "IPC11";

   IPC11CLR : aliased unsigned  -- p32mx470f512.h:3664
     with Import => True,
     Convention => C,
     External_Name => "IPC11CLR";

   IPC11SET : aliased unsigned  -- p32mx470f512.h:3665
     with Import => True,
     Convention => C,
     External_Name => "IPC11SET";

   IPC11INV : aliased unsigned  -- p32mx470f512.h:3666
     with Import => True,
     Convention => C,
     External_Name => "IPC11INV";

   BMXCON : aliased unsigned  -- p32mx470f512.h:3667
     with Import => True,
     Convention => C,
     External_Name => "BMXCON";

   type uu_BMXCONbits_t_struct1808 is record
      BMXARB    : Extensions.Unsigned_3;  -- p32mx470f512.h:3670
      anon5900  : Extensions.Unsigned_3;  -- p32mx470f512.h:3671
      BMXWSDRM  : Extensions.Unsigned_1;  -- p32mx470f512.h:3672
      anon5902  : Extensions.Unsigned_9;  -- p32mx470f512.h:3673
      BMXERRIS  : Extensions.Unsigned_1;  -- p32mx470f512.h:3674
      BMXERRDS  : Extensions.Unsigned_1;  -- p32mx470f512.h:3675
      BMXERRDMA : Extensions.Unsigned_1;  -- p32mx470f512.h:3676
      BMXERRICD : Extensions.Unsigned_1;  -- p32mx470f512.h:3677
      BMXERRIXI : Extensions.Unsigned_1;  -- p32mx470f512.h:3678
      anon5908  : Extensions.Unsigned_5;  -- p32mx470f512.h:3679
      BMXCHEDMA : Extensions.Unsigned_1;  -- p32mx470f512.h:3680
   end record
     with Convention => C_Pass_By_Copy,
     Pack => True,
     Alignment => 4;
   type uu_BMXCONbits_t_struct1809 is record
      w : aliased unsigned;  -- p32mx470f512.h:3683
   end record
     with Convention => C_Pass_By_Copy;
   type uu_BMXCONbits_t (discr : unsigned := 0) is record
      case discr is
         when 0 => anon5911 : aliased uu_BMXCONbits_t_struct1808;  -- p32mx470f512.h:3681
         when 1 => anon5915 : aliased uu_BMXCONbits_t_struct1809;  -- p32mx470f512.h:3684
         when others => null;
      end case;
   end record
     with Convention => C_Pass_By_Copy,
     Unchecked_Union => True;  -- p32mx470f512.h:3685

   BMXCONbits : aliased uu_BMXCONbits_t  -- p32mx470f512.h:3686
     with Import => True,
     Convention => C,
     External_Name => "BMXCON";

   BMXCONCLR : aliased unsigned  -- p32mx470f512.h:3687
     with Import => True,
     Convention => C,
     External_Name => "BMXCONCLR";

   BMXCONSET : aliased unsigned  -- p32mx470f512.h:3688
     with Import => True,
     Convention => C,
     External_Name => "BMXCONSET";

   BMXCONINV : aliased unsigned  -- p32mx470f512.h:3689
     with Import => True,
     Convention => C,
     External_Name => "BMXCONINV";

   BMXDKPBA : aliased unsigned  -- p32mx470f512.h:3690
     with Import => True,
     Convention => C,
     External_Name => "BMXDKPBA";

   BMXDKPBACLR : aliased unsigned  -- p32mx470f512.h:3691
     with Import => True,
     Convention => C,
     External_Name => "BMXDKPBACLR";

   BMXDKPBASET : aliased unsigned  -- p32mx470f512.h:3692
     with Import => True,
     Convention => C,
     External_Name => "BMXDKPBASET";

   BMXDKPBAINV : aliased unsigned  -- p32mx470f512.h:3693
     with Import => True,
     Convention => C,
     External_Name => "BMXDKPBAINV";

   BMXDUDBA : aliased unsigned  -- p32mx470f512.h:3694
     with Import => True,
     Convention => C,
     External_Name => "BMXDUDBA";

   BMXDUDBACLR : aliased unsigned  -- p32mx470f512.h:3695
     with Import => True,
     Convention => C,
     External_Name => "BMXDUDBACLR";

   BMXDUDBASET : aliased unsigned  -- p32mx470f512.h:3696
     with Import => True,
     Convention => C,
     External_Name => "BMXDUDBASET";

   BMXDUDBAINV : aliased unsigned  -- p32mx470f512.h:3697
     with Import => True,
     Convention => C,
     External_Name => "BMXDUDBAINV";

   BMXDUPBA : aliased unsigned  -- p32mx470f512.h:3698
     with Import => True,
     Convention => C,
     External_Name => "BMXDUPBA";

   BMXDUPBACLR : aliased unsigned  -- p32mx470f512.h:3699
     with Import => True,
     Convention => C,
     External_Name => "BMXDUPBACLR";

   BMXDUPBASET : aliased unsigned  -- p32mx470f512.h:3700
     with Import => True,
     Convention => C,
     External_Name => "BMXDUPBASET";

   BMXDUPBAINV : aliased unsigned  -- p32mx470f512.h:3701
     with Import => True,
     Convention => C,
     External_Name => "BMXDUPBAINV";

   BMXDRMSZ : aliased unsigned  -- p32mx470f512.h:3702
     with Import => True,
     Convention => C,
     External_Name => "BMXDRMSZ";

   BMXPUPBA : aliased unsigned  -- p32mx470f512.h:3703
     with Import => True,
     Convention => C,
     External_Name => "BMXPUPBA";

   BMXPUPBACLR : aliased unsigned  -- p32mx470f512.h:3704
     with Import => True,
     Convention => C,
     External_Name => "BMXPUPBACLR";

   BMXPUPBASET : aliased unsigned  -- p32mx470f512.h:3705
     with Import => True,
     Convention => C,
     External_Name => "BMXPUPBASET";

   BMXPUPBAINV : aliased unsigned  -- p32mx470f512.h:3706
     with Import => True,
     Convention => C,
     External_Name => "BMXPUPBAINV";

   BMXPFMSZ : aliased unsigned  -- p32mx470f512.h:3707
     with Import => True,
     Convention => C,
     External_Name => "BMXPFMSZ";

   BMXBOOTSZ : aliased unsigned  -- p32mx470f512.h:3708
     with Import => True,
     Convention => C,
     External_Name => "BMXBOOTSZ";

   DMACON : aliased unsigned  -- p32mx470f512.h:3709
     with Import => True,
     Convention => C,
     External_Name => "DMACON";

   type uu_DMACONbits_t_struct1814 is record
      anon5943 : Extensions.Unsigned_11;  -- p32mx470f512.h:3712
      DMABUSY  : Extensions.Unsigned_1;  -- p32mx470f512.h:3713
      SUSPEND  : Extensions.Unsigned_1;  -- p32mx470f512.h:3714
      anon5946 : Extensions.Unsigned_2;  -- p32mx470f512.h:3715
      ON       : Extensions.Unsigned_1;  -- p32mx470f512.h:3716
   end record
     with Convention => C_Pass_By_Copy,
     Pack => True,
     Alignment => 4;
   type uu_DMACONbits_t_struct1815 is record
      w : aliased unsigned;  -- p32mx470f512.h:3719
   end record
     with Convention => C_Pass_By_Copy;
   type uu_DMACONbits_t (discr : unsigned := 0) is record
      case discr is
         when 0 => anon5949 : aliased uu_DMACONbits_t_struct1814;  -- p32mx470f512.h:3717
         when 1 => anon5953 : aliased uu_DMACONbits_t_struct1815;  -- p32mx470f512.h:3720
         when others => null;
      end case;
   end record
     with Convention => C_Pass_By_Copy,
     Unchecked_Union => True;  -- p32mx470f512.h:3721

   DMACONbits : aliased uu_DMACONbits_t  -- p32mx470f512.h:3722
     with Import => True,
     Convention => C,
     External_Name => "DMACON";

   DMACONCLR : aliased unsigned  -- p32mx470f512.h:3723
     with Import => True,
     Convention => C,
     External_Name => "DMACONCLR";

   DMACONSET : aliased unsigned  -- p32mx470f512.h:3724
     with Import => True,
     Convention => C,
     External_Name => "DMACONSET";

   DMACONINV : aliased unsigned  -- p32mx470f512.h:3725
     with Import => True,
     Convention => C,
     External_Name => "DMACONINV";

   DMASTAT : aliased unsigned  -- p32mx470f512.h:3726
     with Import => True,
     Convention => C,
     External_Name => "DMASTAT";

   type uu_DMASTATbits_t_struct1820 is record
      DMACH : Extensions.Unsigned_3;  -- p32mx470f512.h:3729
      RDWR  : Extensions.Unsigned_1;  -- p32mx470f512.h:3730
   end record
     with Convention => C_Pass_By_Copy,
     Pack => True,
     Alignment => 4;
   type uu_DMASTATbits_t_struct1821 is record
      w : aliased unsigned;  -- p32mx470f512.h:3733
   end record
     with Convention => C_Pass_By_Copy;
   type uu_DMASTATbits_t (discr : unsigned := 0) is record
      case discr is
         when 0 => anon5965 : aliased uu_DMASTATbits_t_struct1820;  -- p32mx470f512.h:3731
         when 1 => anon5969 : aliased uu_DMASTATbits_t_struct1821;  -- p32mx470f512.h:3734
         when others => null;
      end case;
   end record
     with Convention => C_Pass_By_Copy,
     Unchecked_Union => True;  -- p32mx470f512.h:3735

   DMASTATbits : aliased uu_DMASTATbits_t  -- p32mx470f512.h:3736
     with Import => True,
     Convention => C,
     External_Name => "DMASTAT";

   DMASTATCLR : aliased unsigned  -- p32mx470f512.h:3737
     with Import => True,
     Convention => C,
     External_Name => "DMASTATCLR";

   DMASTATSET : aliased unsigned  -- p32mx470f512.h:3738
     with Import => True,
     Convention => C,
     External_Name => "DMASTATSET";

   DMASTATINV : aliased unsigned  -- p32mx470f512.h:3739
     with Import => True,
     Convention => C,
     External_Name => "DMASTATINV";

   DMAADDR : aliased unsigned  -- p32mx470f512.h:3740
     with Import => True,
     Convention => C,
     External_Name => "DMAADDR";

   DMAADDRCLR : aliased unsigned  -- p32mx470f512.h:3741
     with Import => True,
     Convention => C,
     External_Name => "DMAADDRCLR";

   DMAADDRSET : aliased unsigned  -- p32mx470f512.h:3742
     with Import => True,
     Convention => C,
     External_Name => "DMAADDRSET";

   DMAADDRINV : aliased unsigned  -- p32mx470f512.h:3743
     with Import => True,
     Convention => C,
     External_Name => "DMAADDRINV";

   DCRCCON : aliased unsigned  -- p32mx470f512.h:3744
     with Import => True,
     Convention => C,
     External_Name => "DCRCCON";

   type uu_DCRCCONbits_t_struct1826 is record
      CRCCH    : Extensions.Unsigned_3;  -- p32mx470f512.h:3747
      anon5983 : Extensions.Unsigned_2;  -- p32mx470f512.h:3748
      CRCTYP   : Extensions.Unsigned_1;  -- p32mx470f512.h:3749
      CRCAPP   : Extensions.Unsigned_1;  -- p32mx470f512.h:3750
      CRCEN    : Extensions.Unsigned_1;  -- p32mx470f512.h:3751
      PLEN     : Extensions.Unsigned_5;  -- p32mx470f512.h:3752
      anon5988 : Extensions.Unsigned_11;  -- p32mx470f512.h:3753
      BITO     : Extensions.Unsigned_1;  -- p32mx470f512.h:3754
      anon5990 : Extensions.Unsigned_2;  -- p32mx470f512.h:3755
      WBO      : Extensions.Unsigned_1;  -- p32mx470f512.h:3756
      BYTO     : Extensions.Unsigned_2;  -- p32mx470f512.h:3757
   end record
     with Convention => C_Pass_By_Copy,
     Pack => True,
     Alignment => 4;
   type uu_DCRCCONbits_t_struct1827 is record
      w : aliased unsigned;  -- p32mx470f512.h:3760
   end record
     with Convention => C_Pass_By_Copy;
   type uu_DCRCCONbits_t (discr : unsigned := 0) is record
      case discr is
         when 0 => anon5994 : aliased uu_DCRCCONbits_t_struct1826;  -- p32mx470f512.h:3758
         when 1 => anon5998 : aliased uu_DCRCCONbits_t_struct1827;  -- p32mx470f512.h:3761
         when others => null;
      end case;
   end record
     with Convention => C_Pass_By_Copy,
     Unchecked_Union => True;  -- p32mx470f512.h:3762

   DCRCCONbits : aliased uu_DCRCCONbits_t  -- p32mx470f512.h:3763
     with Import => True,
     Convention => C,
     External_Name => "DCRCCON";

   DCRCCONCLR : aliased unsigned  -- p32mx470f512.h:3764
     with Import => True,
     Convention => C,
     External_Name => "DCRCCONCLR";

   DCRCCONSET : aliased unsigned  -- p32mx470f512.h:3765
     with Import => True,
     Convention => C,
     External_Name => "DCRCCONSET";

   DCRCCONINV : aliased unsigned  -- p32mx470f512.h:3766
     with Import => True,
     Convention => C,
     External_Name => "DCRCCONINV";

   DCRCDATA : aliased unsigned  -- p32mx470f512.h:3767
     with Import => True,
     Convention => C,
     External_Name => "DCRCDATA";

   DCRCDATACLR : aliased unsigned  -- p32mx470f512.h:3768
     with Import => True,
     Convention => C,
     External_Name => "DCRCDATACLR";

   DCRCDATASET : aliased unsigned  -- p32mx470f512.h:3769
     with Import => True,
     Convention => C,
     External_Name => "DCRCDATASET";

   DCRCDATAINV : aliased unsigned  -- p32mx470f512.h:3770
     with Import => True,
     Convention => C,
     External_Name => "DCRCDATAINV";

   DCRCXOR : aliased unsigned  -- p32mx470f512.h:3771
     with Import => True,
     Convention => C,
     External_Name => "DCRCXOR";

   DCRCXORCLR : aliased unsigned  -- p32mx470f512.h:3772
     with Import => True,
     Convention => C,
     External_Name => "DCRCXORCLR";

   DCRCXORSET : aliased unsigned  -- p32mx470f512.h:3773
     with Import => True,
     Convention => C,
     External_Name => "DCRCXORSET";

   DCRCXORINV : aliased unsigned  -- p32mx470f512.h:3774
     with Import => True,
     Convention => C,
     External_Name => "DCRCXORINV";

   DCH0CON : aliased unsigned  -- p32mx470f512.h:3775
     with Import => True,
     Convention => C,
     External_Name => "DCH0CON";

   type uu_DCH0CONbits_t_struct1832 is record
      CHPRI    : Extensions.Unsigned_2;  -- p32mx470f512.h:3778
      CHEDET   : Extensions.Unsigned_1;  -- p32mx470f512.h:3779
      anon6017 : Extensions.Unsigned_1;  -- p32mx470f512.h:3780
      CHAEN    : Extensions.Unsigned_1;  -- p32mx470f512.h:3781
      CHCHN    : Extensions.Unsigned_1;  -- p32mx470f512.h:3782
      CHAED    : Extensions.Unsigned_1;  -- p32mx470f512.h:3783
      CHEN     : Extensions.Unsigned_1;  -- p32mx470f512.h:3784
      CHCHNS   : Extensions.Unsigned_1;  -- p32mx470f512.h:3785
      anon6023 : Extensions.Unsigned_6;  -- p32mx470f512.h:3786
      CHBUSY   : Extensions.Unsigned_1;  -- p32mx470f512.h:3787
   end record
     with Convention => C_Pass_By_Copy,
     Pack => True,
     Alignment => 4;
   type uu_DCH0CONbits_t_struct1833 is record
      w : aliased unsigned;  -- p32mx470f512.h:3790
   end record
     with Convention => C_Pass_By_Copy;
   type uu_DCH0CONbits_t (discr : unsigned := 0) is record
      case discr is
         when 0 => anon6026 : aliased uu_DCH0CONbits_t_struct1832;  -- p32mx470f512.h:3788
         when 1 => anon6030 : aliased uu_DCH0CONbits_t_struct1833;  -- p32mx470f512.h:3791
         when others => null;
      end case;
   end record
     with Convention => C_Pass_By_Copy,
     Unchecked_Union => True;  -- p32mx470f512.h:3792

   DCH0CONbits : aliased uu_DCH0CONbits_t  -- p32mx470f512.h:3793
     with Import => True,
     Convention => C,
     External_Name => "DCH0CON";

   DCH0CONCLR : aliased unsigned  -- p32mx470f512.h:3794
     with Import => True,
     Convention => C,
     External_Name => "DCH0CONCLR";

   DCH0CONSET : aliased unsigned  -- p32mx470f512.h:3795
     with Import => True,
     Convention => C,
     External_Name => "DCH0CONSET";

   DCH0CONINV : aliased unsigned  -- p32mx470f512.h:3796
     with Import => True,
     Convention => C,
     External_Name => "DCH0CONINV";

   DCH0ECON : aliased unsigned  -- p32mx470f512.h:3797
     with Import => True,
     Convention => C,
     External_Name => "DCH0ECON";

   type uu_DCH0ECONbits_t_struct1838 is record
      anon6039 : Extensions.Unsigned_3;  -- p32mx470f512.h:3800
      AIRQEN   : Extensions.Unsigned_1;  -- p32mx470f512.h:3801
      SIRQEN   : Extensions.Unsigned_1;  -- p32mx470f512.h:3802
      PATEN    : Extensions.Unsigned_1;  -- p32mx470f512.h:3803
      CABORT   : Extensions.Unsigned_1;  -- p32mx470f512.h:3804
      CFORCE   : Extensions.Unsigned_1;  -- p32mx470f512.h:3805
      CHSIRQ   : aliased unsigned_char;  -- p32mx470f512.h:3806
      CHAIRQ   : aliased unsigned_char;  -- p32mx470f512.h:3807
   end record
     with Convention => C_Pass_By_Copy,
     Pack => True,
     Alignment => 4;
   type uu_DCH0ECONbits_t_struct1839 is record
      w : aliased unsigned;  -- p32mx470f512.h:3810
   end record
     with Convention => C_Pass_By_Copy;
   type uu_DCH0ECONbits_t (discr : unsigned := 0) is record
      case discr is
         when 0 => anon6048 : aliased uu_DCH0ECONbits_t_struct1838;  -- p32mx470f512.h:3808
         when 1 => anon6052 : aliased uu_DCH0ECONbits_t_struct1839;  -- p32mx470f512.h:3811
         when others => null;
      end case;
   end record
     with Convention => C_Pass_By_Copy,
     Unchecked_Union => True;  -- p32mx470f512.h:3812

   DCH0ECONbits : aliased uu_DCH0ECONbits_t  -- p32mx470f512.h:3813
     with Import => True,
     Convention => C,
     External_Name => "DCH0ECON";

   DCH0ECONCLR : aliased unsigned  -- p32mx470f512.h:3814
     with Import => True,
     Convention => C,
     External_Name => "DCH0ECONCLR";

   DCH0ECONSET : aliased unsigned  -- p32mx470f512.h:3815
     with Import => True,
     Convention => C,
     External_Name => "DCH0ECONSET";

   DCH0ECONINV : aliased unsigned  -- p32mx470f512.h:3816
     with Import => True,
     Convention => C,
     External_Name => "DCH0ECONINV";

   DCH0INT : aliased unsigned  -- p32mx470f512.h:3817
     with Import => True,
     Convention => C,
     External_Name => "DCH0INT";

   type uu_DCH0INTbits_t_struct1844 is record
      CHERIF  : Extensions.Unsigned_1;  -- p32mx470f512.h:3820
      CHTAIF  : Extensions.Unsigned_1;  -- p32mx470f512.h:3821
      CHCCIF  : Extensions.Unsigned_1;  -- p32mx470f512.h:3822
      CHBCIF  : Extensions.Unsigned_1;  -- p32mx470f512.h:3823
      CHDHIF  : Extensions.Unsigned_1;  -- p32mx470f512.h:3824
      CHDDIF  : Extensions.Unsigned_1;  -- p32mx470f512.h:3825
      CHSHIF  : Extensions.Unsigned_1;  -- p32mx470f512.h:3826
      CHSDIF  : Extensions.Unsigned_1;  -- p32mx470f512.h:3827
      field_9 : aliased unsigned_char;
      CHERIE  : Extensions.Unsigned_1;  -- p32mx470f512.h:3829
      CHTAIE  : Extensions.Unsigned_1;  -- p32mx470f512.h:3830
      CHCCIE  : Extensions.Unsigned_1;  -- p32mx470f512.h:3831
      CHBCIE  : Extensions.Unsigned_1;  -- p32mx470f512.h:3832
      CHDHIE  : Extensions.Unsigned_1;  -- p32mx470f512.h:3833
      CHDDIE  : Extensions.Unsigned_1;  -- p32mx470f512.h:3834
      CHSHIE  : Extensions.Unsigned_1;  -- p32mx470f512.h:3835
      CHSDIE  : Extensions.Unsigned_1;  -- p32mx470f512.h:3836
   end record
     with Convention => C_Pass_By_Copy,
     Pack => True,
     Alignment => 4;
   type uu_DCH0INTbits_t_struct1845 is record
      w : aliased unsigned;  -- p32mx470f512.h:3839
   end record
     with Convention => C_Pass_By_Copy;
   type uu_DCH0INTbits_t (discr : unsigned := 0) is record
      case discr is
         when 0 => anon6079 : aliased uu_DCH0INTbits_t_struct1844;  -- p32mx470f512.h:3837
         when 1 => anon6083 : aliased uu_DCH0INTbits_t_struct1845;  -- p32mx470f512.h:3840
         when others => null;
      end case;
   end record
     with Convention => C_Pass_By_Copy,
     Unchecked_Union => True;  -- p32mx470f512.h:3841

   DCH0INTbits : aliased uu_DCH0INTbits_t  -- p32mx470f512.h:3842
     with Import => True,
     Convention => C,
     External_Name => "DCH0INT";

   DCH0INTCLR : aliased unsigned  -- p32mx470f512.h:3843
     with Import => True,
     Convention => C,
     External_Name => "DCH0INTCLR";

   DCH0INTSET : aliased unsigned  -- p32mx470f512.h:3844
     with Import => True,
     Convention => C,
     External_Name => "DCH0INTSET";

   DCH0INTINV : aliased unsigned  -- p32mx470f512.h:3845
     with Import => True,
     Convention => C,
     External_Name => "DCH0INTINV";

   DCH0SSA : aliased unsigned  -- p32mx470f512.h:3846
     with Import => True,
     Convention => C,
     External_Name => "DCH0SSA";

   DCH0SSACLR : aliased unsigned  -- p32mx470f512.h:3847
     with Import => True,
     Convention => C,
     External_Name => "DCH0SSACLR";

   DCH0SSASET : aliased unsigned  -- p32mx470f512.h:3848
     with Import => True,
     Convention => C,
     External_Name => "DCH0SSASET";

   DCH0SSAINV : aliased unsigned  -- p32mx470f512.h:3849
     with Import => True,
     Convention => C,
     External_Name => "DCH0SSAINV";

   DCH0DSA : aliased unsigned  -- p32mx470f512.h:3850
     with Import => True,
     Convention => C,
     External_Name => "DCH0DSA";

   DCH0DSACLR : aliased unsigned  -- p32mx470f512.h:3851
     with Import => True,
     Convention => C,
     External_Name => "DCH0DSACLR";

   DCH0DSASET : aliased unsigned  -- p32mx470f512.h:3852
     with Import => True,
     Convention => C,
     External_Name => "DCH0DSASET";

   DCH0DSAINV : aliased unsigned  -- p32mx470f512.h:3853
     with Import => True,
     Convention => C,
     External_Name => "DCH0DSAINV";

   DCH0SSIZ : aliased unsigned  -- p32mx470f512.h:3854
     with Import => True,
     Convention => C,
     External_Name => "DCH0SSIZ";

   DCH0SSIZCLR : aliased unsigned  -- p32mx470f512.h:3855
     with Import => True,
     Convention => C,
     External_Name => "DCH0SSIZCLR";

   DCH0SSIZSET : aliased unsigned  -- p32mx470f512.h:3856
     with Import => True,
     Convention => C,
     External_Name => "DCH0SSIZSET";

   DCH0SSIZINV : aliased unsigned  -- p32mx470f512.h:3857
     with Import => True,
     Convention => C,
     External_Name => "DCH0SSIZINV";

   DCH0DSIZ : aliased unsigned  -- p32mx470f512.h:3858
     with Import => True,
     Convention => C,
     External_Name => "DCH0DSIZ";

   DCH0DSIZCLR : aliased unsigned  -- p32mx470f512.h:3859
     with Import => True,
     Convention => C,
     External_Name => "DCH0DSIZCLR";

   DCH0DSIZSET : aliased unsigned  -- p32mx470f512.h:3860
     with Import => True,
     Convention => C,
     External_Name => "DCH0DSIZSET";

   DCH0DSIZINV : aliased unsigned  -- p32mx470f512.h:3861
     with Import => True,
     Convention => C,
     External_Name => "DCH0DSIZINV";

   DCH0SPTR : aliased unsigned  -- p32mx470f512.h:3862
     with Import => True,
     Convention => C,
     External_Name => "DCH0SPTR";

   DCH0SPTRCLR : aliased unsigned  -- p32mx470f512.h:3863
     with Import => True,
     Convention => C,
     External_Name => "DCH0SPTRCLR";

   DCH0SPTRSET : aliased unsigned  -- p32mx470f512.h:3864
     with Import => True,
     Convention => C,
     External_Name => "DCH0SPTRSET";

   DCH0SPTRINV : aliased unsigned  -- p32mx470f512.h:3865
     with Import => True,
     Convention => C,
     External_Name => "DCH0SPTRINV";

   DCH0DPTR : aliased unsigned  -- p32mx470f512.h:3866
     with Import => True,
     Convention => C,
     External_Name => "DCH0DPTR";

   DCH0DPTRCLR : aliased unsigned  -- p32mx470f512.h:3867
     with Import => True,
     Convention => C,
     External_Name => "DCH0DPTRCLR";

   DCH0DPTRSET : aliased unsigned  -- p32mx470f512.h:3868
     with Import => True,
     Convention => C,
     External_Name => "DCH0DPTRSET";

   DCH0DPTRINV : aliased unsigned  -- p32mx470f512.h:3869
     with Import => True,
     Convention => C,
     External_Name => "DCH0DPTRINV";

   DCH0CSIZ : aliased unsigned  -- p32mx470f512.h:3870
     with Import => True,
     Convention => C,
     External_Name => "DCH0CSIZ";

   DCH0CSIZCLR : aliased unsigned  -- p32mx470f512.h:3871
     with Import => True,
     Convention => C,
     External_Name => "DCH0CSIZCLR";

   DCH0CSIZSET : aliased unsigned  -- p32mx470f512.h:3872
     with Import => True,
     Convention => C,
     External_Name => "DCH0CSIZSET";

   DCH0CSIZINV : aliased unsigned  -- p32mx470f512.h:3873
     with Import => True,
     Convention => C,
     External_Name => "DCH0CSIZINV";

   DCH0CPTR : aliased unsigned  -- p32mx470f512.h:3874
     with Import => True,
     Convention => C,
     External_Name => "DCH0CPTR";

   DCH0CPTRCLR : aliased unsigned  -- p32mx470f512.h:3875
     with Import => True,
     Convention => C,
     External_Name => "DCH0CPTRCLR";

   DCH0CPTRSET : aliased unsigned  -- p32mx470f512.h:3876
     with Import => True,
     Convention => C,
     External_Name => "DCH0CPTRSET";

   DCH0CPTRINV : aliased unsigned  -- p32mx470f512.h:3877
     with Import => True,
     Convention => C,
     External_Name => "DCH0CPTRINV";

   DCH0DAT : aliased unsigned  -- p32mx470f512.h:3878
     with Import => True,
     Convention => C,
     External_Name => "DCH0DAT";

   DCH0DATCLR : aliased unsigned  -- p32mx470f512.h:3879
     with Import => True,
     Convention => C,
     External_Name => "DCH0DATCLR";

   DCH0DATSET : aliased unsigned  -- p32mx470f512.h:3880
     with Import => True,
     Convention => C,
     External_Name => "DCH0DATSET";

   DCH0DATINV : aliased unsigned  -- p32mx470f512.h:3881
     with Import => True,
     Convention => C,
     External_Name => "DCH0DATINV";

   DCH1CON : aliased unsigned  -- p32mx470f512.h:3882
     with Import => True,
     Convention => C,
     External_Name => "DCH1CON";

   type uu_DCH1CONbits_t_struct1850 is record
      CHPRI    : Extensions.Unsigned_2;  -- p32mx470f512.h:3885
      CHEDET   : Extensions.Unsigned_1;  -- p32mx470f512.h:3886
      anon6130 : Extensions.Unsigned_1;  -- p32mx470f512.h:3887
      CHAEN    : Extensions.Unsigned_1;  -- p32mx470f512.h:3888
      CHCHN    : Extensions.Unsigned_1;  -- p32mx470f512.h:3889
      CHAED    : Extensions.Unsigned_1;  -- p32mx470f512.h:3890
      CHEN     : Extensions.Unsigned_1;  -- p32mx470f512.h:3891
      CHCHNS   : Extensions.Unsigned_1;  -- p32mx470f512.h:3892
      anon6136 : Extensions.Unsigned_6;  -- p32mx470f512.h:3893
      CHBUSY   : Extensions.Unsigned_1;  -- p32mx470f512.h:3894
   end record
     with Convention => C_Pass_By_Copy,
     Pack => True,
     Alignment => 4;
   type uu_DCH1CONbits_t_struct1851 is record
      w : aliased unsigned;  -- p32mx470f512.h:3897
   end record
     with Convention => C_Pass_By_Copy;
   type uu_DCH1CONbits_t (discr : unsigned := 0) is record
      case discr is
         when 0 => anon6139 : aliased uu_DCH1CONbits_t_struct1850;  -- p32mx470f512.h:3895
         when 1 => anon6143 : aliased uu_DCH1CONbits_t_struct1851;  -- p32mx470f512.h:3898
         when others => null;
      end case;
   end record
     with Convention => C_Pass_By_Copy,
     Unchecked_Union => True;  -- p32mx470f512.h:3899

   DCH1CONbits : aliased uu_DCH1CONbits_t  -- p32mx470f512.h:3900
     with Import => True,
     Convention => C,
     External_Name => "DCH1CON";

   DCH1CONCLR : aliased unsigned  -- p32mx470f512.h:3901
     with Import => True,
     Convention => C,
     External_Name => "DCH1CONCLR";

   DCH1CONSET : aliased unsigned  -- p32mx470f512.h:3902
     with Import => True,
     Convention => C,
     External_Name => "DCH1CONSET";

   DCH1CONINV : aliased unsigned  -- p32mx470f512.h:3903
     with Import => True,
     Convention => C,
     External_Name => "DCH1CONINV";

   DCH1ECON : aliased unsigned  -- p32mx470f512.h:3904
     with Import => True,
     Convention => C,
     External_Name => "DCH1ECON";

   type uu_DCH1ECONbits_t_struct1856 is record
      anon6152 : Extensions.Unsigned_3;  -- p32mx470f512.h:3907
      AIRQEN   : Extensions.Unsigned_1;  -- p32mx470f512.h:3908
      SIRQEN   : Extensions.Unsigned_1;  -- p32mx470f512.h:3909
      PATEN    : Extensions.Unsigned_1;  -- p32mx470f512.h:3910
      CABORT   : Extensions.Unsigned_1;  -- p32mx470f512.h:3911
      CFORCE   : Extensions.Unsigned_1;  -- p32mx470f512.h:3912
      CHSIRQ   : aliased unsigned_char;  -- p32mx470f512.h:3913
      CHAIRQ   : aliased unsigned_char;  -- p32mx470f512.h:3914
   end record
     with Convention => C_Pass_By_Copy,
     Pack => True,
     Alignment => 4;
   type uu_DCH1ECONbits_t_struct1857 is record
      w : aliased unsigned;  -- p32mx470f512.h:3917
   end record
     with Convention => C_Pass_By_Copy;
   type uu_DCH1ECONbits_t (discr : unsigned := 0) is record
      case discr is
         when 0 => anon6161 : aliased uu_DCH1ECONbits_t_struct1856;  -- p32mx470f512.h:3915
         when 1 => anon6165 : aliased uu_DCH1ECONbits_t_struct1857;  -- p32mx470f512.h:3918
         when others => null;
      end case;
   end record
     with Convention => C_Pass_By_Copy,
     Unchecked_Union => True;  -- p32mx470f512.h:3919

   DCH1ECONbits : aliased uu_DCH1ECONbits_t  -- p32mx470f512.h:3920
     with Import => True,
     Convention => C,
     External_Name => "DCH1ECON";

   DCH1ECONCLR : aliased unsigned  -- p32mx470f512.h:3921
     with Import => True,
     Convention => C,
     External_Name => "DCH1ECONCLR";

   DCH1ECONSET : aliased unsigned  -- p32mx470f512.h:3922
     with Import => True,
     Convention => C,
     External_Name => "DCH1ECONSET";

   DCH1ECONINV : aliased unsigned  -- p32mx470f512.h:3923
     with Import => True,
     Convention => C,
     External_Name => "DCH1ECONINV";

   DCH1INT : aliased unsigned  -- p32mx470f512.h:3924
     with Import => True,
     Convention => C,
     External_Name => "DCH1INT";

   type uu_DCH1INTbits_t_struct1862 is record
      CHERIF  : Extensions.Unsigned_1;  -- p32mx470f512.h:3927
      CHTAIF  : Extensions.Unsigned_1;  -- p32mx470f512.h:3928
      CHCCIF  : Extensions.Unsigned_1;  -- p32mx470f512.h:3929
      CHBCIF  : Extensions.Unsigned_1;  -- p32mx470f512.h:3930
      CHDHIF  : Extensions.Unsigned_1;  -- p32mx470f512.h:3931
      CHDDIF  : Extensions.Unsigned_1;  -- p32mx470f512.h:3932
      CHSHIF  : Extensions.Unsigned_1;  -- p32mx470f512.h:3933
      CHSDIF  : Extensions.Unsigned_1;  -- p32mx470f512.h:3934
      field_9 : aliased unsigned_char;
      CHERIE  : Extensions.Unsigned_1;  -- p32mx470f512.h:3936
      CHTAIE  : Extensions.Unsigned_1;  -- p32mx470f512.h:3937
      CHCCIE  : Extensions.Unsigned_1;  -- p32mx470f512.h:3938
      CHBCIE  : Extensions.Unsigned_1;  -- p32mx470f512.h:3939
      CHDHIE  : Extensions.Unsigned_1;  -- p32mx470f512.h:3940
      CHDDIE  : Extensions.Unsigned_1;  -- p32mx470f512.h:3941
      CHSHIE  : Extensions.Unsigned_1;  -- p32mx470f512.h:3942
      CHSDIE  : Extensions.Unsigned_1;  -- p32mx470f512.h:3943
   end record
     with Convention => C_Pass_By_Copy,
     Pack => True,
     Alignment => 4;
   type uu_DCH1INTbits_t_struct1863 is record
      w : aliased unsigned;  -- p32mx470f512.h:3946
   end record
     with Convention => C_Pass_By_Copy;
   type uu_DCH1INTbits_t (discr : unsigned := 0) is record
      case discr is
         when 0 => anon6192 : aliased uu_DCH1INTbits_t_struct1862;  -- p32mx470f512.h:3944
         when 1 => anon6196 : aliased uu_DCH1INTbits_t_struct1863;  -- p32mx470f512.h:3947
         when others => null;
      end case;
   end record
     with Convention => C_Pass_By_Copy,
     Unchecked_Union => True;  -- p32mx470f512.h:3948

   DCH1INTbits : aliased uu_DCH1INTbits_t  -- p32mx470f512.h:3949
     with Import => True,
     Convention => C,
     External_Name => "DCH1INT";

   DCH1INTCLR : aliased unsigned  -- p32mx470f512.h:3950
     with Import => True,
     Convention => C,
     External_Name => "DCH1INTCLR";

   DCH1INTSET : aliased unsigned  -- p32mx470f512.h:3951
     with Import => True,
     Convention => C,
     External_Name => "DCH1INTSET";

   DCH1INTINV : aliased unsigned  -- p32mx470f512.h:3952
     with Import => True,
     Convention => C,
     External_Name => "DCH1INTINV";

   DCH1SSA : aliased unsigned  -- p32mx470f512.h:3953
     with Import => True,
     Convention => C,
     External_Name => "DCH1SSA";

   DCH1SSACLR : aliased unsigned  -- p32mx470f512.h:3954
     with Import => True,
     Convention => C,
     External_Name => "DCH1SSACLR";

   DCH1SSASET : aliased unsigned  -- p32mx470f512.h:3955
     with Import => True,
     Convention => C,
     External_Name => "DCH1SSASET";

   DCH1SSAINV : aliased unsigned  -- p32mx470f512.h:3956
     with Import => True,
     Convention => C,
     External_Name => "DCH1SSAINV";

   DCH1DSA : aliased unsigned  -- p32mx470f512.h:3957
     with Import => True,
     Convention => C,
     External_Name => "DCH1DSA";

   DCH1DSACLR : aliased unsigned  -- p32mx470f512.h:3958
     with Import => True,
     Convention => C,
     External_Name => "DCH1DSACLR";

   DCH1DSASET : aliased unsigned  -- p32mx470f512.h:3959
     with Import => True,
     Convention => C,
     External_Name => "DCH1DSASET";

   DCH1DSAINV : aliased unsigned  -- p32mx470f512.h:3960
     with Import => True,
     Convention => C,
     External_Name => "DCH1DSAINV";

   DCH1SSIZ : aliased unsigned  -- p32mx470f512.h:3961
     with Import => True,
     Convention => C,
     External_Name => "DCH1SSIZ";

   DCH1SSIZCLR : aliased unsigned  -- p32mx470f512.h:3962
     with Import => True,
     Convention => C,
     External_Name => "DCH1SSIZCLR";

   DCH1SSIZSET : aliased unsigned  -- p32mx470f512.h:3963
     with Import => True,
     Convention => C,
     External_Name => "DCH1SSIZSET";

   DCH1SSIZINV : aliased unsigned  -- p32mx470f512.h:3964
     with Import => True,
     Convention => C,
     External_Name => "DCH1SSIZINV";

   DCH1DSIZ : aliased unsigned  -- p32mx470f512.h:3965
     with Import => True,
     Convention => C,
     External_Name => "DCH1DSIZ";

   DCH1DSIZCLR : aliased unsigned  -- p32mx470f512.h:3966
     with Import => True,
     Convention => C,
     External_Name => "DCH1DSIZCLR";

   DCH1DSIZSET : aliased unsigned  -- p32mx470f512.h:3967
     with Import => True,
     Convention => C,
     External_Name => "DCH1DSIZSET";

   DCH1DSIZINV : aliased unsigned  -- p32mx470f512.h:3968
     with Import => True,
     Convention => C,
     External_Name => "DCH1DSIZINV";

   DCH1SPTR : aliased unsigned  -- p32mx470f512.h:3969
     with Import => True,
     Convention => C,
     External_Name => "DCH1SPTR";

   DCH1SPTRCLR : aliased unsigned  -- p32mx470f512.h:3970
     with Import => True,
     Convention => C,
     External_Name => "DCH1SPTRCLR";

   DCH1SPTRSET : aliased unsigned  -- p32mx470f512.h:3971
     with Import => True,
     Convention => C,
     External_Name => "DCH1SPTRSET";

   DCH1SPTRINV : aliased unsigned  -- p32mx470f512.h:3972
     with Import => True,
     Convention => C,
     External_Name => "DCH1SPTRINV";

   DCH1DPTR : aliased unsigned  -- p32mx470f512.h:3973
     with Import => True,
     Convention => C,
     External_Name => "DCH1DPTR";

   DCH1DPTRCLR : aliased unsigned  -- p32mx470f512.h:3974
     with Import => True,
     Convention => C,
     External_Name => "DCH1DPTRCLR";

   DCH1DPTRSET : aliased unsigned  -- p32mx470f512.h:3975
     with Import => True,
     Convention => C,
     External_Name => "DCH1DPTRSET";

   DCH1DPTRINV : aliased unsigned  -- p32mx470f512.h:3976
     with Import => True,
     Convention => C,
     External_Name => "DCH1DPTRINV";

   DCH1CSIZ : aliased unsigned  -- p32mx470f512.h:3977
     with Import => True,
     Convention => C,
     External_Name => "DCH1CSIZ";

   DCH1CSIZCLR : aliased unsigned  -- p32mx470f512.h:3978
     with Import => True,
     Convention => C,
     External_Name => "DCH1CSIZCLR";

   DCH1CSIZSET : aliased unsigned  -- p32mx470f512.h:3979
     with Import => True,
     Convention => C,
     External_Name => "DCH1CSIZSET";

   DCH1CSIZINV : aliased unsigned  -- p32mx470f512.h:3980
     with Import => True,
     Convention => C,
     External_Name => "DCH1CSIZINV";

   DCH1CPTR : aliased unsigned  -- p32mx470f512.h:3981
     with Import => True,
     Convention => C,
     External_Name => "DCH1CPTR";

   DCH1CPTRCLR : aliased unsigned  -- p32mx470f512.h:3982
     with Import => True,
     Convention => C,
     External_Name => "DCH1CPTRCLR";

   DCH1CPTRSET : aliased unsigned  -- p32mx470f512.h:3983
     with Import => True,
     Convention => C,
     External_Name => "DCH1CPTRSET";

   DCH1CPTRINV : aliased unsigned  -- p32mx470f512.h:3984
     with Import => True,
     Convention => C,
     External_Name => "DCH1CPTRINV";

   DCH1DAT : aliased unsigned  -- p32mx470f512.h:3985
     with Import => True,
     Convention => C,
     External_Name => "DCH1DAT";

   DCH1DATCLR : aliased unsigned  -- p32mx470f512.h:3986
     with Import => True,
     Convention => C,
     External_Name => "DCH1DATCLR";

   DCH1DATSET : aliased unsigned  -- p32mx470f512.h:3987
     with Import => True,
     Convention => C,
     External_Name => "DCH1DATSET";

   DCH1DATINV : aliased unsigned  -- p32mx470f512.h:3988
     with Import => True,
     Convention => C,
     External_Name => "DCH1DATINV";

   DCH2CON : aliased unsigned  -- p32mx470f512.h:3989
     with Import => True,
     Convention => C,
     External_Name => "DCH2CON";

   type uu_DCH2CONbits_t_struct1868 is record
      CHPRI    : Extensions.Unsigned_2;  -- p32mx470f512.h:3992
      CHEDET   : Extensions.Unsigned_1;  -- p32mx470f512.h:3993
      anon6243 : Extensions.Unsigned_1;  -- p32mx470f512.h:3994
      CHAEN    : Extensions.Unsigned_1;  -- p32mx470f512.h:3995
      CHCHN    : Extensions.Unsigned_1;  -- p32mx470f512.h:3996
      CHAED    : Extensions.Unsigned_1;  -- p32mx470f512.h:3997
      CHEN     : Extensions.Unsigned_1;  -- p32mx470f512.h:3998
      CHCHNS   : Extensions.Unsigned_1;  -- p32mx470f512.h:3999
      anon6249 : Extensions.Unsigned_6;  -- p32mx470f512.h:4000
      CHBUSY   : Extensions.Unsigned_1;  -- p32mx470f512.h:4001
   end record
     with Convention => C_Pass_By_Copy,
     Pack => True,
     Alignment => 4;
   type uu_DCH2CONbits_t_struct1869 is record
      w : aliased unsigned;  -- p32mx470f512.h:4004
   end record
     with Convention => C_Pass_By_Copy;
   type uu_DCH2CONbits_t (discr : unsigned := 0) is record
      case discr is
         when 0 => anon6252 : aliased uu_DCH2CONbits_t_struct1868;  -- p32mx470f512.h:4002
         when 1 => anon6256 : aliased uu_DCH2CONbits_t_struct1869;  -- p32mx470f512.h:4005
         when others => null;
      end case;
   end record
     with Convention => C_Pass_By_Copy,
     Unchecked_Union => True;  -- p32mx470f512.h:4006

   DCH2CONbits : aliased uu_DCH2CONbits_t  -- p32mx470f512.h:4007
     with Import => True,
     Convention => C,
     External_Name => "DCH2CON";

   DCH2CONCLR : aliased unsigned  -- p32mx470f512.h:4008
     with Import => True,
     Convention => C,
     External_Name => "DCH2CONCLR";

   DCH2CONSET : aliased unsigned  -- p32mx470f512.h:4009
     with Import => True,
     Convention => C,
     External_Name => "DCH2CONSET";

   DCH2CONINV : aliased unsigned  -- p32mx470f512.h:4010
     with Import => True,
     Convention => C,
     External_Name => "DCH2CONINV";

   DCH2ECON : aliased unsigned  -- p32mx470f512.h:4011
     with Import => True,
     Convention => C,
     External_Name => "DCH2ECON";

   type uu_DCH2ECONbits_t_struct1874 is record
      anon6265 : Extensions.Unsigned_3;  -- p32mx470f512.h:4014
      AIRQEN   : Extensions.Unsigned_1;  -- p32mx470f512.h:4015
      SIRQEN   : Extensions.Unsigned_1;  -- p32mx470f512.h:4016
      PATEN    : Extensions.Unsigned_1;  -- p32mx470f512.h:4017
      CABORT   : Extensions.Unsigned_1;  -- p32mx470f512.h:4018
      CFORCE   : Extensions.Unsigned_1;  -- p32mx470f512.h:4019
      CHSIRQ   : aliased unsigned_char;  -- p32mx470f512.h:4020
      CHAIRQ   : aliased unsigned_char;  -- p32mx470f512.h:4021
   end record
     with Convention => C_Pass_By_Copy,
     Pack => True,
     Alignment => 4;
   type uu_DCH2ECONbits_t_struct1875 is record
      w : aliased unsigned;  -- p32mx470f512.h:4024
   end record
     with Convention => C_Pass_By_Copy;
   type uu_DCH2ECONbits_t (discr : unsigned := 0) is record
      case discr is
         when 0 => anon6274 : aliased uu_DCH2ECONbits_t_struct1874;  -- p32mx470f512.h:4022
         when 1 => anon6278 : aliased uu_DCH2ECONbits_t_struct1875;  -- p32mx470f512.h:4025
         when others => null;
      end case;
   end record
     with Convention => C_Pass_By_Copy,
     Unchecked_Union => True;  -- p32mx470f512.h:4026

   DCH2ECONbits : aliased uu_DCH2ECONbits_t  -- p32mx470f512.h:4027
     with Import => True,
     Convention => C,
     External_Name => "DCH2ECON";

   DCH2ECONCLR : aliased unsigned  -- p32mx470f512.h:4028
     with Import => True,
     Convention => C,
     External_Name => "DCH2ECONCLR";

   DCH2ECONSET : aliased unsigned  -- p32mx470f512.h:4029
     with Import => True,
     Convention => C,
     External_Name => "DCH2ECONSET";

   DCH2ECONINV : aliased unsigned  -- p32mx470f512.h:4030
     with Import => True,
     Convention => C,
     External_Name => "DCH2ECONINV";

   DCH2INT : aliased unsigned  -- p32mx470f512.h:4031
     with Import => True,
     Convention => C,
     External_Name => "DCH2INT";

   type uu_DCH2INTbits_t_struct1880 is record
      CHERIF  : Extensions.Unsigned_1;  -- p32mx470f512.h:4034
      CHTAIF  : Extensions.Unsigned_1;  -- p32mx470f512.h:4035
      CHCCIF  : Extensions.Unsigned_1;  -- p32mx470f512.h:4036
      CHBCIF  : Extensions.Unsigned_1;  -- p32mx470f512.h:4037
      CHDHIF  : Extensions.Unsigned_1;  -- p32mx470f512.h:4038
      CHDDIF  : Extensions.Unsigned_1;  -- p32mx470f512.h:4039
      CHSHIF  : Extensions.Unsigned_1;  -- p32mx470f512.h:4040
      CHSDIF  : Extensions.Unsigned_1;  -- p32mx470f512.h:4041
      field_9 : aliased unsigned_char;
      CHERIE  : Extensions.Unsigned_1;  -- p32mx470f512.h:4043
      CHTAIE  : Extensions.Unsigned_1;  -- p32mx470f512.h:4044
      CHCCIE  : Extensions.Unsigned_1;  -- p32mx470f512.h:4045
      CHBCIE  : Extensions.Unsigned_1;  -- p32mx470f512.h:4046
      CHDHIE  : Extensions.Unsigned_1;  -- p32mx470f512.h:4047
      CHDDIE  : Extensions.Unsigned_1;  -- p32mx470f512.h:4048
      CHSHIE  : Extensions.Unsigned_1;  -- p32mx470f512.h:4049
      CHSDIE  : Extensions.Unsigned_1;  -- p32mx470f512.h:4050
   end record
     with Convention => C_Pass_By_Copy,
     Pack => True,
     Alignment => 4;
   type uu_DCH2INTbits_t_struct1881 is record
      w : aliased unsigned;  -- p32mx470f512.h:4053
   end record
     with Convention => C_Pass_By_Copy;
   type uu_DCH2INTbits_t (discr : unsigned := 0) is record
      case discr is
         when 0 => anon6305 : aliased uu_DCH2INTbits_t_struct1880;  -- p32mx470f512.h:4051
         when 1 => anon6309 : aliased uu_DCH2INTbits_t_struct1881;  -- p32mx470f512.h:4054
         when others => null;
      end case;
   end record
     with Convention => C_Pass_By_Copy,
     Unchecked_Union => True;  -- p32mx470f512.h:4055

   DCH2INTbits : aliased uu_DCH2INTbits_t  -- p32mx470f512.h:4056
     with Import => True,
     Convention => C,
     External_Name => "DCH2INT";

   DCH2INTCLR : aliased unsigned  -- p32mx470f512.h:4057
     with Import => True,
     Convention => C,
     External_Name => "DCH2INTCLR";

   DCH2INTSET : aliased unsigned  -- p32mx470f512.h:4058
     with Import => True,
     Convention => C,
     External_Name => "DCH2INTSET";

   DCH2INTINV : aliased unsigned  -- p32mx470f512.h:4059
     with Import => True,
     Convention => C,
     External_Name => "DCH2INTINV";

   DCH2SSA : aliased unsigned  -- p32mx470f512.h:4060
     with Import => True,
     Convention => C,
     External_Name => "DCH2SSA";

   DCH2SSACLR : aliased unsigned  -- p32mx470f512.h:4061
     with Import => True,
     Convention => C,
     External_Name => "DCH2SSACLR";

   DCH2SSASET : aliased unsigned  -- p32mx470f512.h:4062
     with Import => True,
     Convention => C,
     External_Name => "DCH2SSASET";

   DCH2SSAINV : aliased unsigned  -- p32mx470f512.h:4063
     with Import => True,
     Convention => C,
     External_Name => "DCH2SSAINV";

   DCH2DSA : aliased unsigned  -- p32mx470f512.h:4064
     with Import => True,
     Convention => C,
     External_Name => "DCH2DSA";

   DCH2DSACLR : aliased unsigned  -- p32mx470f512.h:4065
     with Import => True,
     Convention => C,
     External_Name => "DCH2DSACLR";

   DCH2DSASET : aliased unsigned  -- p32mx470f512.h:4066
     with Import => True,
     Convention => C,
     External_Name => "DCH2DSASET";

   DCH2DSAINV : aliased unsigned  -- p32mx470f512.h:4067
     with Import => True,
     Convention => C,
     External_Name => "DCH2DSAINV";

   DCH2SSIZ : aliased unsigned  -- p32mx470f512.h:4068
     with Import => True,
     Convention => C,
     External_Name => "DCH2SSIZ";

   DCH2SSIZCLR : aliased unsigned  -- p32mx470f512.h:4069
     with Import => True,
     Convention => C,
     External_Name => "DCH2SSIZCLR";

   DCH2SSIZSET : aliased unsigned  -- p32mx470f512.h:4070
     with Import => True,
     Convention => C,
     External_Name => "DCH2SSIZSET";

   DCH2SSIZINV : aliased unsigned  -- p32mx470f512.h:4071
     with Import => True,
     Convention => C,
     External_Name => "DCH2SSIZINV";

   DCH2DSIZ : aliased unsigned  -- p32mx470f512.h:4072
     with Import => True,
     Convention => C,
     External_Name => "DCH2DSIZ";

   DCH2DSIZCLR : aliased unsigned  -- p32mx470f512.h:4073
     with Import => True,
     Convention => C,
     External_Name => "DCH2DSIZCLR";

   DCH2DSIZSET : aliased unsigned  -- p32mx470f512.h:4074
     with Import => True,
     Convention => C,
     External_Name => "DCH2DSIZSET";

   DCH2DSIZINV : aliased unsigned  -- p32mx470f512.h:4075
     with Import => True,
     Convention => C,
     External_Name => "DCH2DSIZINV";

   DCH2SPTR : aliased unsigned  -- p32mx470f512.h:4076
     with Import => True,
     Convention => C,
     External_Name => "DCH2SPTR";

   DCH2SPTRCLR : aliased unsigned  -- p32mx470f512.h:4077
     with Import => True,
     Convention => C,
     External_Name => "DCH2SPTRCLR";

   DCH2SPTRSET : aliased unsigned  -- p32mx470f512.h:4078
     with Import => True,
     Convention => C,
     External_Name => "DCH2SPTRSET";

   DCH2SPTRINV : aliased unsigned  -- p32mx470f512.h:4079
     with Import => True,
     Convention => C,
     External_Name => "DCH2SPTRINV";

   DCH2DPTR : aliased unsigned  -- p32mx470f512.h:4080
     with Import => True,
     Convention => C,
     External_Name => "DCH2DPTR";

   DCH2DPTRCLR : aliased unsigned  -- p32mx470f512.h:4081
     with Import => True,
     Convention => C,
     External_Name => "DCH2DPTRCLR";

   DCH2DPTRSET : aliased unsigned  -- p32mx470f512.h:4082
     with Import => True,
     Convention => C,
     External_Name => "DCH2DPTRSET";

   DCH2DPTRINV : aliased unsigned  -- p32mx470f512.h:4083
     with Import => True,
     Convention => C,
     External_Name => "DCH2DPTRINV";

   DCH2CSIZ : aliased unsigned  -- p32mx470f512.h:4084
     with Import => True,
     Convention => C,
     External_Name => "DCH2CSIZ";

   DCH2CSIZCLR : aliased unsigned  -- p32mx470f512.h:4085
     with Import => True,
     Convention => C,
     External_Name => "DCH2CSIZCLR";

   DCH2CSIZSET : aliased unsigned  -- p32mx470f512.h:4086
     with Import => True,
     Convention => C,
     External_Name => "DCH2CSIZSET";

   DCH2CSIZINV : aliased unsigned  -- p32mx470f512.h:4087
     with Import => True,
     Convention => C,
     External_Name => "DCH2CSIZINV";

   DCH2CPTR : aliased unsigned  -- p32mx470f512.h:4088
     with Import => True,
     Convention => C,
     External_Name => "DCH2CPTR";

   DCH2CPTRCLR : aliased unsigned  -- p32mx470f512.h:4089
     with Import => True,
     Convention => C,
     External_Name => "DCH2CPTRCLR";

   DCH2CPTRSET : aliased unsigned  -- p32mx470f512.h:4090
     with Import => True,
     Convention => C,
     External_Name => "DCH2CPTRSET";

   DCH2CPTRINV : aliased unsigned  -- p32mx470f512.h:4091
     with Import => True,
     Convention => C,
     External_Name => "DCH2CPTRINV";

   DCH2DAT : aliased unsigned  -- p32mx470f512.h:4092
     with Import => True,
     Convention => C,
     External_Name => "DCH2DAT";

   DCH2DATCLR : aliased unsigned  -- p32mx470f512.h:4093
     with Import => True,
     Convention => C,
     External_Name => "DCH2DATCLR";

   DCH2DATSET : aliased unsigned  -- p32mx470f512.h:4094
     with Import => True,
     Convention => C,
     External_Name => "DCH2DATSET";

   DCH2DATINV : aliased unsigned  -- p32mx470f512.h:4095
     with Import => True,
     Convention => C,
     External_Name => "DCH2DATINV";

   DCH3CON : aliased unsigned  -- p32mx470f512.h:4096
     with Import => True,
     Convention => C,
     External_Name => "DCH3CON";

   type uu_DCH3CONbits_t_struct1886 is record
      CHPRI    : Extensions.Unsigned_2;  -- p32mx470f512.h:4099
      CHEDET   : Extensions.Unsigned_1;  -- p32mx470f512.h:4100
      anon6356 : Extensions.Unsigned_1;  -- p32mx470f512.h:4101
      CHAEN    : Extensions.Unsigned_1;  -- p32mx470f512.h:4102
      CHCHN    : Extensions.Unsigned_1;  -- p32mx470f512.h:4103
      CHAED    : Extensions.Unsigned_1;  -- p32mx470f512.h:4104
      CHEN     : Extensions.Unsigned_1;  -- p32mx470f512.h:4105
      CHCHNS   : Extensions.Unsigned_1;  -- p32mx470f512.h:4106
      anon6362 : Extensions.Unsigned_6;  -- p32mx470f512.h:4107
      CHBUSY   : Extensions.Unsigned_1;  -- p32mx470f512.h:4108
   end record
     with Convention => C_Pass_By_Copy,
     Pack => True,
     Alignment => 4;
   type uu_DCH3CONbits_t_struct1887 is record
      w : aliased unsigned;  -- p32mx470f512.h:4111
   end record
     with Convention => C_Pass_By_Copy;
   type uu_DCH3CONbits_t (discr : unsigned := 0) is record
      case discr is
         when 0 => anon6365 : aliased uu_DCH3CONbits_t_struct1886;  -- p32mx470f512.h:4109
         when 1 => anon6369 : aliased uu_DCH3CONbits_t_struct1887;  -- p32mx470f512.h:4112
         when others => null;
      end case;
   end record
     with Convention => C_Pass_By_Copy,
     Unchecked_Union => True;  -- p32mx470f512.h:4113

   DCH3CONbits : aliased uu_DCH3CONbits_t  -- p32mx470f512.h:4114
     with Import => True,
     Convention => C,
     External_Name => "DCH3CON";

   DCH3CONCLR : aliased unsigned  -- p32mx470f512.h:4115
     with Import => True,
     Convention => C,
     External_Name => "DCH3CONCLR";

   DCH3CONSET : aliased unsigned  -- p32mx470f512.h:4116
     with Import => True,
     Convention => C,
     External_Name => "DCH3CONSET";

   DCH3CONINV : aliased unsigned  -- p32mx470f512.h:4117
     with Import => True,
     Convention => C,
     External_Name => "DCH3CONINV";

   DCH3ECON : aliased unsigned  -- p32mx470f512.h:4118
     with Import => True,
     Convention => C,
     External_Name => "DCH3ECON";

   type uu_DCH3ECONbits_t_struct1892 is record
      anon6378 : Extensions.Unsigned_3;  -- p32mx470f512.h:4121
      AIRQEN   : Extensions.Unsigned_1;  -- p32mx470f512.h:4122
      SIRQEN   : Extensions.Unsigned_1;  -- p32mx470f512.h:4123
      PATEN    : Extensions.Unsigned_1;  -- p32mx470f512.h:4124
      CABORT   : Extensions.Unsigned_1;  -- p32mx470f512.h:4125
      CFORCE   : Extensions.Unsigned_1;  -- p32mx470f512.h:4126
      CHSIRQ   : aliased unsigned_char;  -- p32mx470f512.h:4127
      CHAIRQ   : aliased unsigned_char;  -- p32mx470f512.h:4128
   end record
     with Convention => C_Pass_By_Copy,
     Pack => True,
     Alignment => 4;
   type uu_DCH3ECONbits_t_struct1893 is record
      w : aliased unsigned;  -- p32mx470f512.h:4131
   end record
     with Convention => C_Pass_By_Copy;
   type uu_DCH3ECONbits_t (discr : unsigned := 0) is record
      case discr is
         when 0 => anon6387 : aliased uu_DCH3ECONbits_t_struct1892;  -- p32mx470f512.h:4129
         when 1 => anon6391 : aliased uu_DCH3ECONbits_t_struct1893;  -- p32mx470f512.h:4132
         when others => null;
      end case;
   end record
     with Convention => C_Pass_By_Copy,
     Unchecked_Union => True;  -- p32mx470f512.h:4133

   DCH3ECONbits : aliased uu_DCH3ECONbits_t  -- p32mx470f512.h:4134
     with Import => True,
     Convention => C,
     External_Name => "DCH3ECON";

   DCH3ECONCLR : aliased unsigned  -- p32mx470f512.h:4135
     with Import => True,
     Convention => C,
     External_Name => "DCH3ECONCLR";

   DCH3ECONSET : aliased unsigned  -- p32mx470f512.h:4136
     with Import => True,
     Convention => C,
     External_Name => "DCH3ECONSET";

   DCH3ECONINV : aliased unsigned  -- p32mx470f512.h:4137
     with Import => True,
     Convention => C,
     External_Name => "DCH3ECONINV";

   DCH3INT : aliased unsigned  -- p32mx470f512.h:4138
     with Import => True,
     Convention => C,
     External_Name => "DCH3INT";

   type uu_DCH3INTbits_t_struct1898 is record
      CHERIF  : Extensions.Unsigned_1;  -- p32mx470f512.h:4141
      CHTAIF  : Extensions.Unsigned_1;  -- p32mx470f512.h:4142
      CHCCIF  : Extensions.Unsigned_1;  -- p32mx470f512.h:4143
      CHBCIF  : Extensions.Unsigned_1;  -- p32mx470f512.h:4144
      CHDHIF  : Extensions.Unsigned_1;  -- p32mx470f512.h:4145
      CHDDIF  : Extensions.Unsigned_1;  -- p32mx470f512.h:4146
      CHSHIF  : Extensions.Unsigned_1;  -- p32mx470f512.h:4147
      CHSDIF  : Extensions.Unsigned_1;  -- p32mx470f512.h:4148
      field_9 : aliased unsigned_char;
      CHERIE  : Extensions.Unsigned_1;  -- p32mx470f512.h:4150
      CHTAIE  : Extensions.Unsigned_1;  -- p32mx470f512.h:4151
      CHCCIE  : Extensions.Unsigned_1;  -- p32mx470f512.h:4152
      CHBCIE  : Extensions.Unsigned_1;  -- p32mx470f512.h:4153
      CHDHIE  : Extensions.Unsigned_1;  -- p32mx470f512.h:4154
      CHDDIE  : Extensions.Unsigned_1;  -- p32mx470f512.h:4155
      CHSHIE  : Extensions.Unsigned_1;  -- p32mx470f512.h:4156
      CHSDIE  : Extensions.Unsigned_1;  -- p32mx470f512.h:4157
   end record
     with Convention => C_Pass_By_Copy,
     Pack => True,
     Alignment => 4;
   type uu_DCH3INTbits_t_struct1899 is record
      w : aliased unsigned;  -- p32mx470f512.h:4160
   end record
     with Convention => C_Pass_By_Copy;
   type uu_DCH3INTbits_t (discr : unsigned := 0) is record
      case discr is
         when 0 => anon6418 : aliased uu_DCH3INTbits_t_struct1898;  -- p32mx470f512.h:4158
         when 1 => anon6422 : aliased uu_DCH3INTbits_t_struct1899;  -- p32mx470f512.h:4161
         when others => null;
      end case;
   end record
     with Convention => C_Pass_By_Copy,
     Unchecked_Union => True;  -- p32mx470f512.h:4162

   DCH3INTbits : aliased uu_DCH3INTbits_t  -- p32mx470f512.h:4163
     with Import => True,
     Convention => C,
     External_Name => "DCH3INT";

   DCH3INTCLR : aliased unsigned  -- p32mx470f512.h:4164
     with Import => True,
     Convention => C,
     External_Name => "DCH3INTCLR";

   DCH3INTSET : aliased unsigned  -- p32mx470f512.h:4165
     with Import => True,
     Convention => C,
     External_Name => "DCH3INTSET";

   DCH3INTINV : aliased unsigned  -- p32mx470f512.h:4166
     with Import => True,
     Convention => C,
     External_Name => "DCH3INTINV";

   DCH3SSA : aliased unsigned  -- p32mx470f512.h:4167
     with Import => True,
     Convention => C,
     External_Name => "DCH3SSA";

   DCH3SSACLR : aliased unsigned  -- p32mx470f512.h:4168
     with Import => True,
     Convention => C,
     External_Name => "DCH3SSACLR";

   DCH3SSASET : aliased unsigned  -- p32mx470f512.h:4169
     with Import => True,
     Convention => C,
     External_Name => "DCH3SSASET";

   DCH3SSAINV : aliased unsigned  -- p32mx470f512.h:4170
     with Import => True,
     Convention => C,
     External_Name => "DCH3SSAINV";

   DCH3DSA : aliased unsigned  -- p32mx470f512.h:4171
     with Import => True,
     Convention => C,
     External_Name => "DCH3DSA";

   DCH3DSACLR : aliased unsigned  -- p32mx470f512.h:4172
     with Import => True,
     Convention => C,
     External_Name => "DCH3DSACLR";

   DCH3DSASET : aliased unsigned  -- p32mx470f512.h:4173
     with Import => True,
     Convention => C,
     External_Name => "DCH3DSASET";

   DCH3DSAINV : aliased unsigned  -- p32mx470f512.h:4174
     with Import => True,
     Convention => C,
     External_Name => "DCH3DSAINV";

   DCH3SSIZ : aliased unsigned  -- p32mx470f512.h:4175
     with Import => True,
     Convention => C,
     External_Name => "DCH3SSIZ";

   DCH3SSIZCLR : aliased unsigned  -- p32mx470f512.h:4176
     with Import => True,
     Convention => C,
     External_Name => "DCH3SSIZCLR";

   DCH3SSIZSET : aliased unsigned  -- p32mx470f512.h:4177
     with Import => True,
     Convention => C,
     External_Name => "DCH3SSIZSET";

   DCH3SSIZINV : aliased unsigned  -- p32mx470f512.h:4178
     with Import => True,
     Convention => C,
     External_Name => "DCH3SSIZINV";

   DCH3DSIZ : aliased unsigned  -- p32mx470f512.h:4179
     with Import => True,
     Convention => C,
     External_Name => "DCH3DSIZ";

   DCH3DSIZCLR : aliased unsigned  -- p32mx470f512.h:4180
     with Import => True,
     Convention => C,
     External_Name => "DCH3DSIZCLR";

   DCH3DSIZSET : aliased unsigned  -- p32mx470f512.h:4181
     with Import => True,
     Convention => C,
     External_Name => "DCH3DSIZSET";

   DCH3DSIZINV : aliased unsigned  -- p32mx470f512.h:4182
     with Import => True,
     Convention => C,
     External_Name => "DCH3DSIZINV";

   DCH3SPTR : aliased unsigned  -- p32mx470f512.h:4183
     with Import => True,
     Convention => C,
     External_Name => "DCH3SPTR";

   DCH3SPTRCLR : aliased unsigned  -- p32mx470f512.h:4184
     with Import => True,
     Convention => C,
     External_Name => "DCH3SPTRCLR";

   DCH3SPTRSET : aliased unsigned  -- p32mx470f512.h:4185
     with Import => True,
     Convention => C,
     External_Name => "DCH3SPTRSET";

   DCH3SPTRINV : aliased unsigned  -- p32mx470f512.h:4186
     with Import => True,
     Convention => C,
     External_Name => "DCH3SPTRINV";

   DCH3DPTR : aliased unsigned  -- p32mx470f512.h:4187
     with Import => True,
     Convention => C,
     External_Name => "DCH3DPTR";

   DCH3DPTRCLR : aliased unsigned  -- p32mx470f512.h:4188
     with Import => True,
     Convention => C,
     External_Name => "DCH3DPTRCLR";

   DCH3DPTRSET : aliased unsigned  -- p32mx470f512.h:4189
     with Import => True,
     Convention => C,
     External_Name => "DCH3DPTRSET";

   DCH3DPTRINV : aliased unsigned  -- p32mx470f512.h:4190
     with Import => True,
     Convention => C,
     External_Name => "DCH3DPTRINV";

   DCH3CSIZ : aliased unsigned  -- p32mx470f512.h:4191
     with Import => True,
     Convention => C,
     External_Name => "DCH3CSIZ";

   DCH3CSIZCLR : aliased unsigned  -- p32mx470f512.h:4192
     with Import => True,
     Convention => C,
     External_Name => "DCH3CSIZCLR";

   DCH3CSIZSET : aliased unsigned  -- p32mx470f512.h:4193
     with Import => True,
     Convention => C,
     External_Name => "DCH3CSIZSET";

   DCH3CSIZINV : aliased unsigned  -- p32mx470f512.h:4194
     with Import => True,
     Convention => C,
     External_Name => "DCH3CSIZINV";

   DCH3CPTR : aliased unsigned  -- p32mx470f512.h:4195
     with Import => True,
     Convention => C,
     External_Name => "DCH3CPTR";

   DCH3CPTRCLR : aliased unsigned  -- p32mx470f512.h:4196
     with Import => True,
     Convention => C,
     External_Name => "DCH3CPTRCLR";

   DCH3CPTRSET : aliased unsigned  -- p32mx470f512.h:4197
     with Import => True,
     Convention => C,
     External_Name => "DCH3CPTRSET";

   DCH3CPTRINV : aliased unsigned  -- p32mx470f512.h:4198
     with Import => True,
     Convention => C,
     External_Name => "DCH3CPTRINV";

   DCH3DAT : aliased unsigned  -- p32mx470f512.h:4199
     with Import => True,
     Convention => C,
     External_Name => "DCH3DAT";

   DCH3DATCLR : aliased unsigned  -- p32mx470f512.h:4200
     with Import => True,
     Convention => C,
     External_Name => "DCH3DATCLR";

   DCH3DATSET : aliased unsigned  -- p32mx470f512.h:4201
     with Import => True,
     Convention => C,
     External_Name => "DCH3DATSET";

   DCH3DATINV : aliased unsigned  -- p32mx470f512.h:4202
     with Import => True,
     Convention => C,
     External_Name => "DCH3DATINV";

   CHECON : aliased unsigned  -- p32mx470f512.h:4203
     with Import => True,
     Convention => C,
     External_Name => "CHECON";

   type uu_CHECONbits_t_struct1904 is record
      PFMWS    : Extensions.Unsigned_3;  -- p32mx470f512.h:4206
      anon6468 : Extensions.Unsigned_1;  -- p32mx470f512.h:4207
      PREFEN   : Extensions.Unsigned_2;  -- p32mx470f512.h:4208
      anon6470 : Extensions.Unsigned_2;  -- p32mx470f512.h:4209
      DCSZ     : Extensions.Unsigned_2;  -- p32mx470f512.h:4210
      anon6472 : Extensions.Unsigned_6;  -- p32mx470f512.h:4211
      CHECOH   : Extensions.Unsigned_1;  -- p32mx470f512.h:4212
   end record
     with Convention => C_Pass_By_Copy,
     Pack => True,
     Alignment => 4;
   type uu_CHECONbits_t_struct1905 is record
      w : aliased unsigned;  -- p32mx470f512.h:4215
   end record
     with Convention => C_Pass_By_Copy;
   type uu_CHECONbits_t (discr : unsigned := 0) is record
      case discr is
         when 0 => anon6475 : aliased uu_CHECONbits_t_struct1904;  -- p32mx470f512.h:4213
         when 1 => anon6479 : aliased uu_CHECONbits_t_struct1905;  -- p32mx470f512.h:4216
         when others => null;
      end case;
   end record
     with Convention => C_Pass_By_Copy,
     Unchecked_Union => True;  -- p32mx470f512.h:4217

   CHECONbits : aliased uu_CHECONbits_t  -- p32mx470f512.h:4218
     with Import => True,
     Convention => C,
     External_Name => "CHECON";

   CHECONCLR : aliased unsigned  -- p32mx470f512.h:4219
     with Import => True,
     Convention => C,
     External_Name => "CHECONCLR";

   CHECONSET : aliased unsigned  -- p32mx470f512.h:4220
     with Import => True,
     Convention => C,
     External_Name => "CHECONSET";

   CHECONINV : aliased unsigned  -- p32mx470f512.h:4221
     with Import => True,
     Convention => C,
     External_Name => "CHECONINV";

   CHEACC : aliased unsigned  -- p32mx470f512.h:4222
     with Import => True,
     Convention => C,
     External_Name => "CHEACC";

   type uu_CHEACCbits_t is record
      CHEIDX   : Extensions.Unsigned_4;  -- p32mx470f512.h:4224
      anon6488 : Extensions.Unsigned_27;  -- p32mx470f512.h:4225
      CHEWEN   : Extensions.Unsigned_1;  -- p32mx470f512.h:4226
   end record
     with Convention => C_Pass_By_Copy,
     Pack => True,
     Alignment => 4;  -- p32mx470f512.h:4227

   CHEACCbits : aliased uu_CHEACCbits_t  -- p32mx470f512.h:4228
     with Import => True,
     Convention => C,
     External_Name => "CHEACC";

   CHEACCCLR : aliased unsigned  -- p32mx470f512.h:4229
     with Import => True,
     Convention => C,
     External_Name => "CHEACCCLR";

   CHEACCSET : aliased unsigned  -- p32mx470f512.h:4230
     with Import => True,
     Convention => C,
     External_Name => "CHEACCSET";

   CHEACCINV : aliased unsigned  -- p32mx470f512.h:4231
     with Import => True,
     Convention => C,
     External_Name => "CHEACCINV";

   CHETAG : aliased unsigned  -- p32mx470f512.h:4232
     with Import => True,
     Convention => C,
     External_Name => "CHETAG";

   type uu_CHETAGbits_t_struct1915 is record
      anon6499 : Extensions.Unsigned_1;  -- p32mx470f512.h:4235
      LTYPE    : Extensions.Unsigned_1;  -- p32mx470f512.h:4236
      LLOCK    : Extensions.Unsigned_1;  -- p32mx470f512.h:4237
      LVALID   : Extensions.Unsigned_1;  -- p32mx470f512.h:4238
      LTAG     : Extensions.Unsigned_20;  -- p32mx470f512.h:4239
      anon6504 : Extensions.Unsigned_7;  -- p32mx470f512.h:4240
      LTAGBOOT : Extensions.Unsigned_1;  -- p32mx470f512.h:4241
   end record
     with Convention => C_Pass_By_Copy,
     Pack => True,
     Alignment => 4;
   type uu_CHETAGbits_t_struct1917 is record
      w : aliased unsigned;  -- p32mx470f512.h:4244
   end record
     with Convention => C_Pass_By_Copy;
   type uu_CHETAGbits_t (discr : unsigned := 0) is record
      case discr is
         when 0 => anon6507 : aliased uu_CHETAGbits_t_struct1915;  -- p32mx470f512.h:4242
         when 1 => anon6511 : aliased uu_CHETAGbits_t_struct1917;  -- p32mx470f512.h:4245
         when others => null;
      end case;
   end record
     with Convention => C_Pass_By_Copy,
     Unchecked_Union => True;  -- p32mx470f512.h:4246

   CHETAGbits : aliased uu_CHETAGbits_t  -- p32mx470f512.h:4247
     with Import => True,
     Convention => C,
     External_Name => "CHETAG";

   CHETAGCLR : aliased unsigned  -- p32mx470f512.h:4248
     with Import => True,
     Convention => C,
     External_Name => "CHETAGCLR";

   CHETAGSET : aliased unsigned  -- p32mx470f512.h:4249
     with Import => True,
     Convention => C,
     External_Name => "CHETAGSET";

   CHETAGINV : aliased unsigned  -- p32mx470f512.h:4250
     with Import => True,
     Convention => C,
     External_Name => "CHETAGINV";

   CHEMSK : aliased unsigned  -- p32mx470f512.h:4251
     with Import => True,
     Convention => C,
     External_Name => "CHEMSK";

   type uu_CHEMSKbits_t is record
      anon6519 : Extensions.Unsigned_5;  -- p32mx470f512.h:4253
      LMASK    : Extensions.Unsigned_11;  -- p32mx470f512.h:4254
   end record
     with Convention => C_Pass_By_Copy,
     Pack => True,
     Alignment => 4;  -- p32mx470f512.h:4255

   CHEMSKbits : aliased uu_CHEMSKbits_t  -- p32mx470f512.h:4256
     with Import => True,
     Convention => C,
     External_Name => "CHEMSK";

   CHEMSKCLR : aliased unsigned  -- p32mx470f512.h:4257
     with Import => True,
     Convention => C,
     External_Name => "CHEMSKCLR";

   CHEMSKSET : aliased unsigned  -- p32mx470f512.h:4258
     with Import => True,
     Convention => C,
     External_Name => "CHEMSKSET";

   CHEMSKINV : aliased unsigned  -- p32mx470f512.h:4259
     with Import => True,
     Convention => C,
     External_Name => "CHEMSKINV";

   CHEW0 : aliased unsigned  -- p32mx470f512.h:4260
     with Import => True,
     Convention => C,
     External_Name => "CHEW0";

   type uu_CHEW0bits_t is record
      CHEW0 : aliased unsigned;  -- p32mx470f512.h:4262
   end record
     with Convention => C_Pass_By_Copy;  -- p32mx470f512.h:4263

   CHEW0bits : aliased uu_CHEW0bits_t  -- p32mx470f512.h:4264
     with Import => True,
     Convention => C,
     External_Name => "CHEW0";

   CHEW1 : aliased unsigned  -- p32mx470f512.h:4265
     with Import => True,
     Convention => C,
     External_Name => "CHEW1";

   type uu_CHEW1bits_t is record
      CHEW1 : aliased unsigned;  -- p32mx470f512.h:4267
   end record
     with Convention => C_Pass_By_Copy;  -- p32mx470f512.h:4268

   CHEW1bits : aliased uu_CHEW1bits_t  -- p32mx470f512.h:4269
     with Import => True,
     Convention => C,
     External_Name => "CHEW1";

   CHEW2 : aliased unsigned  -- p32mx470f512.h:4270
     with Import => True,
     Convention => C,
     External_Name => "CHEW2";

   type uu_CHEW2bits_t is record
      CHEW2 : aliased unsigned;  -- p32mx470f512.h:4272
   end record
     with Convention => C_Pass_By_Copy;  -- p32mx470f512.h:4273

   CHEW2bits : aliased uu_CHEW2bits_t  -- p32mx470f512.h:4274
     with Import => True,
     Convention => C,
     External_Name => "CHEW2";

   CHEW3 : aliased unsigned  -- p32mx470f512.h:4275
     with Import => True,
     Convention => C,
     External_Name => "CHEW3";

   type uu_CHEW3bits_t is record
      CHEW3 : aliased unsigned;  -- p32mx470f512.h:4277
   end record
     with Convention => C_Pass_By_Copy;  -- p32mx470f512.h:4278

   CHEW3bits : aliased uu_CHEW3bits_t  -- p32mx470f512.h:4279
     with Import => True,
     Convention => C,
     External_Name => "CHEW3";

   CHELRU : aliased unsigned  -- p32mx470f512.h:4280
     with Import => True,
     Convention => C,
     External_Name => "CHELRU";

   type uu_CHELRUbits_t is record
      CHELRU : Extensions.Unsigned_25;  -- p32mx470f512.h:4282
   end record
     with Convention => C_Pass_By_Copy,
     Pack => True,
     Alignment => 4;  -- p32mx470f512.h:4283

   CHELRUbits : aliased uu_CHELRUbits_t  -- p32mx470f512.h:4284
     with Import => True,
     Convention => C,
     External_Name => "CHELRU";

   CHEHIT : aliased unsigned  -- p32mx470f512.h:4285
     with Import => True,
     Convention => C,
     External_Name => "CHEHIT";

   type uu_CHEHITbits_t is record
      CHEHIT : aliased unsigned;  -- p32mx470f512.h:4287
   end record
     with Convention => C_Pass_By_Copy;  -- p32mx470f512.h:4288

   CHEHITbits : aliased uu_CHEHITbits_t  -- p32mx470f512.h:4289
     with Import => True,
     Convention => C,
     External_Name => "CHEHIT";

   CHEMIS : aliased unsigned  -- p32mx470f512.h:4290
     with Import => True,
     Convention => C,
     External_Name => "CHEMIS";

   type uu_CHEMISbits_t is record
      CHEMIS : aliased unsigned;  -- p32mx470f512.h:4292
   end record
     with Convention => C_Pass_By_Copy;  -- p32mx470f512.h:4293

   CHEMISbits : aliased uu_CHEMISbits_t  -- p32mx470f512.h:4294
     with Import => True,
     Convention => C,
     External_Name => "CHEMIS";

   RESERVED1 : aliased unsigned  -- p32mx470f512.h:4295
     with Import => True,
     Convention => C,
     External_Name => "RESERVED1";

   CHEPFABT : aliased unsigned  -- p32mx470f512.h:4296
     with Import => True,
     Convention => C,
     External_Name => "CHEPFABT";

   type uu_CHEPFABTbits_t is record
      CHEPFABT : aliased unsigned;  -- p32mx470f512.h:4298
   end record
     with Convention => C_Pass_By_Copy;  -- p32mx470f512.h:4299

   CHEPFABTbits : aliased uu_CHEPFABTbits_t  -- p32mx470f512.h:4300
     with Import => True,
     Convention => C,
     External_Name => "CHEPFABT";

   U1OTGIR : aliased unsigned  -- p32mx470f512.h:4301
     with Import => True,
     Convention => C,
     External_Name => "U1OTGIR";

   type uu_U1OTGIRbits_t is record
      VBUSVDIF : Extensions.Unsigned_1;  -- p32mx470f512.h:4303
      anon6579 : Extensions.Unsigned_1;  -- p32mx470f512.h:4304
      SESENDIF : Extensions.Unsigned_1;  -- p32mx470f512.h:4305
      SESVDIF  : Extensions.Unsigned_1;  -- p32mx470f512.h:4306
      ACTVIF   : Extensions.Unsigned_1;  -- p32mx470f512.h:4307
      LSTATEIF : Extensions.Unsigned_1;  -- p32mx470f512.h:4308
      T1MSECIF : Extensions.Unsigned_1;  -- p32mx470f512.h:4309
      IDIF     : Extensions.Unsigned_1;  -- p32mx470f512.h:4310
   end record
     with Convention => C_Pass_By_Copy,
     Pack => True,
     Alignment => 4;  -- p32mx470f512.h:4311

   U1OTGIRbits : aliased uu_U1OTGIRbits_t  -- p32mx470f512.h:4312
     with Import => True,
     Convention => C,
     External_Name => "U1OTGIR";

   U1OTGIRCLR : aliased unsigned  -- p32mx470f512.h:4313
     with Import => True,
     Convention => C,
     External_Name => "U1OTGIRCLR";

   U1OTGIE : aliased unsigned  -- p32mx470f512.h:4314
     with Import => True,
     Convention => C,
     External_Name => "U1OTGIE";

   type uu_U1OTGIEbits_t is record
      VBUSVDIE : Extensions.Unsigned_1;  -- p32mx470f512.h:4316
      anon6593 : Extensions.Unsigned_1;  -- p32mx470f512.h:4317
      SESENDIE : Extensions.Unsigned_1;  -- p32mx470f512.h:4318
      SESVDIE  : Extensions.Unsigned_1;  -- p32mx470f512.h:4319
      ACTVIE   : Extensions.Unsigned_1;  -- p32mx470f512.h:4320
      LSTATEIE : Extensions.Unsigned_1;  -- p32mx470f512.h:4321
      T1MSECIE : Extensions.Unsigned_1;  -- p32mx470f512.h:4322
      IDIE     : Extensions.Unsigned_1;  -- p32mx470f512.h:4323
   end record
     with Convention => C_Pass_By_Copy,
     Pack => True,
     Alignment => 4;  -- p32mx470f512.h:4324

   U1OTGIEbits : aliased uu_U1OTGIEbits_t  -- p32mx470f512.h:4325
     with Import => True,
     Convention => C,
     External_Name => "U1OTGIE";

   U1OTGIECLR : aliased unsigned  -- p32mx470f512.h:4326
     with Import => True,
     Convention => C,
     External_Name => "U1OTGIECLR";

   U1OTGIESET : aliased unsigned  -- p32mx470f512.h:4327
     with Import => True,
     Convention => C,
     External_Name => "U1OTGIESET";

   U1OTGIEINV : aliased unsigned  -- p32mx470f512.h:4328
     with Import => True,
     Convention => C,
     External_Name => "U1OTGIEINV";

   U1OTGSTAT : aliased unsigned  -- p32mx470f512.h:4329
     with Import => True,
     Convention => C,
     External_Name => "U1OTGSTAT";

   type uu_U1OTGSTATbits_t is record
      VBUSVD   : Extensions.Unsigned_1;  -- p32mx470f512.h:4331
      anon6609 : Extensions.Unsigned_1;  -- p32mx470f512.h:4332
      SESEND   : Extensions.Unsigned_1;  -- p32mx470f512.h:4333
      SESVD    : Extensions.Unsigned_1;  -- p32mx470f512.h:4334
      anon6612 : Extensions.Unsigned_1;  -- p32mx470f512.h:4335
      LSTATE   : Extensions.Unsigned_1;  -- p32mx470f512.h:4336
      anon6614 : Extensions.Unsigned_1;  -- p32mx470f512.h:4337
      ID       : Extensions.Unsigned_1;  -- p32mx470f512.h:4338
   end record
     with Convention => C_Pass_By_Copy,
     Pack => True,
     Alignment => 4;  -- p32mx470f512.h:4339

   U1OTGSTATbits : aliased uu_U1OTGSTATbits_t  -- p32mx470f512.h:4340
     with Import => True,
     Convention => C,
     External_Name => "U1OTGSTAT";

   U1OTGCON : aliased unsigned  -- p32mx470f512.h:4341
     with Import => True,
     Convention => C,
     External_Name => "U1OTGCON";

   type uu_U1OTGCONbits_t is record
      VBUSDIS  : Extensions.Unsigned_1;  -- p32mx470f512.h:4343
      VBUSCHG  : Extensions.Unsigned_1;  -- p32mx470f512.h:4344
      OTGEN    : Extensions.Unsigned_1;  -- p32mx470f512.h:4345
      VBUSON   : Extensions.Unsigned_1;  -- p32mx470f512.h:4346
      DMPULDWN : Extensions.Unsigned_1;  -- p32mx470f512.h:4347
      DPPULDWN : Extensions.Unsigned_1;  -- p32mx470f512.h:4348
      DMPULUP  : Extensions.Unsigned_1;  -- p32mx470f512.h:4349
      DPPULUP  : Extensions.Unsigned_1;  -- p32mx470f512.h:4350
   end record
     with Convention => C_Pass_By_Copy,
     Pack => True,
     Alignment => 4;  -- p32mx470f512.h:4351

   U1OTGCONbits : aliased uu_U1OTGCONbits_t  -- p32mx470f512.h:4352
     with Import => True,
     Convention => C,
     External_Name => "U1OTGCON";

   U1OTGCONCLR : aliased unsigned  -- p32mx470f512.h:4353
     with Import => True,
     Convention => C,
     External_Name => "U1OTGCONCLR";

   U1OTGCONSET : aliased unsigned  -- p32mx470f512.h:4354
     with Import => True,
     Convention => C,
     External_Name => "U1OTGCONSET";

   U1OTGCONINV : aliased unsigned  -- p32mx470f512.h:4355
     with Import => True,
     Convention => C,
     External_Name => "U1OTGCONINV";

   U1PWRC : aliased unsigned  -- p32mx470f512.h:4356
     with Import => True,
     Convention => C,
     External_Name => "U1PWRC";

   type uu_U1PWRCbits_t is record
      USBPWR   : Extensions.Unsigned_1;  -- p32mx470f512.h:4358
      USUSPEND : Extensions.Unsigned_1;  -- p32mx470f512.h:4359
      anon6639 : Extensions.Unsigned_1;  -- p32mx470f512.h:4360
      USBBUSY  : Extensions.Unsigned_1;  -- p32mx470f512.h:4361
      USLPGRD  : Extensions.Unsigned_1;  -- p32mx470f512.h:4362
      anon6642 : Extensions.Unsigned_2;  -- p32mx470f512.h:4363
      UACTPND  : Extensions.Unsigned_1;  -- p32mx470f512.h:4364
   end record
     with Convention => C_Pass_By_Copy,
     Pack => True,
     Alignment => 4;  -- p32mx470f512.h:4365

   U1PWRCbits : aliased uu_U1PWRCbits_t  -- p32mx470f512.h:4366
     with Import => True,
     Convention => C,
     External_Name => "U1PWRC";

   U1PWRCCLR : aliased unsigned  -- p32mx470f512.h:4367
     with Import => True,
     Convention => C,
     External_Name => "U1PWRCCLR";

   U1PWRCSET : aliased unsigned  -- p32mx470f512.h:4368
     with Import => True,
     Convention => C,
     External_Name => "U1PWRCSET";

   U1PWRCINV : aliased unsigned  -- p32mx470f512.h:4369
     with Import => True,
     Convention => C,
     External_Name => "U1PWRCINV";

   U1IR : aliased unsigned  -- p32mx470f512.h:4370
     with Import => True,
     Convention => C,
     External_Name => "U1IR";

   type uu_U1IRbits_t_struct1979 is record
      URSTIF_DETACHIF : Extensions.Unsigned_1;  -- p32mx470f512.h:4373
      UERRIF          : Extensions.Unsigned_1;  -- p32mx470f512.h:4374
      SOFIF           : Extensions.Unsigned_1;  -- p32mx470f512.h:4375
      TRNIF           : Extensions.Unsigned_1;  -- p32mx470f512.h:4376
      IDLEIF          : Extensions.Unsigned_1;  -- p32mx470f512.h:4377
      RESUMEIF        : Extensions.Unsigned_1;  -- p32mx470f512.h:4378
      ATTACHIF        : Extensions.Unsigned_1;  -- p32mx470f512.h:4379
      STALLIF         : Extensions.Unsigned_1;  -- p32mx470f512.h:4380
   end record
     with Convention => C_Pass_By_Copy,
     Pack => True,
     Alignment => 4;
   type uu_U1IRbits_t_struct1980 is record
      DETACHIF : Extensions.Unsigned_1;  -- p32mx470f512.h:4383
   end record
     with Convention => C_Pass_By_Copy,
     Pack => True,
     Alignment => 4;
   type uu_U1IRbits_t_struct1981 is record
      URSTIF : Extensions.Unsigned_1;  -- p32mx470f512.h:4386
   end record
     with Convention => C_Pass_By_Copy,
     Pack => True,
     Alignment => 4;
   type uu_U1IRbits_t (discr : unsigned := 0) is record
      case discr is
         when 0 => anon6662 : aliased uu_U1IRbits_t_struct1979;  -- p32mx470f512.h:4381
         when 1 => anon6666 : aliased uu_U1IRbits_t_struct1980;  -- p32mx470f512.h:4384
         when 2 => anon6670 : aliased uu_U1IRbits_t_struct1981;  -- p32mx470f512.h:4387
         when others => null;
      end case;
   end record
     with Convention => C_Pass_By_Copy,
     Unchecked_Union => True;  -- p32mx470f512.h:4388

   U1IRbits : aliased uu_U1IRbits_t  -- p32mx470f512.h:4389
     with Import => True,
     Convention => C,
     External_Name => "U1IR";

   U1IRCLR : aliased unsigned  -- p32mx470f512.h:4390
     with Import => True,
     Convention => C,
     External_Name => "U1IRCLR";

   U1IE : aliased unsigned  -- p32mx470f512.h:4391
     with Import => True,
     Convention => C,
     External_Name => "U1IE";

   type uu_U1IEbits_t_struct1986 is record
      URSTIE_DETACHIE : Extensions.Unsigned_1;  -- p32mx470f512.h:4394
      UERRIE          : Extensions.Unsigned_1;  -- p32mx470f512.h:4395
      SOFIE           : Extensions.Unsigned_1;  -- p32mx470f512.h:4396
      TRNIE           : Extensions.Unsigned_1;  -- p32mx470f512.h:4397
      IDLEIE          : Extensions.Unsigned_1;  -- p32mx470f512.h:4398
      RESUMEIE        : Extensions.Unsigned_1;  -- p32mx470f512.h:4399
      ATTACHIE        : Extensions.Unsigned_1;  -- p32mx470f512.h:4400
      STALLIE         : Extensions.Unsigned_1;  -- p32mx470f512.h:4401
   end record
     with Convention => C_Pass_By_Copy,
     Pack => True,
     Alignment => 4;
   type uu_U1IEbits_t_struct1987 is record
      DETACHIE : Extensions.Unsigned_1;  -- p32mx470f512.h:4404
   end record
     with Convention => C_Pass_By_Copy,
     Pack => True,
     Alignment => 4;
   type uu_U1IEbits_t_struct1988 is record
      URSTIE : Extensions.Unsigned_1;  -- p32mx470f512.h:4407
   end record
     with Convention => C_Pass_By_Copy,
     Pack => True,
     Alignment => 4;
   type uu_U1IEbits_t (discr : unsigned := 0) is record
      case discr is
         when 0 => anon6686 : aliased uu_U1IEbits_t_struct1986;  -- p32mx470f512.h:4402
         when 1 => anon6690 : aliased uu_U1IEbits_t_struct1987;  -- p32mx470f512.h:4405
         when 2 => anon6694 : aliased uu_U1IEbits_t_struct1988;  -- p32mx470f512.h:4408
         when others => null;
      end case;
   end record
     with Convention => C_Pass_By_Copy,
     Unchecked_Union => True;  -- p32mx470f512.h:4409

   U1IEbits : aliased uu_U1IEbits_t  -- p32mx470f512.h:4410
     with Import => True,
     Convention => C,
     External_Name => "U1IE";

   U1IECLR : aliased unsigned  -- p32mx470f512.h:4411
     with Import => True,
     Convention => C,
     External_Name => "U1IECLR";

   U1IESET : aliased unsigned  -- p32mx470f512.h:4412
     with Import => True,
     Convention => C,
     External_Name => "U1IESET";

   U1IEINV : aliased unsigned  -- p32mx470f512.h:4413
     with Import => True,
     Convention => C,
     External_Name => "U1IEINV";

   U1EIR : aliased unsigned  -- p32mx470f512.h:4414
     with Import => True,
     Convention => C,
     External_Name => "U1EIR";

   type uu_U1EIRbits_t_struct1993 is record
      PIDEF        : Extensions.Unsigned_1;  -- p32mx470f512.h:4417
      CRC5EF_EOFEF : Extensions.Unsigned_1;  -- p32mx470f512.h:4418
      CRC16EF      : Extensions.Unsigned_1;  -- p32mx470f512.h:4419
      DFN8EF       : Extensions.Unsigned_1;  -- p32mx470f512.h:4420
      BTOEF        : Extensions.Unsigned_1;  -- p32mx470f512.h:4421
      DMAEF        : Extensions.Unsigned_1;  -- p32mx470f512.h:4422
      BMXEF        : Extensions.Unsigned_1;  -- p32mx470f512.h:4423
      BTSEF        : Extensions.Unsigned_1;  -- p32mx470f512.h:4424
   end record
     with Convention => C_Pass_By_Copy,
     Pack => True,
     Alignment => 4;
   type uu_U1EIRbits_t_struct1994 is record
      anon6714 : Extensions.Unsigned_1;  -- p32mx470f512.h:4427
      CRC5EF   : Extensions.Unsigned_1;  -- p32mx470f512.h:4428
   end record
     with Convention => C_Pass_By_Copy,
     Pack => True,
     Alignment => 4;
   type uu_U1EIRbits_t_struct1995 is record
      anon6719 : Extensions.Unsigned_1;  -- p32mx470f512.h:4431
      EOFEF    : Extensions.Unsigned_1;  -- p32mx470f512.h:4432
   end record
     with Convention => C_Pass_By_Copy,
     Pack => True,
     Alignment => 4;
   type uu_U1EIRbits_t (discr : unsigned := 0) is record
      case discr is
         when 0 => anon6712 : aliased uu_U1EIRbits_t_struct1993;  -- p32mx470f512.h:4425
         when 1 => anon6717 : aliased uu_U1EIRbits_t_struct1994;  -- p32mx470f512.h:4429
         when 2 => anon6722 : aliased uu_U1EIRbits_t_struct1995;  -- p32mx470f512.h:4433
         when others => null;
      end case;
   end record
     with Convention => C_Pass_By_Copy,
     Unchecked_Union => True;  -- p32mx470f512.h:4434

   U1EIRbits : aliased uu_U1EIRbits_t  -- p32mx470f512.h:4435
     with Import => True,
     Convention => C,
     External_Name => "U1EIR";

   U1EIRCLR : aliased unsigned  -- p32mx470f512.h:4436
     with Import => True,
     Convention => C,
     External_Name => "U1EIRCLR";

   U1EIE : aliased unsigned  -- p32mx470f512.h:4437
     with Import => True,
     Convention => C,
     External_Name => "U1EIE";

   type uu_U1EIEbits_t_struct2000 is record
      PIDEE        : Extensions.Unsigned_1;  -- p32mx470f512.h:4440
      CRC5EE_EOFEE : Extensions.Unsigned_1;  -- p32mx470f512.h:4441
      CRC16EE      : Extensions.Unsigned_1;  -- p32mx470f512.h:4442
      DFN8EE       : Extensions.Unsigned_1;  -- p32mx470f512.h:4443
      BTOEE        : Extensions.Unsigned_1;  -- p32mx470f512.h:4444
      DMAEE        : Extensions.Unsigned_1;  -- p32mx470f512.h:4445
      BMXEE        : Extensions.Unsigned_1;  -- p32mx470f512.h:4446
      BTSEE        : Extensions.Unsigned_1;  -- p32mx470f512.h:4447
   end record
     with Convention => C_Pass_By_Copy,
     Pack => True,
     Alignment => 4;
   type uu_U1EIEbits_t_struct2001 is record
      anon6740 : Extensions.Unsigned_1;  -- p32mx470f512.h:4450
      CRC5EE   : Extensions.Unsigned_1;  -- p32mx470f512.h:4451
   end record
     with Convention => C_Pass_By_Copy,
     Pack => True,
     Alignment => 4;
   type uu_U1EIEbits_t_struct2002 is record
      anon6745 : Extensions.Unsigned_1;  -- p32mx470f512.h:4454
      EOFEE    : Extensions.Unsigned_1;  -- p32mx470f512.h:4455
   end record
     with Convention => C_Pass_By_Copy,
     Pack => True,
     Alignment => 4;
   type uu_U1EIEbits_t (discr : unsigned := 0) is record
      case discr is
         when 0 => anon6738 : aliased uu_U1EIEbits_t_struct2000;  -- p32mx470f512.h:4448
         when 1 => anon6743 : aliased uu_U1EIEbits_t_struct2001;  -- p32mx470f512.h:4452
         when 2 => anon6748 : aliased uu_U1EIEbits_t_struct2002;  -- p32mx470f512.h:4456
         when others => null;
      end case;
   end record
     with Convention => C_Pass_By_Copy,
     Unchecked_Union => True;  -- p32mx470f512.h:4457

   U1EIEbits : aliased uu_U1EIEbits_t  -- p32mx470f512.h:4458
     with Import => True,
     Convention => C,
     External_Name => "U1EIE";

   U1EIECLR : aliased unsigned  -- p32mx470f512.h:4459
     with Import => True,
     Convention => C,
     External_Name => "U1EIECLR";

   U1EIESET : aliased unsigned  -- p32mx470f512.h:4460
     with Import => True,
     Convention => C,
     External_Name => "U1EIESET";

   U1EIEINV : aliased unsigned  -- p32mx470f512.h:4461
     with Import => True,
     Convention => C,
     External_Name => "U1EIEINV";

   U1STAT : aliased unsigned  -- p32mx470f512.h:4462
     with Import => True,
     Convention => C,
     External_Name => "U1STAT";

   type uu_U1STATbits_t_struct2007 is record
      anon6757 : Extensions.Unsigned_2;  -- p32mx470f512.h:4465
      PPBI     : Extensions.Unsigned_1;  -- p32mx470f512.h:4466
      DIR      : Extensions.Unsigned_1;  -- p32mx470f512.h:4467
      ENDPT    : Extensions.Unsigned_4;  -- p32mx470f512.h:4468
   end record
     with Convention => C_Pass_By_Copy,
     Pack => True,
     Alignment => 4;
   type uu_U1STATbits_t_struct2008 is record
      anon6764 : Extensions.Unsigned_4;  -- p32mx470f512.h:4471
      ENDPT0   : Extensions.Unsigned_1;  -- p32mx470f512.h:4472
      ENDPT1   : Extensions.Unsigned_1;  -- p32mx470f512.h:4473
      ENDPT2   : Extensions.Unsigned_1;  -- p32mx470f512.h:4474
      ENDPT3   : Extensions.Unsigned_1;  -- p32mx470f512.h:4475
   end record
     with Convention => C_Pass_By_Copy,
     Pack => True,
     Alignment => 4;
   type uu_U1STATbits_t (discr : unsigned := 0) is record
      case discr is
         when 0 => anon6762 : aliased uu_U1STATbits_t_struct2007;  -- p32mx470f512.h:4469
         when 1 => anon6770 : aliased uu_U1STATbits_t_struct2008;  -- p32mx470f512.h:4476
         when others => null;
      end case;
   end record
     with Convention => C_Pass_By_Copy,
     Unchecked_Union => True;  -- p32mx470f512.h:4477

   U1STATbits : aliased uu_U1STATbits_t  -- p32mx470f512.h:4478
     with Import => True,
     Convention => C,
     External_Name => "U1STAT";

   U1CON : aliased unsigned  -- p32mx470f512.h:4479
     with Import => True,
     Convention => C,
     External_Name => "U1CON";

   type uu_U1CONbits_t_struct2013 is record
      USBEN_SOFEN    : Extensions.Unsigned_1;  -- p32mx470f512.h:4482
      PPBRST         : Extensions.Unsigned_1;  -- p32mx470f512.h:4483
      RESUME         : Extensions.Unsigned_1;  -- p32mx470f512.h:4484
      HOSTEN         : Extensions.Unsigned_1;  -- p32mx470f512.h:4485
      USBRST         : Extensions.Unsigned_1;  -- p32mx470f512.h:4486
      PKTDIS_TOKBUSY : Extensions.Unsigned_1;  -- p32mx470f512.h:4487
      SE0            : Extensions.Unsigned_1;  -- p32mx470f512.h:4488
      JSTATE         : Extensions.Unsigned_1;  -- p32mx470f512.h:4489
   end record
     with Convention => C_Pass_By_Copy,
     Pack => True,
     Alignment => 4;
   type uu_U1CONbits_t_struct2014 is record
      USBEN : Extensions.Unsigned_1;  -- p32mx470f512.h:4492
   end record
     with Convention => C_Pass_By_Copy,
     Pack => True,
     Alignment => 4;
   type uu_U1CONbits_t_struct2015 is record
      SOFEN    : Extensions.Unsigned_1;  -- p32mx470f512.h:4495
      anon6792 : Extensions.Unsigned_4;  -- p32mx470f512.h:4496
      PKTDIS   : Extensions.Unsigned_1;  -- p32mx470f512.h:4497
   end record
     with Convention => C_Pass_By_Copy,
     Pack => True,
     Alignment => 4;
   type uu_U1CONbits_t_struct2016 is record
      anon6797 : Extensions.Unsigned_5;  -- p32mx470f512.h:4500
      TOKBUSY  : Extensions.Unsigned_1;  -- p32mx470f512.h:4501
   end record
     with Convention => C_Pass_By_Copy,
     Pack => True,
     Alignment => 4;
   type uu_U1CONbits_t (discr : unsigned := 0) is record
      case discr is
         when 0 => anon6785 : aliased uu_U1CONbits_t_struct2013;  -- p32mx470f512.h:4490
         when 1 => anon6789 : aliased uu_U1CONbits_t_struct2014;  -- p32mx470f512.h:4493
         when 2 => anon6795 : aliased uu_U1CONbits_t_struct2015;  -- p32mx470f512.h:4498
         when 3 => anon6800 : aliased uu_U1CONbits_t_struct2016;  -- p32mx470f512.h:4502
         when others => null;
      end case;
   end record
     with Convention => C_Pass_By_Copy,
     Unchecked_Union => True;  -- p32mx470f512.h:4503

   U1CONbits : aliased uu_U1CONbits_t  -- p32mx470f512.h:4504
     with Import => True,
     Convention => C,
     External_Name => "U1CON";

   U1CONCLR : aliased unsigned  -- p32mx470f512.h:4505
     with Import => True,
     Convention => C,
     External_Name => "U1CONCLR";

   U1CONSET : aliased unsigned  -- p32mx470f512.h:4506
     with Import => True,
     Convention => C,
     External_Name => "U1CONSET";

   U1CONINV : aliased unsigned  -- p32mx470f512.h:4507
     with Import => True,
     Convention => C,
     External_Name => "U1CONINV";

   U1ADDR : aliased unsigned  -- p32mx470f512.h:4508
     with Import => True,
     Convention => C,
     External_Name => "U1ADDR";

   type uu_U1ADDRbits_t_struct2021 is record
      DEVADDR : Extensions.Unsigned_7;  -- p32mx470f512.h:4511
      LSPDEN  : Extensions.Unsigned_1;  -- p32mx470f512.h:4512
   end record
     with Convention => C_Pass_By_Copy,
     Pack => True,
     Alignment => 4;
   type uu_U1ADDRbits_t_struct2022 is record
      DEVADDR0 : Extensions.Unsigned_1;  -- p32mx470f512.h:4515
      DEVADDR1 : Extensions.Unsigned_1;  -- p32mx470f512.h:4516
      DEVADDR2 : Extensions.Unsigned_1;  -- p32mx470f512.h:4517
      DEVADDR3 : Extensions.Unsigned_1;  -- p32mx470f512.h:4518
      DEVADDR4 : Extensions.Unsigned_1;  -- p32mx470f512.h:4519
      DEVADDR5 : Extensions.Unsigned_1;  -- p32mx470f512.h:4520
      DEVADDR6 : Extensions.Unsigned_1;  -- p32mx470f512.h:4521
   end record
     with Convention => C_Pass_By_Copy,
     Pack => True,
     Alignment => 4;
   type uu_U1ADDRbits_t (discr : unsigned := 0) is record
      case discr is
         when 0 => anon6812 : aliased uu_U1ADDRbits_t_struct2021;  -- p32mx470f512.h:4513
         when 1 => anon6822 : aliased uu_U1ADDRbits_t_struct2022;  -- p32mx470f512.h:4522
         when others => null;
      end case;
   end record
     with Convention => C_Pass_By_Copy,
     Unchecked_Union => True;  -- p32mx470f512.h:4523

   U1ADDRbits : aliased uu_U1ADDRbits_t  -- p32mx470f512.h:4524
     with Import => True,
     Convention => C,
     External_Name => "U1ADDR";

   U1ADDRCLR : aliased unsigned  -- p32mx470f512.h:4525
     with Import => True,
     Convention => C,
     External_Name => "U1ADDRCLR";

   U1ADDRSET : aliased unsigned  -- p32mx470f512.h:4526
     with Import => True,
     Convention => C,
     External_Name => "U1ADDRSET";

   U1ADDRINV : aliased unsigned  -- p32mx470f512.h:4527
     with Import => True,
     Convention => C,
     External_Name => "U1ADDRINV";

   U1BDTP1 : aliased unsigned  -- p32mx470f512.h:4528
     with Import => True,
     Convention => C,
     External_Name => "U1BDTP1";

   type uu_U1BDTP1bits_t is record
      anon6830 : Extensions.Unsigned_1;  -- p32mx470f512.h:4530
      BDTPTRL  : Extensions.Unsigned_7;  -- p32mx470f512.h:4531
   end record
     with Convention => C_Pass_By_Copy,
     Pack => True,
     Alignment => 4;  -- p32mx470f512.h:4532

   U1BDTP1bits : aliased uu_U1BDTP1bits_t  -- p32mx470f512.h:4533
     with Import => True,
     Convention => C,
     External_Name => "U1BDTP1";

   U1BDTP1CLR : aliased unsigned  -- p32mx470f512.h:4534
     with Import => True,
     Convention => C,
     External_Name => "U1BDTP1CLR";

   U1BDTP1SET : aliased unsigned  -- p32mx470f512.h:4535
     with Import => True,
     Convention => C,
     External_Name => "U1BDTP1SET";

   U1BDTP1INV : aliased unsigned  -- p32mx470f512.h:4536
     with Import => True,
     Convention => C,
     External_Name => "U1BDTP1INV";

   U1FRML : aliased unsigned  -- p32mx470f512.h:4537
     with Import => True,
     Convention => C,
     External_Name => "U1FRML";

   type uu_U1FRMLbits_t_struct2031 is record
      FRML : aliased unsigned_char;  -- p32mx470f512.h:4540
   end record
     with Convention => C_Pass_By_Copy;
   type uu_U1FRMLbits_t_struct2032 is record
      FRM0 : Extensions.Unsigned_1;  -- p32mx470f512.h:4543
      FRM1 : Extensions.Unsigned_1;  -- p32mx470f512.h:4544
      FRM2 : Extensions.Unsigned_1;  -- p32mx470f512.h:4545
      FRM3 : Extensions.Unsigned_1;  -- p32mx470f512.h:4546
      FRM4 : Extensions.Unsigned_1;  -- p32mx470f512.h:4547
      FRM5 : Extensions.Unsigned_1;  -- p32mx470f512.h:4548
      FRM6 : Extensions.Unsigned_1;  -- p32mx470f512.h:4549
      FRM7 : Extensions.Unsigned_1;  -- p32mx470f512.h:4550
   end record
     with Convention => C_Pass_By_Copy,
     Pack => True,
     Alignment => 4;
   type uu_U1FRMLbits_t (discr : unsigned := 0) is record
      case discr is
         when 0 => anon6843 : aliased uu_U1FRMLbits_t_struct2031;  -- p32mx470f512.h:4541
         when 1 => anon6854 : aliased uu_U1FRMLbits_t_struct2032;  -- p32mx470f512.h:4551
         when others => null;
      end case;
   end record
     with Convention => C_Pass_By_Copy,
     Unchecked_Union => True;  -- p32mx470f512.h:4552

   U1FRMLbits : aliased uu_U1FRMLbits_t  -- p32mx470f512.h:4553
     with Import => True,
     Convention => C,
     External_Name => "U1FRML";

   U1FRMH : aliased unsigned  -- p32mx470f512.h:4554
     with Import => True,
     Convention => C,
     External_Name => "U1FRMH";

   type uu_U1FRMHbits_t_struct2037 is record
      FRMH : Extensions.Unsigned_3;  -- p32mx470f512.h:4557
   end record
     with Convention => C_Pass_By_Copy,
     Pack => True,
     Alignment => 4;
   type uu_U1FRMHbits_t_struct2038 is record
      FRM8  : Extensions.Unsigned_1;  -- p32mx470f512.h:4560
      FRM9  : Extensions.Unsigned_1;  -- p32mx470f512.h:4561
      FRM10 : Extensions.Unsigned_1;  -- p32mx470f512.h:4562
   end record
     with Convention => C_Pass_By_Copy,
     Pack => True,
     Alignment => 4;
   type uu_U1FRMHbits_t (discr : unsigned := 0) is record
      case discr is
         when 0 => anon6862 : aliased uu_U1FRMHbits_t_struct2037;  -- p32mx470f512.h:4558
         when 1 => anon6868 : aliased uu_U1FRMHbits_t_struct2038;  -- p32mx470f512.h:4563
         when others => null;
      end case;
   end record
     with Convention => C_Pass_By_Copy,
     Unchecked_Union => True;  -- p32mx470f512.h:4564

   U1FRMHbits : aliased uu_U1FRMHbits_t  -- p32mx470f512.h:4565
     with Import => True,
     Convention => C,
     External_Name => "U1FRMH";

   U1TOK : aliased unsigned  -- p32mx470f512.h:4566
     with Import => True,
     Convention => C,
     External_Name => "U1TOK";

   type uu_U1TOKbits_t_struct2043 is record
      EP  : Extensions.Unsigned_4;  -- p32mx470f512.h:4569
      PID : Extensions.Unsigned_4;  -- p32mx470f512.h:4570
   end record
     with Convention => C_Pass_By_Copy,
     Pack => True,
     Alignment => 4;
   type uu_U1TOKbits_t_struct2044 is record
      EP0 : Extensions.Unsigned_1;  -- p32mx470f512.h:4573
   end record
     with Convention => C_Pass_By_Copy,
     Pack => True,
     Alignment => 4;
   type uu_U1TOKbits_t_struct2045 is record
      anon6883 : Extensions.Unsigned_1;  -- p32mx470f512.h:4576
      EP1      : Extensions.Unsigned_1;  -- p32mx470f512.h:4577
      EP2      : Extensions.Unsigned_1;  -- p32mx470f512.h:4578
      EP3      : Extensions.Unsigned_1;  -- p32mx470f512.h:4579
      PID0     : Extensions.Unsigned_1;  -- p32mx470f512.h:4580
   end record
     with Convention => C_Pass_By_Copy,
     Pack => True,
     Alignment => 4;
   type uu_U1TOKbits_t_struct2046 is record
      anon6891 : Extensions.Unsigned_5;  -- p32mx470f512.h:4583
      PID1     : Extensions.Unsigned_1;  -- p32mx470f512.h:4584
      PID2     : Extensions.Unsigned_1;  -- p32mx470f512.h:4585
      PID3     : Extensions.Unsigned_1;  -- p32mx470f512.h:4586
   end record
     with Convention => C_Pass_By_Copy,
     Pack => True,
     Alignment => 4;
   type uu_U1TOKbits_t (discr : unsigned := 0) is record
      case discr is
         when 0 => anon6877 : aliased uu_U1TOKbits_t_struct2043;  -- p32mx470f512.h:4571
         when 1 => anon6881 : aliased uu_U1TOKbits_t_struct2044;  -- p32mx470f512.h:4574
         when 2 => anon6889 : aliased uu_U1TOKbits_t_struct2045;  -- p32mx470f512.h:4581
         when 3 => anon6896 : aliased uu_U1TOKbits_t_struct2046;  -- p32mx470f512.h:4587
         when others => null;
      end case;
   end record
     with Convention => C_Pass_By_Copy,
     Unchecked_Union => True;  -- p32mx470f512.h:4588

   U1TOKbits : aliased uu_U1TOKbits_t  -- p32mx470f512.h:4589
     with Import => True,
     Convention => C,
     External_Name => "U1TOK";

   U1TOKCLR : aliased unsigned  -- p32mx470f512.h:4590
     with Import => True,
     Convention => C,
     External_Name => "U1TOKCLR";

   U1TOKSET : aliased unsigned  -- p32mx470f512.h:4591
     with Import => True,
     Convention => C,
     External_Name => "U1TOKSET";

   U1TOKINV : aliased unsigned  -- p32mx470f512.h:4592
     with Import => True,
     Convention => C,
     External_Name => "U1TOKINV";

   U1SOF : aliased unsigned  -- p32mx470f512.h:4593
     with Import => True,
     Convention => C,
     External_Name => "U1SOF";

   type uu_U1SOFbits_t is record
      CNT : aliased unsigned_char;  -- p32mx470f512.h:4595
   end record
     with Convention => C_Pass_By_Copy;  -- p32mx470f512.h:4596

   U1SOFbits : aliased uu_U1SOFbits_t  -- p32mx470f512.h:4597
     with Import => True,
     Convention => C,
     External_Name => "U1SOF";

   U1SOFCLR : aliased unsigned  -- p32mx470f512.h:4598
     with Import => True,
     Convention => C,
     External_Name => "U1SOFCLR";

   U1SOFSET : aliased unsigned  -- p32mx470f512.h:4599
     with Import => True,
     Convention => C,
     External_Name => "U1SOFSET";

   U1SOFINV : aliased unsigned  -- p32mx470f512.h:4600
     with Import => True,
     Convention => C,
     External_Name => "U1SOFINV";

   U1BDTP2 : aliased unsigned  -- p32mx470f512.h:4601
     with Import => True,
     Convention => C,
     External_Name => "U1BDTP2";

   type uu_U1BDTP2bits_t is record
      BDTPTRH : aliased unsigned_char;  -- p32mx470f512.h:4603
   end record
     with Convention => C_Pass_By_Copy;  -- p32mx470f512.h:4604

   U1BDTP2bits : aliased uu_U1BDTP2bits_t  -- p32mx470f512.h:4605
     with Import => True,
     Convention => C,
     External_Name => "U1BDTP2";

   U1BDTP2CLR : aliased unsigned  -- p32mx470f512.h:4606
     with Import => True,
     Convention => C,
     External_Name => "U1BDTP2CLR";

   U1BDTP2SET : aliased unsigned  -- p32mx470f512.h:4607
     with Import => True,
     Convention => C,
     External_Name => "U1BDTP2SET";

   U1BDTP2INV : aliased unsigned  -- p32mx470f512.h:4608
     with Import => True,
     Convention => C,
     External_Name => "U1BDTP2INV";

   U1BDTP3 : aliased unsigned  -- p32mx470f512.h:4609
     with Import => True,
     Convention => C,
     External_Name => "U1BDTP3";

   type uu_U1BDTP3bits_t is record
      BDTPTRU : aliased unsigned_char;  -- p32mx470f512.h:4611
   end record
     with Convention => C_Pass_By_Copy;  -- p32mx470f512.h:4612

   U1BDTP3bits : aliased uu_U1BDTP3bits_t  -- p32mx470f512.h:4613
     with Import => True,
     Convention => C,
     External_Name => "U1BDTP3";

   U1BDTP3CLR : aliased unsigned  -- p32mx470f512.h:4614
     with Import => True,
     Convention => C,
     External_Name => "U1BDTP3CLR";

   U1BDTP3SET : aliased unsigned  -- p32mx470f512.h:4615
     with Import => True,
     Convention => C,
     External_Name => "U1BDTP3SET";

   U1BDTP3INV : aliased unsigned  -- p32mx470f512.h:4616
     with Import => True,
     Convention => C,
     External_Name => "U1BDTP3INV";

   U1CNFG1 : aliased unsigned  -- p32mx470f512.h:4617
     with Import => True,
     Convention => C,
     External_Name => "U1CNFG1";

   type uu_U1CNFG1bits_t is record
      UASUSPND : Extensions.Unsigned_1;  -- p32mx470f512.h:4619
      anon6932 : Extensions.Unsigned_3;  -- p32mx470f512.h:4620
      USBSIDL  : Extensions.Unsigned_1;  -- p32mx470f512.h:4621
      anon6934 : Extensions.Unsigned_1;  -- p32mx470f512.h:4622
      UOEMON   : Extensions.Unsigned_1;  -- p32mx470f512.h:4623
      UTEYE    : Extensions.Unsigned_1;  -- p32mx470f512.h:4624
   end record
     with Convention => C_Pass_By_Copy,
     Pack => True,
     Alignment => 4;  -- p32mx470f512.h:4625

   U1CNFG1bits : aliased uu_U1CNFG1bits_t  -- p32mx470f512.h:4626
     with Import => True,
     Convention => C,
     External_Name => "U1CNFG1";

   U1CNFG1CLR : aliased unsigned  -- p32mx470f512.h:4627
     with Import => True,
     Convention => C,
     External_Name => "U1CNFG1CLR";

   U1CNFG1SET : aliased unsigned  -- p32mx470f512.h:4628
     with Import => True,
     Convention => C,
     External_Name => "U1CNFG1SET";

   U1CNFG1INV : aliased unsigned  -- p32mx470f512.h:4629
     with Import => True,
     Convention => C,
     External_Name => "U1CNFG1INV";

   U1EP0 : aliased unsigned  -- p32mx470f512.h:4630
     with Import => True,
     Convention => C,
     External_Name => "U1EP0";

   type uu_U1EP0bits_t is record
      EPHSHK   : Extensions.Unsigned_1;  -- p32mx470f512.h:4632
      EPSTALL  : Extensions.Unsigned_1;  -- p32mx470f512.h:4633
      EPTXEN   : Extensions.Unsigned_1;  -- p32mx470f512.h:4634
      EPRXEN   : Extensions.Unsigned_1;  -- p32mx470f512.h:4635
      EPCONDIS : Extensions.Unsigned_1;  -- p32mx470f512.h:4636
      anon6950 : Extensions.Unsigned_1;  -- p32mx470f512.h:4637
      RETRYDIS : Extensions.Unsigned_1;  -- p32mx470f512.h:4638
      LSPD     : Extensions.Unsigned_1;  -- p32mx470f512.h:4639
   end record
     with Convention => C_Pass_By_Copy,
     Pack => True,
     Alignment => 4;  -- p32mx470f512.h:4640

   U1EP0bits : aliased uu_U1EP0bits_t  -- p32mx470f512.h:4641
     with Import => True,
     Convention => C,
     External_Name => "U1EP0";

   U1EP0CLR : aliased unsigned  -- p32mx470f512.h:4642
     with Import => True,
     Convention => C,
     External_Name => "U1EP0CLR";

   U1EP0SET : aliased unsigned  -- p32mx470f512.h:4643
     with Import => True,
     Convention => C,
     External_Name => "U1EP0SET";

   U1EP0INV : aliased unsigned  -- p32mx470f512.h:4644
     with Import => True,
     Convention => C,
     External_Name => "U1EP0INV";

   U1EP1 : aliased unsigned  -- p32mx470f512.h:4645
     with Import => True,
     Convention => C,
     External_Name => "U1EP1";

   type uu_U1EP1bits_t is record
      EPHSHK   : Extensions.Unsigned_1;  -- p32mx470f512.h:4647
      EPSTALL  : Extensions.Unsigned_1;  -- p32mx470f512.h:4648
      EPTXEN   : Extensions.Unsigned_1;  -- p32mx470f512.h:4649
      EPRXEN   : Extensions.Unsigned_1;  -- p32mx470f512.h:4650
      EPCONDIS : Extensions.Unsigned_1;  -- p32mx470f512.h:4651
   end record
     with Convention => C_Pass_By_Copy,
     Pack => True,
     Alignment => 4;  -- p32mx470f512.h:4652

   U1EP1bits : aliased uu_U1EP1bits_t  -- p32mx470f512.h:4653
     with Import => True,
     Convention => C,
     External_Name => "U1EP1";

   U1EP1CLR : aliased unsigned  -- p32mx470f512.h:4654
     with Import => True,
     Convention => C,
     External_Name => "U1EP1CLR";

   U1EP1SET : aliased unsigned  -- p32mx470f512.h:4655
     with Import => True,
     Convention => C,
     External_Name => "U1EP1SET";

   U1EP1INV : aliased unsigned  -- p32mx470f512.h:4656
     with Import => True,
     Convention => C,
     External_Name => "U1EP1INV";

   U1EP2 : aliased unsigned  -- p32mx470f512.h:4657
     with Import => True,
     Convention => C,
     External_Name => "U1EP2";

   type uu_U1EP2bits_t is record
      EPHSHK   : Extensions.Unsigned_1;  -- p32mx470f512.h:4659
      EPSTALL  : Extensions.Unsigned_1;  -- p32mx470f512.h:4660
      EPTXEN   : Extensions.Unsigned_1;  -- p32mx470f512.h:4661
      EPRXEN   : Extensions.Unsigned_1;  -- p32mx470f512.h:4662
      EPCONDIS : Extensions.Unsigned_1;  -- p32mx470f512.h:4663
   end record
     with Convention => C_Pass_By_Copy,
     Pack => True,
     Alignment => 4;  -- p32mx470f512.h:4664

   U1EP2bits : aliased uu_U1EP2bits_t  -- p32mx470f512.h:4665
     with Import => True,
     Convention => C,
     External_Name => "U1EP2";

   U1EP2CLR : aliased unsigned  -- p32mx470f512.h:4666
     with Import => True,
     Convention => C,
     External_Name => "U1EP2CLR";

   U1EP2SET : aliased unsigned  -- p32mx470f512.h:4667
     with Import => True,
     Convention => C,
     External_Name => "U1EP2SET";

   U1EP2INV : aliased unsigned  -- p32mx470f512.h:4668
     with Import => True,
     Convention => C,
     External_Name => "U1EP2INV";

   U1EP3 : aliased unsigned  -- p32mx470f512.h:4669
     with Import => True,
     Convention => C,
     External_Name => "U1EP3";

   type uu_U1EP3bits_t is record
      EPHSHK   : Extensions.Unsigned_1;  -- p32mx470f512.h:4671
      EPSTALL  : Extensions.Unsigned_1;  -- p32mx470f512.h:4672
      EPTXEN   : Extensions.Unsigned_1;  -- p32mx470f512.h:4673
      EPRXEN   : Extensions.Unsigned_1;  -- p32mx470f512.h:4674
      EPCONDIS : Extensions.Unsigned_1;  -- p32mx470f512.h:4675
   end record
     with Convention => C_Pass_By_Copy,
     Pack => True,
     Alignment => 4;  -- p32mx470f512.h:4676

   U1EP3bits : aliased uu_U1EP3bits_t  -- p32mx470f512.h:4677
     with Import => True,
     Convention => C,
     External_Name => "U1EP3";

   U1EP3CLR : aliased unsigned  -- p32mx470f512.h:4678
     with Import => True,
     Convention => C,
     External_Name => "U1EP3CLR";

   U1EP3SET : aliased unsigned  -- p32mx470f512.h:4679
     with Import => True,
     Convention => C,
     External_Name => "U1EP3SET";

   U1EP3INV : aliased unsigned  -- p32mx470f512.h:4680
     with Import => True,
     Convention => C,
     External_Name => "U1EP3INV";

   U1EP4 : aliased unsigned  -- p32mx470f512.h:4681
     with Import => True,
     Convention => C,
     External_Name => "U1EP4";

   type uu_U1EP4bits_t is record
      EPHSHK   : Extensions.Unsigned_1;  -- p32mx470f512.h:4683
      EPSTALL  : Extensions.Unsigned_1;  -- p32mx470f512.h:4684
      EPTXEN   : Extensions.Unsigned_1;  -- p32mx470f512.h:4685
      EPRXEN   : Extensions.Unsigned_1;  -- p32mx470f512.h:4686
      EPCONDIS : Extensions.Unsigned_1;  -- p32mx470f512.h:4687
   end record
     with Convention => C_Pass_By_Copy,
     Pack => True,
     Alignment => 4;  -- p32mx470f512.h:4688

   U1EP4bits : aliased uu_U1EP4bits_t  -- p32mx470f512.h:4689
     with Import => True,
     Convention => C,
     External_Name => "U1EP4";

   U1EP4CLR : aliased unsigned  -- p32mx470f512.h:4690
     with Import => True,
     Convention => C,
     External_Name => "U1EP4CLR";

   U1EP4SET : aliased unsigned  -- p32mx470f512.h:4691
     with Import => True,
     Convention => C,
     External_Name => "U1EP4SET";

   U1EP4INV : aliased unsigned  -- p32mx470f512.h:4692
     with Import => True,
     Convention => C,
     External_Name => "U1EP4INV";

   U1EP5 : aliased unsigned  -- p32mx470f512.h:4693
     with Import => True,
     Convention => C,
     External_Name => "U1EP5";

   type uu_U1EP5bits_t is record
      EPHSHK   : Extensions.Unsigned_1;  -- p32mx470f512.h:4695
      EPSTALL  : Extensions.Unsigned_1;  -- p32mx470f512.h:4696
      EPTXEN   : Extensions.Unsigned_1;  -- p32mx470f512.h:4697
      EPRXEN   : Extensions.Unsigned_1;  -- p32mx470f512.h:4698
      EPCONDIS : Extensions.Unsigned_1;  -- p32mx470f512.h:4699
   end record
     with Convention => C_Pass_By_Copy,
     Pack => True,
     Alignment => 4;  -- p32mx470f512.h:4700

   U1EP5bits : aliased uu_U1EP5bits_t  -- p32mx470f512.h:4701
     with Import => True,
     Convention => C,
     External_Name => "U1EP5";

   U1EP5CLR : aliased unsigned  -- p32mx470f512.h:4702
     with Import => True,
     Convention => C,
     External_Name => "U1EP5CLR";

   U1EP5SET : aliased unsigned  -- p32mx470f512.h:4703
     with Import => True,
     Convention => C,
     External_Name => "U1EP5SET";

   U1EP5INV : aliased unsigned  -- p32mx470f512.h:4704
     with Import => True,
     Convention => C,
     External_Name => "U1EP5INV";

   U1EP6 : aliased unsigned  -- p32mx470f512.h:4705
     with Import => True,
     Convention => C,
     External_Name => "U1EP6";

   type uu_U1EP6bits_t is record
      EPHSHK   : Extensions.Unsigned_1;  -- p32mx470f512.h:4707
      EPSTALL  : Extensions.Unsigned_1;  -- p32mx470f512.h:4708
      EPTXEN   : Extensions.Unsigned_1;  -- p32mx470f512.h:4709
      EPRXEN   : Extensions.Unsigned_1;  -- p32mx470f512.h:4710
      EPCONDIS : Extensions.Unsigned_1;  -- p32mx470f512.h:4711
   end record
     with Convention => C_Pass_By_Copy,
     Pack => True,
     Alignment => 4;  -- p32mx470f512.h:4712

   U1EP6bits : aliased uu_U1EP6bits_t  -- p32mx470f512.h:4713
     with Import => True,
     Convention => C,
     External_Name => "U1EP6";

   U1EP6CLR : aliased unsigned  -- p32mx470f512.h:4714
     with Import => True,
     Convention => C,
     External_Name => "U1EP6CLR";

   U1EP6SET : aliased unsigned  -- p32mx470f512.h:4715
     with Import => True,
     Convention => C,
     External_Name => "U1EP6SET";

   U1EP6INV : aliased unsigned  -- p32mx470f512.h:4716
     with Import => True,
     Convention => C,
     External_Name => "U1EP6INV";

   U1EP7 : aliased unsigned  -- p32mx470f512.h:4717
     with Import => True,
     Convention => C,
     External_Name => "U1EP7";

   type uu_U1EP7bits_t is record
      EPHSHK   : Extensions.Unsigned_1;  -- p32mx470f512.h:4719
      EPSTALL  : Extensions.Unsigned_1;  -- p32mx470f512.h:4720
      EPTXEN   : Extensions.Unsigned_1;  -- p32mx470f512.h:4721
      EPRXEN   : Extensions.Unsigned_1;  -- p32mx470f512.h:4722
      EPCONDIS : Extensions.Unsigned_1;  -- p32mx470f512.h:4723
   end record
     with Convention => C_Pass_By_Copy,
     Pack => True,
     Alignment => 4;  -- p32mx470f512.h:4724

   U1EP7bits : aliased uu_U1EP7bits_t  -- p32mx470f512.h:4725
     with Import => True,
     Convention => C,
     External_Name => "U1EP7";

   U1EP7CLR : aliased unsigned  -- p32mx470f512.h:4726
     with Import => True,
     Convention => C,
     External_Name => "U1EP7CLR";

   U1EP7SET : aliased unsigned  -- p32mx470f512.h:4727
     with Import => True,
     Convention => C,
     External_Name => "U1EP7SET";

   U1EP7INV : aliased unsigned  -- p32mx470f512.h:4728
     with Import => True,
     Convention => C,
     External_Name => "U1EP7INV";

   U1EP8 : aliased unsigned  -- p32mx470f512.h:4729
     with Import => True,
     Convention => C,
     External_Name => "U1EP8";

   type uu_U1EP8bits_t is record
      EPHSHK   : Extensions.Unsigned_1;  -- p32mx470f512.h:4731
      EPSTALL  : Extensions.Unsigned_1;  -- p32mx470f512.h:4732
      EPTXEN   : Extensions.Unsigned_1;  -- p32mx470f512.h:4733
      EPRXEN   : Extensions.Unsigned_1;  -- p32mx470f512.h:4734
      EPCONDIS : Extensions.Unsigned_1;  -- p32mx470f512.h:4735
   end record
     with Convention => C_Pass_By_Copy,
     Pack => True,
     Alignment => 4;  -- p32mx470f512.h:4736

   U1EP8bits : aliased uu_U1EP8bits_t  -- p32mx470f512.h:4737
     with Import => True,
     Convention => C,
     External_Name => "U1EP8";

   U1EP8CLR : aliased unsigned  -- p32mx470f512.h:4738
     with Import => True,
     Convention => C,
     External_Name => "U1EP8CLR";

   U1EP8SET : aliased unsigned  -- p32mx470f512.h:4739
     with Import => True,
     Convention => C,
     External_Name => "U1EP8SET";

   U1EP8INV : aliased unsigned  -- p32mx470f512.h:4740
     with Import => True,
     Convention => C,
     External_Name => "U1EP8INV";

   U1EP9 : aliased unsigned  -- p32mx470f512.h:4741
     with Import => True,
     Convention => C,
     External_Name => "U1EP9";

   type uu_U1EP9bits_t is record
      EPHSHK   : Extensions.Unsigned_1;  -- p32mx470f512.h:4743
      EPSTALL  : Extensions.Unsigned_1;  -- p32mx470f512.h:4744
      EPTXEN   : Extensions.Unsigned_1;  -- p32mx470f512.h:4745
      EPRXEN   : Extensions.Unsigned_1;  -- p32mx470f512.h:4746
      EPCONDIS : Extensions.Unsigned_1;  -- p32mx470f512.h:4747
   end record
     with Convention => C_Pass_By_Copy,
     Pack => True,
     Alignment => 4;  -- p32mx470f512.h:4748

   U1EP9bits : aliased uu_U1EP9bits_t  -- p32mx470f512.h:4749
     with Import => True,
     Convention => C,
     External_Name => "U1EP9";

   U1EP9CLR : aliased unsigned  -- p32mx470f512.h:4750
     with Import => True,
     Convention => C,
     External_Name => "U1EP9CLR";

   U1EP9SET : aliased unsigned  -- p32mx470f512.h:4751
     with Import => True,
     Convention => C,
     External_Name => "U1EP9SET";

   U1EP9INV : aliased unsigned  -- p32mx470f512.h:4752
     with Import => True,
     Convention => C,
     External_Name => "U1EP9INV";

   U1EP10 : aliased unsigned  -- p32mx470f512.h:4753
     with Import => True,
     Convention => C,
     External_Name => "U1EP10";

   type uu_U1EP10bits_t is record
      EPHSHK   : Extensions.Unsigned_1;  -- p32mx470f512.h:4755
      EPSTALL  : Extensions.Unsigned_1;  -- p32mx470f512.h:4756
      EPTXEN   : Extensions.Unsigned_1;  -- p32mx470f512.h:4757
      EPRXEN   : Extensions.Unsigned_1;  -- p32mx470f512.h:4758
      EPCONDIS : Extensions.Unsigned_1;  -- p32mx470f512.h:4759
   end record
     with Convention => C_Pass_By_Copy,
     Pack => True,
     Alignment => 4;  -- p32mx470f512.h:4760

   U1EP10bits : aliased uu_U1EP10bits_t  -- p32mx470f512.h:4761
     with Import => True,
     Convention => C,
     External_Name => "U1EP10";

   U1EP10CLR : aliased unsigned  -- p32mx470f512.h:4762
     with Import => True,
     Convention => C,
     External_Name => "U1EP10CLR";

   U1EP10SET : aliased unsigned  -- p32mx470f512.h:4763
     with Import => True,
     Convention => C,
     External_Name => "U1EP10SET";

   U1EP10INV : aliased unsigned  -- p32mx470f512.h:4764
     with Import => True,
     Convention => C,
     External_Name => "U1EP10INV";

   U1EP11 : aliased unsigned  -- p32mx470f512.h:4765
     with Import => True,
     Convention => C,
     External_Name => "U1EP11";

   type uu_U1EP11bits_t is record
      EPHSHK   : Extensions.Unsigned_1;  -- p32mx470f512.h:4767
      EPSTALL  : Extensions.Unsigned_1;  -- p32mx470f512.h:4768
      EPTXEN   : Extensions.Unsigned_1;  -- p32mx470f512.h:4769
      EPRXEN   : Extensions.Unsigned_1;  -- p32mx470f512.h:4770
      EPCONDIS : Extensions.Unsigned_1;  -- p32mx470f512.h:4771
   end record
     with Convention => C_Pass_By_Copy,
     Pack => True,
     Alignment => 4;  -- p32mx470f512.h:4772

   U1EP11bits : aliased uu_U1EP11bits_t  -- p32mx470f512.h:4773
     with Import => True,
     Convention => C,
     External_Name => "U1EP11";

   U1EP11CLR : aliased unsigned  -- p32mx470f512.h:4774
     with Import => True,
     Convention => C,
     External_Name => "U1EP11CLR";

   U1EP11SET : aliased unsigned  -- p32mx470f512.h:4775
     with Import => True,
     Convention => C,
     External_Name => "U1EP11SET";

   U1EP11INV : aliased unsigned  -- p32mx470f512.h:4776
     with Import => True,
     Convention => C,
     External_Name => "U1EP11INV";

   U1EP12 : aliased unsigned  -- p32mx470f512.h:4777
     with Import => True,
     Convention => C,
     External_Name => "U1EP12";

   type uu_U1EP12bits_t is record
      EPHSHK   : Extensions.Unsigned_1;  -- p32mx470f512.h:4779
      EPSTALL  : Extensions.Unsigned_1;  -- p32mx470f512.h:4780
      EPTXEN   : Extensions.Unsigned_1;  -- p32mx470f512.h:4781
      EPRXEN   : Extensions.Unsigned_1;  -- p32mx470f512.h:4782
      EPCONDIS : Extensions.Unsigned_1;  -- p32mx470f512.h:4783
   end record
     with Convention => C_Pass_By_Copy,
     Pack => True,
     Alignment => 4;  -- p32mx470f512.h:4784

   U1EP12bits : aliased uu_U1EP12bits_t  -- p32mx470f512.h:4785
     with Import => True,
     Convention => C,
     External_Name => "U1EP12";

   U1EP12CLR : aliased unsigned  -- p32mx470f512.h:4786
     with Import => True,
     Convention => C,
     External_Name => "U1EP12CLR";

   U1EP12SET : aliased unsigned  -- p32mx470f512.h:4787
     with Import => True,
     Convention => C,
     External_Name => "U1EP12SET";

   U1EP12INV : aliased unsigned  -- p32mx470f512.h:4788
     with Import => True,
     Convention => C,
     External_Name => "U1EP12INV";

   U1EP13 : aliased unsigned  -- p32mx470f512.h:4789
     with Import => True,
     Convention => C,
     External_Name => "U1EP13";

   type uu_U1EP13bits_t is record
      EPHSHK   : Extensions.Unsigned_1;  -- p32mx470f512.h:4791
      EPSTALL  : Extensions.Unsigned_1;  -- p32mx470f512.h:4792
      EPTXEN   : Extensions.Unsigned_1;  -- p32mx470f512.h:4793
      EPRXEN   : Extensions.Unsigned_1;  -- p32mx470f512.h:4794
      EPCONDIS : Extensions.Unsigned_1;  -- p32mx470f512.h:4795
   end record
     with Convention => C_Pass_By_Copy,
     Pack => True,
     Alignment => 4;  -- p32mx470f512.h:4796

   U1EP13bits : aliased uu_U1EP13bits_t  -- p32mx470f512.h:4797
     with Import => True,
     Convention => C,
     External_Name => "U1EP13";

   U1EP13CLR : aliased unsigned  -- p32mx470f512.h:4798
     with Import => True,
     Convention => C,
     External_Name => "U1EP13CLR";

   U1EP13SET : aliased unsigned  -- p32mx470f512.h:4799
     with Import => True,
     Convention => C,
     External_Name => "U1EP13SET";

   U1EP13INV : aliased unsigned  -- p32mx470f512.h:4800
     with Import => True,
     Convention => C,
     External_Name => "U1EP13INV";

   U1EP14 : aliased unsigned  -- p32mx470f512.h:4801
     with Import => True,
     Convention => C,
     External_Name => "U1EP14";

   type uu_U1EP14bits_t is record
      EPHSHK   : Extensions.Unsigned_1;  -- p32mx470f512.h:4803
      EPSTALL  : Extensions.Unsigned_1;  -- p32mx470f512.h:4804
      EPTXEN   : Extensions.Unsigned_1;  -- p32mx470f512.h:4805
      EPRXEN   : Extensions.Unsigned_1;  -- p32mx470f512.h:4806
      EPCONDIS : Extensions.Unsigned_1;  -- p32mx470f512.h:4807
   end record
     with Convention => C_Pass_By_Copy,
     Pack => True,
     Alignment => 4;  -- p32mx470f512.h:4808

   U1EP14bits : aliased uu_U1EP14bits_t  -- p32mx470f512.h:4809
     with Import => True,
     Convention => C,
     External_Name => "U1EP14";

   U1EP14CLR : aliased unsigned  -- p32mx470f512.h:4810
     with Import => True,
     Convention => C,
     External_Name => "U1EP14CLR";

   U1EP14SET : aliased unsigned  -- p32mx470f512.h:4811
     with Import => True,
     Convention => C,
     External_Name => "U1EP14SET";

   U1EP14INV : aliased unsigned  -- p32mx470f512.h:4812
     with Import => True,
     Convention => C,
     External_Name => "U1EP14INV";

   U1EP15 : aliased unsigned  -- p32mx470f512.h:4813
     with Import => True,
     Convention => C,
     External_Name => "U1EP15";

   type uu_U1EP15bits_t is record
      EPHSHK   : Extensions.Unsigned_1;  -- p32mx470f512.h:4815
      EPSTALL  : Extensions.Unsigned_1;  -- p32mx470f512.h:4816
      EPTXEN   : Extensions.Unsigned_1;  -- p32mx470f512.h:4817
      EPRXEN   : Extensions.Unsigned_1;  -- p32mx470f512.h:4818
      EPCONDIS : Extensions.Unsigned_1;  -- p32mx470f512.h:4819
   end record
     with Convention => C_Pass_By_Copy,
     Pack => True,
     Alignment => 4;  -- p32mx470f512.h:4820

   U1EP15bits : aliased uu_U1EP15bits_t  -- p32mx470f512.h:4821
     with Import => True,
     Convention => C,
     External_Name => "U1EP15";

   U1EP15CLR : aliased unsigned  -- p32mx470f512.h:4822
     with Import => True,
     Convention => C,
     External_Name => "U1EP15CLR";

   U1EP15SET : aliased unsigned  -- p32mx470f512.h:4823
     with Import => True,
     Convention => C,
     External_Name => "U1EP15SET";

   U1EP15INV : aliased unsigned  -- p32mx470f512.h:4824
     with Import => True,
     Convention => C,
     External_Name => "U1EP15INV";

   ANSELB : aliased unsigned  -- p32mx470f512.h:4825
     with Import => True,
     Convention => C,
     External_Name => "ANSELB";

   type uu_ANSELBbits_t_struct2131 is record
      ANSB0  : Extensions.Unsigned_1;  -- p32mx470f512.h:4828
      ANSB1  : Extensions.Unsigned_1;  -- p32mx470f512.h:4829
      ANSB2  : Extensions.Unsigned_1;  -- p32mx470f512.h:4830
      ANSB3  : Extensions.Unsigned_1;  -- p32mx470f512.h:4831
      ANSB4  : Extensions.Unsigned_1;  -- p32mx470f512.h:4832
      ANSB5  : Extensions.Unsigned_1;  -- p32mx470f512.h:4833
      ANSB6  : Extensions.Unsigned_1;  -- p32mx470f512.h:4834
      ANSB7  : Extensions.Unsigned_1;  -- p32mx470f512.h:4835
      ANSB8  : Extensions.Unsigned_1;  -- p32mx470f512.h:4836
      ANSB9  : Extensions.Unsigned_1;  -- p32mx470f512.h:4837
      ANSB10 : Extensions.Unsigned_1;  -- p32mx470f512.h:4838
      ANSB11 : Extensions.Unsigned_1;  -- p32mx470f512.h:4839
      ANSB12 : Extensions.Unsigned_1;  -- p32mx470f512.h:4840
      ANSB13 : Extensions.Unsigned_1;  -- p32mx470f512.h:4841
      ANSB14 : Extensions.Unsigned_1;  -- p32mx470f512.h:4842
      ANSB15 : Extensions.Unsigned_1;  -- p32mx470f512.h:4843
   end record
     with Convention => C_Pass_By_Copy,
     Pack => True,
     Alignment => 4;

   type uu_ANSELBbits_t_struct2132 is record
      w : aliased unsigned;  -- p32mx470f512.h:4846
   end record
     with Convention => C_Pass_By_Copy;
   type uu_ANSELBbits_t (discr : unsigned := 0) is record
      case discr is
         when 0 => anon7174 : aliased uu_ANSELBbits_t_struct2131;  -- p32mx470f512.h:4844
         when 1 => anon7178 : aliased uu_ANSELBbits_t_struct2132;  -- p32mx470f512.h:4847
         when others => null;
      end case;
   end record
     with Convention => C_Pass_By_Copy,
     Unchecked_Union => True;  -- p32mx470f512.h:4848

   ANSELBbits : aliased uu_ANSELBbits_t  -- p32mx470f512.h:4849
     with Import => True,
     Convention => C,
     External_Name => "ANSELB";

   ANSELBCLR : aliased unsigned  -- p32mx470f512.h:4850
     with Import => True,
     Convention => C,
     External_Name => "ANSELBCLR";

   ANSELBSET : aliased unsigned  -- p32mx470f512.h:4851
     with Import => True,
     Convention => C,
     External_Name => "ANSELBSET";

   ANSELBINV : aliased unsigned  -- p32mx470f512.h:4852
     with Import => True,
     Convention => C,
     External_Name => "ANSELBINV";

   TRISB : aliased unsigned  -- p32mx470f512.h:4853
     with Import => True,
     Convention => C,
     External_Name => "TRISB";

   type uu_TRISBbits_t_struct2137 is record
      TRISB0  : Extensions.Unsigned_1;  -- p32mx470f512.h:4856
      TRISB1  : Extensions.Unsigned_1;  -- p32mx470f512.h:4857
      TRISB2  : Extensions.Unsigned_1;  -- p32mx470f512.h:4858
      TRISB3  : Extensions.Unsigned_1;  -- p32mx470f512.h:4859
      TRISB4  : Extensions.Unsigned_1;  -- p32mx470f512.h:4860
      TRISB5  : Extensions.Unsigned_1;  -- p32mx470f512.h:4861
      TRISB6  : Extensions.Unsigned_1;  -- p32mx470f512.h:4862
      TRISB7  : Extensions.Unsigned_1;  -- p32mx470f512.h:4863
      TRISB8  : Extensions.Unsigned_1;  -- p32mx470f512.h:4864
      TRISB9  : Extensions.Unsigned_1;  -- p32mx470f512.h:4865
      TRISB10 : Extensions.Unsigned_1;  -- p32mx470f512.h:4866
      TRISB11 : Extensions.Unsigned_1;  -- p32mx470f512.h:4867
      TRISB12 : Extensions.Unsigned_1;  -- p32mx470f512.h:4868
      TRISB13 : Extensions.Unsigned_1;  -- p32mx470f512.h:4869
      TRISB14 : Extensions.Unsigned_1;  -- p32mx470f512.h:4870
      TRISB15 : Extensions.Unsigned_1;  -- p32mx470f512.h:4871
   end record
     with Convention => C_Pass_By_Copy,
     Pack => True,
     Alignment => 4;

   type uu_TRISBbits_t_struct2138 is record
      w : aliased unsigned;  -- p32mx470f512.h:4874
   end record
     with Convention => C_Pass_By_Copy;

   type uu_TRISBbits_t (discr : unsigned := 0) is record
      case discr is
         when 0 => anon7204 : aliased uu_TRISBbits_t_struct2137;  -- p32mx470f512.h:4872
         when 1 => anon7208 : aliased uu_TRISBbits_t_struct2138;  -- p32mx470f512.h:4875
         when others => null;
      end case;
   end record
     with Convention => C_Pass_By_Copy,
     Unchecked_Union => True;  -- p32mx470f512.h:4876

   TRISBbits : aliased uu_TRISBbits_t  -- p32mx470f512.h:4877
     with Import => True,
     Convention => C,
     External_Name => "TRISB";

   TRISBCLR : aliased unsigned  -- p32mx470f512.h:4878
     with Import => True,
     Convention => C,
     External_Name => "TRISBCLR";

   TRISBSET : aliased unsigned  -- p32mx470f512.h:4879
     with Import => True,
     Convention => C,
     External_Name => "TRISBSET";

   TRISBINV : aliased unsigned  -- p32mx470f512.h:4880
     with Import => True,
     Convention => C,
     External_Name => "TRISBINV";

   PORTB : aliased unsigned  -- p32mx470f512.h:4881
     with Import => True,
     Convention => C,
     External_Name => "PORTB";

   type uu_PORTBbits_t_struct2143 is record
      RB0  : Extensions.Unsigned_1;  -- p32mx470f512.h:4884
      RB1  : Extensions.Unsigned_1;  -- p32mx470f512.h:4885
      RB2  : Extensions.Unsigned_1;  -- p32mx470f512.h:4886
      RB3  : Extensions.Unsigned_1;  -- p32mx470f512.h:4887
      RB4  : Extensions.Unsigned_1;  -- p32mx470f512.h:4888
      RB5  : Extensions.Unsigned_1;  -- p32mx470f512.h:4889
      RB6  : Extensions.Unsigned_1;  -- p32mx470f512.h:4890
      RB7  : Extensions.Unsigned_1;  -- p32mx470f512.h:4891
      RB8  : Extensions.Unsigned_1;  -- p32mx470f512.h:4892
      RB9  : Extensions.Unsigned_1;  -- p32mx470f512.h:4893
      RB10 : Extensions.Unsigned_1;  -- p32mx470f512.h:4894
      RB11 : Extensions.Unsigned_1;  -- p32mx470f512.h:4895
      RB12 : Extensions.Unsigned_1;  -- p32mx470f512.h:4896
      RB13 : Extensions.Unsigned_1;  -- p32mx470f512.h:4897
      RB14 : Extensions.Unsigned_1;  -- p32mx470f512.h:4898
      RB15 : Extensions.Unsigned_1;  -- p32mx470f512.h:4899
   end record
     with Convention => C_Pass_By_Copy,
     Pack => True,
     Alignment => 4;

   type uu_PORTBbits_t_struct2144 is record
      w : aliased unsigned;  -- p32mx470f512.h:4902
   end record
     with Convention => C_Pass_By_Copy;

   type uu_PORTBbits_t (discr : unsigned := 0) is record
      case discr is
         when 0 => anon7234 : aliased uu_PORTBbits_t_struct2143;  -- p32mx470f512.h:4900
         when 1 => anon7238 : aliased uu_PORTBbits_t_struct2144;  -- p32mx470f512.h:4903
         when others => null;
      end case;
   end record
     with Convention => C_Pass_By_Copy,
     Unchecked_Union => True;  -- p32mx470f512.h:4904

   PORTBbits : aliased uu_PORTBbits_t  -- p32mx470f512.h:4905
     with Import => True,
     Convention => C,
     External_Name => "PORTB";

   PORTBCLR : aliased unsigned  -- p32mx470f512.h:4906
     with Import => True,
     Convention => C,
     External_Name => "PORTBCLR";

   PORTBSET : aliased unsigned  -- p32mx470f512.h:4907
     with Import => True,
     Convention => C,
     External_Name => "PORTBSET";

   PORTBINV : aliased unsigned  -- p32mx470f512.h:4908
     with Import => True,
     Convention => C,
     External_Name => "PORTBINV";

   LATB : aliased unsigned  -- p32mx470f512.h:4909
     with Import => True,
     Convention => C,
     External_Name => "LATB";

   type uu_LATBbits_t_struct2149 is record
      LATB0  : Extensions.Unsigned_1;  -- p32mx470f512.h:4912
      LATB1  : Extensions.Unsigned_1;  -- p32mx470f512.h:4913
      LATB2  : Extensions.Unsigned_1;  -- p32mx470f512.h:4914
      LATB3  : Extensions.Unsigned_1;  -- p32mx470f512.h:4915
      LATB4  : Extensions.Unsigned_1;  -- p32mx470f512.h:4916
      LATB5  : Extensions.Unsigned_1;  -- p32mx470f512.h:4917
      LATB6  : Extensions.Unsigned_1;  -- p32mx470f512.h:4918
      LATB7  : Extensions.Unsigned_1;  -- p32mx470f512.h:4919
      LATB8  : Extensions.Unsigned_1;  -- p32mx470f512.h:4920
      LATB9  : Extensions.Unsigned_1;  -- p32mx470f512.h:4921
      LATB10 : Extensions.Unsigned_1;  -- p32mx470f512.h:4922
      LATB11 : Extensions.Unsigned_1;  -- p32mx470f512.h:4923
      LATB12 : Extensions.Unsigned_1;  -- p32mx470f512.h:4924
      LATB13 : Extensions.Unsigned_1;  -- p32mx470f512.h:4925
      LATB14 : Extensions.Unsigned_1;  -- p32mx470f512.h:4926
      LATB15 : Extensions.Unsigned_1;  -- p32mx470f512.h:4927
   end record
     with Convention => C_Pass_By_Copy,
     Pack => True,
     Alignment => 4;
   type uu_LATBbits_t_struct2150 is record
      w : aliased unsigned;  -- p32mx470f512.h:4930
   end record
     with Convention => C_Pass_By_Copy;
   type uu_LATBbits_t (discr : unsigned := 0) is record
      case discr is
         when 0 => anon7264 : aliased uu_LATBbits_t_struct2149;  -- p32mx470f512.h:4928
         when 1 => anon7268 : aliased uu_LATBbits_t_struct2150;  -- p32mx470f512.h:4931
         when others => null;
      end case;
   end record
     with Convention => C_Pass_By_Copy,
     Unchecked_Union => True;  -- p32mx470f512.h:4932

   LATBbits : aliased uu_LATBbits_t  -- p32mx470f512.h:4933
     with Import => True,
     Convention => C,
     External_Name => "LATB";

   LATBCLR : aliased unsigned  -- p32mx470f512.h:4934
     with Import => True,
     Convention => C,
     External_Name => "LATBCLR";

   LATBSET : aliased unsigned  -- p32mx470f512.h:4935
     with Import => True,
     Convention => C,
     External_Name => "LATBSET";

   LATBINV : aliased unsigned  -- p32mx470f512.h:4936
     with Import => True,
     Convention => C,
     External_Name => "LATBINV";

   ODCB : aliased unsigned  -- p32mx470f512.h:4937
     with Import => True,
     Convention => C,
     External_Name => "ODCB";

   type uu_ODCBbits_t_struct2155 is record
      ODCB0  : Extensions.Unsigned_1;  -- p32mx470f512.h:4940
      ODCB1  : Extensions.Unsigned_1;  -- p32mx470f512.h:4941
      ODCB2  : Extensions.Unsigned_1;  -- p32mx470f512.h:4942
      ODCB3  : Extensions.Unsigned_1;  -- p32mx470f512.h:4943
      ODCB4  : Extensions.Unsigned_1;  -- p32mx470f512.h:4944
      ODCB5  : Extensions.Unsigned_1;  -- p32mx470f512.h:4945
      ODCB6  : Extensions.Unsigned_1;  -- p32mx470f512.h:4946
      ODCB7  : Extensions.Unsigned_1;  -- p32mx470f512.h:4947
      ODCB8  : Extensions.Unsigned_1;  -- p32mx470f512.h:4948
      ODCB9  : Extensions.Unsigned_1;  -- p32mx470f512.h:4949
      ODCB10 : Extensions.Unsigned_1;  -- p32mx470f512.h:4950
      ODCB11 : Extensions.Unsigned_1;  -- p32mx470f512.h:4951
      ODCB12 : Extensions.Unsigned_1;  -- p32mx470f512.h:4952
      ODCB13 : Extensions.Unsigned_1;  -- p32mx470f512.h:4953
      ODCB14 : Extensions.Unsigned_1;  -- p32mx470f512.h:4954
      ODCB15 : Extensions.Unsigned_1;  -- p32mx470f512.h:4955
   end record
     with Convention => C_Pass_By_Copy,
     Pack => True,
     Alignment => 4;
   type uu_ODCBbits_t_struct2156 is record
      w : aliased unsigned;  -- p32mx470f512.h:4958
   end record
     with Convention => C_Pass_By_Copy;
   type uu_ODCBbits_t (discr : unsigned := 0) is record
      case discr is
         when 0 => anon7294 : aliased uu_ODCBbits_t_struct2155;  -- p32mx470f512.h:4956
         when 1 => anon7298 : aliased uu_ODCBbits_t_struct2156;  -- p32mx470f512.h:4959
         when others => null;
      end case;
   end record
     with Convention => C_Pass_By_Copy,
     Unchecked_Union => True;  -- p32mx470f512.h:4960

   ODCBbits : aliased uu_ODCBbits_t  -- p32mx470f512.h:4961
     with Import => True,
     Convention => C,
     External_Name => "ODCB";

   ODCBCLR : aliased unsigned  -- p32mx470f512.h:4962
     with Import => True,
     Convention => C,
     External_Name => "ODCBCLR";

   ODCBSET : aliased unsigned  -- p32mx470f512.h:4963
     with Import => True,
     Convention => C,
     External_Name => "ODCBSET";

   ODCBINV : aliased unsigned  -- p32mx470f512.h:4964
     with Import => True,
     Convention => C,
     External_Name => "ODCBINV";

   CNPUB : aliased unsigned  -- p32mx470f512.h:4965
     with Import => True,
     Convention => C,
     External_Name => "CNPUB";

   type uu_CNPUBbits_t_struct2161 is record
      CNPUB0  : Extensions.Unsigned_1;  -- p32mx470f512.h:4968
      CNPUB1  : Extensions.Unsigned_1;  -- p32mx470f512.h:4969
      CNPUB2  : Extensions.Unsigned_1;  -- p32mx470f512.h:4970
      CNPUB3  : Extensions.Unsigned_1;  -- p32mx470f512.h:4971
      CNPUB4  : Extensions.Unsigned_1;  -- p32mx470f512.h:4972
      CNPUB5  : Extensions.Unsigned_1;  -- p32mx470f512.h:4973
      CNPUB6  : Extensions.Unsigned_1;  -- p32mx470f512.h:4974
      CNPUB7  : Extensions.Unsigned_1;  -- p32mx470f512.h:4975
      CNPUB8  : Extensions.Unsigned_1;  -- p32mx470f512.h:4976
      CNPUB9  : Extensions.Unsigned_1;  -- p32mx470f512.h:4977
      CNPUB10 : Extensions.Unsigned_1;  -- p32mx470f512.h:4978
      CNPUB11 : Extensions.Unsigned_1;  -- p32mx470f512.h:4979
      CNPUB12 : Extensions.Unsigned_1;  -- p32mx470f512.h:4980
      CNPUB13 : Extensions.Unsigned_1;  -- p32mx470f512.h:4981
      CNPUB14 : Extensions.Unsigned_1;  -- p32mx470f512.h:4982
      CNPUB15 : Extensions.Unsigned_1;  -- p32mx470f512.h:4983
   end record
     with Convention => C_Pass_By_Copy,
     Pack => True,
     Alignment => 4;
   type uu_CNPUBbits_t_struct2162 is record
      w : aliased unsigned;  -- p32mx470f512.h:4986
   end record
     with Convention => C_Pass_By_Copy;
   type uu_CNPUBbits_t (discr : unsigned := 0) is record
      case discr is
         when 0 => anon7324 : aliased uu_CNPUBbits_t_struct2161;  -- p32mx470f512.h:4984
         when 1 => anon7328 : aliased uu_CNPUBbits_t_struct2162;  -- p32mx470f512.h:4987
         when others => null;
      end case;
   end record
     with Convention => C_Pass_By_Copy,
     Unchecked_Union => True;  -- p32mx470f512.h:4988

   CNPUBbits : aliased uu_CNPUBbits_t  -- p32mx470f512.h:4989
     with Import => True,
     Convention => C,
     External_Name => "CNPUB";

   CNPUBCLR : aliased unsigned  -- p32mx470f512.h:4990
     with Import => True,
     Convention => C,
     External_Name => "CNPUBCLR";

   CNPUBSET : aliased unsigned  -- p32mx470f512.h:4991
     with Import => True,
     Convention => C,
     External_Name => "CNPUBSET";

   CNPUBINV : aliased unsigned  -- p32mx470f512.h:4992
     with Import => True,
     Convention => C,
     External_Name => "CNPUBINV";

   CNPDB : aliased unsigned  -- p32mx470f512.h:4993
     with Import => True,
     Convention => C,
     External_Name => "CNPDB";

   type uu_CNPDBbits_t_struct2167 is record
      CNPDB0  : Extensions.Unsigned_1;  -- p32mx470f512.h:4996
      CNPDB1  : Extensions.Unsigned_1;  -- p32mx470f512.h:4997
      CNPDB2  : Extensions.Unsigned_1;  -- p32mx470f512.h:4998
      CNPDB3  : Extensions.Unsigned_1;  -- p32mx470f512.h:4999
      CNPDB4  : Extensions.Unsigned_1;  -- p32mx470f512.h:5000
      CNPDB5  : Extensions.Unsigned_1;  -- p32mx470f512.h:5001
      CNPDB6  : Extensions.Unsigned_1;  -- p32mx470f512.h:5002
      CNPDB7  : Extensions.Unsigned_1;  -- p32mx470f512.h:5003
      CNPDB8  : Extensions.Unsigned_1;  -- p32mx470f512.h:5004
      CNPDB9  : Extensions.Unsigned_1;  -- p32mx470f512.h:5005
      CNPDB10 : Extensions.Unsigned_1;  -- p32mx470f512.h:5006
      CNPDB11 : Extensions.Unsigned_1;  -- p32mx470f512.h:5007
      CNPDB12 : Extensions.Unsigned_1;  -- p32mx470f512.h:5008
      CNPDB13 : Extensions.Unsigned_1;  -- p32mx470f512.h:5009
      CNPDB14 : Extensions.Unsigned_1;  -- p32mx470f512.h:5010
      CNPDB15 : Extensions.Unsigned_1;  -- p32mx470f512.h:5011
   end record
     with Convention => C_Pass_By_Copy,
     Pack => True,
     Alignment => 4;
   type uu_CNPDBbits_t_struct2168 is record
      w : aliased unsigned;  -- p32mx470f512.h:5014
   end record
     with Convention => C_Pass_By_Copy;
   type uu_CNPDBbits_t (discr : unsigned := 0) is record
      case discr is
         when 0 => anon7354 : aliased uu_CNPDBbits_t_struct2167;  -- p32mx470f512.h:5012
         when 1 => anon7358 : aliased uu_CNPDBbits_t_struct2168;  -- p32mx470f512.h:5015
         when others => null;
      end case;
   end record
     with Convention => C_Pass_By_Copy,
     Unchecked_Union => True;  -- p32mx470f512.h:5016

   CNPDBbits : aliased uu_CNPDBbits_t  -- p32mx470f512.h:5017
     with Import => True,
     Convention => C,
     External_Name => "CNPDB";

   CNPDBCLR : aliased unsigned  -- p32mx470f512.h:5018
     with Import => True,
     Convention => C,
     External_Name => "CNPDBCLR";

   CNPDBSET : aliased unsigned  -- p32mx470f512.h:5019
     with Import => True,
     Convention => C,
     External_Name => "CNPDBSET";

   CNPDBINV : aliased unsigned  -- p32mx470f512.h:5020
     with Import => True,
     Convention => C,
     External_Name => "CNPDBINV";

   CNCONB : aliased unsigned  -- p32mx470f512.h:5021
     with Import => True,
     Convention => C,
     External_Name => "CNCONB";

   type uu_CNCONBbits_t_struct2173 is record
      anon7367 : Extensions.Unsigned_13;  -- p32mx470f512.h:5024
      SIDL     : Extensions.Unsigned_1;  -- p32mx470f512.h:5025
      anon7369 : Extensions.Unsigned_1;  -- p32mx470f512.h:5026
      ON       : Extensions.Unsigned_1;  -- p32mx470f512.h:5027
   end record
     with Convention => C_Pass_By_Copy,
     Pack => True,
     Alignment => 4;
   type uu_CNCONBbits_t_struct2174 is record
      w : aliased unsigned;  -- p32mx470f512.h:5030
   end record
     with Convention => C_Pass_By_Copy;
   type uu_CNCONBbits_t (discr : unsigned := 0) is record
      case discr is
         when 0 => anon7372 : aliased uu_CNCONBbits_t_struct2173;  -- p32mx470f512.h:5028
         when 1 => anon7376 : aliased uu_CNCONBbits_t_struct2174;  -- p32mx470f512.h:5031
         when others => null;
      end case;
   end record
     with Convention => C_Pass_By_Copy,
     Unchecked_Union => True;  -- p32mx470f512.h:5032

   CNCONBbits : aliased uu_CNCONBbits_t  -- p32mx470f512.h:5033
     with Import => True,
     Convention => C,
     External_Name => "CNCONB";

   CNCONBCLR : aliased unsigned  -- p32mx470f512.h:5034
     with Import => True,
     Convention => C,
     External_Name => "CNCONBCLR";

   CNCONBSET : aliased unsigned  -- p32mx470f512.h:5035
     with Import => True,
     Convention => C,
     External_Name => "CNCONBSET";

   CNCONBINV : aliased unsigned  -- p32mx470f512.h:5036
     with Import => True,
     Convention => C,
     External_Name => "CNCONBINV";

   CNENB : aliased unsigned  -- p32mx470f512.h:5037
     with Import => True,
     Convention => C,
     External_Name => "CNENB";

   type uu_CNENBbits_t_struct2179 is record
      CNIEB0  : Extensions.Unsigned_1;  -- p32mx470f512.h:5040
      CNIEB1  : Extensions.Unsigned_1;  -- p32mx470f512.h:5041
      CNIEB2  : Extensions.Unsigned_1;  -- p32mx470f512.h:5042
      CNIEB3  : Extensions.Unsigned_1;  -- p32mx470f512.h:5043
      CNIEB4  : Extensions.Unsigned_1;  -- p32mx470f512.h:5044
      CNIEB5  : Extensions.Unsigned_1;  -- p32mx470f512.h:5045
      CNIEB6  : Extensions.Unsigned_1;  -- p32mx470f512.h:5046
      CNIEB7  : Extensions.Unsigned_1;  -- p32mx470f512.h:5047
      CNIEB8  : Extensions.Unsigned_1;  -- p32mx470f512.h:5048
      CNIEB9  : Extensions.Unsigned_1;  -- p32mx470f512.h:5049
      CNIEB10 : Extensions.Unsigned_1;  -- p32mx470f512.h:5050
      CNIEB11 : Extensions.Unsigned_1;  -- p32mx470f512.h:5051
      CNIEB12 : Extensions.Unsigned_1;  -- p32mx470f512.h:5052
      CNIEB13 : Extensions.Unsigned_1;  -- p32mx470f512.h:5053
      CNIEB14 : Extensions.Unsigned_1;  -- p32mx470f512.h:5054
      CNIEB15 : Extensions.Unsigned_1;  -- p32mx470f512.h:5055
   end record
     with Convention => C_Pass_By_Copy,
     Pack => True,
     Alignment => 4;
   type uu_CNENBbits_t_struct2180 is record
      w : aliased unsigned;  -- p32mx470f512.h:5058
   end record
     with Convention => C_Pass_By_Copy;
   type uu_CNENBbits_t (discr : unsigned := 0) is record
      case discr is
         when 0 => anon7402 : aliased uu_CNENBbits_t_struct2179;  -- p32mx470f512.h:5056
         when 1 => anon7406 : aliased uu_CNENBbits_t_struct2180;  -- p32mx470f512.h:5059
         when others => null;
      end case;
   end record
     with Convention => C_Pass_By_Copy,
     Unchecked_Union => True;  -- p32mx470f512.h:5060

   CNENBbits : aliased uu_CNENBbits_t  -- p32mx470f512.h:5061
     with Import => True,
     Convention => C,
     External_Name => "CNENB";

   CNENBCLR : aliased unsigned  -- p32mx470f512.h:5062
     with Import => True,
     Convention => C,
     External_Name => "CNENBCLR";

   CNENBSET : aliased unsigned  -- p32mx470f512.h:5063
     with Import => True,
     Convention => C,
     External_Name => "CNENBSET";

   CNENBINV : aliased unsigned  -- p32mx470f512.h:5064
     with Import => True,
     Convention => C,
     External_Name => "CNENBINV";

   CNSTATB : aliased unsigned  -- p32mx470f512.h:5065
     with Import => True,
     Convention => C,
     External_Name => "CNSTATB";

   type uu_CNSTATBbits_t_struct2185 is record
      CNSTATB0  : Extensions.Unsigned_1;  -- p32mx470f512.h:5068
      CNSTATB1  : Extensions.Unsigned_1;  -- p32mx470f512.h:5069
      CNSTATB2  : Extensions.Unsigned_1;  -- p32mx470f512.h:5070
      CNSTATB3  : Extensions.Unsigned_1;  -- p32mx470f512.h:5071
      CNSTATB4  : Extensions.Unsigned_1;  -- p32mx470f512.h:5072
      CNSTATB5  : Extensions.Unsigned_1;  -- p32mx470f512.h:5073
      CNSTATB6  : Extensions.Unsigned_1;  -- p32mx470f512.h:5074
      CNSTATB7  : Extensions.Unsigned_1;  -- p32mx470f512.h:5075
      CNSTATB8  : Extensions.Unsigned_1;  -- p32mx470f512.h:5076
      CNSTATB9  : Extensions.Unsigned_1;  -- p32mx470f512.h:5077
      CNSTATB10 : Extensions.Unsigned_1;  -- p32mx470f512.h:5078
      CNSTATB11 : Extensions.Unsigned_1;  -- p32mx470f512.h:5079
      CNSTATB12 : Extensions.Unsigned_1;  -- p32mx470f512.h:5080
      CNSTATB13 : Extensions.Unsigned_1;  -- p32mx470f512.h:5081
      CNSTATB14 : Extensions.Unsigned_1;  -- p32mx470f512.h:5082
      CNSTATB15 : Extensions.Unsigned_1;  -- p32mx470f512.h:5083
   end record
     with Convention => C_Pass_By_Copy,
     Pack => True,
     Alignment => 4;
   type uu_CNSTATBbits_t_struct2186 is record
      w : aliased unsigned;  -- p32mx470f512.h:5086
   end record
     with Convention => C_Pass_By_Copy;
   type uu_CNSTATBbits_t (discr : unsigned := 0) is record
      case discr is
         when 0 => anon7432 : aliased uu_CNSTATBbits_t_struct2185;  -- p32mx470f512.h:5084
         when 1 => anon7436 : aliased uu_CNSTATBbits_t_struct2186;  -- p32mx470f512.h:5087
         when others => null;
      end case;
   end record
     with Convention => C_Pass_By_Copy,
     Unchecked_Union => True;  -- p32mx470f512.h:5088

   CNSTATBbits : aliased uu_CNSTATBbits_t  -- p32mx470f512.h:5089
     with Import => True,
     Convention => C,
     External_Name => "CNSTATB";

   CNSTATBCLR : aliased unsigned  -- p32mx470f512.h:5090
     with Import => True,
     Convention => C,
     External_Name => "CNSTATBCLR";

   CNSTATBSET : aliased unsigned  -- p32mx470f512.h:5091
     with Import => True,
     Convention => C,
     External_Name => "CNSTATBSET";

   CNSTATBINV : aliased unsigned  -- p32mx470f512.h:5092
     with Import => True,
     Convention => C,
     External_Name => "CNSTATBINV";

   ANSELC : aliased unsigned  -- p32mx470f512.h:5093
     with Import => True,
     Convention => C,
     External_Name => "ANSELC";

   type uu_ANSELCbits_t_struct2191 is record
      anon7445 : Extensions.Unsigned_12;  -- p32mx470f512.h:5096
      ANSC12   : Extensions.Unsigned_1;  -- p32mx470f512.h:5097
      ANSC13   : Extensions.Unsigned_1;  -- p32mx470f512.h:5098
      ANSC14   : Extensions.Unsigned_1;  -- p32mx470f512.h:5099
      ANSC15   : Extensions.Unsigned_1;  -- p32mx470f512.h:5100
   end record
     with Convention => C_Pass_By_Copy,
     Pack => True,
     Alignment => 4;
   type uu_ANSELCbits_t_struct2193 is record
      w : aliased unsigned;  -- p32mx470f512.h:5103
   end record
     with Convention => C_Pass_By_Copy;
   type uu_ANSELCbits_t (discr : unsigned := 0) is record
      case discr is
         when 0 => anon7451 : aliased uu_ANSELCbits_t_struct2191;  -- p32mx470f512.h:5101
         when 1 => anon7455 : aliased uu_ANSELCbits_t_struct2193;  -- p32mx470f512.h:5104
         when others => null;
      end case;
   end record
     with Convention => C_Pass_By_Copy,
     Unchecked_Union => True;  -- p32mx470f512.h:5105

   ANSELCbits : aliased uu_ANSELCbits_t  -- p32mx470f512.h:5106
     with Import => True,
     Convention => C,
     External_Name => "ANSELC";

   ANSELCCLR : aliased unsigned  -- p32mx470f512.h:5107
     with Import => True,
     Convention => C,
     External_Name => "ANSELCCLR";

   ANSELCSET : aliased unsigned  -- p32mx470f512.h:5108
     with Import => True,
     Convention => C,
     External_Name => "ANSELCSET";

   ANSELCINV : aliased unsigned  -- p32mx470f512.h:5109
     with Import => True,
     Convention => C,
     External_Name => "ANSELCINV";

   TRISC : aliased unsigned  -- p32mx470f512.h:5110
     with Import => True,
     Convention => C,
     External_Name => "TRISC";

   type uu_TRISCbits_t_struct2198 is record
      anon7464 : Extensions.Unsigned_12;  -- p32mx470f512.h:5113
      TRISC12  : Extensions.Unsigned_1;  -- p32mx470f512.h:5114
      TRISC13  : Extensions.Unsigned_1;  -- p32mx470f512.h:5115
      TRISC14  : Extensions.Unsigned_1;  -- p32mx470f512.h:5116
      TRISC15  : Extensions.Unsigned_1;  -- p32mx470f512.h:5117
   end record
     with Convention => C_Pass_By_Copy,
     Pack => True,
     Alignment => 4;
   type uu_TRISCbits_t_struct2199 is record
      w : aliased unsigned;  -- p32mx470f512.h:5120
   end record
     with Convention => C_Pass_By_Copy;
   type uu_TRISCbits_t (discr : unsigned := 0) is record
      case discr is
         when 0 => anon7470 : aliased uu_TRISCbits_t_struct2198;  -- p32mx470f512.h:5118
         when 1 => anon7474 : aliased uu_TRISCbits_t_struct2199;  -- p32mx470f512.h:5121
         when others => null;
      end case;
   end record
     with Convention => C_Pass_By_Copy,
     Unchecked_Union => True;  -- p32mx470f512.h:5122

   TRISCbits : aliased uu_TRISCbits_t  -- p32mx470f512.h:5123
     with Import => True,
     Convention => C,
     External_Name => "TRISC";

   TRISCCLR : aliased unsigned  -- p32mx470f512.h:5124
     with Import => True,
     Convention => C,
     External_Name => "TRISCCLR";

   TRISCSET : aliased unsigned  -- p32mx470f512.h:5125
     with Import => True,
     Convention => C,
     External_Name => "TRISCSET";

   TRISCINV : aliased unsigned  -- p32mx470f512.h:5126
     with Import => True,
     Convention => C,
     External_Name => "TRISCINV";

   PORTC : aliased unsigned  -- p32mx470f512.h:5127
     with Import => True,
     Convention => C,
     External_Name => "PORTC";

   type uu_PORTCbits_t_struct2204 is record
      anon7483 : Extensions.Unsigned_12;  -- p32mx470f512.h:5130
      RC12     : Extensions.Unsigned_1;  -- p32mx470f512.h:5131
      RC13     : Extensions.Unsigned_1;  -- p32mx470f512.h:5132
      RC14     : Extensions.Unsigned_1;  -- p32mx470f512.h:5133
      RC15     : Extensions.Unsigned_1;  -- p32mx470f512.h:5134
   end record
     with Convention => C_Pass_By_Copy,
     Pack => True,
     Alignment => 4;
   type uu_PORTCbits_t_struct2205 is record
      w : aliased unsigned;  -- p32mx470f512.h:5137
   end record
     with Convention => C_Pass_By_Copy;
   type uu_PORTCbits_t (discr : unsigned := 0) is record
      case discr is
         when 0 => anon7489 : aliased uu_PORTCbits_t_struct2204;  -- p32mx470f512.h:5135
         when 1 => anon7493 : aliased uu_PORTCbits_t_struct2205;  -- p32mx470f512.h:5138
         when others => null;
      end case;
   end record
     with Convention => C_Pass_By_Copy,
     Unchecked_Union => True;  -- p32mx470f512.h:5139

   PORTCbits : aliased uu_PORTCbits_t  -- p32mx470f512.h:5140
     with Import => True,
     Convention => C,
     External_Name => "PORTC";

   PORTCCLR : aliased unsigned  -- p32mx470f512.h:5141
     with Import => True,
     Convention => C,
     External_Name => "PORTCCLR";

   PORTCSET : aliased unsigned  -- p32mx470f512.h:5142
     with Import => True,
     Convention => C,
     External_Name => "PORTCSET";

   PORTCINV : aliased unsigned  -- p32mx470f512.h:5143
     with Import => True,
     Convention => C,
     External_Name => "PORTCINV";

   LATC : aliased unsigned  -- p32mx470f512.h:5144
     with Import => True,
     Convention => C,
     External_Name => "LATC";

   type uu_LATCbits_t_struct2210 is record
      anon7502 : Extensions.Unsigned_12;  -- p32mx470f512.h:5147
      LATC12   : Extensions.Unsigned_1;  -- p32mx470f512.h:5148
      LATC13   : Extensions.Unsigned_1;  -- p32mx470f512.h:5149
      LATC14   : Extensions.Unsigned_1;  -- p32mx470f512.h:5150
      LATC15   : Extensions.Unsigned_1;  -- p32mx470f512.h:5151
   end record
     with Convention => C_Pass_By_Copy,
     Pack => True,
     Alignment => 4;
   type uu_LATCbits_t_struct2211 is record
      w : aliased unsigned;  -- p32mx470f512.h:5154
   end record
     with Convention => C_Pass_By_Copy;
   type uu_LATCbits_t (discr : unsigned := 0) is record
      case discr is
         when 0 => anon7508 : aliased uu_LATCbits_t_struct2210;  -- p32mx470f512.h:5152
         when 1 => anon7512 : aliased uu_LATCbits_t_struct2211;  -- p32mx470f512.h:5155
         when others => null;
      end case;
   end record
     with Convention => C_Pass_By_Copy,
     Unchecked_Union => True;  -- p32mx470f512.h:5156

   LATCbits : aliased uu_LATCbits_t  -- p32mx470f512.h:5157
     with Import => True,
     Convention => C,
     External_Name => "LATC";

   LATCCLR : aliased unsigned  -- p32mx470f512.h:5158
     with Import => True,
     Convention => C,
     External_Name => "LATCCLR";

   LATCSET : aliased unsigned  -- p32mx470f512.h:5159
     with Import => True,
     Convention => C,
     External_Name => "LATCSET";

   LATCINV : aliased unsigned  -- p32mx470f512.h:5160
     with Import => True,
     Convention => C,
     External_Name => "LATCINV";

   ODCC : aliased unsigned  -- p32mx470f512.h:5161
     with Import => True,
     Convention => C,
     External_Name => "ODCC";

   type uu_ODCCbits_t_struct2216 is record
      anon7521 : Extensions.Unsigned_12;  -- p32mx470f512.h:5164
      ODCC12   : Extensions.Unsigned_1;  -- p32mx470f512.h:5165
      ODCC13   : Extensions.Unsigned_1;  -- p32mx470f512.h:5166
      ODCC14   : Extensions.Unsigned_1;  -- p32mx470f512.h:5167
      ODCC15   : Extensions.Unsigned_1;  -- p32mx470f512.h:5168
   end record
     with Convention => C_Pass_By_Copy,
     Pack => True,
     Alignment => 4;
   type uu_ODCCbits_t_struct2217 is record
      w : aliased unsigned;  -- p32mx470f512.h:5171
   end record
     with Convention => C_Pass_By_Copy;
   type uu_ODCCbits_t (discr : unsigned := 0) is record
      case discr is
         when 0 => anon7527 : aliased uu_ODCCbits_t_struct2216;  -- p32mx470f512.h:5169
         when 1 => anon7531 : aliased uu_ODCCbits_t_struct2217;  -- p32mx470f512.h:5172
         when others => null;
      end case;
   end record
     with Convention => C_Pass_By_Copy,
     Unchecked_Union => True;  -- p32mx470f512.h:5173

   ODCCbits : aliased uu_ODCCbits_t  -- p32mx470f512.h:5174
     with Import => True,
     Convention => C,
     External_Name => "ODCC";

   ODCCCLR : aliased unsigned  -- p32mx470f512.h:5175
     with Import => True,
     Convention => C,
     External_Name => "ODCCCLR";

   ODCCSET : aliased unsigned  -- p32mx470f512.h:5176
     with Import => True,
     Convention => C,
     External_Name => "ODCCSET";

   ODCCINV : aliased unsigned  -- p32mx470f512.h:5177
     with Import => True,
     Convention => C,
     External_Name => "ODCCINV";

   CNPUC : aliased unsigned  -- p32mx470f512.h:5178
     with Import => True,
     Convention => C,
     External_Name => "CNPUC";

   type uu_CNPUCbits_t_struct2222 is record
      anon7540 : Extensions.Unsigned_12;  -- p32mx470f512.h:5181
      CNPUC12  : Extensions.Unsigned_1;  -- p32mx470f512.h:5182
      CNPUC13  : Extensions.Unsigned_1;  -- p32mx470f512.h:5183
      CNPUC14  : Extensions.Unsigned_1;  -- p32mx470f512.h:5184
      CNPUC15  : Extensions.Unsigned_1;  -- p32mx470f512.h:5185
   end record
     with Convention => C_Pass_By_Copy,
     Pack => True,
     Alignment => 4;
   type uu_CNPUCbits_t_struct2223 is record
      w : aliased unsigned;  -- p32mx470f512.h:5188
   end record
     with Convention => C_Pass_By_Copy;
   type uu_CNPUCbits_t (discr : unsigned := 0) is record
      case discr is
         when 0 => anon7546 : aliased uu_CNPUCbits_t_struct2222;  -- p32mx470f512.h:5186
         when 1 => anon7550 : aliased uu_CNPUCbits_t_struct2223;  -- p32mx470f512.h:5189
         when others => null;
      end case;
   end record
     with Convention => C_Pass_By_Copy,
     Unchecked_Union => True;  -- p32mx470f512.h:5190

   CNPUCbits : aliased uu_CNPUCbits_t  -- p32mx470f512.h:5191
     with Import => True,
     Convention => C,
     External_Name => "CNPUC";

   CNPUCCLR : aliased unsigned  -- p32mx470f512.h:5192
     with Import => True,
     Convention => C,
     External_Name => "CNPUCCLR";

   CNPUCSET : aliased unsigned  -- p32mx470f512.h:5193
     with Import => True,
     Convention => C,
     External_Name => "CNPUCSET";

   CNPUCINV : aliased unsigned  -- p32mx470f512.h:5194
     with Import => True,
     Convention => C,
     External_Name => "CNPUCINV";

   CNPDC : aliased unsigned  -- p32mx470f512.h:5195
     with Import => True,
     Convention => C,
     External_Name => "CNPDC";

   type uu_CNPDCbits_t_struct2228 is record
      anon7559 : Extensions.Unsigned_12;  -- p32mx470f512.h:5198
      CNPDC12  : Extensions.Unsigned_1;  -- p32mx470f512.h:5199
      CNPDC13  : Extensions.Unsigned_1;  -- p32mx470f512.h:5200
      CNPDC14  : Extensions.Unsigned_1;  -- p32mx470f512.h:5201
      CNPDC15  : Extensions.Unsigned_1;  -- p32mx470f512.h:5202
   end record
     with Convention => C_Pass_By_Copy,
     Pack => True,
     Alignment => 4;
   type uu_CNPDCbits_t_struct2229 is record
      w : aliased unsigned;  -- p32mx470f512.h:5205
   end record
     with Convention => C_Pass_By_Copy;
   type uu_CNPDCbits_t (discr : unsigned := 0) is record
      case discr is
         when 0 => anon7565 : aliased uu_CNPDCbits_t_struct2228;  -- p32mx470f512.h:5203
         when 1 => anon7569 : aliased uu_CNPDCbits_t_struct2229;  -- p32mx470f512.h:5206
         when others => null;
      end case;
   end record
     with Convention => C_Pass_By_Copy,
     Unchecked_Union => True;  -- p32mx470f512.h:5207

   CNPDCbits : aliased uu_CNPDCbits_t  -- p32mx470f512.h:5208
     with Import => True,
     Convention => C,
     External_Name => "CNPDC";

   CNPDCCLR : aliased unsigned  -- p32mx470f512.h:5209
     with Import => True,
     Convention => C,
     External_Name => "CNPDCCLR";

   CNPDCSET : aliased unsigned  -- p32mx470f512.h:5210
     with Import => True,
     Convention => C,
     External_Name => "CNPDCSET";

   CNPDCINV : aliased unsigned  -- p32mx470f512.h:5211
     with Import => True,
     Convention => C,
     External_Name => "CNPDCINV";

   CNCONC : aliased unsigned  -- p32mx470f512.h:5212
     with Import => True,
     Convention => C,
     External_Name => "CNCONC";

   type uu_CNCONCbits_t_struct2234 is record
      anon7578 : Extensions.Unsigned_13;  -- p32mx470f512.h:5215
      SIDL     : Extensions.Unsigned_1;  -- p32mx470f512.h:5216
      anon7580 : Extensions.Unsigned_1;  -- p32mx470f512.h:5217
      ON       : Extensions.Unsigned_1;  -- p32mx470f512.h:5218
   end record
     with Convention => C_Pass_By_Copy,
     Pack => True,
     Alignment => 4;
   type uu_CNCONCbits_t_struct2235 is record
      w : aliased unsigned;  -- p32mx470f512.h:5221
   end record
     with Convention => C_Pass_By_Copy;
   type uu_CNCONCbits_t (discr : unsigned := 0) is record
      case discr is
         when 0 => anon7583 : aliased uu_CNCONCbits_t_struct2234;  -- p32mx470f512.h:5219
         when 1 => anon7587 : aliased uu_CNCONCbits_t_struct2235;  -- p32mx470f512.h:5222
         when others => null;
      end case;
   end record
     with Convention => C_Pass_By_Copy,
     Unchecked_Union => True;  -- p32mx470f512.h:5223

   CNCONCbits : aliased uu_CNCONCbits_t  -- p32mx470f512.h:5224
     with Import => True,
     Convention => C,
     External_Name => "CNCONC";

   CNCONCCLR : aliased unsigned  -- p32mx470f512.h:5225
     with Import => True,
     Convention => C,
     External_Name => "CNCONCCLR";

   CNCONCSET : aliased unsigned  -- p32mx470f512.h:5226
     with Import => True,
     Convention => C,
     External_Name => "CNCONCSET";

   CNCONCINV : aliased unsigned  -- p32mx470f512.h:5227
     with Import => True,
     Convention => C,
     External_Name => "CNCONCINV";

   CNENC : aliased unsigned  -- p32mx470f512.h:5228
     with Import => True,
     Convention => C,
     External_Name => "CNENC";

   type uu_CNENCbits_t_struct2240 is record
      anon7596 : Extensions.Unsigned_12;  -- p32mx470f512.h:5231
      CNIEC12  : Extensions.Unsigned_1;  -- p32mx470f512.h:5232
      CNIEC13  : Extensions.Unsigned_1;  -- p32mx470f512.h:5233
      CNIEC14  : Extensions.Unsigned_1;  -- p32mx470f512.h:5234
      CNIEC15  : Extensions.Unsigned_1;  -- p32mx470f512.h:5235
   end record
     with Convention => C_Pass_By_Copy,
     Pack => True,
     Alignment => 4;
   type uu_CNENCbits_t_struct2241 is record
      w : aliased unsigned;  -- p32mx470f512.h:5238
   end record
     with Convention => C_Pass_By_Copy;
   type uu_CNENCbits_t (discr : unsigned := 0) is record
      case discr is
         when 0 => anon7602 : aliased uu_CNENCbits_t_struct2240;  -- p32mx470f512.h:5236
         when 1 => anon7606 : aliased uu_CNENCbits_t_struct2241;  -- p32mx470f512.h:5239
         when others => null;
      end case;
   end record
     with Convention => C_Pass_By_Copy,
     Unchecked_Union => True;  -- p32mx470f512.h:5240

   CNENCbits : aliased uu_CNENCbits_t  -- p32mx470f512.h:5241
     with Import => True,
     Convention => C,
     External_Name => "CNENC";

   CNENCCLR : aliased unsigned  -- p32mx470f512.h:5242
     with Import => True,
     Convention => C,
     External_Name => "CNENCCLR";

   CNENCSET : aliased unsigned  -- p32mx470f512.h:5243
     with Import => True,
     Convention => C,
     External_Name => "CNENCSET";

   CNENCINV : aliased unsigned  -- p32mx470f512.h:5244
     with Import => True,
     Convention => C,
     External_Name => "CNENCINV";

   CNSTATC : aliased unsigned  -- p32mx470f512.h:5245
     with Import => True,
     Convention => C,
     External_Name => "CNSTATC";

   type uu_CNSTATCbits_t_struct2246 is record
      anon7615  : Extensions.Unsigned_12;  -- p32mx470f512.h:5248
      CNSTATC12 : Extensions.Unsigned_1;  -- p32mx470f512.h:5249
      CNSTATC13 : Extensions.Unsigned_1;  -- p32mx470f512.h:5250
      CNSTATC14 : Extensions.Unsigned_1;  -- p32mx470f512.h:5251
      CNSTATC15 : Extensions.Unsigned_1;  -- p32mx470f512.h:5252
   end record
     with Convention => C_Pass_By_Copy,
     Pack => True,
     Alignment => 4;
   type uu_CNSTATCbits_t_struct2247 is record
      w : aliased unsigned;  -- p32mx470f512.h:5255
   end record
     with Convention => C_Pass_By_Copy;
   type uu_CNSTATCbits_t (discr : unsigned := 0) is record
      case discr is
         when 0 => anon7621 : aliased uu_CNSTATCbits_t_struct2246;  -- p32mx470f512.h:5253
         when 1 => anon7625 : aliased uu_CNSTATCbits_t_struct2247;  -- p32mx470f512.h:5256
         when others => null;
      end case;
   end record
     with Convention => C_Pass_By_Copy,
     Unchecked_Union => True;  -- p32mx470f512.h:5257

   CNSTATCbits : aliased uu_CNSTATCbits_t  -- p32mx470f512.h:5258
     with Import => True,
     Convention => C,
     External_Name => "CNSTATC";

   CNSTATCCLR : aliased unsigned  -- p32mx470f512.h:5259
     with Import => True,
     Convention => C,
     External_Name => "CNSTATCCLR";

   CNSTATCSET : aliased unsigned  -- p32mx470f512.h:5260
     with Import => True,
     Convention => C,
     External_Name => "CNSTATCSET";

   CNSTATCINV : aliased unsigned  -- p32mx470f512.h:5261
     with Import => True,
     Convention => C,
     External_Name => "CNSTATCINV";

   ANSELD : aliased unsigned  -- p32mx470f512.h:5262
     with Import => True,
     Convention => C,
     External_Name => "ANSELD";

   type uu_ANSELDbits_t_struct2252 is record
      anon7634 : Extensions.Unsigned_1;  -- p32mx470f512.h:5265
      ANSD1    : Extensions.Unsigned_1;  -- p32mx470f512.h:5266
      ANSD2    : Extensions.Unsigned_1;  -- p32mx470f512.h:5267
      ANSD3    : Extensions.Unsigned_1;  -- p32mx470f512.h:5268
   end record
     with Convention => C_Pass_By_Copy,
     Pack => True,
     Alignment => 4;
   type uu_ANSELDbits_t_struct2253 is record
      w : aliased unsigned;  -- p32mx470f512.h:5271
   end record
     with Convention => C_Pass_By_Copy;
   type uu_ANSELDbits_t (discr : unsigned := 0) is record
      case discr is
         when 0 => anon7639 : aliased uu_ANSELDbits_t_struct2252;  -- p32mx470f512.h:5269
         when 1 => anon7643 : aliased uu_ANSELDbits_t_struct2253;  -- p32mx470f512.h:5272
         when others => null;
      end case;
   end record
     with Convention => C_Pass_By_Copy,
     Unchecked_Union => True;  -- p32mx470f512.h:5273

   ANSELDbits : aliased uu_ANSELDbits_t  -- p32mx470f512.h:5274
     with Import => True,
     Convention => C,
     External_Name => "ANSELD";

   ANSELDCLR : aliased unsigned  -- p32mx470f512.h:5275
     with Import => True,
     Convention => C,
     External_Name => "ANSELDCLR";

   ANSELDSET : aliased unsigned  -- p32mx470f512.h:5276
     with Import => True,
     Convention => C,
     External_Name => "ANSELDSET";

   ANSELDINV : aliased unsigned  -- p32mx470f512.h:5277
     with Import => True,
     Convention => C,
     External_Name => "ANSELDINV";

   TRISD : aliased unsigned  -- p32mx470f512.h:5278
     with Import => True,
     Convention => C,
     External_Name => "TRISD";

   type uu_TRISDbits_t_struct2258 is record
      TRISD0  : Extensions.Unsigned_1;  -- p32mx470f512.h:5281
      TRISD1  : Extensions.Unsigned_1;  -- p32mx470f512.h:5282
      TRISD2  : Extensions.Unsigned_1;  -- p32mx470f512.h:5283
      TRISD3  : Extensions.Unsigned_1;  -- p32mx470f512.h:5284
      TRISD4  : Extensions.Unsigned_1;  -- p32mx470f512.h:5285
      TRISD5  : Extensions.Unsigned_1;  -- p32mx470f512.h:5286
      TRISD6  : Extensions.Unsigned_1;  -- p32mx470f512.h:5287
      TRISD7  : Extensions.Unsigned_1;  -- p32mx470f512.h:5288
      TRISD8  : Extensions.Unsigned_1;  -- p32mx470f512.h:5289
      TRISD9  : Extensions.Unsigned_1;  -- p32mx470f512.h:5290
      TRISD10 : Extensions.Unsigned_1;  -- p32mx470f512.h:5291
      TRISD11 : Extensions.Unsigned_1;  -- p32mx470f512.h:5292
   end record
     with Convention => C_Pass_By_Copy,
     Pack => True,
     Alignment => 4;
   type uu_TRISDbits_t_struct2259 is record
      w : aliased unsigned;  -- p32mx470f512.h:5295
   end record
     with Convention => C_Pass_By_Copy;
   type uu_TRISDbits_t (discr : unsigned := 0) is record
      case discr is
         when 0 => anon7665 : aliased uu_TRISDbits_t_struct2258;  -- p32mx470f512.h:5293
         when 1 => anon7669 : aliased uu_TRISDbits_t_struct2259;  -- p32mx470f512.h:5296
         when others => null;
      end case;
   end record
     with Convention => C_Pass_By_Copy,
     Unchecked_Union => True;  -- p32mx470f512.h:5297

   TRISDbits : aliased uu_TRISDbits_t  -- p32mx470f512.h:5298
     with Import => True,
     Convention => C,
     External_Name => "TRISD";

   TRISDCLR : aliased unsigned  -- p32mx470f512.h:5299
     with Import => True,
     Convention => C,
     External_Name => "TRISDCLR";

   TRISDSET : aliased unsigned  -- p32mx470f512.h:5300
     with Import => True,
     Convention => C,
     External_Name => "TRISDSET";

   TRISDINV : aliased unsigned  -- p32mx470f512.h:5301
     with Import => True,
     Convention => C,
     External_Name => "TRISDINV";

   PORTD : aliased unsigned  -- p32mx470f512.h:5302
     with Import => True,
     Convention => C,
     External_Name => "PORTD";

   type uu_PORTDbits_t_struct2264 is record
      RD0  : Extensions.Unsigned_1;  -- p32mx470f512.h:5305
      RD1  : Extensions.Unsigned_1;  -- p32mx470f512.h:5306
      RD2  : Extensions.Unsigned_1;  -- p32mx470f512.h:5307
      RD3  : Extensions.Unsigned_1;  -- p32mx470f512.h:5308
      RD4  : Extensions.Unsigned_1;  -- p32mx470f512.h:5309
      RD5  : Extensions.Unsigned_1;  -- p32mx470f512.h:5310
      RD6  : Extensions.Unsigned_1;  -- p32mx470f512.h:5311
      RD7  : Extensions.Unsigned_1;  -- p32mx470f512.h:5312
      RD8  : Extensions.Unsigned_1;  -- p32mx470f512.h:5313
      RD9  : Extensions.Unsigned_1;  -- p32mx470f512.h:5314
      RD10 : Extensions.Unsigned_1;  -- p32mx470f512.h:5315
      RD11 : Extensions.Unsigned_1;  -- p32mx470f512.h:5316
   end record
     with Convention => C_Pass_By_Copy,
     Pack => True,
     Alignment => 4;
   type uu_PORTDbits_t_struct2265 is record
      w : aliased unsigned;  -- p32mx470f512.h:5319
   end record
     with Convention => C_Pass_By_Copy;
   type uu_PORTDbits_t (discr : unsigned := 0) is record
      case discr is
         when 0 => anon7691 : aliased uu_PORTDbits_t_struct2264;  -- p32mx470f512.h:5317
         when 1 => anon7695 : aliased uu_PORTDbits_t_struct2265;  -- p32mx470f512.h:5320
         when others => null;
      end case;
   end record
     with Convention => C_Pass_By_Copy,
     Unchecked_Union => True;  -- p32mx470f512.h:5321

   PORTDbits : aliased uu_PORTDbits_t  -- p32mx470f512.h:5322
     with Import => True,
     Convention => C,
     External_Name => "PORTD";

   PORTDCLR : aliased unsigned  -- p32mx470f512.h:5323
     with Import => True,
     Convention => C,
     External_Name => "PORTDCLR";

   PORTDSET : aliased unsigned  -- p32mx470f512.h:5324
     with Import => True,
     Convention => C,
     External_Name => "PORTDSET";

   PORTDINV : aliased unsigned  -- p32mx470f512.h:5325
     with Import => True,
     Convention => C,
     External_Name => "PORTDINV";

   LATD : aliased unsigned  -- p32mx470f512.h:5326
     with Import => True,
     Convention => C,
     External_Name => "LATD";

   type uu_LATDbits_t_struct2270 is record
      LATD0  : Extensions.Unsigned_1;  -- p32mx470f512.h:5329
      LATD1  : Extensions.Unsigned_1;  -- p32mx470f512.h:5330
      LATD2  : Extensions.Unsigned_1;  -- p32mx470f512.h:5331
      LATD3  : Extensions.Unsigned_1;  -- p32mx470f512.h:5332
      LATD4  : Extensions.Unsigned_1;  -- p32mx470f512.h:5333
      LATD5  : Extensions.Unsigned_1;  -- p32mx470f512.h:5334
      LATD6  : Extensions.Unsigned_1;  -- p32mx470f512.h:5335
      LATD7  : Extensions.Unsigned_1;  -- p32mx470f512.h:5336
      LATD8  : Extensions.Unsigned_1;  -- p32mx470f512.h:5337
      LATD9  : Extensions.Unsigned_1;  -- p32mx470f512.h:5338
      LATD10 : Extensions.Unsigned_1;  -- p32mx470f512.h:5339
      LATD11 : Extensions.Unsigned_1;  -- p32mx470f512.h:5340
   end record
     with Convention => C_Pass_By_Copy,
     Pack => True,
     Alignment => 4;
   type uu_LATDbits_t_struct2271 is record
      w : aliased unsigned;  -- p32mx470f512.h:5343
   end record
     with Convention => C_Pass_By_Copy;
   type uu_LATDbits_t (discr : unsigned := 0) is record
      case discr is
         when 0 => anon7717 : aliased uu_LATDbits_t_struct2270;  -- p32mx470f512.h:5341
         when 1 => anon7721 : aliased uu_LATDbits_t_struct2271;  -- p32mx470f512.h:5344
         when others => null;
      end case;
   end record
     with Convention => C_Pass_By_Copy,
     Unchecked_Union => True;  -- p32mx470f512.h:5345

   LATDbits : aliased uu_LATDbits_t  -- p32mx470f512.h:5346
     with Import => True,
     Convention => C,
     External_Name => "LATD";

   LATDCLR : aliased unsigned  -- p32mx470f512.h:5347
     with Import => True,
     Convention => C,
     External_Name => "LATDCLR";

   LATDSET : aliased unsigned  -- p32mx470f512.h:5348
     with Import => True,
     Convention => C,
     External_Name => "LATDSET";

   LATDINV : aliased unsigned  -- p32mx470f512.h:5349
     with Import => True,
     Convention => C,
     External_Name => "LATDINV";

   ODCD : aliased unsigned  -- p32mx470f512.h:5350
     with Import => True,
     Convention => C,
     External_Name => "ODCD";

   type uu_ODCDbits_t_struct2276 is record
      ODCD0  : Extensions.Unsigned_1;  -- p32mx470f512.h:5353
      ODCD1  : Extensions.Unsigned_1;  -- p32mx470f512.h:5354
      ODCD2  : Extensions.Unsigned_1;  -- p32mx470f512.h:5355
      ODCD3  : Extensions.Unsigned_1;  -- p32mx470f512.h:5356
      ODCD4  : Extensions.Unsigned_1;  -- p32mx470f512.h:5357
      ODCD5  : Extensions.Unsigned_1;  -- p32mx470f512.h:5358
      ODCD6  : Extensions.Unsigned_1;  -- p32mx470f512.h:5359
      ODCD7  : Extensions.Unsigned_1;  -- p32mx470f512.h:5360
      ODCD8  : Extensions.Unsigned_1;  -- p32mx470f512.h:5361
      ODCD9  : Extensions.Unsigned_1;  -- p32mx470f512.h:5362
      ODCD10 : Extensions.Unsigned_1;  -- p32mx470f512.h:5363
      ODCD11 : Extensions.Unsigned_1;  -- p32mx470f512.h:5364
   end record
     with Convention => C_Pass_By_Copy,
     Pack => True,
     Alignment => 4;
   type uu_ODCDbits_t_struct2277 is record
      w : aliased unsigned;  -- p32mx470f512.h:5367
   end record
     with Convention => C_Pass_By_Copy;
   type uu_ODCDbits_t (discr : unsigned := 0) is record
      case discr is
         when 0 => anon7743 : aliased uu_ODCDbits_t_struct2276;  -- p32mx470f512.h:5365
         when 1 => anon7747 : aliased uu_ODCDbits_t_struct2277;  -- p32mx470f512.h:5368
         when others => null;
      end case;
   end record
     with Convention => C_Pass_By_Copy,
     Unchecked_Union => True;  -- p32mx470f512.h:5369

   ODCDbits : aliased uu_ODCDbits_t  -- p32mx470f512.h:5370
     with Import => True,
     Convention => C,
     External_Name => "ODCD";

   ODCDCLR : aliased unsigned  -- p32mx470f512.h:5371
     with Import => True,
     Convention => C,
     External_Name => "ODCDCLR";

   ODCDSET : aliased unsigned  -- p32mx470f512.h:5372
     with Import => True,
     Convention => C,
     External_Name => "ODCDSET";

   ODCDINV : aliased unsigned  -- p32mx470f512.h:5373
     with Import => True,
     Convention => C,
     External_Name => "ODCDINV";

   CNPUD : aliased unsigned  -- p32mx470f512.h:5374
     with Import => True,
     Convention => C,
     External_Name => "CNPUD";

   type uu_CNPUDbits_t_struct2282 is record
      CNPUD0  : Extensions.Unsigned_1;  -- p32mx470f512.h:5377
      CNPUD1  : Extensions.Unsigned_1;  -- p32mx470f512.h:5378
      CNPUD2  : Extensions.Unsigned_1;  -- p32mx470f512.h:5379
      CNPUD3  : Extensions.Unsigned_1;  -- p32mx470f512.h:5380
      CNPUD4  : Extensions.Unsigned_1;  -- p32mx470f512.h:5381
      CNPUD5  : Extensions.Unsigned_1;  -- p32mx470f512.h:5382
      CNPUD6  : Extensions.Unsigned_1;  -- p32mx470f512.h:5383
      CNPUD7  : Extensions.Unsigned_1;  -- p32mx470f512.h:5384
      CNPUD8  : Extensions.Unsigned_1;  -- p32mx470f512.h:5385
      CNPUD9  : Extensions.Unsigned_1;  -- p32mx470f512.h:5386
      CNPUD10 : Extensions.Unsigned_1;  -- p32mx470f512.h:5387
      CNPUD11 : Extensions.Unsigned_1;  -- p32mx470f512.h:5388
   end record
     with Convention => C_Pass_By_Copy,
     Pack => True,
     Alignment => 4;
   type uu_CNPUDbits_t_struct2283 is record
      w : aliased unsigned;  -- p32mx470f512.h:5391
   end record
     with Convention => C_Pass_By_Copy;
   type uu_CNPUDbits_t (discr : unsigned := 0) is record
      case discr is
         when 0 => anon7769 : aliased uu_CNPUDbits_t_struct2282;  -- p32mx470f512.h:5389
         when 1 => anon7773 : aliased uu_CNPUDbits_t_struct2283;  -- p32mx470f512.h:5392
         when others => null;
      end case;
   end record
     with Convention => C_Pass_By_Copy,
     Unchecked_Union => True;  -- p32mx470f512.h:5393

   CNPUDbits : aliased uu_CNPUDbits_t  -- p32mx470f512.h:5394
     with Import => True,
     Convention => C,
     External_Name => "CNPUD";

   CNPUDCLR : aliased unsigned  -- p32mx470f512.h:5395
     with Import => True,
     Convention => C,
     External_Name => "CNPUDCLR";

   CNPUDSET : aliased unsigned  -- p32mx470f512.h:5396
     with Import => True,
     Convention => C,
     External_Name => "CNPUDSET";

   CNPUDINV : aliased unsigned  -- p32mx470f512.h:5397
     with Import => True,
     Convention => C,
     External_Name => "CNPUDINV";

   CNPDD : aliased unsigned  -- p32mx470f512.h:5398
     with Import => True,
     Convention => C,
     External_Name => "CNPDD";

   type uu_CNPDDbits_t_struct2288 is record
      CNPDD0  : Extensions.Unsigned_1;  -- p32mx470f512.h:5401
      CNPDD1  : Extensions.Unsigned_1;  -- p32mx470f512.h:5402
      CNPDD2  : Extensions.Unsigned_1;  -- p32mx470f512.h:5403
      CNPDD3  : Extensions.Unsigned_1;  -- p32mx470f512.h:5404
      CNPDD4  : Extensions.Unsigned_1;  -- p32mx470f512.h:5405
      CNPDD5  : Extensions.Unsigned_1;  -- p32mx470f512.h:5406
      CNPDD6  : Extensions.Unsigned_1;  -- p32mx470f512.h:5407
      CNPDD7  : Extensions.Unsigned_1;  -- p32mx470f512.h:5408
      CNPDD8  : Extensions.Unsigned_1;  -- p32mx470f512.h:5409
      CNPDD9  : Extensions.Unsigned_1;  -- p32mx470f512.h:5410
      CNPDD10 : Extensions.Unsigned_1;  -- p32mx470f512.h:5411
      CNPDD11 : Extensions.Unsigned_1;  -- p32mx470f512.h:5412
   end record
     with Convention => C_Pass_By_Copy,
     Pack => True,
     Alignment => 4;
   type uu_CNPDDbits_t_struct2289 is record
      w : aliased unsigned;  -- p32mx470f512.h:5415
   end record
     with Convention => C_Pass_By_Copy;
   type uu_CNPDDbits_t (discr : unsigned := 0) is record
      case discr is
         when 0 => anon7795 : aliased uu_CNPDDbits_t_struct2288;  -- p32mx470f512.h:5413
         when 1 => anon7799 : aliased uu_CNPDDbits_t_struct2289;  -- p32mx470f512.h:5416
         when others => null;
      end case;
   end record
     with Convention => C_Pass_By_Copy,
     Unchecked_Union => True;  -- p32mx470f512.h:5417

   CNPDDbits : aliased uu_CNPDDbits_t  -- p32mx470f512.h:5418
     with Import => True,
     Convention => C,
     External_Name => "CNPDD";

   CNPDDCLR : aliased unsigned  -- p32mx470f512.h:5419
     with Import => True,
     Convention => C,
     External_Name => "CNPDDCLR";

   CNPDDSET : aliased unsigned  -- p32mx470f512.h:5420
     with Import => True,
     Convention => C,
     External_Name => "CNPDDSET";

   CNPDDINV : aliased unsigned  -- p32mx470f512.h:5421
     with Import => True,
     Convention => C,
     External_Name => "CNPDDINV";

   CNCOND : aliased unsigned  -- p32mx470f512.h:5422
     with Import => True,
     Convention => C,
     External_Name => "CNCOND";

   type uu_CNCONDbits_t_struct2294 is record
      anon7808 : Extensions.Unsigned_13;  -- p32mx470f512.h:5425
      SIDL     : Extensions.Unsigned_1;  -- p32mx470f512.h:5426
      anon7810 : Extensions.Unsigned_1;  -- p32mx470f512.h:5427
      ON       : Extensions.Unsigned_1;  -- p32mx470f512.h:5428
   end record
     with Convention => C_Pass_By_Copy,
     Pack => True,
     Alignment => 4;
   type uu_CNCONDbits_t_struct2295 is record
      w : aliased unsigned;  -- p32mx470f512.h:5431
   end record
     with Convention => C_Pass_By_Copy;
   type uu_CNCONDbits_t (discr : unsigned := 0) is record
      case discr is
         when 0 => anon7813 : aliased uu_CNCONDbits_t_struct2294;  -- p32mx470f512.h:5429
         when 1 => anon7817 : aliased uu_CNCONDbits_t_struct2295;  -- p32mx470f512.h:5432
         when others => null;
      end case;
   end record
     with Convention => C_Pass_By_Copy,
     Unchecked_Union => True;  -- p32mx470f512.h:5433

   CNCONDbits : aliased uu_CNCONDbits_t  -- p32mx470f512.h:5434
     with Import => True,
     Convention => C,
     External_Name => "CNCOND";

   CNCONDCLR : aliased unsigned  -- p32mx470f512.h:5435
     with Import => True,
     Convention => C,
     External_Name => "CNCONDCLR";

   CNCONDSET : aliased unsigned  -- p32mx470f512.h:5436
     with Import => True,
     Convention => C,
     External_Name => "CNCONDSET";

   CNCONDINV : aliased unsigned  -- p32mx470f512.h:5437
     with Import => True,
     Convention => C,
     External_Name => "CNCONDINV";

   CNEND : aliased unsigned  -- p32mx470f512.h:5438
     with Import => True,
     Convention => C,
     External_Name => "CNEND";

   type uu_CNENDbits_t_struct2300 is record
      CNIED0  : Extensions.Unsigned_1;  -- p32mx470f512.h:5441
      CNIED1  : Extensions.Unsigned_1;  -- p32mx470f512.h:5442
      CNIED2  : Extensions.Unsigned_1;  -- p32mx470f512.h:5443
      CNIED3  : Extensions.Unsigned_1;  -- p32mx470f512.h:5444
      CNIED4  : Extensions.Unsigned_1;  -- p32mx470f512.h:5445
      CNIED5  : Extensions.Unsigned_1;  -- p32mx470f512.h:5446
      CNIED6  : Extensions.Unsigned_1;  -- p32mx470f512.h:5447
      CNIED7  : Extensions.Unsigned_1;  -- p32mx470f512.h:5448
      CNIED8  : Extensions.Unsigned_1;  -- p32mx470f512.h:5449
      CNIED9  : Extensions.Unsigned_1;  -- p32mx470f512.h:5450
      CNIED10 : Extensions.Unsigned_1;  -- p32mx470f512.h:5451
      CNIED11 : Extensions.Unsigned_1;  -- p32mx470f512.h:5452
   end record
     with Convention => C_Pass_By_Copy,
     Pack => True,
     Alignment => 4;
   type uu_CNENDbits_t_struct2301 is record
      w : aliased unsigned;  -- p32mx470f512.h:5455
   end record
     with Convention => C_Pass_By_Copy;
   type uu_CNENDbits_t (discr : unsigned := 0) is record
      case discr is
         when 0 => anon7839 : aliased uu_CNENDbits_t_struct2300;  -- p32mx470f512.h:5453
         when 1 => anon7843 : aliased uu_CNENDbits_t_struct2301;  -- p32mx470f512.h:5456
         when others => null;
      end case;
   end record
     with Convention => C_Pass_By_Copy,
     Unchecked_Union => True;  -- p32mx470f512.h:5457

   CNENDbits : aliased uu_CNENDbits_t  -- p32mx470f512.h:5458
     with Import => True,
     Convention => C,
     External_Name => "CNEND";

   CNENDCLR : aliased unsigned  -- p32mx470f512.h:5459
     with Import => True,
     Convention => C,
     External_Name => "CNENDCLR";

   CNENDSET : aliased unsigned  -- p32mx470f512.h:5460
     with Import => True,
     Convention => C,
     External_Name => "CNENDSET";

   CNENDINV : aliased unsigned  -- p32mx470f512.h:5461
     with Import => True,
     Convention => C,
     External_Name => "CNENDINV";

   CNSTATD : aliased unsigned  -- p32mx470f512.h:5462
     with Import => True,
     Convention => C,
     External_Name => "CNSTATD";

   type uu_CNSTATDbits_t_struct2306 is record
      CNSTATD0  : Extensions.Unsigned_1;  -- p32mx470f512.h:5465
      CNSTATD1  : Extensions.Unsigned_1;  -- p32mx470f512.h:5466
      CNSTATD2  : Extensions.Unsigned_1;  -- p32mx470f512.h:5467
      CNSTATD3  : Extensions.Unsigned_1;  -- p32mx470f512.h:5468
      CNSTATD4  : Extensions.Unsigned_1;  -- p32mx470f512.h:5469
      CNSTATD5  : Extensions.Unsigned_1;  -- p32mx470f512.h:5470
      CNSTATD6  : Extensions.Unsigned_1;  -- p32mx470f512.h:5471
      CNSTATD7  : Extensions.Unsigned_1;  -- p32mx470f512.h:5472
      CNSTATD8  : Extensions.Unsigned_1;  -- p32mx470f512.h:5473
      CNSTATD9  : Extensions.Unsigned_1;  -- p32mx470f512.h:5474
      CNSTATD10 : Extensions.Unsigned_1;  -- p32mx470f512.h:5475
      CNSTATD11 : Extensions.Unsigned_1;  -- p32mx470f512.h:5476
   end record
     with Convention => C_Pass_By_Copy,
     Pack => True,
     Alignment => 4;
   type uu_CNSTATDbits_t_struct2307 is record
      w : aliased unsigned;  -- p32mx470f512.h:5479
   end record
     with Convention => C_Pass_By_Copy;
   type uu_CNSTATDbits_t (discr : unsigned := 0) is record
      case discr is
         when 0 => anon7865 : aliased uu_CNSTATDbits_t_struct2306;  -- p32mx470f512.h:5477
         when 1 => anon7869 : aliased uu_CNSTATDbits_t_struct2307;  -- p32mx470f512.h:5480
         when others => null;
      end case;
   end record
     with Convention => C_Pass_By_Copy,
     Unchecked_Union => True;  -- p32mx470f512.h:5481

   CNSTATDbits : aliased uu_CNSTATDbits_t  -- p32mx470f512.h:5482
     with Import => True,
     Convention => C,
     External_Name => "CNSTATD";

   CNSTATDCLR : aliased unsigned  -- p32mx470f512.h:5483
     with Import => True,
     Convention => C,
     External_Name => "CNSTATDCLR";

   CNSTATDSET : aliased unsigned  -- p32mx470f512.h:5484
     with Import => True,
     Convention => C,
     External_Name => "CNSTATDSET";

   CNSTATDINV : aliased unsigned  -- p32mx470f512.h:5485
     with Import => True,
     Convention => C,
     External_Name => "CNSTATDINV";

   ANSELE : aliased unsigned  -- p32mx470f512.h:5486
     with Import => True,
     Convention => C,
     External_Name => "ANSELE";

   type uu_ANSELEbits_t_struct2312 is record
      anon7878 : Extensions.Unsigned_2;  -- p32mx470f512.h:5489
      ANSE2    : Extensions.Unsigned_1;  -- p32mx470f512.h:5490
      anon7880 : Extensions.Unsigned_1;  -- p32mx470f512.h:5491
      ANSE4    : Extensions.Unsigned_1;  -- p32mx470f512.h:5492
      ANSE5    : Extensions.Unsigned_1;  -- p32mx470f512.h:5493
      ANSE6    : Extensions.Unsigned_1;  -- p32mx470f512.h:5494
      ANSE7    : Extensions.Unsigned_1;  -- p32mx470f512.h:5495
   end record
     with Convention => C_Pass_By_Copy,
     Pack => True,
     Alignment => 4;
   type uu_ANSELEbits_t_struct2313 is record
      w : aliased unsigned;  -- p32mx470f512.h:5498
   end record
     with Convention => C_Pass_By_Copy;
   type uu_ANSELEbits_t (discr : unsigned := 0) is record
      case discr is
         when 0 => anon7886 : aliased uu_ANSELEbits_t_struct2312;  -- p32mx470f512.h:5496
         when 1 => anon7890 : aliased uu_ANSELEbits_t_struct2313;  -- p32mx470f512.h:5499
         when others => null;
      end case;
   end record
     with Convention => C_Pass_By_Copy,
     Unchecked_Union => True;  -- p32mx470f512.h:5500

   ANSELEbits : aliased uu_ANSELEbits_t  -- p32mx470f512.h:5501
     with Import => True,
     Convention => C,
     External_Name => "ANSELE";

   ANSELECLR : aliased unsigned  -- p32mx470f512.h:5502
     with Import => True,
     Convention => C,
     External_Name => "ANSELECLR";

   ANSELESET : aliased unsigned  -- p32mx470f512.h:5503
     with Import => True,
     Convention => C,
     External_Name => "ANSELESET";

   ANSELEINV : aliased unsigned  -- p32mx470f512.h:5504
     with Import => True,
     Convention => C,
     External_Name => "ANSELEINV";

   TRISE : aliased unsigned  -- p32mx470f512.h:5505
     with Import => True,
     Convention => C,
     External_Name => "TRISE";

   type uu_TRISEbits_t_struct2318 is record
      TRISE0 : Extensions.Unsigned_1;  -- p32mx470f512.h:5508
      TRISE1 : Extensions.Unsigned_1;  -- p32mx470f512.h:5509
      TRISE2 : Extensions.Unsigned_1;  -- p32mx470f512.h:5510
      TRISE3 : Extensions.Unsigned_1;  -- p32mx470f512.h:5511
      TRISE4 : Extensions.Unsigned_1;  -- p32mx470f512.h:5512
      TRISE5 : Extensions.Unsigned_1;  -- p32mx470f512.h:5513
      TRISE6 : Extensions.Unsigned_1;  -- p32mx470f512.h:5514
      TRISE7 : Extensions.Unsigned_1;  -- p32mx470f512.h:5515
   end record
     with Convention => C_Pass_By_Copy,
     Pack => True,
     Alignment => 4;
   type uu_TRISEbits_t_struct2319 is record
      w : aliased unsigned;  -- p32mx470f512.h:5518
   end record
     with Convention => C_Pass_By_Copy;
   type uu_TRISEbits_t (discr : unsigned := 0) is record
      case discr is
         when 0 => anon7908 : aliased uu_TRISEbits_t_struct2318;  -- p32mx470f512.h:5516
         when 1 => anon7912 : aliased uu_TRISEbits_t_struct2319;  -- p32mx470f512.h:5519
         when others => null;
      end case;
   end record
     with Convention => C_Pass_By_Copy,
     Unchecked_Union => True;  -- p32mx470f512.h:5520

   TRISEbits : aliased uu_TRISEbits_t  -- p32mx470f512.h:5521
     with Import => True,
     Convention => C,
     External_Name => "TRISE";

   TRISECLR : aliased unsigned  -- p32mx470f512.h:5522
     with Import => True,
     Convention => C,
     External_Name => "TRISECLR";

   TRISESET : aliased unsigned  -- p32mx470f512.h:5523
     with Import => True,
     Convention => C,
     External_Name => "TRISESET";

   TRISEINV : aliased unsigned  -- p32mx470f512.h:5524
     with Import => True,
     Convention => C,
     External_Name => "TRISEINV";

   PORTE : aliased unsigned  -- p32mx470f512.h:5525
     with Import => True,
     Convention => C,
     External_Name => "PORTE";

   type uu_PORTEbits_t_struct2324 is record
      RE0 : Extensions.Unsigned_1;  -- p32mx470f512.h:5528
      RE1 : Extensions.Unsigned_1;  -- p32mx470f512.h:5529
      RE2 : Extensions.Unsigned_1;  -- p32mx470f512.h:5530
      RE3 : Extensions.Unsigned_1;  -- p32mx470f512.h:5531
      RE4 : Extensions.Unsigned_1;  -- p32mx470f512.h:5532
      RE5 : Extensions.Unsigned_1;  -- p32mx470f512.h:5533
      RE6 : Extensions.Unsigned_1;  -- p32mx470f512.h:5534
      RE7 : Extensions.Unsigned_1;  -- p32mx470f512.h:5535
   end record
     with Convention => C_Pass_By_Copy,
     Pack => True,
     Alignment => 4;
   type uu_PORTEbits_t_struct2325 is record
      w : aliased unsigned;  -- p32mx470f512.h:5538
   end record
     with Convention => C_Pass_By_Copy;
   type uu_PORTEbits_t (discr : unsigned := 0) is record
      case discr is
         when 0 => anon7930 : aliased uu_PORTEbits_t_struct2324;  -- p32mx470f512.h:5536
         when 1 => anon7934 : aliased uu_PORTEbits_t_struct2325;  -- p32mx470f512.h:5539
         when others => null;
      end case;
   end record
     with Convention => C_Pass_By_Copy,
     Unchecked_Union => True;  -- p32mx470f512.h:5540

   PORTEbits : aliased uu_PORTEbits_t  -- p32mx470f512.h:5541
     with Import => True,
     Convention => C,
     External_Name => "PORTE";

   PORTECLR : aliased unsigned  -- p32mx470f512.h:5542
     with Import => True,
     Convention => C,
     External_Name => "PORTECLR";

   PORTESET : aliased unsigned  -- p32mx470f512.h:5543
     with Import => True,
     Convention => C,
     External_Name => "PORTESET";

   PORTEINV : aliased unsigned  -- p32mx470f512.h:5544
     with Import => True,
     Convention => C,
     External_Name => "PORTEINV";

   LATE : aliased unsigned  -- p32mx470f512.h:5545
     with Import => True,
     Convention => C,
     External_Name => "LATE";

   type uu_LATEbits_t_struct2330 is record
      LATE0 : Extensions.Unsigned_1;  -- p32mx470f512.h:5548
      LATE1 : Extensions.Unsigned_1;  -- p32mx470f512.h:5549
      LATE2 : Extensions.Unsigned_1;  -- p32mx470f512.h:5550
      LATE3 : Extensions.Unsigned_1;  -- p32mx470f512.h:5551
      LATE4 : Extensions.Unsigned_1;  -- p32mx470f512.h:5552
      LATE5 : Extensions.Unsigned_1;  -- p32mx470f512.h:5553
      LATE6 : Extensions.Unsigned_1;  -- p32mx470f512.h:5554
      LATE7 : Extensions.Unsigned_1;  -- p32mx470f512.h:5555
   end record
     with Convention => C_Pass_By_Copy,
     Pack => True,
     Alignment => 4;
   type uu_LATEbits_t_struct2331 is record
      w : aliased unsigned;  -- p32mx470f512.h:5558
   end record
     with Convention => C_Pass_By_Copy;
   type uu_LATEbits_t (discr : unsigned := 0) is record
      case discr is
         when 0 => anon7952 : aliased uu_LATEbits_t_struct2330;  -- p32mx470f512.h:5556
         when 1 => anon7956 : aliased uu_LATEbits_t_struct2331;  -- p32mx470f512.h:5559
         when others => null;
      end case;
   end record
     with Convention => C_Pass_By_Copy,
     Unchecked_Union => True;  -- p32mx470f512.h:5560

   LATEbits : aliased uu_LATEbits_t  -- p32mx470f512.h:5561
     with Import => True,
     Convention => C,
     External_Name => "LATE";

   LATECLR : aliased unsigned  -- p32mx470f512.h:5562
     with Import => True,
     Convention => C,
     External_Name => "LATECLR";

   LATESET : aliased unsigned  -- p32mx470f512.h:5563
     with Import => True,
     Convention => C,
     External_Name => "LATESET";

   LATEINV : aliased unsigned  -- p32mx470f512.h:5564
     with Import => True,
     Convention => C,
     External_Name => "LATEINV";

   ODCE : aliased unsigned  -- p32mx470f512.h:5565
     with Import => True,
     Convention => C,
     External_Name => "ODCE";

   type uu_ODCEbits_t_struct2336 is record
      ODCE0 : Extensions.Unsigned_1;  -- p32mx470f512.h:5568
      ODCE1 : Extensions.Unsigned_1;  -- p32mx470f512.h:5569
      ODCE2 : Extensions.Unsigned_1;  -- p32mx470f512.h:5570
      ODCE3 : Extensions.Unsigned_1;  -- p32mx470f512.h:5571
      ODCE4 : Extensions.Unsigned_1;  -- p32mx470f512.h:5572
      ODCE5 : Extensions.Unsigned_1;  -- p32mx470f512.h:5573
      ODCE6 : Extensions.Unsigned_1;  -- p32mx470f512.h:5574
      ODCE7 : Extensions.Unsigned_1;  -- p32mx470f512.h:5575
   end record
     with Convention => C_Pass_By_Copy,
     Pack => True,
     Alignment => 4;
   type uu_ODCEbits_t_struct2337 is record
      w : aliased unsigned;  -- p32mx470f512.h:5578
   end record
     with Convention => C_Pass_By_Copy;
   type uu_ODCEbits_t (discr : unsigned := 0) is record
      case discr is
         when 0 => anon7974 : aliased uu_ODCEbits_t_struct2336;  -- p32mx470f512.h:5576
         when 1 => anon7978 : aliased uu_ODCEbits_t_struct2337;  -- p32mx470f512.h:5579
         when others => null;
      end case;
   end record
     with Convention => C_Pass_By_Copy,
     Unchecked_Union => True;  -- p32mx470f512.h:5580

   ODCEbits : aliased uu_ODCEbits_t  -- p32mx470f512.h:5581
     with Import => True,
     Convention => C,
     External_Name => "ODCE";

   ODCECLR : aliased unsigned  -- p32mx470f512.h:5582
     with Import => True,
     Convention => C,
     External_Name => "ODCECLR";

   ODCESET : aliased unsigned  -- p32mx470f512.h:5583
     with Import => True,
     Convention => C,
     External_Name => "ODCESET";

   ODCEINV : aliased unsigned  -- p32mx470f512.h:5584
     with Import => True,
     Convention => C,
     External_Name => "ODCEINV";

   CNPUE : aliased unsigned  -- p32mx470f512.h:5585
     with Import => True,
     Convention => C,
     External_Name => "CNPUE";

   type uu_CNPUEbits_t_struct2342 is record
      CNPUE0 : Extensions.Unsigned_1;  -- p32mx470f512.h:5588
      CNPUE1 : Extensions.Unsigned_1;  -- p32mx470f512.h:5589
      CNPUE2 : Extensions.Unsigned_1;  -- p32mx470f512.h:5590
      CNPUE3 : Extensions.Unsigned_1;  -- p32mx470f512.h:5591
      CNPUE4 : Extensions.Unsigned_1;  -- p32mx470f512.h:5592
      CNPUE5 : Extensions.Unsigned_1;  -- p32mx470f512.h:5593
      CNPUE6 : Extensions.Unsigned_1;  -- p32mx470f512.h:5594
      CNPUE7 : Extensions.Unsigned_1;  -- p32mx470f512.h:5595
   end record
     with Convention => C_Pass_By_Copy,
     Pack => True,
     Alignment => 4;
   type uu_CNPUEbits_t_struct2343 is record
      w : aliased unsigned;  -- p32mx470f512.h:5598
   end record
     with Convention => C_Pass_By_Copy;
   type uu_CNPUEbits_t (discr : unsigned := 0) is record
      case discr is
         when 0 => anon7996 : aliased uu_CNPUEbits_t_struct2342;  -- p32mx470f512.h:5596
         when 1 => anon8000 : aliased uu_CNPUEbits_t_struct2343;  -- p32mx470f512.h:5599
         when others => null;
      end case;
   end record
     with Convention => C_Pass_By_Copy,
     Unchecked_Union => True;  -- p32mx470f512.h:5600

   CNPUEbits : aliased uu_CNPUEbits_t  -- p32mx470f512.h:5601
     with Import => True,
     Convention => C,
     External_Name => "CNPUE";

   CNPUECLR : aliased unsigned  -- p32mx470f512.h:5602
     with Import => True,
     Convention => C,
     External_Name => "CNPUECLR";

   CNPUESET : aliased unsigned  -- p32mx470f512.h:5603
     with Import => True,
     Convention => C,
     External_Name => "CNPUESET";

   CNPUEINV : aliased unsigned  -- p32mx470f512.h:5604
     with Import => True,
     Convention => C,
     External_Name => "CNPUEINV";

   CNPDE : aliased unsigned  -- p32mx470f512.h:5605
     with Import => True,
     Convention => C,
     External_Name => "CNPDE";

   type uu_CNPDEbits_t_struct2348 is record
      CNPDE0 : Extensions.Unsigned_1;  -- p32mx470f512.h:5608
      CNPDE1 : Extensions.Unsigned_1;  -- p32mx470f512.h:5609
      CNPDE2 : Extensions.Unsigned_1;  -- p32mx470f512.h:5610
      CNPDE3 : Extensions.Unsigned_1;  -- p32mx470f512.h:5611
      CNPDE4 : Extensions.Unsigned_1;  -- p32mx470f512.h:5612
      CNPDE5 : Extensions.Unsigned_1;  -- p32mx470f512.h:5613
      CNPDE6 : Extensions.Unsigned_1;  -- p32mx470f512.h:5614
      CNPDE7 : Extensions.Unsigned_1;  -- p32mx470f512.h:5615
   end record
     with Convention => C_Pass_By_Copy,
     Pack => True,
     Alignment => 4;
   type uu_CNPDEbits_t_struct2349 is record
      w : aliased unsigned;  -- p32mx470f512.h:5618
   end record
     with Convention => C_Pass_By_Copy;
   type uu_CNPDEbits_t (discr : unsigned := 0) is record
      case discr is
         when 0 => anon8018 : aliased uu_CNPDEbits_t_struct2348;  -- p32mx470f512.h:5616
         when 1 => anon8022 : aliased uu_CNPDEbits_t_struct2349;  -- p32mx470f512.h:5619
         when others => null;
      end case;
   end record
     with Convention => C_Pass_By_Copy,
     Unchecked_Union => True;  -- p32mx470f512.h:5620

   CNPDEbits : aliased uu_CNPDEbits_t  -- p32mx470f512.h:5621
     with Import => True,
     Convention => C,
     External_Name => "CNPDE";

   CNPDECLR : aliased unsigned  -- p32mx470f512.h:5622
     with Import => True,
     Convention => C,
     External_Name => "CNPDECLR";

   CNPDESET : aliased unsigned  -- p32mx470f512.h:5623
     with Import => True,
     Convention => C,
     External_Name => "CNPDESET";

   CNPDEINV : aliased unsigned  -- p32mx470f512.h:5624
     with Import => True,
     Convention => C,
     External_Name => "CNPDEINV";

   CNCONE : aliased unsigned  -- p32mx470f512.h:5625
     with Import => True,
     Convention => C,
     External_Name => "CNCONE";

   type uu_CNCONEbits_t_struct2354 is record
      anon8031 : Extensions.Unsigned_13;  -- p32mx470f512.h:5628
      SIDL     : Extensions.Unsigned_1;  -- p32mx470f512.h:5629
      anon8033 : Extensions.Unsigned_1;  -- p32mx470f512.h:5630
      ON       : Extensions.Unsigned_1;  -- p32mx470f512.h:5631
   end record
     with Convention => C_Pass_By_Copy,
     Pack => True,
     Alignment => 4;
   type uu_CNCONEbits_t_struct2355 is record
      w : aliased unsigned;  -- p32mx470f512.h:5634
   end record
     with Convention => C_Pass_By_Copy;
   type uu_CNCONEbits_t (discr : unsigned := 0) is record
      case discr is
         when 0 => anon8036 : aliased uu_CNCONEbits_t_struct2354;  -- p32mx470f512.h:5632
         when 1 => anon8040 : aliased uu_CNCONEbits_t_struct2355;  -- p32mx470f512.h:5635
         when others => null;
      end case;
   end record
     with Convention => C_Pass_By_Copy,
     Unchecked_Union => True;  -- p32mx470f512.h:5636

   CNCONEbits : aliased uu_CNCONEbits_t  -- p32mx470f512.h:5637
     with Import => True,
     Convention => C,
     External_Name => "CNCONE";

   CNCONECLR : aliased unsigned  -- p32mx470f512.h:5638
     with Import => True,
     Convention => C,
     External_Name => "CNCONECLR";

   CNCONESET : aliased unsigned  -- p32mx470f512.h:5639
     with Import => True,
     Convention => C,
     External_Name => "CNCONESET";

   CNCONEINV : aliased unsigned  -- p32mx470f512.h:5640
     with Import => True,
     Convention => C,
     External_Name => "CNCONEINV";

   CNENE : aliased unsigned  -- p32mx470f512.h:5641
     with Import => True,
     Convention => C,
     External_Name => "CNENE";

   type uu_CNENEbits_t_struct2360 is record
      CNIEE0 : Extensions.Unsigned_1;  -- p32mx470f512.h:5644
      CNIEE1 : Extensions.Unsigned_1;  -- p32mx470f512.h:5645
      CNIEE2 : Extensions.Unsigned_1;  -- p32mx470f512.h:5646
      CNIEE3 : Extensions.Unsigned_1;  -- p32mx470f512.h:5647
      CNIEE4 : Extensions.Unsigned_1;  -- p32mx470f512.h:5648
      CNIEE5 : Extensions.Unsigned_1;  -- p32mx470f512.h:5649
      CNIEE6 : Extensions.Unsigned_1;  -- p32mx470f512.h:5650
      CNIEE7 : Extensions.Unsigned_1;  -- p32mx470f512.h:5651
   end record
     with Convention => C_Pass_By_Copy,
     Pack => True,
     Alignment => 4;
   type uu_CNENEbits_t_struct2361 is record
      w : aliased unsigned;  -- p32mx470f512.h:5654
   end record
     with Convention => C_Pass_By_Copy;
   type uu_CNENEbits_t (discr : unsigned := 0) is record
      case discr is
         when 0 => anon8058 : aliased uu_CNENEbits_t_struct2360;  -- p32mx470f512.h:5652
         when 1 => anon8062 : aliased uu_CNENEbits_t_struct2361;  -- p32mx470f512.h:5655
         when others => null;
      end case;
   end record
     with Convention => C_Pass_By_Copy,
     Unchecked_Union => True;  -- p32mx470f512.h:5656

   CNENEbits : aliased uu_CNENEbits_t  -- p32mx470f512.h:5657
     with Import => True,
     Convention => C,
     External_Name => "CNENE";

   CNENECLR : aliased unsigned  -- p32mx470f512.h:5658
     with Import => True,
     Convention => C,
     External_Name => "CNENECLR";

   CNENESET : aliased unsigned  -- p32mx470f512.h:5659
     with Import => True,
     Convention => C,
     External_Name => "CNENESET";

   CNENEINV : aliased unsigned  -- p32mx470f512.h:5660
     with Import => True,
     Convention => C,
     External_Name => "CNENEINV";

   CNSTATE : aliased unsigned  -- p32mx470f512.h:5661
     with Import => True,
     Convention => C,
     External_Name => "CNSTATE";

   type uu_CNSTATEbits_t_struct2366 is record
      CNSTATE0 : Extensions.Unsigned_1;  -- p32mx470f512.h:5664
      CNSTATE1 : Extensions.Unsigned_1;  -- p32mx470f512.h:5665
      CNSTATE2 : Extensions.Unsigned_1;  -- p32mx470f512.h:5666
      CNSTATE3 : Extensions.Unsigned_1;  -- p32mx470f512.h:5667
      CNSTATE4 : Extensions.Unsigned_1;  -- p32mx470f512.h:5668
      CNSTATE5 : Extensions.Unsigned_1;  -- p32mx470f512.h:5669
      CNSTATE6 : Extensions.Unsigned_1;  -- p32mx470f512.h:5670
      CNSTATE7 : Extensions.Unsigned_1;  -- p32mx470f512.h:5671
   end record
     with Convention => C_Pass_By_Copy,
     Pack => True,
     Alignment => 4;
   type uu_CNSTATEbits_t_struct2367 is record
      w : aliased unsigned;  -- p32mx470f512.h:5674
   end record
     with Convention => C_Pass_By_Copy;
   type uu_CNSTATEbits_t (discr : unsigned := 0) is record
      case discr is
         when 0 => anon8080 : aliased uu_CNSTATEbits_t_struct2366;  -- p32mx470f512.h:5672
         when 1 => anon8084 : aliased uu_CNSTATEbits_t_struct2367;  -- p32mx470f512.h:5675
         when others => null;
      end case;
   end record
     with Convention => C_Pass_By_Copy,
     Unchecked_Union => True;  -- p32mx470f512.h:5676

   CNSTATEbits : aliased uu_CNSTATEbits_t  -- p32mx470f512.h:5677
     with Import => True,
     Convention => C,
     External_Name => "CNSTATE";

   CNSTATECLR : aliased unsigned  -- p32mx470f512.h:5678
     with Import => True,
     Convention => C,
     External_Name => "CNSTATECLR";

   CNSTATESET : aliased unsigned  -- p32mx470f512.h:5679
     with Import => True,
     Convention => C,
     External_Name => "CNSTATESET";

   CNSTATEINV : aliased unsigned  -- p32mx470f512.h:5680
     with Import => True,
     Convention => C,
     External_Name => "CNSTATEINV";

   ANSELF : aliased unsigned  -- p32mx470f512.h:5681
     with Import => True,
     Convention => C,
     External_Name => "ANSELF";

   type uu_ANSELFbits_t is record
      w : aliased unsigned;  -- p32mx470f512.h:5683
   end record
     with Convention => C_Pass_By_Copy;  -- p32mx470f512.h:5684

   ANSELFbits : aliased uu_ANSELFbits_t  -- p32mx470f512.h:5685
     with Import => True,
     Convention => C,
     External_Name => "ANSELF";

   ANSELFCLR : aliased unsigned  -- p32mx470f512.h:5686
     with Import => True,
     Convention => C,
     External_Name => "ANSELFCLR";

   ANSELFSET : aliased unsigned  -- p32mx470f512.h:5687
     with Import => True,
     Convention => C,
     External_Name => "ANSELFSET";

   ANSELFINV : aliased unsigned  -- p32mx470f512.h:5688
     with Import => True,
     Convention => C,
     External_Name => "ANSELFINV";

   TRISF : aliased unsigned  -- p32mx470f512.h:5689
     with Import => True,
     Convention => C,
     External_Name => "TRISF";

   type uu_TRISFbits_t_struct2376 is record
      TRISF0   : Extensions.Unsigned_1;  -- p32mx470f512.h:5692
      TRISF1   : Extensions.Unsigned_1;  -- p32mx470f512.h:5693
      anon8104 : Extensions.Unsigned_1;  -- p32mx470f512.h:5694
      TRISF3   : Extensions.Unsigned_1;  -- p32mx470f512.h:5695
      TRISF4   : Extensions.Unsigned_1;  -- p32mx470f512.h:5696
      TRISF5   : Extensions.Unsigned_1;  -- p32mx470f512.h:5697
   end record
     with Convention => C_Pass_By_Copy,
     Pack => True,
     Alignment => 4;
   type uu_TRISFbits_t_struct2377 is record
      w : aliased unsigned;  -- p32mx470f512.h:5700
   end record
     with Convention => C_Pass_By_Copy;
   type uu_TRISFbits_t (discr : unsigned := 0) is record
      case discr is
         when 0 => anon8109 : aliased uu_TRISFbits_t_struct2376;  -- p32mx470f512.h:5698
         when 1 => anon8113 : aliased uu_TRISFbits_t_struct2377;  -- p32mx470f512.h:5701
         when others => null;
      end case;
   end record
     with Convention => C_Pass_By_Copy,
     Unchecked_Union => True;  -- p32mx470f512.h:5702

   TRISFbits : aliased uu_TRISFbits_t  -- p32mx470f512.h:5703
     with Import => True,
     Convention => C,
     External_Name => "TRISF";

   TRISFCLR : aliased unsigned  -- p32mx470f512.h:5704
     with Import => True,
     Convention => C,
     External_Name => "TRISFCLR";

   TRISFSET : aliased unsigned  -- p32mx470f512.h:5705
     with Import => True,
     Convention => C,
     External_Name => "TRISFSET";

   TRISFINV : aliased unsigned  -- p32mx470f512.h:5706
     with Import => True,
     Convention => C,
     External_Name => "TRISFINV";

   PORTF : aliased unsigned  -- p32mx470f512.h:5707
     with Import => True,
     Convention => C,
     External_Name => "PORTF";

   type uu_PORTFbits_t_struct2382 is record
      RF0      : Extensions.Unsigned_1;  -- p32mx470f512.h:5710
      RF1      : Extensions.Unsigned_1;  -- p32mx470f512.h:5711
      anon8124 : Extensions.Unsigned_1;  -- p32mx470f512.h:5712
      RF3      : Extensions.Unsigned_1;  -- p32mx470f512.h:5713
      RF4      : Extensions.Unsigned_1;  -- p32mx470f512.h:5714
      RF5      : Extensions.Unsigned_1;  -- p32mx470f512.h:5715
   end record
     with Convention => C_Pass_By_Copy,
     Pack => True,
     Alignment => 4;
   type uu_PORTFbits_t_struct2383 is record
      w : aliased unsigned;  -- p32mx470f512.h:5718
   end record
     with Convention => C_Pass_By_Copy;
   type uu_PORTFbits_t (discr : unsigned := 0) is record
      case discr is
         when 0 => anon8129 : aliased uu_PORTFbits_t_struct2382;  -- p32mx470f512.h:5716
         when 1 => anon8133 : aliased uu_PORTFbits_t_struct2383;  -- p32mx470f512.h:5719
         when others => null;
      end case;
   end record
     with Convention => C_Pass_By_Copy,
     Unchecked_Union => True;  -- p32mx470f512.h:5720

   PORTFbits : aliased uu_PORTFbits_t  -- p32mx470f512.h:5721
     with Import => True,
     Convention => C,
     External_Name => "PORTF";

   PORTFCLR : aliased unsigned  -- p32mx470f512.h:5722
     with Import => True,
     Convention => C,
     External_Name => "PORTFCLR";

   PORTFSET : aliased unsigned  -- p32mx470f512.h:5723
     with Import => True,
     Convention => C,
     External_Name => "PORTFSET";

   PORTFINV : aliased unsigned  -- p32mx470f512.h:5724
     with Import => True,
     Convention => C,
     External_Name => "PORTFINV";

   LATF : aliased unsigned  -- p32mx470f512.h:5725
     with Import => True,
     Convention => C,
     External_Name => "LATF";

   type uu_LATFbits_t_struct2388 is record
      LATF0    : Extensions.Unsigned_1;  -- p32mx470f512.h:5728
      LATF1    : Extensions.Unsigned_1;  -- p32mx470f512.h:5729
      anon8144 : Extensions.Unsigned_1;  -- p32mx470f512.h:5730
      LATF3    : Extensions.Unsigned_1;  -- p32mx470f512.h:5731
      LATF4    : Extensions.Unsigned_1;  -- p32mx470f512.h:5732
      LATF5    : Extensions.Unsigned_1;  -- p32mx470f512.h:5733
   end record
     with Convention => C_Pass_By_Copy,
     Pack => True,
     Alignment => 4;
   type uu_LATFbits_t_struct2389 is record
      w : aliased unsigned;  -- p32mx470f512.h:5736
   end record
     with Convention => C_Pass_By_Copy;
   type uu_LATFbits_t (discr : unsigned := 0) is record
      case discr is
         when 0 => anon8149 : aliased uu_LATFbits_t_struct2388;  -- p32mx470f512.h:5734
         when 1 => anon8153 : aliased uu_LATFbits_t_struct2389;  -- p32mx470f512.h:5737
         when others => null;
      end case;
   end record
     with Convention => C_Pass_By_Copy,
     Unchecked_Union => True;  -- p32mx470f512.h:5738

   LATFbits : aliased uu_LATFbits_t  -- p32mx470f512.h:5739
     with Import => True,
     Convention => C,
     External_Name => "LATF";

   LATFCLR : aliased unsigned  -- p32mx470f512.h:5740
     with Import => True,
     Convention => C,
     External_Name => "LATFCLR";

   LATFSET : aliased unsigned  -- p32mx470f512.h:5741
     with Import => True,
     Convention => C,
     External_Name => "LATFSET";

   LATFINV : aliased unsigned  -- p32mx470f512.h:5742
     with Import => True,
     Convention => C,
     External_Name => "LATFINV";

   ODCF : aliased unsigned  -- p32mx470f512.h:5743
     with Import => True,
     Convention => C,
     External_Name => "ODCF";

   type uu_ODCFbits_t_struct2394 is record
      ODCF0    : Extensions.Unsigned_1;  -- p32mx470f512.h:5746
      ODCF1    : Extensions.Unsigned_1;  -- p32mx470f512.h:5747
      anon8164 : Extensions.Unsigned_1;  -- p32mx470f512.h:5748
      ODCF3    : Extensions.Unsigned_1;  -- p32mx470f512.h:5749
      ODCF4    : Extensions.Unsigned_1;  -- p32mx470f512.h:5750
      ODCF5    : Extensions.Unsigned_1;  -- p32mx470f512.h:5751
   end record
     with Convention => C_Pass_By_Copy,
     Pack => True,
     Alignment => 4;
   type uu_ODCFbits_t_struct2395 is record
      w : aliased unsigned;  -- p32mx470f512.h:5754
   end record
     with Convention => C_Pass_By_Copy;
   type uu_ODCFbits_t (discr : unsigned := 0) is record
      case discr is
         when 0 => anon8169 : aliased uu_ODCFbits_t_struct2394;  -- p32mx470f512.h:5752
         when 1 => anon8173 : aliased uu_ODCFbits_t_struct2395;  -- p32mx470f512.h:5755
         when others => null;
      end case;
   end record
     with Convention => C_Pass_By_Copy,
     Unchecked_Union => True;  -- p32mx470f512.h:5756

   ODCFbits : aliased uu_ODCFbits_t  -- p32mx470f512.h:5757
     with Import => True,
     Convention => C,
     External_Name => "ODCF";

   ODCFCLR : aliased unsigned  -- p32mx470f512.h:5758
     with Import => True,
     Convention => C,
     External_Name => "ODCFCLR";

   ODCFSET : aliased unsigned  -- p32mx470f512.h:5759
     with Import => True,
     Convention => C,
     External_Name => "ODCFSET";

   ODCFINV : aliased unsigned  -- p32mx470f512.h:5760
     with Import => True,
     Convention => C,
     External_Name => "ODCFINV";

   CNPUF : aliased unsigned  -- p32mx470f512.h:5761
     with Import => True,
     Convention => C,
     External_Name => "CNPUF";

   type uu_CNPUFbits_t_struct2400 is record
      CNPUF0   : Extensions.Unsigned_1;  -- p32mx470f512.h:5764
      CNPUF1   : Extensions.Unsigned_1;  -- p32mx470f512.h:5765
      anon8184 : Extensions.Unsigned_1;  -- p32mx470f512.h:5766
      CNPUF3   : Extensions.Unsigned_1;  -- p32mx470f512.h:5767
      CNPUF4   : Extensions.Unsigned_1;  -- p32mx470f512.h:5768
      CNPUF5   : Extensions.Unsigned_1;  -- p32mx470f512.h:5769
   end record
     with Convention => C_Pass_By_Copy,
     Pack => True,
     Alignment => 4;
   type uu_CNPUFbits_t_struct2401 is record
      w : aliased unsigned;  -- p32mx470f512.h:5772
   end record
     with Convention => C_Pass_By_Copy;
   type uu_CNPUFbits_t (discr : unsigned := 0) is record
      case discr is
         when 0 => anon8189 : aliased uu_CNPUFbits_t_struct2400;  -- p32mx470f512.h:5770
         when 1 => anon8193 : aliased uu_CNPUFbits_t_struct2401;  -- p32mx470f512.h:5773
         when others => null;
      end case;
   end record
     with Convention => C_Pass_By_Copy,
     Unchecked_Union => True;  -- p32mx470f512.h:5774

   CNPUFbits : aliased uu_CNPUFbits_t  -- p32mx470f512.h:5775
     with Import => True,
     Convention => C,
     External_Name => "CNPUF";

   CNPUFCLR : aliased unsigned  -- p32mx470f512.h:5776
     with Import => True,
     Convention => C,
     External_Name => "CNPUFCLR";

   CNPUFSET : aliased unsigned  -- p32mx470f512.h:5777
     with Import => True,
     Convention => C,
     External_Name => "CNPUFSET";

   CNPUFINV : aliased unsigned  -- p32mx470f512.h:5778
     with Import => True,
     Convention => C,
     External_Name => "CNPUFINV";

   CNPDF : aliased unsigned  -- p32mx470f512.h:5779
     with Import => True,
     Convention => C,
     External_Name => "CNPDF";

   type uu_CNPDFbits_t_struct2406 is record
      CNPDF0   : Extensions.Unsigned_1;  -- p32mx470f512.h:5782
      CNPDF1   : Extensions.Unsigned_1;  -- p32mx470f512.h:5783
      anon8204 : Extensions.Unsigned_1;  -- p32mx470f512.h:5784
      CNPDF3   : Extensions.Unsigned_1;  -- p32mx470f512.h:5785
      CNPDF4   : Extensions.Unsigned_1;  -- p32mx470f512.h:5786
      CNPDF5   : Extensions.Unsigned_1;  -- p32mx470f512.h:5787
   end record
     with Convention => C_Pass_By_Copy,
     Pack => True,
     Alignment => 4;
   type uu_CNPDFbits_t_struct2407 is record
      w : aliased unsigned;  -- p32mx470f512.h:5790
   end record
     with Convention => C_Pass_By_Copy;
   type uu_CNPDFbits_t (discr : unsigned := 0) is record
      case discr is
         when 0 => anon8209 : aliased uu_CNPDFbits_t_struct2406;  -- p32mx470f512.h:5788
         when 1 => anon8213 : aliased uu_CNPDFbits_t_struct2407;  -- p32mx470f512.h:5791
         when others => null;
      end case;
   end record
     with Convention => C_Pass_By_Copy,
     Unchecked_Union => True;  -- p32mx470f512.h:5792

   CNPDFbits : aliased uu_CNPDFbits_t  -- p32mx470f512.h:5793
     with Import => True,
     Convention => C,
     External_Name => "CNPDF";

   CNPDFCLR : aliased unsigned  -- p32mx470f512.h:5794
     with Import => True,
     Convention => C,
     External_Name => "CNPDFCLR";

   CNPDFSET : aliased unsigned  -- p32mx470f512.h:5795
     with Import => True,
     Convention => C,
     External_Name => "CNPDFSET";

   CNPDFINV : aliased unsigned  -- p32mx470f512.h:5796
     with Import => True,
     Convention => C,
     External_Name => "CNPDFINV";

   CNCONF : aliased unsigned  -- p32mx470f512.h:5797
     with Import => True,
     Convention => C,
     External_Name => "CNCONF";

   type uu_CNCONFbits_t_struct2412 is record
      anon8222 : Extensions.Unsigned_13;  -- p32mx470f512.h:5800
      SIDL     : Extensions.Unsigned_1;  -- p32mx470f512.h:5801
      anon8224 : Extensions.Unsigned_1;  -- p32mx470f512.h:5802
      ON       : Extensions.Unsigned_1;  -- p32mx470f512.h:5803
   end record
     with Convention => C_Pass_By_Copy,
     Pack => True,
     Alignment => 4;
   type uu_CNCONFbits_t_struct2413 is record
      w : aliased unsigned;  -- p32mx470f512.h:5806
   end record
     with Convention => C_Pass_By_Copy;
   type uu_CNCONFbits_t (discr : unsigned := 0) is record
      case discr is
         when 0 => anon8227 : aliased uu_CNCONFbits_t_struct2412;  -- p32mx470f512.h:5804
         when 1 => anon8231 : aliased uu_CNCONFbits_t_struct2413;  -- p32mx470f512.h:5807
         when others => null;
      end case;
   end record
     with Convention => C_Pass_By_Copy,
     Unchecked_Union => True;  -- p32mx470f512.h:5808

   CNCONFbits : aliased uu_CNCONFbits_t  -- p32mx470f512.h:5809
     with Import => True,
     Convention => C,
     External_Name => "CNCONF";

   CNCONFCLR : aliased unsigned  -- p32mx470f512.h:5810
     with Import => True,
     Convention => C,
     External_Name => "CNCONFCLR";

   CNCONFSET : aliased unsigned  -- p32mx470f512.h:5811
     with Import => True,
     Convention => C,
     External_Name => "CNCONFSET";

   CNCONFINV : aliased unsigned  -- p32mx470f512.h:5812
     with Import => True,
     Convention => C,
     External_Name => "CNCONFINV";

   CNENF : aliased unsigned  -- p32mx470f512.h:5813
     with Import => True,
     Convention => C,
     External_Name => "CNENF";

   type uu_CNENFbits_t_struct2418 is record
      CNIEF0   : Extensions.Unsigned_1;  -- p32mx470f512.h:5816
      CNIEF1   : Extensions.Unsigned_1;  -- p32mx470f512.h:5817
      anon8242 : Extensions.Unsigned_1;  -- p32mx470f512.h:5818
      CNIEF3   : Extensions.Unsigned_1;  -- p32mx470f512.h:5819
      CNIEF4   : Extensions.Unsigned_1;  -- p32mx470f512.h:5820
      CNIEF5   : Extensions.Unsigned_1;  -- p32mx470f512.h:5821
   end record
     with Convention => C_Pass_By_Copy,
     Pack => True,
     Alignment => 4;
   type uu_CNENFbits_t_struct2419 is record
      w : aliased unsigned;  -- p32mx470f512.h:5824
   end record
     with Convention => C_Pass_By_Copy;
   type uu_CNENFbits_t (discr : unsigned := 0) is record
      case discr is
         when 0 => anon8247 : aliased uu_CNENFbits_t_struct2418;  -- p32mx470f512.h:5822
         when 1 => anon8251 : aliased uu_CNENFbits_t_struct2419;  -- p32mx470f512.h:5825
         when others => null;
      end case;
   end record
     with Convention => C_Pass_By_Copy,
     Unchecked_Union => True;  -- p32mx470f512.h:5826

   CNENFbits : aliased uu_CNENFbits_t  -- p32mx470f512.h:5827
     with Import => True,
     Convention => C,
     External_Name => "CNENF";

   CNENFCLR : aliased unsigned  -- p32mx470f512.h:5828
     with Import => True,
     Convention => C,
     External_Name => "CNENFCLR";

   CNENFSET : aliased unsigned  -- p32mx470f512.h:5829
     with Import => True,
     Convention => C,
     External_Name => "CNENFSET";

   CNENFINV : aliased unsigned  -- p32mx470f512.h:5830
     with Import => True,
     Convention => C,
     External_Name => "CNENFINV";

   CNSTATF : aliased unsigned  -- p32mx470f512.h:5831
     with Import => True,
     Convention => C,
     External_Name => "CNSTATF";

   type uu_CNSTATFbits_t_struct2424 is record
      CNSTATF0 : Extensions.Unsigned_1;  -- p32mx470f512.h:5834
      CNSTATF1 : Extensions.Unsigned_1;  -- p32mx470f512.h:5835
      anon8262 : Extensions.Unsigned_1;  -- p32mx470f512.h:5836
      CNSTATF3 : Extensions.Unsigned_1;  -- p32mx470f512.h:5837
      CNSTATF4 : Extensions.Unsigned_1;  -- p32mx470f512.h:5838
      CNSTATF5 : Extensions.Unsigned_1;  -- p32mx470f512.h:5839
   end record
     with Convention => C_Pass_By_Copy,
     Pack => True,
     Alignment => 4;
   type uu_CNSTATFbits_t_struct2425 is record
      w : aliased unsigned;  -- p32mx470f512.h:5842
   end record
     with Convention => C_Pass_By_Copy;
   type uu_CNSTATFbits_t (discr : unsigned := 0) is record
      case discr is
         when 0 => anon8267 : aliased uu_CNSTATFbits_t_struct2424;  -- p32mx470f512.h:5840
         when 1 => anon8271 : aliased uu_CNSTATFbits_t_struct2425;  -- p32mx470f512.h:5843
         when others => null;
      end case;
   end record
     with Convention => C_Pass_By_Copy,
     Unchecked_Union => True;  -- p32mx470f512.h:5844

   CNSTATFbits : aliased uu_CNSTATFbits_t  -- p32mx470f512.h:5845
     with Import => True,
     Convention => C,
     External_Name => "CNSTATF";

   CNSTATFCLR : aliased unsigned  -- p32mx470f512.h:5846
     with Import => True,
     Convention => C,
     External_Name => "CNSTATFCLR";

   CNSTATFSET : aliased unsigned  -- p32mx470f512.h:5847
     with Import => True,
     Convention => C,
     External_Name => "CNSTATFSET";

   CNSTATFINV : aliased unsigned  -- p32mx470f512.h:5848
     with Import => True,
     Convention => C,
     External_Name => "CNSTATFINV";

   ANSELG : aliased unsigned  -- p32mx470f512.h:5849
     with Import => True,
     Convention => C,
     External_Name => "ANSELG";

   type uu_ANSELGbits_t_struct2430 is record
      anon8280 : Extensions.Unsigned_6;  -- p32mx470f512.h:5852
      ANSG6    : Extensions.Unsigned_1;  -- p32mx470f512.h:5853
      ANSG7    : Extensions.Unsigned_1;  -- p32mx470f512.h:5854
      ANSG8    : Extensions.Unsigned_1;  -- p32mx470f512.h:5855
      ANSG9    : Extensions.Unsigned_1;  -- p32mx470f512.h:5856
   end record
     with Convention => C_Pass_By_Copy,
     Pack => True,
     Alignment => 4;
   type uu_ANSELGbits_t_struct2431 is record
      w : aliased unsigned;  -- p32mx470f512.h:5859
   end record
     with Convention => C_Pass_By_Copy;
   type uu_ANSELGbits_t (discr : unsigned := 0) is record
      case discr is
         when 0 => anon8286 : aliased uu_ANSELGbits_t_struct2430;  -- p32mx470f512.h:5857
         when 1 => anon8290 : aliased uu_ANSELGbits_t_struct2431;  -- p32mx470f512.h:5860
         when others => null;
      end case;
   end record
     with Convention => C_Pass_By_Copy,
     Unchecked_Union => True;  -- p32mx470f512.h:5861

   ANSELGbits : aliased uu_ANSELGbits_t  -- p32mx470f512.h:5862
     with Import => True,
     Convention => C,
     External_Name => "ANSELG";

   ANSELGCLR : aliased unsigned  -- p32mx470f512.h:5863
     with Import => True,
     Convention => C,
     External_Name => "ANSELGCLR";

   ANSELGSET : aliased unsigned  -- p32mx470f512.h:5864
     with Import => True,
     Convention => C,
     External_Name => "ANSELGSET";

   ANSELGINV : aliased unsigned  -- p32mx470f512.h:5865
     with Import => True,
     Convention => C,
     External_Name => "ANSELGINV";

   TRISG : aliased unsigned  -- p32mx470f512.h:5866
     with Import => True,
     Convention => C,
     External_Name => "TRISG";

   type uu_TRISGbits_t_struct2436 is record
      anon8299 : Extensions.Unsigned_2;  -- p32mx470f512.h:5869
      TRISG2   : Extensions.Unsigned_1;  -- p32mx470f512.h:5870
      TRISG3   : Extensions.Unsigned_1;  -- p32mx470f512.h:5871
      anon8302 : Extensions.Unsigned_2;  -- p32mx470f512.h:5872
      TRISG6   : Extensions.Unsigned_1;  -- p32mx470f512.h:5873
      TRISG7   : Extensions.Unsigned_1;  -- p32mx470f512.h:5874
      TRISG8   : Extensions.Unsigned_1;  -- p32mx470f512.h:5875
      TRISG9   : Extensions.Unsigned_1;  -- p32mx470f512.h:5876
   end record
     with Convention => C_Pass_By_Copy,
     Pack => True,
     Alignment => 4;
   type uu_TRISGbits_t_struct2437 is record
      w : aliased unsigned;  -- p32mx470f512.h:5879
   end record
     with Convention => C_Pass_By_Copy;
   type uu_TRISGbits_t (discr : unsigned := 0) is record
      case discr is
         when 0 => anon8308 : aliased uu_TRISGbits_t_struct2436;  -- p32mx470f512.h:5877
         when 1 => anon8312 : aliased uu_TRISGbits_t_struct2437;  -- p32mx470f512.h:5880
         when others => null;
      end case;
   end record
     with Convention => C_Pass_By_Copy,
     Unchecked_Union => True;  -- p32mx470f512.h:5881

   TRISGbits : aliased uu_TRISGbits_t  -- p32mx470f512.h:5882
     with Import => True,
     Convention => C,
     External_Name => "TRISG";

   TRISGCLR : aliased unsigned  -- p32mx470f512.h:5883
     with Import => True,
     Convention => C,
     External_Name => "TRISGCLR";

   TRISGSET : aliased unsigned  -- p32mx470f512.h:5884
     with Import => True,
     Convention => C,
     External_Name => "TRISGSET";

   TRISGINV : aliased unsigned  -- p32mx470f512.h:5885
     with Import => True,
     Convention => C,
     External_Name => "TRISGINV";

   PORTG : aliased unsigned  -- p32mx470f512.h:5886
     with Import => True,
     Convention => C,
     External_Name => "PORTG";

   type uu_PORTGbits_t_struct2442 is record
      anon8321 : Extensions.Unsigned_2;  -- p32mx470f512.h:5889
      RG2      : Extensions.Unsigned_1;  -- p32mx470f512.h:5890
      RG3      : Extensions.Unsigned_1;  -- p32mx470f512.h:5891
      anon8324 : Extensions.Unsigned_2;  -- p32mx470f512.h:5892
      RG6      : Extensions.Unsigned_1;  -- p32mx470f512.h:5893
      RG7      : Extensions.Unsigned_1;  -- p32mx470f512.h:5894
      RG8      : Extensions.Unsigned_1;  -- p32mx470f512.h:5895
      RG9      : Extensions.Unsigned_1;  -- p32mx470f512.h:5896
   end record
     with Convention => C_Pass_By_Copy,
     Pack => True,
     Alignment => 4;
   type uu_PORTGbits_t_struct2443 is record
      w : aliased unsigned;  -- p32mx470f512.h:5899
   end record
     with Convention => C_Pass_By_Copy;
   type uu_PORTGbits_t (discr : unsigned := 0) is record
      case discr is
         when 0 => anon8330 : aliased uu_PORTGbits_t_struct2442;  -- p32mx470f512.h:5897
         when 1 => anon8334 : aliased uu_PORTGbits_t_struct2443;  -- p32mx470f512.h:5900
         when others => null;
      end case;
   end record
     with Convention => C_Pass_By_Copy,
     Unchecked_Union => True;  -- p32mx470f512.h:5901

   PORTGbits : aliased uu_PORTGbits_t  -- p32mx470f512.h:5902
     with Import => True,
     Convention => C,
     External_Name => "PORTG";

   PORTGCLR : aliased unsigned  -- p32mx470f512.h:5903
     with Import => True,
     Convention => C,
     External_Name => "PORTGCLR";

   PORTGSET : aliased unsigned  -- p32mx470f512.h:5904
     with Import => True,
     Convention => C,
     External_Name => "PORTGSET";

   PORTGINV : aliased unsigned  -- p32mx470f512.h:5905
     with Import => True,
     Convention => C,
     External_Name => "PORTGINV";

   LATG : aliased unsigned  -- p32mx470f512.h:5906
     with Import => True,
     Convention => C,
     External_Name => "LATG";

   type uu_LATGbits_t_struct2448 is record
      anon8343 : Extensions.Unsigned_2;  -- p32mx470f512.h:5909
      LATG2    : Extensions.Unsigned_1;  -- p32mx470f512.h:5910
      LATG3    : Extensions.Unsigned_1;  -- p32mx470f512.h:5911
      anon8346 : Extensions.Unsigned_2;  -- p32mx470f512.h:5912
      LATG6    : Extensions.Unsigned_1;  -- p32mx470f512.h:5913
      LATG7    : Extensions.Unsigned_1;  -- p32mx470f512.h:5914
      LATG8    : Extensions.Unsigned_1;  -- p32mx470f512.h:5915
      LATG9    : Extensions.Unsigned_1;  -- p32mx470f512.h:5916
   end record
     with Convention => C_Pass_By_Copy,
     Pack => True,
     Alignment => 4;
   type uu_LATGbits_t_struct2449 is record
      w : aliased unsigned;  -- p32mx470f512.h:5919
   end record
     with Convention => C_Pass_By_Copy;
   type uu_LATGbits_t (discr : unsigned := 0) is record
      case discr is
         when 0 => anon8352 : aliased uu_LATGbits_t_struct2448;  -- p32mx470f512.h:5917
         when 1 => anon8356 : aliased uu_LATGbits_t_struct2449;  -- p32mx470f512.h:5920
         when others => null;
      end case;
   end record
     with Convention => C_Pass_By_Copy,
     Unchecked_Union => True;  -- p32mx470f512.h:5921

   LATGbits : aliased uu_LATGbits_t  -- p32mx470f512.h:5922
     with Import => True,
     Convention => C,
     External_Name => "LATG";

   LATGCLR : aliased unsigned  -- p32mx470f512.h:5923
     with Import => True,
     Convention => C,
     External_Name => "LATGCLR";

   LATGSET : aliased unsigned  -- p32mx470f512.h:5924
     with Import => True,
     Convention => C,
     External_Name => "LATGSET";

   LATGINV : aliased unsigned  -- p32mx470f512.h:5925
     with Import => True,
     Convention => C,
     External_Name => "LATGINV";

   ODCG : aliased unsigned  -- p32mx470f512.h:5926
     with Import => True,
     Convention => C,
     External_Name => "ODCG";

   type uu_ODCGbits_t_struct2454 is record
      anon8365 : Extensions.Unsigned_2;  -- p32mx470f512.h:5929
      ODCG2    : Extensions.Unsigned_1;  -- p32mx470f512.h:5930
      ODCG3    : Extensions.Unsigned_1;  -- p32mx470f512.h:5931
      anon8368 : Extensions.Unsigned_2;  -- p32mx470f512.h:5932
      ODCG6    : Extensions.Unsigned_1;  -- p32mx470f512.h:5933
      ODCG7    : Extensions.Unsigned_1;  -- p32mx470f512.h:5934
      ODCG8    : Extensions.Unsigned_1;  -- p32mx470f512.h:5935
      ODCG9    : Extensions.Unsigned_1;  -- p32mx470f512.h:5936
   end record
     with Convention => C_Pass_By_Copy,
     Pack => True,
     Alignment => 4;
   type uu_ODCGbits_t_struct2455 is record
      w : aliased unsigned;  -- p32mx470f512.h:5939
   end record
     with Convention => C_Pass_By_Copy;
   type uu_ODCGbits_t (discr : unsigned := 0) is record
      case discr is
         when 0 => anon8374 : aliased uu_ODCGbits_t_struct2454;  -- p32mx470f512.h:5937
         when 1 => anon8378 : aliased uu_ODCGbits_t_struct2455;  -- p32mx470f512.h:5940
         when others => null;
      end case;
   end record
     with Convention => C_Pass_By_Copy,
     Unchecked_Union => True;  -- p32mx470f512.h:5941

   ODCGbits : aliased uu_ODCGbits_t  -- p32mx470f512.h:5942
     with Import => True,
     Convention => C,
     External_Name => "ODCG";

   ODCGCLR : aliased unsigned  -- p32mx470f512.h:5943
     with Import => True,
     Convention => C,
     External_Name => "ODCGCLR";

   ODCGSET : aliased unsigned  -- p32mx470f512.h:5944
     with Import => True,
     Convention => C,
     External_Name => "ODCGSET";

   ODCGINV : aliased unsigned  -- p32mx470f512.h:5945
     with Import => True,
     Convention => C,
     External_Name => "ODCGINV";

   CNPUG : aliased unsigned  -- p32mx470f512.h:5946
     with Import => True,
     Convention => C,
     External_Name => "CNPUG";

   type uu_CNPUGbits_t_struct2460 is record
      anon8387 : Extensions.Unsigned_2;  -- p32mx470f512.h:5949
      CNPUG2   : Extensions.Unsigned_1;  -- p32mx470f512.h:5950
      CNPUG3   : Extensions.Unsigned_1;  -- p32mx470f512.h:5951
      anon8390 : Extensions.Unsigned_2;  -- p32mx470f512.h:5952
      CNPUG6   : Extensions.Unsigned_1;  -- p32mx470f512.h:5953
      CNPUG7   : Extensions.Unsigned_1;  -- p32mx470f512.h:5954
      CNPUG8   : Extensions.Unsigned_1;  -- p32mx470f512.h:5955
      CNPUG9   : Extensions.Unsigned_1;  -- p32mx470f512.h:5956
   end record
     with Convention => C_Pass_By_Copy,
     Pack => True,
     Alignment => 4;
   type uu_CNPUGbits_t_struct2461 is record
      w : aliased unsigned;  -- p32mx470f512.h:5959
   end record
     with Convention => C_Pass_By_Copy;
   type uu_CNPUGbits_t (discr : unsigned := 0) is record
      case discr is
         when 0 => anon8396 : aliased uu_CNPUGbits_t_struct2460;  -- p32mx470f512.h:5957
         when 1 => anon8400 : aliased uu_CNPUGbits_t_struct2461;  -- p32mx470f512.h:5960
         when others => null;
      end case;
   end record
     with Convention => C_Pass_By_Copy,
     Unchecked_Union => True;  -- p32mx470f512.h:5961

   CNPUGbits : aliased uu_CNPUGbits_t  -- p32mx470f512.h:5962
     with Import => True,
     Convention => C,
     External_Name => "CNPUG";

   CNPUGCLR : aliased unsigned  -- p32mx470f512.h:5963
     with Import => True,
     Convention => C,
     External_Name => "CNPUGCLR";

   CNPUGSET : aliased unsigned  -- p32mx470f512.h:5964
     with Import => True,
     Convention => C,
     External_Name => "CNPUGSET";

   CNPUGINV : aliased unsigned  -- p32mx470f512.h:5965
     with Import => True,
     Convention => C,
     External_Name => "CNPUGINV";

   CNPDG : aliased unsigned  -- p32mx470f512.h:5966
     with Import => True,
     Convention => C,
     External_Name => "CNPDG";

   type uu_CNPDGbits_t_struct2466 is record
      anon8409 : Extensions.Unsigned_2;  -- p32mx470f512.h:5969
      CNPDG2   : Extensions.Unsigned_1;  -- p32mx470f512.h:5970
      CNPDG3   : Extensions.Unsigned_1;  -- p32mx470f512.h:5971
      anon8412 : Extensions.Unsigned_2;  -- p32mx470f512.h:5972
      CNPDG6   : Extensions.Unsigned_1;  -- p32mx470f512.h:5973
      CNPDG7   : Extensions.Unsigned_1;  -- p32mx470f512.h:5974
      CNPDG8   : Extensions.Unsigned_1;  -- p32mx470f512.h:5975
      CNPDG9   : Extensions.Unsigned_1;  -- p32mx470f512.h:5976
   end record
     with Convention => C_Pass_By_Copy,
     Pack => True,
     Alignment => 4;
   type uu_CNPDGbits_t_struct2467 is record
      w : aliased unsigned;  -- p32mx470f512.h:5979
   end record
     with Convention => C_Pass_By_Copy;
   type uu_CNPDGbits_t (discr : unsigned := 0) is record
      case discr is
         when 0 => anon8418 : aliased uu_CNPDGbits_t_struct2466;  -- p32mx470f512.h:5977
         when 1 => anon8422 : aliased uu_CNPDGbits_t_struct2467;  -- p32mx470f512.h:5980
         when others => null;
      end case;
   end record
     with Convention => C_Pass_By_Copy,
     Unchecked_Union => True;  -- p32mx470f512.h:5981

   CNPDGbits : aliased uu_CNPDGbits_t  -- p32mx470f512.h:5982
     with Import => True,
     Convention => C,
     External_Name => "CNPDG";

   CNPDGCLR : aliased unsigned  -- p32mx470f512.h:5983
     with Import => True,
     Convention => C,
     External_Name => "CNPDGCLR";

   CNPDGSET : aliased unsigned  -- p32mx470f512.h:5984
     with Import => True,
     Convention => C,
     External_Name => "CNPDGSET";

   CNPDGINV : aliased unsigned  -- p32mx470f512.h:5985
     with Import => True,
     Convention => C,
     External_Name => "CNPDGINV";

   CNCONG : aliased unsigned  -- p32mx470f512.h:5986
     with Import => True,
     Convention => C,
     External_Name => "CNCONG";

   type uu_CNCONGbits_t_struct2472 is record
      anon8431 : Extensions.Unsigned_13;  -- p32mx470f512.h:5989
      SIDL     : Extensions.Unsigned_1;  -- p32mx470f512.h:5990
      anon8433 : Extensions.Unsigned_1;  -- p32mx470f512.h:5991
      ON       : Extensions.Unsigned_1;  -- p32mx470f512.h:5992
   end record
     with Convention => C_Pass_By_Copy,
     Pack => True,
     Alignment => 4;
   type uu_CNCONGbits_t_struct2473 is record
      w : aliased unsigned;  -- p32mx470f512.h:5995
   end record
     with Convention => C_Pass_By_Copy;
   type uu_CNCONGbits_t (discr : unsigned := 0) is record
      case discr is
         when 0 => anon8436 : aliased uu_CNCONGbits_t_struct2472;  -- p32mx470f512.h:5993
         when 1 => anon8440 : aliased uu_CNCONGbits_t_struct2473;  -- p32mx470f512.h:5996
         when others => null;
      end case;
   end record
     with Convention => C_Pass_By_Copy,
     Unchecked_Union => True;  -- p32mx470f512.h:5997

   CNCONGbits : aliased uu_CNCONGbits_t  -- p32mx470f512.h:5998
     with Import => True,
     Convention => C,
     External_Name => "CNCONG";

   CNCONGCLR : aliased unsigned  -- p32mx470f512.h:5999
     with Import => True,
     Convention => C,
     External_Name => "CNCONGCLR";

   CNCONGSET : aliased unsigned  -- p32mx470f512.h:6000
     with Import => True,
     Convention => C,
     External_Name => "CNCONGSET";

   CNCONGINV : aliased unsigned  -- p32mx470f512.h:6001
     with Import => True,
     Convention => C,
     External_Name => "CNCONGINV";

   CNENG : aliased unsigned  -- p32mx470f512.h:6002
     with Import => True,
     Convention => C,
     External_Name => "CNENG";

   type uu_CNENGbits_t_struct2478 is record
      anon8449 : Extensions.Unsigned_2;  -- p32mx470f512.h:6005
      CNIEG2   : Extensions.Unsigned_1;  -- p32mx470f512.h:6006
      CNIEG3   : Extensions.Unsigned_1;  -- p32mx470f512.h:6007
      anon8452 : Extensions.Unsigned_2;  -- p32mx470f512.h:6008
      CNIEG6   : Extensions.Unsigned_1;  -- p32mx470f512.h:6009
      CNIEG7   : Extensions.Unsigned_1;  -- p32mx470f512.h:6010
      CNIEG8   : Extensions.Unsigned_1;  -- p32mx470f512.h:6011
      CNIEG9   : Extensions.Unsigned_1;  -- p32mx470f512.h:6012
   end record
     with Convention => C_Pass_By_Copy,
     Pack => True,
     Alignment => 4;
   type uu_CNENGbits_t_struct2479 is record
      w : aliased unsigned;  -- p32mx470f512.h:6015
   end record
     with Convention => C_Pass_By_Copy;
   type uu_CNENGbits_t (discr : unsigned := 0) is record
      case discr is
         when 0 => anon8458 : aliased uu_CNENGbits_t_struct2478;  -- p32mx470f512.h:6013
         when 1 => anon8462 : aliased uu_CNENGbits_t_struct2479;  -- p32mx470f512.h:6016
         when others => null;
      end case;
   end record
     with Convention => C_Pass_By_Copy,
     Unchecked_Union => True;  -- p32mx470f512.h:6017

   CNENGbits : aliased uu_CNENGbits_t  -- p32mx470f512.h:6018
     with Import => True,
     Convention => C,
     External_Name => "CNENG";

   CNENGCLR : aliased unsigned  -- p32mx470f512.h:6019
     with Import => True,
     Convention => C,
     External_Name => "CNENGCLR";

   CNENGSET : aliased unsigned  -- p32mx470f512.h:6020
     with Import => True,
     Convention => C,
     External_Name => "CNENGSET";

   CNENGINV : aliased unsigned  -- p32mx470f512.h:6021
     with Import => True,
     Convention => C,
     External_Name => "CNENGINV";

   CNSTATG : aliased unsigned  -- p32mx470f512.h:6022
     with Import => True,
     Convention => C,
     External_Name => "CNSTATG";

   type uu_CNSTATGbits_t_struct2484 is record
      anon8471 : Extensions.Unsigned_2;  -- p32mx470f512.h:6025
      CNSTATG2 : Extensions.Unsigned_1;  -- p32mx470f512.h:6026
      CNSTATG3 : Extensions.Unsigned_1;  -- p32mx470f512.h:6027
      anon8474 : Extensions.Unsigned_2;  -- p32mx470f512.h:6028
      CNSTATG6 : Extensions.Unsigned_1;  -- p32mx470f512.h:6029
      CNSTATG7 : Extensions.Unsigned_1;  -- p32mx470f512.h:6030
      CNSTATG8 : Extensions.Unsigned_1;  -- p32mx470f512.h:6031
      CNSTATG9 : Extensions.Unsigned_1;  -- p32mx470f512.h:6032
   end record
     with Convention => C_Pass_By_Copy,
     Pack => True,
     Alignment => 4;
   type uu_CNSTATGbits_t_struct2485 is record
      w : aliased unsigned;  -- p32mx470f512.h:6035
   end record
     with Convention => C_Pass_By_Copy;
   type uu_CNSTATGbits_t (discr : unsigned := 0) is record
      case discr is
         when 0 => anon8480 : aliased uu_CNSTATGbits_t_struct2484;  -- p32mx470f512.h:6033
         when 1 => anon8484 : aliased uu_CNSTATGbits_t_struct2485;  -- p32mx470f512.h:6036
         when others => null;
      end case;
   end record
     with Convention => C_Pass_By_Copy,
     Unchecked_Union => True;  -- p32mx470f512.h:6037

   CNSTATGbits : aliased uu_CNSTATGbits_t  -- p32mx470f512.h:6038
     with Import => True,
     Convention => C,
     External_Name => "CNSTATG";

   CNSTATGCLR : aliased unsigned  -- p32mx470f512.h:6039
     with Import => True,
     Convention => C,
     External_Name => "CNSTATGCLR";

   CNSTATGSET : aliased unsigned  -- p32mx470f512.h:6040
     with Import => True,
     Convention => C,
     External_Name => "CNSTATGSET";

   CNSTATGINV : aliased unsigned  -- p32mx470f512.h:6041
     with Import => True,
     Convention => C,
     External_Name => "CNSTATGINV";

   DEVCFG3 : aliased unsigned  -- p32mx470f512.h:6042
     with Import => True,
     Convention => C,
     External_Name => "DEVCFG3";

   type uu_DEVCFG3bits_t_struct2490 is record
      USERID    : aliased unsigned_short;  -- p32mx470f512.h:6045
      FSRSSEL   : Extensions.Unsigned_3;  -- p32mx470f512.h:6046
      anon8495  : Extensions.Unsigned_9;  -- p32mx470f512.h:6047
      PMDL1WAY  : Extensions.Unsigned_1;  -- p32mx470f512.h:6048
      IOL1WAY   : Extensions.Unsigned_1;  -- p32mx470f512.h:6049
      FUSBIDIO  : Extensions.Unsigned_1;  -- p32mx470f512.h:6050
      FVBUSONIO : Extensions.Unsigned_1;  -- p32mx470f512.h:6051
   end record
     with Convention => C_Pass_By_Copy,
     Pack => True,
     Alignment => 4;
   type uu_DEVCFG3bits_t_struct2491 is record
      w : aliased unsigned;  -- p32mx470f512.h:6054
   end record
     with Convention => C_Pass_By_Copy;
   type uu_DEVCFG3bits_t (discr : unsigned := 0) is record
      case discr is
         when 0 => anon8501 : aliased uu_DEVCFG3bits_t_struct2490;  -- p32mx470f512.h:6052
         when 1 => anon8505 : aliased uu_DEVCFG3bits_t_struct2491;  -- p32mx470f512.h:6055
         when others => null;
      end case;
   end record
     with Convention => C_Pass_By_Copy,
     Unchecked_Union => True;  -- p32mx470f512.h:6056

   DEVCFG3bits : aliased uu_DEVCFG3bits_t  -- p32mx470f512.h:6057
     with Import => True,
     Convention => C,
     External_Name => "DEVCFG3";

   DEVCFG2 : aliased unsigned  -- p32mx470f512.h:6058
     with Import => True,
     Convention => C,
     External_Name => "DEVCFG2";

   type uu_DEVCFG2bits_t_struct2496 is record
      FPLLIDIV : Extensions.Unsigned_3;  -- p32mx470f512.h:6061
      anon8512 : Extensions.Unsigned_1;  -- p32mx470f512.h:6062
      FPLLMUL  : Extensions.Unsigned_3;  -- p32mx470f512.h:6063
      anon8514 : Extensions.Unsigned_1;  -- p32mx470f512.h:6064
      UPLLIDIV : Extensions.Unsigned_3;  -- p32mx470f512.h:6065
      anon8516 : Extensions.Unsigned_4;  -- p32mx470f512.h:6066
      UPLLEN   : Extensions.Unsigned_1;  -- p32mx470f512.h:6067
      FPLLODIV : Extensions.Unsigned_3;  -- p32mx470f512.h:6068
   end record
     with Convention => C_Pass_By_Copy,
     Pack => True,
     Alignment => 4;
   type uu_DEVCFG2bits_t_struct2497 is record
      w : aliased unsigned;  -- p32mx470f512.h:6071
   end record
     with Convention => C_Pass_By_Copy;
   type uu_DEVCFG2bits_t (discr : unsigned := 0) is record
      case discr is
         when 0 => anon8520 : aliased uu_DEVCFG2bits_t_struct2496;  -- p32mx470f512.h:6069
         when 1 => anon8524 : aliased uu_DEVCFG2bits_t_struct2497;  -- p32mx470f512.h:6072
         when others => null;
      end case;
   end record
     with Convention => C_Pass_By_Copy,
     Unchecked_Union => True;  -- p32mx470f512.h:6073

   DEVCFG2bits : aliased uu_DEVCFG2bits_t  -- p32mx470f512.h:6074
     with Import => True,
     Convention => C,
     External_Name => "DEVCFG2";

   DEVCFG1 : aliased unsigned  -- p32mx470f512.h:6075
     with Import => True,
     Convention => C,
     External_Name => "DEVCFG1";

   type uu_DEVCFG1bits_t_struct2502 is record
      FNOSC     : Extensions.Unsigned_3;  -- p32mx470f512.h:6078
      anon8531  : Extensions.Unsigned_2;  -- p32mx470f512.h:6079
      FSOSCEN   : Extensions.Unsigned_1;  -- p32mx470f512.h:6080
      anon8533  : Extensions.Unsigned_1;  -- p32mx470f512.h:6081
      IESO      : Extensions.Unsigned_1;  -- p32mx470f512.h:6082
      POSCMOD   : Extensions.Unsigned_2;  -- p32mx470f512.h:6083
      OSCIOFNC  : Extensions.Unsigned_1;  -- p32mx470f512.h:6084
      anon8537  : Extensions.Unsigned_1;  -- p32mx470f512.h:6085
      FPBDIV    : Extensions.Unsigned_2;  -- p32mx470f512.h:6086
      FCKSM     : Extensions.Unsigned_2;  -- p32mx470f512.h:6087
      WDTPS     : Extensions.Unsigned_5;  -- p32mx470f512.h:6088
      anon8541  : Extensions.Unsigned_1;  -- p32mx470f512.h:6089
      WINDIS    : Extensions.Unsigned_1;  -- p32mx470f512.h:6090
      FWDTEN    : Extensions.Unsigned_1;  -- p32mx470f512.h:6091
      FWDTWINSZ : Extensions.Unsigned_2;  -- p32mx470f512.h:6092
   end record
     with Convention => C_Pass_By_Copy,
     Pack => True,
     Alignment => 4;
   type uu_DEVCFG1bits_t_struct2503 is record
      w : aliased unsigned;  -- p32mx470f512.h:6095
   end record
     with Convention => C_Pass_By_Copy;
   type uu_DEVCFG1bits_t (discr : unsigned := 0) is record
      case discr is
         when 0 => anon8546 : aliased uu_DEVCFG1bits_t_struct2502;  -- p32mx470f512.h:6093
         when 1 => anon8550 : aliased uu_DEVCFG1bits_t_struct2503;  -- p32mx470f512.h:6096
         when others => null;
      end case;
   end record
     with Convention => C_Pass_By_Copy,
     Unchecked_Union => True;  -- p32mx470f512.h:6097

   DEVCFG1bits : aliased uu_DEVCFG1bits_t  -- p32mx470f512.h:6098
     with Import => True,
     Convention => C,
     External_Name => "DEVCFG1";

   DEVCFG0 : aliased unsigned  -- p32mx470f512.h:6099
     with Import => True,
     Convention => C,
     External_Name => "DEVCFG0";

   type uu_DEVCFG0bits_t_struct2508 is record
      DEBUG    : Extensions.Unsigned_2;  -- p32mx470f512.h:6102
      JTAGEN   : Extensions.Unsigned_1;  -- p32mx470f512.h:6103
      ICESEL   : Extensions.Unsigned_2;  -- p32mx470f512.h:6104
      anon8559 : Extensions.Unsigned_7;  -- p32mx470f512.h:6105
      PWP      : aliased unsigned_char;  -- p32mx470f512.h:6106
      anon8561 : Extensions.Unsigned_4;  -- p32mx470f512.h:6107
      BWP      : Extensions.Unsigned_1;  -- p32mx470f512.h:6108
      anon8563 : Extensions.Unsigned_3;  -- p32mx470f512.h:6109
      CP       : Extensions.Unsigned_1;  -- p32mx470f512.h:6110
   end record
     with Convention => C_Pass_By_Copy,
     Pack => True,
     Alignment => 4;
   type uu_DEVCFG0bits_t_struct2509 is record
      FDEBUG : Extensions.Unsigned_2;  -- p32mx470f512.h:6113
   end record
     with Convention => C_Pass_By_Copy,
     Pack => True,
     Alignment => 4;
   type uu_DEVCFG0bits_t_struct2510 is record
      w : aliased unsigned;  -- p32mx470f512.h:6116
   end record
     with Convention => C_Pass_By_Copy;
   type uu_DEVCFG0bits_t (discr : unsigned := 0) is record
      case discr is
         when 0 => anon8566 : aliased uu_DEVCFG0bits_t_struct2508;  -- p32mx470f512.h:6111
         when 1 => anon8570 : aliased uu_DEVCFG0bits_t_struct2509;  -- p32mx470f512.h:6114
         when 2 => anon8574 : aliased uu_DEVCFG0bits_t_struct2510;  -- p32mx470f512.h:6117
         when others => Null;
      end case;
   end record
     with Convention => C_Pass_By_Copy,
     Unchecked_Union => True;  -- p32mx470f512.h:6118

   DEVCFG0bits : aliased uu_DEVCFG0bits_t  -- p32mx470f512.h:6119
     with Import => True,
     Convention => C,
     External_Name => "DEVCFG0";

   --  Vector Numbers
   --  IRQ Numbers
   --  Device Peripherals
   --  Base Addresses for Peripherals

   --  p32mx470f512.h:8289
   OC2CON_ON_POSITION : constant Unsigned := 16#F#;
   OC2CON_ON_MASK     : constant Unsigned := 16#8000#;
   OC2CON_ON_LENGTH   : constant Unsigned := 1;

   OC4CON_ON_POSITION : constant Unsigned := 16#F#;
   OC4CON_ON_MASK     : constant Unsigned := 16#8000#;
   OC4CON_ON_LENGTH   : constant Unsigned := 1;

   --  p32mx470f512.h:12497
   IFS0_T4IF_POSITION   : constant Unsigned :=  16#13#;
   IFS0_T4IF_MASK       : constant Unsigned := 16#80000#;
   IFS0_T4IF_LENGTH     : constant Unsigned := 1;

   IFS0_IC4EIF_POSITION : constant Unsigned := 16#14#;
   IFS0_IC4EIF_MASK     : constant Unsigned := 16#100000#;
   IFS0_IC4EIF_LENGTH   : constant Unsigned := 1;

   IFS0_IC4IF_POSITION  : constant Unsigned := 16#15#;
   IFS0_IC4IF_MASK      : constant Unsigned := 16#200000#;
   IFS0_IC4IF_LENGTH    : constant Unsigned := 1;

   IFS0_OC4IF_POSITION  : constant Unsigned := 16#16#;
   IFS0_OC4IF_MASK      : constant Unsigned := 16#400000#;
   IFS0_OC4IF_LENGTH    : constant Unsigned := 1;

   IFS0_INT4IF_POSITION : constant Unsigned := 16#17#;
   IFS0_INT4IF_MASK     : constant Unsigned := 16#800000#;
   IFS0_INT4IF_LENGTH   : constant Unsigned := 1;

   --  p32mx470f512.h:12797
   IEC0_T4IE_POSITION      : constant Unsigned := 16#13#;
   IEC0_T4IE_MASK          : constant Unsigned := 16#80000#;
   IEC0_T4IE_LENGTH        : constant Unsigned := 1;

   IEC0_IC4EIE_POSITION    : constant Unsigned := 16#14#;
   IEC0_IC4EIE_MASK        : constant Unsigned := 16#100000#;
   IEC0_IC4EIE_LENGTH      : constant Unsigned := 1;

   IEC0_IC4IE_POSITION     : constant Unsigned := 16#15#;
   IEC0_IC4IE_MASK         : constant Unsigned := 16#200000#;
   IEC0_IC4IE_LENGTH       : constant Unsigned := 1;

   IEC0_OC4IE_POSITION     : constant Unsigned := 16#16#;
   IEC0_OC4IE_MASK         : constant Unsigned := 16#400000#;
   IEC0_OC4IE_LENGTH       : constant Unsigned := 1;

   IEC0_INT4IE_POSITION    : constant Unsigned := 16#17#;
   IEC0_INT4IE_MASK        : constant Unsigned := 16#800000#;
   IEC0_INT4IE_LENGTH      : constant Unsigned := 1;

   --  p32mx470f512.h:13165
   IPC4_T4IS_POSITION : constant Unsigned := 0;
   IPC4_T4IS_MASK     : constant Unsigned := 3;
   IPC4_T4IS_LENGTH   : constant Unsigned := 2;

   IPC4_T4IP_POSITION : constant Unsigned := 2;
   IPC4_T4IP_MASK     : constant Unsigned := 16#0000001C#;
   IPC4_T4IP_LENGTH   : constant Unsigned := 3;

   IPC4_IC4IS_POSITION : constant Unsigned := 8;
   IPC4_IC4IS_MASK     : constant Unsigned := 16#00000300#;
   IPC4_IC4IS_LENGTH   : constant Unsigned := 2;

   IPC4_IC4IP_POSITION : constant Unsigned := 16#0000000A#;
   IPC4_IC4IP_MASK     : constant Unsigned := 16#00001C00#;
   IPC4_IC4IP_LENGTH   : constant Unsigned := 3;

   IFS0_INT0IF_POSITION : constant Unsigned := 3;
   IFS0_INT0IF_MASK     : constant Unsigned := 8;
   IFS0_INT0IF_LENGTH   : constant Unsigned := 1;

end P32mx470f512h;
