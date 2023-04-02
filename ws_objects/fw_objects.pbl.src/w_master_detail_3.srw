$PBExportHeader$w_master_detail_3.srw
$PBExportComments$master detail ancestor window with two data window and update two table ( master and detail), enhanced model
forward
global type w_master_detail_3 from window
end type
type tab1 from tab within w_master_detail_3
end type
type page1 from userobject within tab1
end type
type dw_master from datawindow within page1
end type
type page1 from userobject within tab1
dw_master dw_master
end type
type page2 from userobject within tab1
end type
type cb_det1_del from commandbutton within page2
end type
type cb_det1_add from commandbutton within page2
end type
type dw_detail_1 from datawindow within page2
end type
type page2 from userobject within tab1
cb_det1_del cb_det1_del
cb_det1_add cb_det1_add
dw_detail_1 dw_detail_1
end type
type page3 from userobject within tab1
end type
type cb_det2_del from commandbutton within page3
end type
type cb_det2_add from commandbutton within page3
end type
type dw_detail_2 from datawindow within page3
end type
type page3 from userobject within tab1
cb_det2_del cb_det2_del
cb_det2_add cb_det2_add
dw_detail_2 dw_detail_2
end type
type tab1 from tab within w_master_detail_3
page1 page1
page2 page2
page3 page3
end type
type uo_buttons from uo_std_buttons within w_master_detail_3
end type
type gb_3 from groupbox within w_master_detail_3
end type
end forward

global type w_master_detail_3 from window
integer width = 3008
integer height = 2404
boolean titlebar = true
string title = "Untitled"
boolean controlmenu = true
long backcolor = 67108864
string icon = "AppIcon!"
boolean center = true
event ue_delete ( )
event ue_first ( )
event ue_last ( )
event ue_next ( )
event ue_prev ( )
event ue_retrieve_detail ( long l_row )
event ue_print ( )
event ue_add_cancel ( )
event ue_close ( )
event ue_display ( )
event ue_edit_save ( )
event ue_query_display ( )
event ue_update ( )
tab1 tab1
uo_buttons uo_buttons
gb_3 gb_3
end type
global w_master_detail_3 w_master_detail_3

type prototypes
function boolean PeekMessageA( ref blob lpMsg, long hWnd, UINT uMsgFilterMin, UINT uMsgFilterMax, UINT wRemoveMsg ) LIBRARY "user32.dll" 
end prototypes

type variables
string &
	is_mode
boolean &
	ib_query, ib_fake_insert
s_control_setting &
	istr_control_setting[], istr_control_setting_clear[]
long &
	il_currow

end variables

forward prototypes
public subroutine wf_custom_edit ()
public subroutine wf_add ()
public function string wf_post_add ()
public function string wf_post_edit ()
public subroutine wf_post_update ()
public function string wf_pre_add ()
public function string wf_pre_edit ()
public subroutine wf_pre_update ()
public function string wf_check_fields ()
public function string wf_check_delete ()
public function string wf_delete ()
public function string wf_check_edit ()
public subroutine wf_post_display ()
public function boolean wf_updatemore ()
public subroutine wf_control_query ()
public subroutine wf_control_query_orig ()
public subroutine wf_post_query ()
end prototypes

event ue_delete();integer 		li_delconf
string 		ls_errmsg
long			ll_currow


if is_mode = "display" then
	ll_currow = tab1.page1.dw_master.getrow()
	ls_errmsg = wf_check_delete() 
	if  ls_errmsg = ""then
		if f_check_access( this.tag, gs_userid, "group_delete") then
			li_delconf = messagebox( "Delete Record", "Are you sure?", &
				exclamation!,yesno!)
			if li_delconf = 1 then
				// check success or not, 
				// becareful empty string mean not success
				ls_errmsg = wf_delete()
				if ls_errmsg = "" then
					messagebox( "Delete", "Delete Fail")
				else
					tab1.page1.dw_master.reselectrow( ll_currow)
					messagebox( "Delete", ls_errmsg)
				end if
			end if
		else
			messagebox( "Delete", "You don't have rights to delete")
		end if
	else
		messagebox( "Delete", ls_errmsg)
	end if
end if
end event

event ue_first();if is_mode = "display" then
	tab1.page1.dw_master.scrolltorow( 1)
	il_currow = tab1.page1.dw_master.getrow()
end if
end event

event ue_last();if is_mode = "display" then
	tab1.page1.dw_master.scrolltorow(tab1.page1.dw_master.rowcount( ))
	il_currow = tab1.page1.dw_master.getrow()
end if
end event

event ue_next();if is_mode = "display" then
	tab1.page1.dw_master.scrollnextrow( )
	il_currow = tab1.page1.dw_master.getrow()
end if
end event

event ue_prev();if is_mode = "display" then
	tab1.page1.dw_master.scrollpriorrow( )
	il_currow = tab1.page1.dw_master.getrow()
end if
end event

event ue_retrieve_detail(long l_row);//
// add script retrieve detail data
//
end event

event ue_print();//
end event

event ue_add_cancel();string &
	ls_errmsg

if is_mode = "display" then
	// check add rights
	if f_check_access( this.tag, gs_userid, "group_add") then 
		is_mode = "add"
		
		ls_errmsg = wf_pre_add()
		if  ls_errmsg <> "" then
			messagebox( "Error Pre Add", ls_errmsg)
			this.postevent( "ue_display")
			return
		end if
		
		this.setredraw( false)	
		uo_buttons.cb_add_cancel.text = "&Cancel (F1)"
		uo_buttons.cb_edit_save.text = "&Save (F4)"
		uo_buttons.cb_query_display.visible = false
		uo_buttons.cb_delete.visible = false
		uo_buttons.cb_print.visible = false
		uo_buttons.cb_close.visible = false
		uo_buttons.cb_first.visible = false
		uo_buttons.cb_prev.visible = false
		uo_buttons.cb_next.visible = false
		uo_buttons.cb_last.visible = false	
		tab1.page2.cb_det1_add.visible = true
		tab1.page2.cb_det1_del.visible = true
		tab1.page3.cb_det2_add.visible = true
		tab1.page3.cb_det2_del.visible = true
		f_enable_fields( tab1.page1.dw_master, true)
		f_enable_fields( tab1.page2.dw_detail_1, true)
		f_enable_fields( tab1.page3.dw_detail_2, true)
		this.setredraw( true)
		
		il_currow = tab1.page1.dw_master.insertrow(0)
		tab1.page1.dw_master.scrolltorow( il_currow)
		tab1.page1.dw_master.setfocus()
		tab1.page2.dw_detail_1.reset()
		tab1.page3.dw_detail_2.reset()
		
		ls_errmsg = wf_post_add()
		if  ls_errmsg <> "" then
			messagebox( "Error Post Add", ls_errmsg)
			this.postevent( "ue_display")
			return
		end if
	else
		messagebox( "Add Record", "You don't have rights to add record")
	end if
else
	if is_mode = "add" then
		tab1.page1.dw_master.deleterow(0)
		tab1.page2.dw_detail_1.reset()
		tab1.page3.dw_detail_2.reset()
	end if	
	if is_mode = "add" or is_mode = "edit" then
		this.postevent( "ue_display")	
		this.postevent( "ue_retrieve_detail", 0, tab1.page1.dw_master.getrow())		
	end if
end if	

end event

event ue_close();integer		li_close_conf

if is_mode = "display" then
	li_close_conf= messagebox( "Close " + this.title, "Are you sure?", &
		exclamation!,yesno!)
	if li_close_conf = 1 then
		close( this)
	end if
end if
end event

event ue_display();long &
	ll_rowcount, i
	
this.setredraw ( false)

// jika cancel pada saat edit
// kembalikan nilai asal
if is_mode = "edit" then
	tab1.page1.dw_master.reselectrow(tab1.page1.dw_master.getrow())
	this.postevent( "ue_retrieve_detail",0, tab1.page1.dw_master.getrow())	
end if

is_mode = "display"

uo_buttons.cb_add_cancel.text = "&Add (F1)"
uo_buttons.cb_edit_save.text = "&Edit (F4)"
uo_buttons.cb_query_display.text = "&Query (F2)"
uo_buttons.cb_add_cancel.visible = true
uo_buttons.cb_edit_save.visible = true
uo_buttons.cb_query_display.visible = true
uo_buttons.cb_delete.visible = true
uo_buttons.cb_print.visible = true
uo_buttons.cb_close.visible = true
uo_buttons.cb_first.visible = true
uo_buttons.cb_prev.visible = true
uo_buttons.cb_next.visible = true
uo_buttons.cb_last.visible = true

tab1.page2.cb_det1_add.visible = false
tab1.page2.cb_det1_del.visible = false
tab1.page3.cb_det2_add.visible = false
tab1.page3.cb_det2_del.visible = false

f_enable_fields( tab1.page1.dw_master, false)
f_enable_fields( tab1.page2.dw_detail_1, false)
f_enable_fields( tab1.page3.dw_detail_2, false)

if ib_query then
	ib_query = false
	tab1.page1.dw_master.retrieve()
	wf_control_query_orig( )		
	tab1.page1.dw_master.modify("datawindow.queryclear = yes")
	tab1.page1.dw_master.modify("datawindow.querymode = no")
end if

if tab1.page1.dw_master.rowcount() = 0 then
	tab1.page1.dw_master.insertrow(0)
	ib_fake_insert = true
else
	ib_fake_insert = false
end if

this.wf_post_display()

this.setredraw( true)


end event

event ue_edit_save();string		ls_errmsg

this.setredraw( false)

if is_mode = "display" then	
	if f_check_access( this.tag, gs_userid, "group_modify") then

		ls_errmsg = wf_pre_edit()
		if  ls_errmsg <> "" then
			messagebox( "Error Pre Edit", ls_errmsg)
			this.postevent( "ue_display")
			return
		end if

		ls_errmsg = wf_check_edit()
		if  trim( ls_errmsg) = "" then
			is_mode = "edit"
			
			uo_buttons.cb_add_cancel.text = "&Cancel (F1)"
			uo_buttons.cb_edit_save.text = "&Save (F4)"
			uo_buttons.cb_query_display.visible = false
			uo_buttons.cb_delete.visible = false
			uo_buttons.cb_print.visible = false
			uo_buttons.cb_close.visible = false
			uo_buttons.cb_first.visible = false
			uo_buttons.cb_prev.visible = false
			uo_buttons.cb_next.visible = false
			uo_buttons.cb_last.visible = false
			tab1.page2.cb_det1_add.visible = true
			tab1.page2.cb_det1_del.visible = true
			tab1.page3.cb_det2_add.visible = true
			tab1.page3.cb_det2_del.visible = true
		
			f_enable_fields( tab1.page1.dw_master, true)
			f_enable_fields( tab1.page2.dw_detail_1, true)
			f_enable_fields( tab1.page3.dw_detail_2, true)
			
			il_currow = tab1.page1.dw_master.getrow()
		else
			messagebox( "Error Edit", ls_errmsg)
			this.setredraw( true)
			return
		end if
		
		ls_errmsg = wf_post_edit()
		if  ls_errmsg <> "" then
			messagebox( "Error Post Edit", ls_errmsg)
			this.postevent( "ue_display")
			return
		end if

	else
		messagebox( "Edit record", "You don't have rights to modify")
	end if
else
	if is_mode = "edit" or is_mode = "add" then
		this.triggerevent( "ue_update")
	end if
end if
	
this.setredraw( true)



end event

event ue_query_display();this.setredraw( false)
if is_mode = "display" then
	is_mode = "query"
	ib_query = true
	uo_buttons.cb_query_display.text = "&Display (F2)"
	uo_buttons.cb_add_cancel.visible = false
	uo_buttons.cb_edit_save.visible = false
	uo_buttons.cb_delete.visible = false
	uo_buttons.cb_print.visible = false
	uo_buttons.cb_close.visible = false
	uo_buttons.cb_first.visible = false
	uo_buttons.cb_prev.visible = false
	uo_buttons.cb_next.visible = false
	uo_buttons.cb_last.visible = false
	
	tab1.page1.dw_master.reset()
	tab1.page2.dw_detail_1.reset()
	tab1.page3.dw_detail_2.reset()
	f_enable_fields( tab1.page1.dw_master, true)
	tab1.page1.dw_master.object.datawindow.querymode = "yes"
	wf_control_query( )
	tab1.page1.dw_master.setfocus()
	wf_post_query()	
else
	if is_mode = "query" then	
		tab1.page1.dw_master.accepttext()
		this.triggerevent( "ue_display")
	end if
end if
this.setredraw( true)
end event

event ue_update();long &
	ll_currow, ll_rowcount, n
string &
	ls_errmsg

tab1.page1.dw_master.accepttext()
tab1.page2.dw_detail_1.accepttext()
tab1.page3.dw_detail_2.accepttext()

// check fields
ls_errmsg = wf_check_fields()

if ls_errmsg <> "" then
	messagebox( "Error field", ls_errmsg)
	return
end if

this.wf_pre_update()

if tab1.page1.dw_master.Update() = 1  then
	if tab1.page2.dw_detail_1.update() = 1 then
		if tab1.page3.dw_detail_2.update() = 1 then
			if wf_updatemore() then
				commit;
				this.wf_post_update()
				this.postevent( "ue_display")
				messagebox( "Update", "Data Updated")
			else
				rollback;
				messagebox( "Update", "Update Fail")		
			end if
		else
			rollback;
			messagebox( "Update", "Update Fail")	
		end if
	else
		rollback;
		messagebox( "Update", "Update Fail")		
	end if
else
	rollback;
	messagebox( "Update", "Update Fail")
end if


end event

public subroutine wf_custom_edit ();//
// add more edit script here
//
end subroutine

public subroutine wf_add ();//
//
//
end subroutine

public function string wf_post_add ();return ""
end function

public function string wf_post_edit ();return ""
end function

public subroutine wf_post_update ();//
//  add post update script here
//

end subroutine

public function string wf_pre_add ();return ""
end function

public function string wf_pre_edit ();return ""
end function

public subroutine wf_pre_update ();//
// add script here
//
end subroutine

public function string wf_check_fields ();return ""

end function

public function string wf_check_delete ();return ""
end function

public function string wf_delete ();return ""
end function

public function string wf_check_edit ();return ""
end function

public subroutine wf_post_display ();//
//
//
end subroutine

public function boolean wf_updatemore ();return true
end function

public subroutine wf_control_query ();long &
	n, ll_fields_count, ll_row, ll_tab_seq

ll_row = tab1.page1.dw_master.getrow()

ll_fields_count = long(tab1.page1.dw_master.Describe("datawindow.Column.Count"))

istr_control_setting = istr_control_setting_clear

// save current column setting
for n = 1 to ll_fields_count
	istr_control_setting[n].backcolor = tab1.page1.dw_master.describe( "#"+string( n)+".background.color")
	istr_control_setting[n].taborder = tab1.page1.dw_master.describe( "#"+string( n)+".tabsequence")
	istr_control_setting[n].backmode = tab1.page1.dw_master.describe( "#"+string( n)+".background.mode")
next

// change setting
for n = 1 to ll_fields_count
	ll_tab_seq = n * 10
	tab1.page1.dw_master.modify( "#"+string( n)+".tabsequence=" + string( ll_tab_seq))
	tab1.page1.dw_master.modify( "#"+string( n)+".background.mode=0")
	tab1.page1.dw_master.modify( "#"+string( n)+".background.color=134217752")	
next

tab1.page1.dw_master.scrolltorow( ll_row)


end subroutine

public subroutine wf_control_query_orig ();
long &
	n, ll_fields_count, ll_row
string &
	ls_test

ll_row = tab1.page1.dw_master.getrow()

ll_fields_count = long(tab1.page1.dw_master.Describe("datawindow.Column.Count"))

// change setting
for n = 1 to ll_fields_count	
	tab1.page1.dw_master.modify( "#"+string( n)+".tabsequence=" + istr_control_setting[n].taborder )
	tab1.page1.dw_master.modify( "#"+string( n)+".background.mode=" + istr_control_setting[n].backmode)
	tab1.page1.dw_master.modify( "#"+string( n)+".background.color=" + istr_control_setting[n].backcolor)	
next

tab1.page1.dw_master.scrolltorow( ll_row)


end subroutine

public subroutine wf_post_query ();// 

end subroutine

on w_master_detail_3.create
this.tab1=create tab1
this.uo_buttons=create uo_buttons
this.gb_3=create gb_3
this.Control[]={this.tab1,&
this.uo_buttons,&
this.gb_3}
end on

on w_master_detail_3.destroy
destroy(this.tab1)
destroy(this.uo_buttons)
destroy(this.gb_3)
end on

event open;//f_set_window_pos( this)

// set transaction data window object
tab1.page1.dw_master.settransobject(sqlca)
tab1.page2.dw_detail_1.settransobject(sqlca)
tab1.page3.dw_detail_2.settransobject(sqlca)

// put in display mode
this.postevent( "ue_display")

ib_query = false

tab1.page2.dw_detail_1.SetRowFocusIndicator(focusrect!)
tab1.page3.dw_detail_2.SetRowFocusIndicator(focusrect!)
end event

type tab1 from tab within w_master_detail_3
integer x = 37
integer y = 32
integer width = 2898
integer height = 1932
integer taborder = 110
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
long backcolor = 67108864
boolean raggedright = true
boolean focusonbuttondown = true
integer selectedtab = 1
page1 page1
page2 page2
page3 page3
end type

on tab1.create
this.page1=create page1
this.page2=create page2
this.page3=create page3
this.Control[]={this.page1,&
this.page2,&
this.page3}
end on

on tab1.destroy
destroy(this.page1)
destroy(this.page2)
destroy(this.page3)
end on

type page1 from userobject within tab1
event create ( )
event destroy ( )
integer x = 18
integer y = 100
integer width = 2862
integer height = 1816
long backcolor = 67108864
string text = "Master"
long tabtextcolor = 33554432
long picturemaskcolor = 536870912
dw_master dw_master
end type

on page1.create
this.dw_master=create dw_master
this.Control[]={this.dw_master}
end on

on page1.destroy
destroy(this.dw_master)
end on

type dw_master from datawindow within page1
event ue_dwnkey pbm_dwnkey
event ue_nomousescroll pbm_vscroll
integer x = 23
integer y = 32
integer width = 2807
integer height = 1760
integer taborder = 70
string title = "none"
boolean border = false
boolean livescroll = true
end type

event ue_dwnkey;if key = KeyPageUp! or &
	key = KeyPageDown! or &
	key = KeyEnd! or &
	key = KeyHome! or &
	key = KeyLeftArrow! or &
	key = KeyUpArrow! or &
	key = KeyRightArrow! or &
	key = KeyDownArrow! then
	return 1
end if

/* blok ini untuk mencegah multiline object salah focus*/
blob {28} Msg
if NOT KeyDown(KeyControl!) and key=KeyEnter! then
    PeekMessageA( Msg,0,256,264,1)
    message.processed = TRUE
    message.returnvalue = 0

    Send(Handle(this),256,9,Long(0,0))
    return 1
end if 
end event

event ue_nomousescroll;// prevent vertical scrolling
return 1 
end event

event rowfocuschanged;tab1.getparent( ).postevent( "ue_retrieve_detail",0, currentrow)
if currentrow <> il_currow and &
	is_mode <> "display" and &  
	il_currow <> 0 then // no current row
	
	this.scrolltorow( il_currow)
end if

end event

type page2 from userobject within tab1
event create ( )
event destroy ( )
integer x = 18
integer y = 100
integer width = 2862
integer height = 1816
long backcolor = 67108864
string text = "Detail"
long tabtextcolor = 33554432
long picturemaskcolor = 536870912
cb_det1_del cb_det1_del
cb_det1_add cb_det1_add
dw_detail_1 dw_detail_1
end type

on page2.create
this.cb_det1_del=create cb_det1_del
this.cb_det1_add=create cb_det1_add
this.dw_detail_1=create dw_detail_1
this.Control[]={this.cb_det1_del,&
this.cb_det1_add,&
this.dw_detail_1}
end on

on page2.destroy
destroy(this.cb_det1_del)
destroy(this.cb_det1_add)
destroy(this.dw_detail_1)
end on

type cb_det1_del from commandbutton within page2
boolean visible = false
integer x = 434
integer y = 1108
integer width = 352
integer height = 100
integer taborder = 60
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
string text = "&Delete Row"
end type

event clicked;integer &
	li_msgconf

li_msgconf = messagebox( "Delete", "Delete row number " + string(dw_detail_1.getrow()) + " ?", question!,yesno!)

if li_msgconf = 1 then
	dw_detail_1.deleterow(0)
	dw_detail_1.setfocus()
end if
end event

type cb_det1_add from commandbutton within page2
boolean visible = false
integer x = 32
integer y = 1108
integer width = 352
integer height = 100
integer taborder = 50
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
string text = "&Add Row"
end type

event clicked;dw_detail_1.scrolltorow( dw_detail_1.insertrow(0))
dw_detail_1.setfocus()

end event

type dw_detail_1 from datawindow within page2
event ue_key pbm_dwnprocessenter
integer x = 18
integer y = 52
integer width = 2793
integer height = 1004
integer taborder = 30
string title = "none"
boolean vscrollbar = true
boolean border = false
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event ue_key;Send (Handle (this), 256, 9, Long (0, 0))     
return 1
end event

type page3 from userobject within tab1
event create ( )
event destroy ( )
integer x = 18
integer y = 100
integer width = 2862
integer height = 1816
long backcolor = 67108864
string text = "GL"
long tabtextcolor = 33554432
long picturemaskcolor = 536870912
cb_det2_del cb_det2_del
cb_det2_add cb_det2_add
dw_detail_2 dw_detail_2
end type

on page3.create
this.cb_det2_del=create cb_det2_del
this.cb_det2_add=create cb_det2_add
this.dw_detail_2=create dw_detail_2
this.Control[]={this.cb_det2_del,&
this.cb_det2_add,&
this.dw_detail_2}
end on

on page3.destroy
destroy(this.cb_det2_del)
destroy(this.cb_det2_add)
destroy(this.dw_detail_2)
end on

type cb_det2_del from commandbutton within page3
boolean visible = false
integer x = 466
integer y = 1324
integer width = 352
integer height = 100
integer taborder = 80
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
string text = "&Delete Row"
end type

event clicked;integer &
	li_msgconf

li_msgconf = messagebox( "Delete", "Delete row number " + string(dw_detail_2.getrow()) + " ?", question!,yesno!)

if li_msgconf = 1 then
	dw_detail_2.deleterow(0)
	dw_detail_2.setfocus()
end if
end event

type cb_det2_add from commandbutton within page3
boolean visible = false
integer x = 64
integer y = 1324
integer width = 352
integer height = 100
integer taborder = 70
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
string text = "&Add Row"
end type

event clicked;dw_detail_2.scrolltorow( dw_detail_2.insertrow(0))
dw_detail_2.setfocus()

end event

type dw_detail_2 from datawindow within page3
integer x = 23
integer y = 20
integer width = 2798
integer height = 1232
integer taborder = 40
string title = "none"
boolean vscrollbar = true
boolean border = false
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type uo_buttons from uo_std_buttons within w_master_detail_3
event destroy ( )
integer x = 50
integer y = 2036
integer taborder = 30
end type

on uo_buttons.destroy
call uo_std_buttons::destroy
end on

type gb_3 from groupbox within w_master_detail_3
integer x = 37
integer y = 1988
integer width = 2898
integer height = 20
integer taborder = 100
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
end type

