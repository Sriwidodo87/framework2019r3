$PBExportHeader$w_ribbonwindow.srw
forward
global type w_ribbonwindow from w_uspb_ribbon_base
end type
type st_uspb_ribbon_label from statictext within w_ribbonwindow
end type
type sle_ribbonwindowfocuscontrol from singlelineedit within w_ribbonwindow
end type
type uo_ribbonmenu from u_cst_ribbonmenu within w_ribbonwindow
end type
type uo_ribbon from u_cst_ribboncontainer within w_ribbonwindow
end type
type uo_ribbonstatusbar from u_cst_ribbonstatusbar within w_ribbonwindow
end type
type uo_ribbonmenuadvanced from u_cst_ribbonmenuadvanced within w_ribbonwindow
end type
type inv_win32 from n_cst_win32 within w_ribbonwindow
end type
end forward

global type w_ribbonwindow from w_uspb_ribbon_base
integer width = 3959
integer height = 1648
windowstate windowstate = maximized!
boolean toolbarvisible = false
event ribbonmenuclicked ( string as_command )
event ribbontabclicked ( string as_item,  string as_menuclassname )
event ribbondocked ( )
event ribbonundocked ( )
event syskeyup pbm_syskeyup
event type long ribbontabclosing ( long index )
event ribbontabclosed ( long index )
event ncpaint pbm_ncpaint
event paint pbm_paint
event uspbalthotkey pbm_custom75
st_uspb_ribbon_label st_uspb_ribbon_label
sle_ribbonwindowfocuscontrol sle_ribbonwindowfocuscontrol
uo_ribbonmenu uo_ribbonmenu
uo_ribbon uo_ribbon
uo_ribbonstatusbar uo_ribbonstatusbar
uo_ribbonmenuadvanced uo_ribbonmenuadvanced
inv_win32 inv_win32
end type
global w_ribbonwindow w_ribbonwindow

type prototypes

end prototypes

type variables
Boolean DisplayQuickAccessUnderRibbon
Boolean DisableAltHotKey
Boolean SmoothScroll = FALSE
Integer FontSize = 9
String ProgramTabText = "File"
Boolean HideRibbonShadow = FALSE
Boolean DisableRibbonTooltip = FALSE
Integer ToolTipWidth = 215

CONSTANT LONG STATUSPANEL1 = 1
CONSTANT LONG STATUSPANEL2 = 2
CONSTANT LONG STATUSPANEL3 = 3
CONSTANT LONG STATUSPANEL4 = 4
CONSTANT LONG STATUSPANEL5 = 5
CONSTANT LONG STATUSPANEL6 = 6

CONSTANT LONG DEFAULT = 0
CONSTANT LONG OFFICE365 = 1

n_ribbonwindow in_ribbonwindow

Boolean Advanced
Boolean AdvancedMenu

PRIVATE Boolean FullyInitialized
end variables

forward prototypes
private function integer of_hidemenu ()
public function integer workspaceheight ()
public function integer workspacey ()
private function integer of_buildribbon ()
private function string of_convertkeytoletter (keycode akc_key)
public function boolean of_isribbondocked ()
public function integer of_undockribbon ()
public function integer workspacewidth ()
public function integer workspacex ()
public function string of_removeampersand (string as_text)
public function integer of_buildquickaccess ()
public function integer of_rebuildribbon ()
public function integer changemenu (ref menu m, integer w)
public function integer of_settheme (string as_theme)
public function integer of_displayprogramtab (string as_image)
public function u_cst_ribbonmenu of_ribbonmenu ()
public function integer of_rebuildribbon (menu a_menu)
public function integer of_setgroupfont (string as_font)
public function integer of_settabfont (string as_font)
public function integer of_setitemfont (string as_font)
public function integer of_setfont (string as_font)
public function integer of_setgrouptextcolor (long al_color)
public function integer of_settabtextcolor (long al_color)
public function integer of_setitemtextcolor (long al_color)
public function integer of_settextcolor (long al_color)
public function integer of_buildquickaccess (menu a_menu)
public function integer of_righttoleft (boolean ab_switch)
private function integer of_showmenu ()
private function integer of_hidemenu (menu l_menu)
private function integer of_showmenu (menu l_menu)
public function integer of_showtoplevelmenu (ref menu a_menu, boolean ab_visible, boolean ab_rebuild)
public function integer of_rebuildribbon (menu a_menu, boolean ab_keepcurrenttabselected)
public function integer of_rebuildribbon (boolean ab_keepcurrenttabselected)
public function integer of_cancelalt ()
public function boolean of_altkeypressed ()
public function boolean of_altletterkeypressed ()
public function integer of_dockribbon ()
public function boolean of_registerhotkey ()
public function integer of_disablealthotkey (boolean ab_switch)
public function integer changemenu (ref menu m, boolean redraw)
public function integer changemenu (ref menu m, integer w, boolean redraw)
public function integer of_hidestatusbar ()
public function integer of_showstatusbar ()
public function integer of_setstatus (string as_status)
public function integer of_statuspop ()
public function integer of_statuspush (string as_status)
public function integer of_setstatuspanel (string as_text, integer ai_panel)
public function integer of_hideribbongroup ()
public function integer of_showribbongroup ()
public function integer changemenu (ref menu m)
public function integer of_showloadingcircle (boolean ab_switch)
public function integer of_buildribbon (menu a_menu)
public function n_ribbonwindow of_getnvo ()
public function integer of_setstyle (integer ai_style)
public function integer of_displayprogramtab ()
public function u_cst_ribbonmenuadvanced of_ribbonmenuadvanced ()
public function integer of_closeadvancedmenu ()
public function integer of_enabletoplevelmenu (menu a_menu, boolean ab_enabled)
end prototypes

event uspbalthotkey;IF IsValid(of_GetNVO()) THEN of_GetNVO().USPBAltHotKey()
end event

private function integer of_hidemenu ();IF NOT IsValid(of_GetNVO()) THEN RETURN 0

RETURN of_GetNVO().of_HideMenu()
end function

public function integer workspaceheight ();Long ll_status

IF uo_ribbonstatusbar.Visible THEN ll_status = uo_ribbonstatusbar.Height
RETURN super::WorkSpaceHeight() - WorkSpaceY() - 8 - ll_status
end function

public function integer workspacey ();IF NOT IsValid(uo_ribbon) THEN
	RETURN super::workspacey()
ELSE
	RETURN uo_ribbon.of_GetHeight()  + uo_ribbon.Y
END IF
end function

private function integer of_buildribbon ();IF NOT IsValid(of_GetNVO()) THEN RETURN 0

RETURN of_GetNVO().of_BuildRibbon()
end function

private function string of_convertkeytoletter (keycode akc_key);IF NOT IsValid(of_GetNVO()) THEN RETURN ""

RETURN of_GetNVO().of_ConvertKeyToLetter(akc_key)
end function

public function boolean of_isribbondocked ();IF NOT IsValid(of_GetNVO()) THEN RETURN FALSE

RETURN of_GetNVO().of_IsRibbonDocked()
end function

public function integer of_undockribbon ();IF NOT IsValid(of_GetNVO()) THEN RETURN 0

RETURN of_GetNVO().of_UndockRibbon()
end function

public function integer workspacewidth ();IF NOT IsValid(uo_ribbon) THEN
	RETURN super::workspacewidth()
ELSE
	RETURN uo_ribbon.Width + 10
END IF
end function

public function integer workspacex ();IF NOT IsValid(uo_ribbon) THEN
	RETURN super::workspacex()
ELSE
	RETURN uo_ribbon.X
END IF
end function

public function string of_removeampersand (string as_text);IF NOT IsValid(of_GetNVO()) THEN RETURN ""

RETURN of_GetNVO().of_RemoveAmpersand(as_text)
end function

public function integer of_buildquickaccess ();IF NOT IsValid(of_GetNVO()) THEN RETURN 0

RETURN of_GetNVO().of_BuildQuickAccess()
end function

public function integer of_rebuildribbon ();IF NOT IsValid(of_GetNVO()) THEN RETURN 0

RETURN of_GetNVO().of_RebuildRibbon()
end function

public function integer changemenu (ref menu m, integer w);IF NOT FullyInitialized THEN RETURN SUPER::ChangeMenu(m, w)

Long ll_return

SetRedraw(FALSE)

ll_return = super::ChangeMenu(m, w)

of_RebuildRibbon(m)

SetRedraw(TRUE)

RETURN ll_return
end function

public function integer of_settheme (string as_theme);IF NOT IsValid(of_GetNVO()) THEN RETURN 0

RETURN of_GetNVO().of_SetTheme(as_theme)
end function

public function integer of_displayprogramtab (string as_image);IF NOT IsValid(of_GetNVO()) THEN RETURN 0

RETURN of_GetNVO().of_DisplayProgramTab(as_image)
end function

public function u_cst_ribbonmenu of_ribbonmenu ();IF NOT IsValid(of_GetNVO()) THEN RETURN uo_ribbonmenu

RETURN of_GetNVO().of_RibbonMenu()
end function

public function integer of_rebuildribbon (menu a_menu);IF NOT IsValid(of_GetNVO()) THEN RETURN 0

RETURN of_GetNVO().of_RebuildRibbon(a_menu)
end function

public function integer of_setgroupfont (string as_font);IF NOT IsValid(of_GetNVO()) THEN RETURN 0

RETURN of_GetNVO().of_SetGroupFont(as_font)
end function

public function integer of_settabfont (string as_font);IF NOT IsValid(of_GetNVO()) THEN RETURN 0

RETURN of_GetNVO().of_SetTabFont(as_font)
end function

public function integer of_setitemfont (string as_font);IF NOT IsValid(of_GetNVO()) THEN RETURN 0

RETURN of_GetNVO().of_SetItemFont(as_font)
end function

public function integer of_setfont (string as_font);IF NOT IsValid(of_GetNVO()) THEN RETURN 0

RETURN of_GetNVO().of_SetFont(as_font)
end function

public function integer of_setgrouptextcolor (long al_color);IF NOT IsValid(of_GetNVO()) THEN RETURN 0

RETURN of_GetNVO().of_SetGroupTextColor(al_color)
end function

public function integer of_settabtextcolor (long al_color);IF NOT IsValid(of_GetNVO()) THEN RETURN 0

RETURN of_GetNVO().of_SetTabTextColor(al_color)
end function

public function integer of_setitemtextcolor (long al_color);IF NOT IsValid(of_GetNVO()) THEN RETURN 0

RETURN of_GetNVO().of_SetItemTextColor(al_color)
end function

public function integer of_settextcolor (long al_color);IF NOT IsValid(of_GetNVO()) THEN RETURN 0

RETURN of_GetNVO().of_SetTextColor(al_color)
end function

public function integer of_buildquickaccess (menu a_menu);IF NOT IsValid(of_GetNVO()) THEN RETURN 0

RETURN of_GetNVO().of_BuildQuickAccess(a_menu)
end function

public function integer of_righttoleft (boolean ab_switch);IF NOT IsValid(of_GetNVO()) THEN RETURN 0

RETURN of_GetNVO().of_RightToLeft(ab_switch)
end function

private function integer of_showmenu ();IF NOT IsValid(of_GetNVO()) THEN RETURN 0

RETURN of_GetNVO().of_ShowMenu()
end function

private function integer of_hidemenu (menu l_menu);IF NOT IsValid(of_GetNVO()) THEN RETURN 0

RETURN of_GetNVO().of_HideMenu(l_menu)
end function

private function integer of_showmenu (menu l_menu);IF NOT IsValid(of_GetNVO()) THEN RETURN 0

RETURN of_GetNVO().of_ShowMenu(l_menu)
end function

public function integer of_showtoplevelmenu (ref menu a_menu, boolean ab_visible, boolean ab_rebuild);IF NOT IsValid(of_GetNVO()) THEN RETURN 0

RETURN of_GetNVO().of_ShowTopLevelMenu(a_menu, ab_visible, ab_rebuild)
end function

public function integer of_rebuildribbon (menu a_menu, boolean ab_keepcurrenttabselected);IF NOT IsValid(of_GetNVO()) THEN RETURN 0

RETURN of_GetNVO().of_RebuildRibbon(a_menu, ab_keepcurrenttabselected)
end function

public function integer of_rebuildribbon (boolean ab_keepcurrenttabselected);IF NOT IsValid(of_GetNVO()) THEN RETURN 0

RETURN of_GetNVO().of_RebuildRibbon(ab_keepcurrenttabselected)
end function

public function integer of_cancelalt ();IF NOT IsValid(of_GetNVO()) THEN RETURN 0

RETURN of_GetNVO().of_CancelAlt()
end function

public function boolean of_altkeypressed ();IF NOT IsValid(of_GetNVO()) THEN RETURN FALSE

RETURN of_GetNVO().of_AltKeyPressed()
end function

public function boolean of_altletterkeypressed ();IF NOT IsValid(of_GetNVO()) THEN RETURN FALSE

RETURN of_GetNVO().of_ALTLetterKeyPressed()
end function

public function integer of_dockribbon ();IF NOT IsValid(of_GetNVO()) THEN RETURN 0

RETURN of_GetNVO().of_DockRibbon()

end function

public function boolean of_registerhotkey ();IF NOT IsValid(of_GetNVO()) THEN RETURN FALSE

RETURN of_GetNVO().of_RegisterHotKey()
end function

public function integer of_disablealthotkey (boolean ab_switch);IF NOT IsValid(of_GetNVO()) THEN RETURN 0

RETURN of_GetNVO().of_DisableAltHotKey(ab_switch)
end function

public function integer changemenu (ref menu m, boolean redraw);IF NOT FullyInitialized THEN RETURN SUPER::ChangeMenu(m)

Long ll_return

IF redraw THEN SetRedraw(FALSE)

ll_return = super::ChangeMenu(m)

of_RebuildRibbon(m)

IF redraw THEN SetRedraw(TRUE)

RETURN ll_return
end function

public function integer changemenu (ref menu m, integer w, boolean redraw);IF NOT FullyInitialized THEN RETURN SUPER::ChangeMenu(m, w)

Long ll_return

IF redraw THEN SetRedraw(FALSE)

ll_return = super::ChangeMenu(m, w)

of_RebuildRibbon(m)

IF redraw THEN SetRedraw(TRUE)

RETURN ll_return
end function

public function integer of_hidestatusbar ();IF NOT IsValid(of_GetNVO()) THEN RETURN 0

RETURN of_GetNVO().of_HideStatusBar()
end function

public function integer of_showstatusbar ();IF NOT IsValid(of_GetNVO()) THEN RETURN 0

RETURN of_GetNVO().of_ShowStatusBar()
end function

public function integer of_setstatus (string as_status);IF NOT IsValid(of_GetNVO()) THEN RETURN 0

RETURN of_GetNVO().of_SetStatus(as_status)
end function

public function integer of_statuspop ();IF NOT IsValid(of_GetNVO()) THEN RETURN 0

RETURN of_GetNVO().of_StatusPop()
end function

public function integer of_statuspush (string as_status);IF NOT IsValid(of_GetNVO()) THEN RETURN 0

RETURN of_GetNVO().of_StatusPush(as_status)
end function

public function integer of_setstatuspanel (string as_text, integer ai_panel);IF NOT IsValid(of_GetNVO()) THEN RETURN 0

RETURN of_GetNVO().of_SetStatusPanel(as_text, ai_panel)
end function

public function integer of_hideribbongroup ();IF NOT IsValid(of_GetNVO()) THEN RETURN 0

RETURN of_GetNVO().of_HideRibbonGroup()
end function

public function integer of_showribbongroup ();IF NOT IsValid(of_GetNVO()) THEN RETURN 0

RETURN of_GetNVO().of_ShowRibbonGroup()
end function

public function integer changemenu (ref menu m);IF NOT FullyInitialized THEN RETURN SUPER::ChangeMenu(m)

Long ll_return

SetRedraw(FALSE)

ll_return = SUPER::ChangeMenu(m)

of_RebuildRibbon(m)

SetRedraw(TRUE)

RETURN ll_return
end function

public function integer of_showloadingcircle (boolean ab_switch);IF NOT IsValid(of_GetNVO()) THEN RETURN 0

RETURN of_GetNVO().of_ShowLoadingCircle(ab_switch)
end function

public function integer of_buildribbon (menu a_menu);IF NOT IsValid(of_GetNVO()) THEN RETURN 0

RETURN of_GetNVO().of_BuildRibbon(a_menu)
end function

public function n_ribbonwindow of_getnvo ();RETURN in_ribbonwindow
end function

public function integer of_setstyle (integer ai_style);IF NOT IsValid(of_GetNVO()) THEN RETURN 0

RETURN of_GetNVO().of_SetStyle(ai_style)
end function

public function integer of_displayprogramtab ();IF NOT IsValid(of_GetNVO()) THEN RETURN 0

RETURN of_GetNVO().of_DisplayProgramTab()
end function

public function u_cst_ribbonmenuadvanced of_ribbonmenuadvanced ();IF NOT IsValid(of_GetNVO()) THEN RETURN uo_ribbonmenuadvanced

AdvancedMenu = TRUE
RETURN of_GetNVO().of_RibbonMenuAdvanced()
end function

public function integer of_closeadvancedmenu ();uo_ribbonmenuadvanced.Hide()
RETURN 1
end function

public function integer of_enabletoplevelmenu (menu a_menu, boolean ab_enabled);IF NOT IsValid(of_GetNVO()) THEN RETURN 0

RETURN of_GetNVO().of_EnableTopLevelMenu(a_menu, ab_enabled)
end function

on w_ribbonwindow.create
int iCurrent
call super::create
this.st_uspb_ribbon_label=create st_uspb_ribbon_label
this.sle_ribbonwindowfocuscontrol=create sle_ribbonwindowfocuscontrol
this.uo_ribbonmenu=create uo_ribbonmenu
this.uo_ribbon=create uo_ribbon
this.uo_ribbonstatusbar=create uo_ribbonstatusbar
this.uo_ribbonmenuadvanced=create uo_ribbonmenuadvanced
this.inv_win32=create inv_win32
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.st_uspb_ribbon_label
this.Control[iCurrent+2]=this.sle_ribbonwindowfocuscontrol
this.Control[iCurrent+3]=this.uo_ribbonmenu
this.Control[iCurrent+4]=this.uo_ribbon
this.Control[iCurrent+5]=this.uo_ribbonstatusbar
this.Control[iCurrent+6]=this.uo_ribbonmenuadvanced
end on

on w_ribbonwindow.destroy
call super::destroy
destroy(this.st_uspb_ribbon_label)
destroy(this.sle_ribbonwindowfocuscontrol)
destroy(this.uo_ribbonmenu)
destroy(this.uo_ribbon)
destroy(this.uo_ribbonstatusbar)
destroy(this.uo_ribbonmenuadvanced)
destroy(this.inv_win32)
end on

event open;call super::open;IF NOT IsValid(of_GetNVO()) THEN
	in_ribbonwindow = CREATE n_ribbonwindow

	of_GetNVO().of_SetRibbonWindow(THIS)
	of_GetNVO().Open()
	
	FullyInitialized = TRUE
END IF


end event

event mouseup;call super::mouseup;IF IsValid(of_GetNVO())  THEN of_GetNVO().MouseUp()
RETURN 1
end event

event close;call super::close;IF NOT Advanced  AND IsValid(of_GetNVO()) THEN of_GetNVO().Close()
DESTROY in_ribbonwindow

end event

event resize;call super::resize;IF NOT Advanced AND IsValid(of_GetNVO()) THEN of_GetNVO().Resize(sizetype, newwidth, newheight)
end event

type st_uspb_ribbon_label from statictext within w_ribbonwindow
integer width = 10002
integer height = 512
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 16777215
long backcolor = 8421376
string text = "  Ribbon"
boolean focusrectangle = false
end type

event constructor;THIS.Hide()
end event

type sle_ribbonwindowfocuscontrol from singlelineedit within w_ribbonwindow
event key pbm_keydown
event keyup pbm_keyup
event systemkey pbm_syskeydown
boolean visible = false
integer x = 37
integer y = 1328
integer width = 402
integer height = 112
integer taborder = 20
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
string text = "none"
borderstyle borderstyle = stylelowered!
end type

event key;of_GetNVO().FocusKey(key)
end event

event losefocus;IF IsValid(of_GetNVO()) THEN of_GetNVO().FocusLoseFocus(THIS)

end event

type uo_ribbonmenu from u_cst_ribbonmenu within w_ribbonwindow
boolean visible = false
integer x = 9
integer y = 176
integer taborder = 20
end type

on uo_ribbonmenu.destroy
call u_cst_ribbonmenu::destroy
end on

type uo_ribbon from u_cst_ribboncontainer within w_ribbonwindow
event key pbm_keydown
integer x = 9
integer height = 436
integer taborder = 20
end type

on uo_ribbon.destroy
call u_cst_ribboncontainer::destroy
end on

event ue_programtabclicked;call super::ue_programtabclicked;of_GetNVO().ProgramTabClicked()
end event

event wm_mousewheel;call super::wm_mousewheel; IF IsValid(of_GetNVO()) THEN of_GetNVO().RibbonOther(wparam, lparam)
end event

type uo_ribbonstatusbar from u_cst_ribbonstatusbar within w_ribbonwindow
integer y = 1456
integer taborder = 20
boolean bringtotop = true
end type

on uo_ribbonstatusbar.destroy
call u_cst_ribbonstatusbar::destroy
end on

type uo_ribbonmenuadvanced from u_cst_ribbonmenuadvanced within w_ribbonwindow
boolean visible = false
integer width = 9
integer height = 12
integer taborder = 30
boolean bringtotop = true
end type

on uo_ribbonmenuadvanced.destroy
call u_cst_ribbonmenuadvanced::destroy
end on

type inv_win32 from n_cst_win32 within w_ribbonwindow descriptor "pb_nvo" = "true" 
end type

on inv_win32.create
call super::create
end on

on inv_win32.destroy
call super::destroy
end on

