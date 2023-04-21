$PBExportHeader$framework_main.sra
$PBExportComments$Generated Application Object
forward
global type framework_main from application
end type
global transaction sqlca
global dynamicdescriptionarea sqlda
global dynamicstagingarea sqlsa
global error error
global message message
end forward

global variables
string  gs_userid,gs_password,gs_company_name, gs_company_code, &
	gs_inifile = "appl.ini", gs_internalmarket, &
	gs_frametitle, gs_version = ""

datetime &
	gdt_serverdatetime
date &
	gd_serverdate
time &
	gt_servertime
	
	
n_cst_powermessage gnv_message
end variables

global type framework_main from application
string appname = "framework_main"
string themepath = "C:\Program Files (x86)\Appeon\PowerBuilder 19.0\IDE\theme"
string themename = "Do Not Use Themes"
boolean nativepdfvalid = false
boolean nativepdfincludecustomfont = false
string nativepdfappname = ""
long richtextedittype = 2
long richtexteditx64type = 3
long richtexteditversion = 1
string richtexteditkey = ""
string appicon = "C:\Powerbuilder\PBUS2019R3\res\HW SIMRS.ico"
string appruntimeversion = "19.2.0.2703"
end type
global framework_main framework_main

on framework_main.create
appname="framework_main"
message=create message
sqlca=create transaction
sqlda=create dynamicdescriptionarea
sqlsa=create dynamicstagingarea
error=create error
end on

on framework_main.destroy
destroy(sqlca)
destroy(sqlda)
destroy(sqlsa)
destroy(error)
destroy(message)
end on

event open;f_pbus_set_global_theme("violet_light")
open(w_login)

end event

