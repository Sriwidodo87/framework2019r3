$PBExportHeader$w_login.srw
forward
global type w_login from window
end type
type st_login from statictext within w_login
end type
type cb_cancel from u_cst_commandbutton within w_login
end type
type cb_login from u_cst_commandbutton within w_login
end type
type p_lock from picture within w_login
end type
type sle_password from singlelineedit within w_login
end type
type sle_userid from singlelineedit within w_login
end type
type st_2 from statictext within w_login
end type
type st_1 from statictext within w_login
end type
end forward

global type w_login from window
integer width = 2062
integer height = 828
boolean border = false
windowtype windowtype = popup!
long backcolor = 16777215
boolean center = true
windowanimationstyle openanimation = leftslide!
windowanimationstyle closeanimation = centeranimation!
integer animationtime = 1000
st_login st_login
cb_cancel cb_cancel
cb_login cb_login
p_lock p_lock
sle_password sle_password
sle_userid sle_userid
st_2 st_2
st_1 st_1
end type
global w_login w_login

type variables


end variables

forward prototypes
public subroutine wf_open_program ()
public function boolean wf_check_user (string as_userid, string as_password)
end prototypes

public subroutine wf_open_program ();// open program function
open( w_main_ribbon)
hide( this)
end subroutine

public function boolean wf_check_user (string as_userid, string as_password);string &
	ls_userid, ls_password, ls_dbparm

as_userid = trim( as_userid)
as_password = trim( as_password)

open( w_busy)
w_busy.st_remark.text = "Sedang melakukan koneksi ke database ..."
ls_dbparm = ProfileString ( "appl.ini", "Database", "dbparm", "")

ls_dbparm = trim( ls_dbparm)
sqlca = f_db_local_connect("appl.ini", "Database", ls_dbparm)
close( w_busy)


if sqlca.sqlcode = 0 then
	select user_id, user_password into :ls_userid, :ls_password
	from sysuser
	where user_id = :as_userid;
	
	if not isnull( ls_userid) then 
		if trim( ls_password) = as_password then
			gs_userid = as_userid
			gs_password = as_password
			return true
		else
			disconnect using sqlca;
			return false // wrong password
		end if
	else
		disconnect using sqlca;
		return false // not valid user
	end if
else
	return false
end if
end function

on w_login.create
this.st_login=create st_login
this.cb_cancel=create cb_cancel
this.cb_login=create cb_login
this.p_lock=create p_lock
this.sle_password=create sle_password
this.sle_userid=create sle_userid
this.st_2=create st_2
this.st_1=create st_1
this.Control[]={this.st_login,&
this.cb_cancel,&
this.cb_login,&
this.p_lock,&
this.sle_password,&
this.sle_userid,&
this.st_2,&
this.st_1}
end on

on w_login.destroy
destroy(this.st_login)
destroy(this.cb_cancel)
destroy(this.cb_login)
destroy(this.p_lock)
destroy(this.sle_password)
destroy(this.sle_userid)
destroy(this.st_2)
destroy(this.st_1)
end on

event open;string &
	ls_date_format, ls_data, ls_dec, ls_thousand
n_regional_setting &
	ln_regional_setting

ls_data = ProfileString ( "appl.ini", "setting", "development", "N")
ls_data = trim( lower( ls_data))

if ls_data = "yes" then
	ls_data = ProfileString ( "appl.ini", "setting", "userid", "")
	sle_userid.text = ls_data
	ls_data = ProfileString ( "appl.ini", "setting", "password", "")
	sle_password.text = ls_data
end if



// periksa setting tanggal di regional setting
// format tanggal harus dd-mm-yyyy
ln_regional_setting = create n_regional_Setting
ls_date_format = ln_regional_setting.of_get_regionalsetting(31)
ls_date_format = trim( ls_date_format)
if upper(mid( ls_date_format, 1, 2)) = "DD" and &
	upper(mid( ls_date_format, 4, 2)) = "MM" and &
	upper(mid( ls_date_format, 7, 4)) = "YYYY" then
else
	messagebox( "Format Tanggal", "Format tanggal di regional setting harus dd-mm-yyyy")
	Run( "rundll32.exe shell32.dll,Control_RunDLL intl.cpl,,4")
	halt
end if

ls_dec = trim( ln_regional_setting.of_get_regionalsetting(14))
ls_thousand = trim( ln_regional_setting.of_get_regionalsetting(15))
if ls_dec = "." and ls_thousand = "," then
else
	messagebox( "Format Nomor", "Pemisah ribuan harus pakai tanda ',' dan pemisah desimal harus pakai tanda '.'")
	Run( "rundll32.exe shell32.dll,Control_RunDLL intl.cpl,,4")
	halt
end if

destroy ln_regional_setting
end event

event resize;st_login.x=0
st_login.y=0
st_login.width=this.workspacewidth( )
end event

type st_login from statictext within w_login
integer x = 46
integer y = 36
integer width = 2016
integer height = 120
integer textsize = -16
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = roman!
string facename = "Cambria"
long textcolor = 134217737
long backcolor = 553648127
string text = "Login Application"
alignment alignment = center!
long bordercolor = 33554431
borderstyle borderstyle = StyleRaised!
end type

type cb_cancel from u_cst_commandbutton within w_login
integer x = 1522
integer y = 592
integer width = 462
integer height = 152
integer taborder = 50
fontfamily fontfamily = roman!
string facename = "Cambria"
string text = "&Cancel"
integer visualstyle = -2
boolean ellipsis = false
string theme = ""
string iconname = "../res/Cancel.png"
alignment htextalign = justify!
integer cornerradius = 3
end type

event clicked;call super::clicked;halt
end event

type cb_login from u_cst_commandbutton within w_login
integer x = 786
integer y = 584
integer width = 462
integer height = 152
integer taborder = 40
fontfamily fontfamily = roman!
string facename = "Cambria"
string text = "Login"
boolean default = true
integer visualstyle = 0
boolean ellipsis = false
string theme = ""
string iconname = "../res/Ok.png"
alignment htextalign = justify!
integer cornerradius = 3
end type

event clicked;call super::clicked;string &
	ls_userid, ls_password
ls_userid = trim( sle_userid.text)
ls_password = trim( sle_password.text)

if ls_userid = "" then
	messagebox( "Login", "User ID cannot empty")
	return
end if

if ls_password = "" then
	messagebox( "Login", "Password cannot empty")
	return
end if

if wf_check_user( ls_userid, ls_password ) then
	wf_open_program()
else
	messagebox( "Login", "Bad User ID or Password")
	return
end if


	
	
	

end event

type p_lock from picture within w_login
integer x = 50
integer y = 176
integer width = 626
integer height = 556
string picturename = "..\res\padlock.png"
boolean map3dcolors = true
end type

type sle_password from singlelineedit within w_login
event ue_enter pbm_keydown
integer x = 1239
integer y = 400
integer width = 681
integer height = 116
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
long textcolor = 33554432
boolean password = true
borderstyle borderstyle = stylelowered!
end type

event ue_enter;if key = keyenter! then
	cb_login.postevent( "clicked")
end if
end event

type sle_userid from singlelineedit within w_login
event ue_enter pbm_keydown
integer x = 1239
integer y = 196
integer width = 681
integer height = 116
integer taborder = 10
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
long textcolor = 33554432
borderstyle borderstyle = stylelowered!
end type

event ue_enter;if key = keyenter! then
	sle_password.setfocus()
end if
end event

type st_2 from statictext within w_login
integer x = 786
integer y = 400
integer width = 402
integer height = 116
integer textsize = -11
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = roman!
string facename = "Cambria"
long textcolor = 33554432
long backcolor = 553648127
string text = "Password :"
alignment alignment = right!
boolean focusrectangle = false
end type

type st_1 from statictext within w_login
integer x = 786
integer y = 196
integer width = 320
integer height = 116
integer textsize = -11
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = roman!
string facename = "Cambria"
long textcolor = 33554432
long backcolor = 553648127
string text = "User ID :"
alignment alignment = right!
boolean focusrectangle = false
end type

