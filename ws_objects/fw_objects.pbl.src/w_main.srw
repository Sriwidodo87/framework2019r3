$PBExportHeader$w_main.srw
forward
global type w_main from w_ribbonwindow
end type
type mdi_1 from mdiclient within w_main
end type
type uo_powerdock from u_cst_powerdock within w_main
end type
end forward

global type w_main from w_ribbonwindow
integer height = 1724
string menuname = "m_main"
windowtype windowtype = mdi!
event ue_exit ( )
mdi_1 mdi_1
uo_powerdock uo_powerdock
end type
global w_main w_main

event ue_exit();integer &
	li_return

//li_return = messagebox( "Exit", "Apakah Anda  Akan Keluar dari Aplikasi ?", question!, yesno!)
gnv_message.of_SetTheme(f_pbus_get_global_theme())
li_return = gnv_message.MessageBox("EXIT", "Apakah Anda  Akan Keluar dari Aplikasi ?",OKCancel!)
if li_return = 1 then
	halt
end if
end event

on w_main.create
int iCurrent
call super::create
if this.MenuName = "m_main" then this.MenuID = create m_main
this.mdi_1=create mdi_1
this.uo_powerdock=create uo_powerdock
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.mdi_1
this.Control[iCurrent+2]=this.uo_powerdock
end on

on w_main.destroy
call super::destroy
if IsValid(MenuID) then destroy(MenuID)
destroy(this.mdi_1)
destroy(this.uo_powerdock)
end on

event resize;call super::resize;//uo_PowerDock.Resize(THIS.WorkSpaceWidth(), THIS.WorkSpaceHeight())    
//uo_toolbarstrip.Width = THIS.WorkSpaceWidth() - 12
uo_PowerDock.Move(WorkSpaceX(), WorkSpaceY())
uo_PowerDock.Resize(THIS.WorkSpaceWidth() - 8,THIS.WorkSpaceHeight())
end event

event open;call super::open;THIS.WindowState = Maximized!
end event

event close;call super::close;f_pbus_set_global_theme(FALSE)
end event

event closequery;call super::closequery;IF uo_powerdock.of_CloseAllDocuments() = 0 THEN
	RETURN 1
END IF
end event

type st_uspb_ribbon_label from w_ribbonwindow`st_uspb_ribbon_label within w_main
end type

type sle_ribbonwindowfocuscontrol from w_ribbonwindow`sle_ribbonwindowfocuscontrol within w_main
end type

type uo_ribbonmenu from w_ribbonwindow`uo_ribbonmenu within w_main
end type

type uo_ribbon from w_ribbonwindow`uo_ribbon within w_main
end type

type uo_ribbonstatusbar from w_ribbonwindow`uo_ribbonstatusbar within w_main
end type

type uo_ribbonmenuadvanced from w_ribbonwindow`uo_ribbonmenuadvanced within w_main
end type

type mdi_1 from mdiclient within w_main
long BackColor=268435456
end type

type uo_powerdock from u_cst_powerdock within w_main
integer y = 512
integer taborder = 30
boolean bringtotop = true
end type

on uo_powerdock.destroy
call u_cst_powerdock::destroy
end on

