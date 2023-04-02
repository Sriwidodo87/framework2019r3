$PBExportHeader$w_ribbonwindow_advanced.srw
forward
global type w_ribbonwindow_advanced from w_ribbonwindow
end type
type uo_spa_toolbar from u_cst_toolbarstrip within w_ribbonwindow_advanced
end type
type st_pbus_title from statictext within w_ribbonwindow_advanced
end type
type r_title from statictext within w_ribbonwindow_advanced
end type
type uo_spa_controls from u_cst_spa_controls within w_ribbonwindow_advanced
end type
type uo_spa_icon from u_cst_spa_icon within w_ribbonwindow_advanced
end type
end forward

global type w_ribbonwindow_advanced from w_ribbonwindow
boolean visible = false
integer width = 3977
integer height = 1664
boolean clientedge = true
boolean advanced = true
event syskeyup pbm_syskeyup
event paint pbm_paint
event windowsposchanging pbm_windowposchanging
event settext pbm_settext
event nccalcsize pbm_nccalcsize
event activateapp pbm_activateapp
event ue_pbus_postopen ( )
event windowsposchanged pbm_windowposchanged
event syscommand pbm_syscommand
event move pbm_move
event resizingstart ( )
event resizingend ( )
event type integer pbus_customcaptionwindow ( )
uo_spa_toolbar uo_spa_toolbar
st_pbus_title st_pbus_title
r_title r_title
uo_spa_controls uo_spa_controls
uo_spa_icon uo_spa_icon
end type
global w_ribbonwindow_advanced w_ribbonwindow_advanced

type prototypes

end prototypes

type variables
n_ribbonwindow_advanced in_ribbonwindowadvanced

end variables

forward prototypes
public function integer of_setwindowicon (string as_image)
private function integer of_changeactivestate (boolean ab_active)
public function integer of_settheme (string as_theme)
public function integer of_buildquickaccess (menu a_menu)
private function integer of_displaysysmenu (integer px, integer py)
public function integer of_rebuildribbon (menu a_menu)
private function integer of_notrestoring ()
public function integer of_sizewindow (integer a_x, integer a_y, integer a_width, integer a_height)
public function integer of_buildquickaccess ()
public function integer of_buildribbon (menu a_menu)
public function boolean of_altkeypressed ()
public function boolean of_altletterkeypressed ()
private function integer of_buildribbon ()
private function integer of_hidemenu ()
private function string of_convertkeytoletter (keycode akc_key)
public function integer of_displayprogramtab (string as_image)
public function boolean of_isribbondocked ()
public function integer of_rebuildribbon ()
public function integer of_rebuildribbon (boolean ab_keepcurrenttabselected)
public function integer of_disablealthotkey (boolean ab_switch)
public function integer of_cancelalt ()
public function integer of_dockribbon ()
public function integer of_hideribbongroup ()
public function integer of_hidestatusbar ()
public function integer of_rebuildribbon (menu a_menu, boolean ab_keepcurrenttabselected)
public function boolean of_registerhotkey ()
public function integer of_righttoleft (boolean ab_switch)
public function integer of_setfont (string as_font)
public function integer of_undockribbon ()
public function integer of_statuspush (string as_status)
public function integer of_statuspop ()
public function integer of_showtoplevelmenu (ref menu a_menu, boolean ab_visible, boolean ab_rebuild)
public function integer of_showstatusbar ()
public function integer of_showribbongroup ()
public function integer of_showloadingcircle (boolean ab_switch)
public function integer of_settextcolor (long al_color)
public function integer of_setgroupfont (string as_font)
public function integer of_settabtextcolor (long al_color)
public function integer of_setgrouptextcolor (long al_color)
public function integer of_setitemfont (string as_font)
public function integer of_setstatus (string as_status)
public function integer of_setstatuspanel (string as_text, integer ai_panel)
public function integer of_settabfont (string as_font)
public function string of_removeampersand (string as_text)
public function integer of_setitemtextcolor (long al_color)
public function n_ribbonwindow of_getnvo ()
public function integer of_setstyle (integer ai_style)
public function integer of_pauseresize (boolean ab_pause)
end prototypes

event settext;st_pbus_title.Text = text
end event

event nccalcsize;Message.Processed = TRUE
RETURN 0

end event

event activateapp;IF IsValid(of_GetNVO()) THEN  in_ribbonwindowadvanced.ActivateApp(activate)
end event

event ue_pbus_postopen();POST Show()
end event

event move;IF IsValid(of_GetNVO()) THEN in_ribbonwindowadvanced.Move(xpos, ypos)
	
end event

event resizingstart();IF IsValid(of_GetNVO()) THEN in_ribbonwindowadvanced.ResizingStart()
end event

event resizingend();IF IsValid(of_GetNVO()) THEN in_ribbonwindowadvanced.ResizingEnd()
end event

event type integer pbus_customcaptionwindow();RETURN 2
end event

public function integer of_setwindowicon (string as_image);IF NOT IsValid(of_GetNVO()) THEN RETURN 0

RETURN in_ribbonwindowadvanced.of_SetWindowIcon(as_image)
end function

private function integer of_changeactivestate (boolean ab_active);IF NOT IsValid(of_GetNVO()) THEN RETURN 0

RETURN in_ribbonwindowadvanced.of_ChangeActiveState(ab_active)
end function

public function integer of_settheme (string as_theme);IF NOT IsValid(of_GetNVO()) THEN RETURN 0

RETURN of_GetNVO().of_SetTheme(as_theme)
end function

public function integer of_buildquickaccess (menu a_menu);IF NOT IsValid(of_GetNVO()) THEN RETURN 0

RETURN of_GetNVO().of_BuildQuickAccess(a_menu)
end function

private function integer of_displaysysmenu (integer px, integer py);IF NOT IsValid(of_GetNVO()) THEN RETURN 0

RETURN in_ribbonwindowadvanced.of_DisplaySysMenu(px, py)
end function

public function integer of_rebuildribbon (menu a_menu);IF NOT IsValid(of_GetNVO()) THEN RETURN 0

RETURN of_GetNVO().of_RebuildRibbon(a_menu)
end function

private function integer of_notrestoring ();IF NOT IsValid(of_GetNVO()) THEN RETURN 0

RETURN in_ribbonwindowadvanced.of_NotRestoring()
end function

public function integer of_sizewindow (integer a_x, integer a_y, integer a_width, integer a_height);IF NOT IsValid(of_GetNVO()) THEN RETURN 0

RETURN in_ribbonwindowadvanced.of_SizeWindow(a_x, a_y, a_width, a_height)
end function

public function integer of_buildquickaccess ();IF NOT IsValid(of_GetNVO()) THEN RETURN 0

RETURN of_GetNVO().of_BuildQuickAccess()
end function

public function integer of_buildribbon (menu a_menu);IF NOT IsValid(of_GetNVO()) THEN RETURN 0

RETURN of_GetNVO().of_BuildRibbon(a_menu)
end function

public function boolean of_altkeypressed ();IF NOT IsValid(of_GetNVO()) THEN RETURN FALSE

RETURN of_GetNVO().of_AltKeyPressed()
end function

public function boolean of_altletterkeypressed ();IF NOT IsValid(of_GetNVO()) THEN RETURN FALSE

RETURN of_GetNVO().of_ALTLetterKeyPressed()
end function

private function integer of_buildribbon ();IF NOT IsValid(of_GetNVO()) THEN RETURN 0

RETURN of_GetNVO().of_BuildRibbon()
end function

private function integer of_hidemenu ();IF NOT IsValid(of_GetNVO()) THEN RETURN 0

RETURN of_GetNVO().of_HideMenu()
end function

private function string of_convertkeytoletter (keycode akc_key);IF NOT IsValid(of_GetNVO()) THEN RETURN ""

RETURN of_GetNVO().of_ConvertKeyToLetter(akc_key)
end function

public function integer of_displayprogramtab (string as_image);IF NOT IsValid(of_GetNVO()) THEN RETURN 0

RETURN of_GetNVO().of_DisplayProgramTab(as_image)
end function

public function boolean of_isribbondocked ();IF NOT IsValid(of_GetNVO()) THEN RETURN FALSE

RETURN of_GetNVO().of_IsRibbonDocked()
end function

public function integer of_rebuildribbon ();IF NOT IsValid(of_GetNVO()) THEN RETURN 0

RETURN of_GetNVO().of_RebuildRibbon()
end function

public function integer of_rebuildribbon (boolean ab_keepcurrenttabselected);IF NOT IsValid(of_GetNVO()) THEN RETURN 0

RETURN of_GetNVO().of_RebuildRibbon(ab_keepcurrenttabselected)
end function

public function integer of_disablealthotkey (boolean ab_switch);IF NOT IsValid(of_GetNVO()) THEN RETURN 0

RETURN of_GetNVO().of_DisableAltHotKey(ab_switch)
end function

public function integer of_cancelalt ();IF NOT IsValid(of_GetNVO()) THEN RETURN 0

RETURN of_GetNVO().of_CancelAlt()
end function

public function integer of_dockribbon ();IF NOT IsValid(of_GetNVO()) THEN RETURN 0

RETURN of_GetNVO().of_DockRibbon()

end function

public function integer of_hideribbongroup ();IF NOT IsValid(of_GetNVO()) THEN RETURN 0

RETURN of_GetNVO().of_HideRibbonGroup()
end function

public function integer of_hidestatusbar ();IF NOT IsValid(of_GetNVO()) THEN RETURN 0

RETURN of_GetNVO().of_HideStatusBar()
end function

public function integer of_rebuildribbon (menu a_menu, boolean ab_keepcurrenttabselected);IF NOT IsValid(of_GetNVO()) THEN RETURN 0

RETURN of_GetNVO().of_RebuildRibbon(a_menu, ab_keepcurrenttabselected)
end function

public function boolean of_registerhotkey ();IF NOT IsValid(of_GetNVO()) THEN RETURN FALSE

RETURN of_GetNVO().of_RegisterHotKey()
end function

public function integer of_righttoleft (boolean ab_switch);IF NOT IsValid(of_GetNVO()) THEN RETURN 0

RETURN of_GetNVO().of_RightToLeft(ab_switch)
end function

public function integer of_setfont (string as_font);IF NOT IsValid(of_GetNVO()) THEN RETURN 0

RETURN of_GetNVO().of_SetFont(as_font)
end function

public function integer of_undockribbon ();IF NOT IsValid(of_GetNVO()) THEN RETURN 0

RETURN of_GetNVO().of_UndockRibbon()
end function

public function integer of_statuspush (string as_status);IF NOT IsValid(of_GetNVO()) THEN RETURN 0

RETURN of_GetNVO().of_StatusPush(as_status)
end function

public function integer of_statuspop ();IF NOT IsValid(of_GetNVO()) THEN RETURN 0

RETURN of_GetNVO().of_StatusPop()
end function

public function integer of_showtoplevelmenu (ref menu a_menu, boolean ab_visible, boolean ab_rebuild);IF NOT IsValid(of_GetNVO()) THEN RETURN 0

RETURN of_GetNVO().of_ShowTopLevelMenu(a_menu, ab_visible, ab_rebuild)
end function

public function integer of_showstatusbar ();IF NOT IsValid(of_GetNVO()) THEN RETURN 0

RETURN of_GetNVO().of_ShowStatusBar()
end function

public function integer of_showribbongroup ();IF NOT IsValid(of_GetNVO()) THEN RETURN 0

RETURN of_GetNVO().of_ShowRibbonGroup()
end function

public function integer of_showloadingcircle (boolean ab_switch);IF NOT IsValid(of_GetNVO()) THEN RETURN 0

RETURN of_GetNVO().of_ShowLoadingCircle(ab_switch)
end function

public function integer of_settextcolor (long al_color);IF NOT IsValid(of_GetNVO()) THEN RETURN 0

RETURN of_GetNVO().of_SetTextColor(al_color)
end function

public function integer of_setgroupfont (string as_font);IF NOT IsValid(of_GetNVO()) THEN RETURN 0

RETURN of_GetNVO().of_SetGroupFont(as_font)
end function

public function integer of_settabtextcolor (long al_color);IF NOT IsValid(of_GetNVO()) THEN RETURN 0

RETURN of_GetNVO().of_SetTabTextColor(al_color)
end function

public function integer of_setgrouptextcolor (long al_color);IF NOT IsValid(of_GetNVO()) THEN RETURN 0

RETURN of_GetNVO().of_SetGroupTextColor(al_color)
end function

public function integer of_setitemfont (string as_font);IF NOT IsValid(of_GetNVO()) THEN RETURN 0

RETURN of_GetNVO().of_SetItemFont(as_font)
end function

public function integer of_setstatus (string as_status);IF NOT IsValid(of_GetNVO()) THEN RETURN 0

RETURN of_GetNVO().of_SetStatus(as_status)
end function

public function integer of_setstatuspanel (string as_text, integer ai_panel);IF NOT IsValid(of_GetNVO()) THEN RETURN 0

RETURN of_GetNVO().of_SetStatusPanel(as_text, ai_panel)
end function

public function integer of_settabfont (string as_font);IF NOT IsValid(of_GetNVO()) THEN RETURN 0

RETURN of_GetNVO().of_SetTabFont(as_font)
end function

public function string of_removeampersand (string as_text);RETURN of_GetNVO().of_RemoveAmpersand(as_text)
end function

public function integer of_setitemtextcolor (long al_color);IF NOT IsValid(of_GetNVO()) THEN RETURN 0

RETURN of_GetNVO().of_SetItemTextColor(al_color)
end function

public function n_ribbonwindow of_getnvo ();RETURN in_ribbonwindowadvanced
end function

public function integer of_setstyle (integer ai_style);IF NOT IsValid(of_GetNVO()) THEN RETURN 0

RETURN of_GetNVO().of_SetStyle(ai_style)
end function

public function integer of_pauseresize (boolean ab_pause);IF NOT IsValid(of_GetNVO()) THEN RETURN 0

RETURN in_ribbonwindowadvanced.of_PauseResize(ab_pause)
end function

on w_ribbonwindow_advanced.create
int iCurrent
call super::create
this.uo_spa_toolbar=create uo_spa_toolbar
this.st_pbus_title=create st_pbus_title
this.r_title=create r_title
this.uo_spa_controls=create uo_spa_controls
this.uo_spa_icon=create uo_spa_icon
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.uo_spa_toolbar
this.Control[iCurrent+2]=this.st_pbus_title
this.Control[iCurrent+3]=this.r_title
this.Control[iCurrent+4]=this.uo_spa_controls
this.Control[iCurrent+5]=this.uo_spa_icon
end on

on w_ribbonwindow_advanced.destroy
call super::destroy
destroy(this.uo_spa_toolbar)
destroy(this.st_pbus_title)
destroy(this.r_title)
destroy(this.uo_spa_controls)
destroy(this.uo_spa_icon)
end on

event close;call super::close;of_GetNVO().Close()
DESTROY in_ribbonwindowadvanced
end event

event open;
in_ribbonwindowadvanced = CREATE n_ribbonwindow_advanced
in_ribbonwindowadvanced.of_SetRibbonWindowAdvanced(THIS)
of_GetNVO().of_SetRibbonWindow(THIS)

of_GetNVO().Open()

SUPER::EVENT Open()

POST EVENT ue_PBUS_PostOpen()
end event

event resize;call super::resize;IF IsValid(of_GetNVO()) THEN of_GetNVO().Resize(sizetype, newwidth, newheight)
end event

type st_uspb_ribbon_label from w_ribbonwindow`st_uspb_ribbon_label within w_ribbonwindow_advanced
integer y = 128
end type

type sle_ribbonwindowfocuscontrol from w_ribbonwindow`sle_ribbonwindowfocuscontrol within w_ribbonwindow_advanced
end type

type uo_ribbonmenu from w_ribbonwindow`uo_ribbonmenu within w_ribbonwindow_advanced
end type

on uo_ribbonmenu.destroy
call u_cst_ribbonmenu::destroy
end on

type uo_ribbon from w_ribbonwindow`uo_ribbon within w_ribbonwindow_advanced
integer x = 0
integer y = 128
integer height = 512
end type

on uo_ribbon.destroy
call u_cst_ribboncontainer::destroy
end on

type uo_ribbonstatusbar from w_ribbonwindow`uo_ribbonstatusbar within w_ribbonwindow_advanced
end type

on uo_ribbonstatusbar.destroy
call u_cst_ribbonstatusbar::destroy
end on

type uo_ribbonmenuadvanced from w_ribbonwindow`uo_ribbonmenuadvanced within w_ribbonwindow_advanced
end type

type uo_spa_toolbar from u_cst_toolbarstrip within w_ribbonwindow_advanced
event destroy ( )
boolean visible = false
integer x = 123
integer y = 8
integer taborder = 40
boolean bringtotop = true
end type

on uo_spa_toolbar.destroy
call u_cst_toolbarstrip::destroy
end on

event ue_buttonclicked;call super::ue_buttonclicked;in_ribbonwindowadvanced.ue_ButtonClicked(as_button)

end event

event onpaint;call super::onpaint;IF IsValid(in_ribbonwindowadvanced) THEN in_ribbonwindowadvanced.of_SetQAState()

IF of_AltKeyPressed() AND NOT of_AltLetterKeyPressed() THEN
	uo_ribbon.of_DrawQuickAccessHotKeys(THIS, hdc)
END IF



RETURN 1
end event

type st_pbus_title from statictext within w_ribbonwindow_advanced
event lbuttondown pbm_lbuttondown
event lbuttonup pbm_lbuttonup
event mousemove pbm_mousemove
event nchittest pbm_nchittest
event rbuttonup pbm_rbuttonup
integer x = 23
integer y = 28
integer width = 3744
integer height = 80
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Segoe UI"
long textcolor = 33554432
long backcolor = 15780518
string text = "Title"
alignment alignment = center!
boolean focusrectangle = false
end type

event lbuttondown;r_title.Event lbuttondown(flags,xpos,ypos)
end event

event lbuttonup;r_title.Event lbuttonup(flags,xpos,ypos)
end event

event mousemove;r_title.Event MouseMove(flags,xpos,ypos)
end event

event rbuttonup;r_title.Event rbuttonup(flags,xpos,ypos)
end event

event doubleclicked;r_title.Event DoubleClicked()
end event

type r_title from statictext within w_ribbonwindow_advanced
event lbuttondown pbm_lbuttondown
event lbuttonup pbm_lbuttonup
event mousemove pbm_mousemove
event nchittest pbm_nchittest
event rbuttonup pbm_rbuttonup
integer width = 30002
integer height = 224
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 15780518
boolean focusrectangle = false
end type

event lbuttondown;
in_ribbonwindowadvanced.Title_RButtonDown()
end event

event rbuttonup;of_DisplaySysMenu(xpos,ypos)
end event

event doubleclicked;in_ribbonwindowadvanced.title_doubleclicked()
end event

type uo_spa_controls from u_cst_spa_controls within w_ribbonwindow_advanced
event destroy ( )
boolean visible = false
integer x = 3246
integer height = 120
integer taborder = 40
boolean bringtotop = true
end type

on uo_spa_controls.destroy
call u_cst_spa_controls::destroy
end on

event constructor;call super::constructor;THIS.Show()
end event

type uo_spa_icon from u_cst_spa_icon within w_ribbonwindow_advanced
boolean visible = false
integer x = 18
integer y = 12
integer taborder = 30
boolean bringtotop = true
end type

on uo_spa_icon.destroy
call u_cst_spa_icon::destroy
end on

event lbuttonup;call super::lbuttonup;IF RightToLeft THEN
	of_DisplaySysMenu(PARENT.Width - 80, r_title.Height - 24)
ELSE
	of_DisplaySysMenu(-24, r_title.Height - 24)
END IF
end event

