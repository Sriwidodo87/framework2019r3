$PBExportHeader$w_master_1.srw
forward
global type w_master_1 from window
end type
type uo_dwnav from u_cst_dwnav within w_master_1
end type
type uo_buttons from uo_std_buttons_picture within w_master_1
end type
type dw_master from datawindow within w_master_1
end type
type gb_1 from groupbox within w_master_1
end type
end forward

global type w_master_1 from window
integer width = 4695
integer height = 1120
boolean titlebar = true
string title = "Untitled"
boolean resizable = true
windowstate windowstate = maximized!
long backcolor = 67108864
boolean center = true
event ue_display ( )
event ue_update ( )
event ue_delete ( )
event ue_first ( )
event ue_next ( )
event ue_prev ( )
event ue_last ( )
event ue_print ( )
event ue_add_cancel ( )
event ue_close ( )
event ue_key pbm_keydown
event ue_edit_save ( )
event ue_query_display ( )
uo_dwnav uo_dwnav
uo_buttons uo_buttons
dw_master dw_master
gb_1 gb_1
end type
global w_master_1 w_master_1

type prototypes
function boolean PeekMessageA( ref blob lpMsg, long hWnd, UINT uMsgFilterMin, UINT uMsgFilterMax, UINT wRemoveMsg ) LIBRARY "user32.dll" 
end prototypes

type variables
string &
	is_mode ,ls_key,ls_name
boolean &
	ib_query
s_control_setting &
	istr_control_setting[], istr_control_setting_clear[]
long &
	il_currow
	datawindow idw_list
end variables

forward prototypes
public subroutine wf_pre_update ()
public subroutine wf_post_update ()
public function string wf_pre_add ()
public function string wf_post_add ()
public function string wf_pre_edit ()
public function string wf_post_edit ()
public function string wf_check_delete ()
public function string wf_check_edit ()
public function string wf_check_fields ()
public function string wf_delete ()
public subroutine wf_control_query_orig ()
public subroutine wf_control_query ()
public subroutine wf_post_display ()
public subroutine wf_post_query ()
end prototypes

event ue_display();this.setredraw ( false)

// jika cancel pada saat edit
// kembalikan nilai asal
if is_mode = "edit" then
	dw_master.reselectrow(dw_master.getrow())
end if

is_mode = "display"

uo_buttons.cb_add_cancel.text = "&Add (F1)"
uo_buttons.cb_add_cancel.iconname="..\res\Add.png"
uo_buttons.cb_edit_save.text = "&Edit (F4)"
uo_buttons.cb_edit_save.iconname="..\res\Edit.png"
uo_buttons.cb_query_display.text = "&Query(F2)"
uo_buttons.cb_add_cancel.visible = true
uo_buttons.cb_edit_save.visible = true
uo_buttons.cb_query_display.visible = true
uo_buttons.cb_delete.visible = true
uo_buttons.cb_print.visible = true
uo_buttons.cb_close.visible = true
//uo_buttons.cb_first.visible = true
//uo_buttons.cb_prev.visible = true
//uo_buttons.cb_next.visible = true
//uo_buttons.cb_last.visible = true

f_enable_fields( dw_master, false)

if ib_query then
	ib_query = false
	dw_master.retrieve()
	if dw_master.rowcount() = 0 then
		messagebox( "Query", "No record found")
	end if
	wf_control_query_orig( )
	dw_master.modify("datawindow.queryclear = yes")
	dw_master.modify("datawindow.querymode = no")
end if

if dw_master.rowcount() = 0 then
	dw_master.insertrow(0)
end if

this.wf_post_display()

this.setredraw( true)

uo_dwnav.of_SetValueText("{currentrow} of {rowcount}" )
end event

event ue_update();long 		ll_currow
string 	ls_errmsg
dwitemstatus ls_status

dw_master.accepttext()
ls_errmsg = wf_check_fields()

if ls_errmsg <> "" then
	messagebox( "Error field", ls_errmsg)
	return
end if

this.wf_pre_update()

if dw_master.Update() = -1 then
	rollback;
	messagebox( "Update", "Update Fail")
else
	commit;
	dw_master.reselectrow( dw_master.getrow())
	this.wf_post_update()
	this.postevent( "ue_display")
	messagebox( "Update", "Data Updated")
end if

end event

event ue_delete();integer 		li_delconf
string 		ls_errmsg
long &
	ll_currow

ll_currow = dw_master.getrow()
ls_errmsg = wf_check_delete() 

if is_mode = "display" then
	if  ls_errmsg = "" then
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
					//dw_master.reselectrow( ll_currow)
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
	dw_master.scrolltorow( 1)
	il_currow = dw_master.getrow()
end if
end event

event ue_next();if is_mode = "display" then
	dw_master.scrollnextrow( )
	il_currow = dw_master.getrow()
end if
end event

event ue_prev();if is_mode = "display" then
	dw_master.scrollpriorrow( )
	il_currow = dw_master.getrow()
end if
end event

event ue_last();if is_mode = "display" then
	dw_master.scrolltorow(dw_master.rowcount( ))
	il_currow = dw_master.getrow()
end if
end event

event ue_print();//
// add script to print
//
end event

event ue_add_cancel();string &
	ls_errmsg

if is_mode = "display" then
	// check add rights
	if f_check_access( this.tag, gs_userid, "group_add") then 
		this.setredraw( false)
		is_mode = "add"
		
		ls_errmsg = wf_pre_add()
		if  ls_errmsg <> "" then
			messagebox( "Error Pre Add", ls_errmsg)
			this.postevent( "ue_display")
			return
		end if
		
		uo_buttons.cb_add_cancel.text = "&Cancel (F1)"
		uo_buttons.cb_add_cancel.iconname='../res/Cancel.png'
		uo_buttons.cb_edit_save.text = "&Save (F4)"
		uo_buttons.cb_edit_save.iconname='../res/save.png'
		uo_buttons.cb_query_display.visible = false
		uo_buttons.cb_delete.visible = false
	uo_buttons.cb_print.visible = false
		uo_buttons.cb_close.visible = false
//		uo_buttons.cb_first.visible = false
//		uo_buttons.cb_prev.visible = false
//		uo_buttons.cb_next.visible = false
//		uo_buttons.cb_last.visible = false	
//
		f_enable_fields( dw_master, true)
		
		il_currow = dw_master.insertrow(0)
		dw_master.scrolltorow( il_currow)
		dw_master.setfocus()

		ls_errmsg = wf_post_add()
		if  ls_errmsg <> "" then
			messagebox( "Error Post Add", ls_errmsg)
			this.postevent( "ue_display")
			return
		end if

		this.setredraw( true)
	else
		messagebox( "Add Record", "You don't have rights to add record")
	end if
else
	if is_mode = "add" then
		dw_master.deleterow(0)
	end if
	if is_mode = "add" or is_mode = "edit" then	
		this.postevent( "ue_display")	
	end if
end if	


end event

event ue_close();integer		li_close_conf

if is_mode = "display" then
	li_close_conf= messagebox( "Close " + this.title, "Are you sure?", &
		exclamation!,yesno!)
	if li_close_conf = 1 then
		//close(this)
		w_main.uo_powerDock.of_closeactivedocument()
	end if
end if
end event

event ue_edit_save();string &
	ls_errmsg

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
			this.setredraw( false)
			uo_buttons.cb_add_cancel.text = "&Cancel (F1)"
				uo_buttons.cb_add_cancel.iconname='..\res\cancel.png'
			uo_buttons.cb_edit_save.text = "&Save (F4)"
			uo_buttons.cb_edit_save.iconname='..\res\Save.png'
			uo_buttons.cb_query_display.visible = false
			uo_buttons.cb_delete.visible = false
		uo_buttons.cb_print.visible = false
			uo_buttons.cb_close.visible = false
//			uo_buttons.cb_first.visible = false
//			uo_buttons.cb_prev.visible = false
//			uo_buttons.cb_next.visible = false
//			uo_buttons.cb_last.visible = false	
			f_enable_fields( dw_master, true)
			
			il_currow = dw_master.getrow()

			this.setredraw( true)
		else
			messagebox( "Error Edit", ls_errmsg)
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



end event

event ue_query_display();if is_mode = "display" then
	is_mode = "query"
	ib_query = true
	this.setredraw( false)
	uo_buttons.cb_query_display.text = "&Display(F2)"
	uo_buttons.cb_add_cancel.visible = false
	uo_buttons.cb_edit_save.visible = false
	uo_buttons.cb_delete.visible = false
	uo_buttons.cb_print.visible = false
	uo_buttons.cb_close.visible = false
//	uo_buttons.cb_first.visible = false
//	uo_buttons.cb_prev.visible = false
//	uo_buttons.cb_next.visible = false
//	uo_buttons.cb_last.visible = false
	dw_master.reset()
	f_enable_fields( dw_master, true)
	dw_master.modify( "datawindow.querymode = yes")
	wf_control_query( )
	this.wf_post_query()
	this.setredraw( true)	
else	
	if is_mode = "query" then
		dw_master.accepttext()
		this.triggerevent( "ue_display")
	end if
end if

end event

public subroutine wf_pre_update ();//
// add script here
//
//dwItemStatus   ls_status
//long ll_row
//ll_row = dw_master.getrow()
//
//ls_status = dw_master.getitemstatus(ll_row, 0, primary!)
//	if ls_status = Newmodified! then
//		
//			dw_master.setitem( ll_row,"create_by", gs_userid)
//	dw_master.setitem( ll_row,"create_date",gdt_serverdatetime)	
//	end if
//if ls_status = Datamodified! then
//		dw_master.setitem( ll_row,"update_by", gs_userid)
//		dw_master.setitem( ll_row,"update_date",gdt_serverdatetime)			
//	end if
end subroutine

public subroutine wf_post_update ();//
//  add post update script here
//
//long ll_row
//ll_row = dw_master.getrow( )
//if is_mode = "add" then 
//	dw_master.setitem( ll_row,"create_by", gs_userid)
//		dw_master.setitem( ll_row,"create_date",gdt_serverdatetime)
//	
//end if 

end subroutine

public function string wf_pre_add ();return ""
end function

public function string wf_post_add ();return ""
end function

public function string wf_pre_edit ();return ""
end function

public function string wf_post_edit ();return ""
end function

public function string wf_check_delete ();


return ""
end function

public function string wf_check_edit ();return ""


end function

public function string wf_check_fields ();return ""
end function

public function string wf_delete ();dw_master.deleterow( 0)

return ""
end function

public subroutine wf_control_query_orig ();
long &
	n, ll_fields_count, ll_row
string &
	ls_test

ll_row = dw_master.getrow()

ll_fields_count = long(dw_master.Describe("datawindow.Column.Count"))

// change setting
for n = 1 to ll_fields_count	
	dw_master.modify( "#"+string( n)+".tabsequence=" + istr_control_setting[n].taborder )
	dw_master.modify( "#"+string( n)+".background.mode=" + istr_control_setting[n].backmode)
	dw_master.modify( "#"+string( n)+".background.color=" + istr_control_setting[n].backcolor)	
next

dw_master.scrolltorow( ll_row)


end subroutine

public subroutine wf_control_query ();long &
	n, ll_fields_count, ll_row, ll_tab_seq

ll_row = dw_master.getrow()

ll_fields_count = long(dw_master.Describe("datawindow.Column.Count"))

istr_control_setting = istr_control_setting_clear

// save current column setting
for n = 1 to ll_fields_count
	istr_control_setting[n].backcolor = dw_master.describe( "#"+string( n)+".background.color")
	istr_control_setting[n].taborder = dw_master.describe( "#"+string( n)+".tabsequence")
	istr_control_setting[n].backmode = dw_master.describe( "#"+string( n)+".background.mode")
next

// change setting
for n = 1 to ll_fields_count
	ll_tab_seq = n * 10
	dw_master.modify( "#"+string( n)+".tabsequence=" + string( ll_tab_seq))
	dw_master.modify( "#"+string( n)+".background.mode=0")
	dw_master.modify( "#"+string( n)+".background.color=134217752")	
next

dw_master.scrolltorow( ll_row)


end subroutine

public subroutine wf_post_display ();//
//
//
end subroutine

public subroutine wf_post_query ();//
end subroutine

on w_master_1.create
this.uo_dwnav=create uo_dwnav
this.uo_buttons=create uo_buttons
this.dw_master=create dw_master
this.gb_1=create gb_1
this.Control[]={this.uo_dwnav,&
this.uo_buttons,&
this.dw_master,&
this.gb_1}
end on

on w_master_1.destroy
destroy(this.uo_dwnav)
destroy(this.uo_buttons)
destroy(this.dw_master)
destroy(this.gb_1)
end on

event open;
dw_master.settransobject(sqlca)

// put in display mode
this.triggerevent( "ue_display")

ib_query = false

end event

event resize;uo_buttons.x =this.workspacewidth( ) - uo_buttons.width
uo_buttons.y =28
uo_buttons.move( uo_buttons.x,uo_buttons.y )
uo_dwnav.x=0
uo_dwnav.y=this.workspaceheight( )-uo_dwnav.height
uo_dwnav.move( uo_dwnav.x, uo_dwnav.y)
uo_dwnav.width=this.workspacewidth( )
end event

type uo_dwnav from u_cst_dwnav within w_master_1
integer x = 78
integer y = 876
integer width = 946
integer taborder = 20
end type

on uo_dwnav.destroy
call u_cst_dwnav::destroy
end on

event constructor;call super::constructor;uo_dwnav.of_SetDataWindow(DW_MASTER)
uo_dwnav.of_SetVisible(INSERT_RECORD, FALSE)
uo_dwnav.of_SetVisible(DELETE_RECORD, FALSE)

uo_dwnav.of_SetTheme("Amber_Light")




end event

type uo_buttons from uo_std_buttons_picture within w_master_1
integer x = 4027
integer y = 40
integer taborder = 90
end type

on uo_buttons.destroy
call uo_std_buttons_picture::destroy
end on

type dw_master from datawindow within w_master_1
event ue_nomousescroll pbm_vscroll
event ue_dwnkey pbm_dwnkey
integer x = 69
integer y = 36
integer width = 3790
integer height = 792
integer taborder = 10
string title = "none"
boolean border = false
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event ue_nomousescroll;// prevent vertical scrolling
return 1 
end event

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

event rowfocuschanged;parent.postevent( "ue_retrieve_detail",0, currentrow)
if currentrow <> il_currow and &
	is_mode <> "display" and &  
	il_currow <> 0 then // no current row
	
	this.scrolltorow( il_currow)
end if

end event

type gb_1 from groupbox within w_master_1
boolean visible = false
integer x = 64
integer y = 184
integer width = 3790
integer height = 20
integer taborder = 80
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 134217734
end type

