$PBExportHeader$w_main_ribbon.srw
forward
global type w_main_ribbon from w_ribbonwindow_advanced
end type
type mdi_1 from mdiclient within w_main_ribbon
end type
type uo_powerdock from u_cst_powerdock within w_main_ribbon
end type
end forward

global type w_main_ribbon from w_ribbonwindow_advanced
integer height = 1740
string menuname = "m_main"
windowtype windowtype = mdi!
event ue_postopen ( )
event ue_exit ( )
event ue_mdi_move ( )
mdi_1 mdi_1
uo_powerdock uo_powerdock
end type
global w_main_ribbon w_main_ribbon

type variables

end variables

event ue_postopen();of_setstatus("Ready ")


 
end event

event ue_exit();integer &
	li_return
	gnv_message.of_SetTheme(gs_color)
li_return = gnv_message.MessageBox("Exit ", "Apakah Anda  Akan Keluar dari Aplikasi ?",YesNo! )
if li_return = 1 then
	halt
end if




end event

event ue_mdi_move();integer wx,wy,wh,ww
wx =this.workspacex( )
wy = this.workspacey( )
wh = this.workspaceheight( )
ww = this.workspacewidth( )

if(handle (w_bkg) > 0 ) then 
//wh  -= 200
w_bkg.width=ww
w_bkg.height=wh
	IF ww > w_bkg.width then 
		ww =integer ((ww - w_bkg.width) ) 
	else
		ww =1
	end if 
	
	IF wh > w_bkg.height then 
		wh =integer ((wh - w_bkg.height)) 
	else
		wh=1
	end if 
	
	move (w_bkg,ww,wh)
end if 
setfocus(this)

end event

on w_main_ribbon.create
int iCurrent
call super::create
if this.MenuName = "m_main" then this.MenuID = create m_main
this.mdi_1=create mdi_1
this.uo_powerdock=create uo_powerdock
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.mdi_1
this.Control[iCurrent+2]=this.uo_powerdock
end on

on w_main_ribbon.destroy
call super::destroy
if IsValid(MenuID) then destroy(MenuID)
destroy(this.mdi_1)
destroy(this.uo_powerdock)
end on

event open;call super::open;  THIS.WindowState = Maximized!
  uo_powerdock.of_setbackgroundimage("pbuslogo.bmp",10)	
   string &
	ls_securemenu, ls_compmix, ls_comparr[], ls_scode
integer &
	i, li_intcount	
//mencari theme global
	gs_color =f_pbus_get_global_theme()
	gs_color = Upper(gs_color)
// get menu setting from ini file
ls_securemenu = ProfileString ( "appl.ini", "setting", "securemenu", "yes")

if trim( lower( ls_securemenu)) = "yes" and &
	 gs_userid <>"dba" then
	
	f_disable_menu( m_main, gs_userid)
end if

// get company code for title
//select textvl into :ls_compmix
//	from sysset
//	where moducd = 'SYSTEM'
	//	and settype = 'DEPONAME';
//ls_comparr = f_split_string( ls_compmix, ";")
//gs_company_code = trim( ls_comparr[1])
//gs_company_name = trim( ls_comparr[2])
this.title = "IT MAINTENANCE RSUP PROF Dr. R.D. KANDOU MANADO - " + gs_company_name +&
	" | " + gs_userid +&
	" | Versi " + gs_version

gdt_serverdatetime = datetime( today(), now())
gd_serverdate = date( gdt_serverdatetime)
gt_servertime = time( gdt_serverdatetime)
gs_frametitle = this.title + " | Time on Client - " + &
	string( gd_serverdate, "dd-mmmm-yyyy")	
	
	
// lihat settingan, apakah feedmill cakung atau bukan
//select scode into :ls_scode 
	//from supmast;
//gb_cakung = false
//if ls_scode = "C01" then
	//gb_cakung = true
//end if

//messagebox( "Info", "Sukses")	
this.title = gs_frametitle
timer(1)
of_SetStatus("Loading...")
of_SetStatusPanel("", THIS.STATUSPANEL1)
of_SetStatusPanel(gs_userid, THIS.STATUSPANEL2)




POST EVENT ue_PostOpen()
end event

event resize;call super::resize;uo_powerDock.Move(WorkSpaceX(), WorkSpaceY())
uo_PowerDock.Resize(THIS.WorkSpaceWidth() - 8, THIS.WorkSpaceHeight() - MDI_1.MicroHelpHeight)    

end event

type st_uspb_ribbon_label from w_ribbonwindow_advanced`st_uspb_ribbon_label within w_main_ribbon
end type

type sle_ribbonwindowfocuscontrol from w_ribbonwindow_advanced`sle_ribbonwindowfocuscontrol within w_main_ribbon
end type

type uo_ribbonmenu from w_ribbonwindow_advanced`uo_ribbonmenu within w_main_ribbon
end type

type uo_ribbon from w_ribbonwindow_advanced`uo_ribbon within w_main_ribbon
end type

type uo_ribbonstatusbar from w_ribbonwindow_advanced`uo_ribbonstatusbar within w_main_ribbon
end type

type uo_ribbonmenuadvanced from w_ribbonwindow_advanced`uo_ribbonmenuadvanced within w_main_ribbon
end type

type uo_spa_toolbar from w_ribbonwindow_advanced`uo_spa_toolbar within w_main_ribbon
end type

type st_pbus_title from w_ribbonwindow_advanced`st_pbus_title within w_main_ribbon
end type

type r_title from w_ribbonwindow_advanced`r_title within w_main_ribbon
end type

type uo_spa_controls from w_ribbonwindow_advanced`uo_spa_controls within w_main_ribbon
end type

type uo_spa_icon from w_ribbonwindow_advanced`uo_spa_icon within w_main_ribbon
end type

type mdi_1 from mdiclient within w_main_ribbon
long BackColor=268435456
end type

type uo_powerdock from u_cst_powerdock within w_main_ribbon
integer y = 536
integer taborder = 30
boolean bringtotop = true
end type

on uo_powerdock.destroy
call u_cst_powerdock::destroy
end on

