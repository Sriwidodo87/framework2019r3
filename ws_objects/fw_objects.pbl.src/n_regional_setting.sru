$PBExportHeader$n_regional_setting.sru
forward
global type n_regional_setting from nonvisualobject
end type
end forward

global type n_regional_setting from nonvisualobject
end type
global n_regional_setting n_regional_setting

type prototypes
FUNCTION int GetLocaleInfoA(ulong locale,ulong lctype,REF string data,int size) LIBRARY "kernel32.dll" alias for "GetLocaleInfoA;Ansi"
FUNCTION ulong GetSystemDefaultLCID() LIBRARY "kernel32.dll" alias for "GetSystemDefaultLCID;Ansi"
end prototypes

forward prototypes
public function string of_get_regionalsetting (long al_regcode)
end prototypes

public function string of_get_regionalsetting (long al_regcode);CONSTANT long LOCALE_ILANGUAGE = 1         //  LANGID  in hexadecimal digits
CONSTANT long LOCALE_SLANGUAGE = 2         //  Full localized name of the language
CONSTANT long LOCALE_SENGLANGUAGE = 4097   //  Full English U.S. name of the language ISO Standard 639
CONSTANT long LOCALE_SABBREVLANGNAME = 3   //  Abbreviated name of the language, ISO Standard 639
CONSTANT long LOCALE_SNATIVELANGNAME = 4   //  Native name of the language
CONSTANT long LOCALE_ICOUNTRY = 5          //  Country code, based on international phone codes
CONSTANT long LOCALE_SCOUNTRY = 6          //  The full localized name of the country.
CONSTANT long LOCALE_SENGCOUNTRY = 4098    //  The full English U.S. name of the country.
CONSTANT long LOCALE_SABBREVCTRYNAME = 7   //  Abbreviated name of the country ISO Standard 3166.
CONSTANT long LOCALE_SNATIVECTRYNAME = 8   //  Native name of the country.
CONSTANT long LOCALE_IDEFAULTLANGUAGE = 9  //  LANGID for the principal language spoken in this locale.
CONSTANT long LOCALE_IDEFAULTCOUNTRY = 10  //  Country code for the principal country in this locale.
CONSTANT long LOCALE_IDEFAULTCODEPAGE = 11 //  OEM code page associated with the country.
CONSTANT long LOCALE_SLIST = 12            //  Characters used to separate list items.
CONSTANT long LOCALE_IMEASURE = 13         //  0 for metric system (S.I.) and 1 for the U.S.
CONSTANT long LOCALE_SDECIMAL = 14         //  decimal separator
CONSTANT long LOCALE_STHOUSAND = 15        //  thousand separator
CONSTANT long LOCALE_SGROUPING = 16        //  Sizes for each group of digits to the left of the decimal.
CONSTANT long LOCALE_IDIGITS = 17          //  number of fractional digits
CONSTANT long LOCALE_ILZERO = 18           //  0 means use no leading zeros; 1 means use leading zeros.
CONSTANT long LOCALE_SNATIVEDIGITS = 19    //  Ten characters equivalent of the ASCII 0-9.
CONSTANT long LOCALE_SCURRENCY = 20        //  local monetary symbol
CONSTANT long LOCALE_SINTLSYMBOL = 21      //  International monetary symbol ISO 4217.
CONSTANT long LOCALE_SMONDECIMALSEP = 22   //  monetary decimal separator
CONSTANT long LOCALE_SMONTHOUSANDSEP = 23  //  monetary thousand separator
CONSTANT long LOCALE_SMONGROUPING = 24     //  monetary grouping
CONSTANT long LOCALE_ICURRDIGITS = 25      //  # local monetary digits
CONSTANT long LOCALE_IINTLCURRDIGITS = 26  //  # intl monetary digits
CONSTANT long LOCALE_ICURRENCY = 27        //  positive currency mode
CONSTANT long LOCALE_INEGCURR = 28         //  negative currency mode
CONSTANT long LOCALE_SDATE = 29            //  date separator
CONSTANT long LOCALE_STIME = 30            //  time separator
CONSTANT long LOCALE_SSHORTDATE = 31       //  short date format string
CONSTANT long LOCALE_SLONGDATE = 32        //  long date format string
CONSTANT long LOCALE_STIMEFORMAT = 4099    //  time format string
CONSTANT long LOCALE_IDATE = 33            //  short date format, 0 M–D–Y,1 D–M–Yr,2 Y–M–D
CONSTANT long LOCALE_ILDATE = 34           //  long date format, 0 M–D–Y,1 D–M–Y,2 Y–M–D
CONSTANT long LOCALE_ITIME = 35            //  time format, 0 AM/PM 12-hr format, 1 24-hr format
CONSTANT long LOCALE_ICENTURY = 36         //  Use full 4-digit century, 0 Two digit.1 Full century
CONSTANT long LOCALE_ITLZERO = 37          //  leading zeros in time field, 0 No , 1 yes
CONSTANT long LOCALE_IDAYLZERO = 38        //  leading zeros in day field, 0 No , 1 yes
CONSTANT long LOCALE_IMONLZERO = 39        //  leading zeros in month field, 0 No , 1 yes
CONSTANT long LOCALE_S1159 = 40            //  AM designator
CONSTANT long LOCALE_S2359 = 41            //  PM designator
CONSTANT long LOCALE_SDAYNAME1 = 42        //  long name for Monday
CONSTANT long LOCALE_SDAYNAME2 = 43        //  long name for Tuesday
CONSTANT long LOCALE_SDAYNAME3 = 44        //  long name for Wednesday
CONSTANT long LOCALE_SDAYNAME4 = 45        //  long name for Thursday
CONSTANT long LOCALE_SDAYNAME5 = 46        //  long name for Friday
CONSTANT long LOCALE_SDAYNAME6 = 47        //  long name for Saturday
CONSTANT long LOCALE_SDAYNAME7 = 48        //  long name for Sunday
CONSTANT long LOCALE_SABBREVDAYNAME1 = 49  //  abbreviated name for Monday
CONSTANT long LOCALE_SABBREVDAYNAME2 = 51  //  abbreviated name for Tuesday
CONSTANT long LOCALE_SABBREVDAYNAME3 = 52  //  abbreviated name for Wednesday
CONSTANT long LOCALE_SABBREVDAYNAME4 = 53  //  abbreviated name for Thursday
CONSTANT long LOCALE_SABBREVDAYNAME5 = 54  //  abbreviated name for Friday
CONSTANT long LOCALE_SABBREVDAYNAME6 = 55  //  abbreviated name for Saturday
CONSTANT long LOCALE_SABBREVDAYNAME7 = 56  //  abbreviated name for Sunday
CONSTANT long LOCALE_SMONTHNAME1 = 57      //  long name for January
CONSTANT long LOCALE_SMONTHNAME2 = 58      //  long name for February
CONSTANT long LOCALE_SMONTHNAME3 = 59      //  long name for March
CONSTANT long LOCALE_SMONTHNAME4 = 60      //  long name for April
CONSTANT long LOCALE_SMONTHNAME5 = 61      //  long name for May
CONSTANT long LOCALE_SMONTHNAME6 = 62      //  long name for June
CONSTANT long LOCALE_SMONTHNAME7 = 63      //  long name for July
CONSTANT long LOCALE_SMONTHNAME8 = 64      //  long name for August
CONSTANT long LOCALE_SMONTHNAME9 = 65      //  long name for September
CONSTANT long LOCALE_SMONTHNAME10 = 66     //  long name for October
CONSTANT long LOCALE_SMONTHNAME11 = 67     //  long name for November
CONSTANT long LOCALE_SMONTHNAME12 = 68     //  long name for December
CONSTANT long LOCALE_SABBREVMONTHNAME1 = 69 //  abbreviated name for January
CONSTANT long LOCALE_SABBREVMONTHNAME2 = 70 //  abbreviated name for February
CONSTANT long LOCALE_SABBREVMONTHNAME3 = 71 //  abbreviated name for March
CONSTANT long LOCALE_SABBREVMONTHNAME4 = 72 //  abbreviated name for April
CONSTANT long LOCALE_SABBREVMONTHNAME5 = 73 //  abbreviated name for May
CONSTANT long LOCALE_SABBREVMONTHNAME6 = 74 //  abbreviated name for June
CONSTANT long LOCALE_SABBREVMONTHNAME7 = 75 //  abbreviated name for July
CONSTANT long LOCALE_SABBREVMONTHNAME8 = 76 //  abbreviated name for August
CONSTANT long LOCALE_SABBREVMONTHNAME9 = 77 //  abbreviated name for September
CONSTANT long LOCALE_SABBREVMONTHNAME10 = 78 //  abbreviated name for October
CONSTANT long LOCALE_SABBREVMONTHNAME11 = 79 //  abbreviated name for November
CONSTANT long LOCALE_SABBREVMONTHNAME12 = 80 //  abbreviated name for December
CONSTANT long LOCALE_SABBREVMONTHNAME13 = 4111 // Native abbreviated name for 13th month, if it exists.

string ls_str
ls_str = space(128)

GetLocaleInfoA( GetSystemDefaultLCID(), al_regcode, ls_str,128)
return ls_str
end function

on n_regional_setting.create
call super::create
TriggerEvent( this, "constructor" )
end on

on n_regional_setting.destroy
TriggerEvent( this, "destructor" )
call super::destroy
end on

