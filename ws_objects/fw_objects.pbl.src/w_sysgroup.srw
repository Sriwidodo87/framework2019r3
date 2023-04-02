$PBExportHeader$w_sysgroup.srw
forward
global type w_sysgroup from w_master_detail_1
end type
type cb_genaccess from commandbutton within w_sysgroup
end type
type cb_copy from commandbutton within w_sysgroup
end type
type cb_paste from commandbutton within w_sysgroup
end type
type dw_access from datawindow within w_sysgroup
end type
end forward

global type w_sysgroup from w_master_detail_1
string tag = "m_admgroup"
integer width = 4178
integer height = 2800
string title = "Group Maintenance"
boolean resizable = true
windowstate windowstate = maximized!
cb_genaccess cb_genaccess
cb_copy cb_copy
cb_paste cb_paste
dw_access dw_access
end type
global w_sysgroup w_sysgroup

forward prototypes
public subroutine wf_pre_update ()
public function string wf_post_add ()
public subroutine wf_post_display ()
public function string wf_post_edit ()
public subroutine wf_detail2access ()
end prototypes

public subroutine wf_pre_update ();string &
	ls_group_id, ls_menu_id
long &
	ll_rowcount, i, ll_currow
integer &
	li_group_add, li_group_modify, li_group_delete, &
	li_group_s1, li_group_s2, li_group_s3, li_group_s4, li_group_s5, &
	li_stat

ls_group_id = dw_master.getitemstring( dw_master.getrow(), "group_id")

ll_rowcount = dw_detail.rowcount()

for i = 1 to ll_rowcount
	dw_detail.deleterow( 1)
next

ll_rowcount = dw_access.rowcount()
for i = 1 to ll_rowcount
	
	li_stat = dw_access.getitemnumber( i, "stat")
	
	if li_stat = 1 then   //checked
		ls_menu_id = dw_access.getitemstring( i, "menu_id")
		li_group_add = dw_access.getitemnumber( i, "group_add")
		li_group_modify = dw_access.getitemnumber( i, "group_modify")
		li_group_delete = dw_access.getitemnumber( i, "group_delete")
		li_group_s1 = dw_access.getitemnumber( i, "group_s1")
		li_group_s2 = dw_access.getitemnumber( i, "group_s2")
		li_group_s3 = dw_access.getitemnumber( i, "group_s3")
		li_group_s4 = dw_access.getitemnumber( i, "group_s4")
		li_group_s5 = dw_access.getitemnumber( i, "group_s5")
		
		dw_detail.scrolltorow( dw_detail.insertrow(0))
		ll_currow = dw_detail.getrow()
		dw_detail.setitem( ll_currow, "group_id", ls_group_id)
		dw_detail.setitem( ll_currow, "menu_id", ls_menu_id)
		dw_detail.setitem( ll_currow, "group_add", li_group_add)
		dw_detail.setitem( ll_currow, "group_modify", li_group_modify)
		dw_detail.setitem( ll_currow, "group_delete", li_group_delete)
		dw_detail.setitem( ll_currow, "group_s1", li_group_s1)
		dw_detail.setitem( ll_currow, "group_s2", li_group_s2)
		dw_detail.setitem( ll_currow, "group_s3", li_group_s3)
		dw_detail.setitem( ll_currow, "group_s4", li_group_s4)
		dw_detail.setitem( ll_currow, "group_s5", li_group_s5)
		
	end if		
next
end subroutine

public function string wf_post_add ();integer &
	i, li_menu_sort
string &
	ls_menu_id, ls_menu_desc
long &
	ll_currow


//for i = 1 to 20
// 	dw_detail.insertrow(0)
//next

dw_access.reset()
dw_access.settransobject( sqlca)
dw_access.visible = true

declare menu_curs cursor for
	select menu_id, menu_desc, menu_sort
	from sysmenu
	order by menu_sort;
open menu_curs;

dw_access.setredraw( false)
do while sqlca.sqlcode = 0 
	fetch menu_curs into :ls_menu_id, &
		:ls_menu_desc, :li_menu_sort;
	if sqlca.sqlcode = 0 then
		dw_access.setrow(dw_access.insertrow(0))
		ll_currow = dw_access.getrow()
		dw_access.setitem( ll_currow, "menu_id", ls_menu_id)
		dw_access.setitem( ll_currow, "menu_desc", ls_menu_desc)
	end if
loop
dw_access.setredraw( true)

close menu_curs;

return ""

end function

public subroutine wf_post_display ();dw_access.visible = false
end subroutine

public function string wf_post_edit ();wf_detail2access()

return ""

end function

public subroutine wf_detail2access ();string &
	ls_menu_desc, ls_menu_id
integer &
	li_menu_sort
long &
	ll_currow, ll_rowcount, ll_rowcount2
integer &
	i, k

dw_access.reset()
dw_access.settransobject( sqlca)
dw_access.visible = true

declare menu_curs cursor for
	select menu_id, menu_desc, menu_sort
	from sysmenu
	order by menu_sort;
open menu_curs;

dw_access.setredraw( false)
do while sqlca.sqlcode = 0 
	fetch menu_curs into :ls_menu_id, &
		:ls_menu_desc, :li_menu_sort;
	if sqlca.sqlcode = 0 then
		dw_access.setrow(dw_access.insertrow(0))
		ll_currow = dw_access.getrow()
		dw_access.setitem( ll_currow, "menu_id", ls_menu_id)
		dw_access.setitem( ll_currow, "menu_desc", ls_menu_desc)
	end if
loop

ll_rowcount = dw_detail.rowcount()
ll_rowcount2 = dw_access.rowcount()
for i = 1 to ll_rowcount
	ls_menu_id = trim( dw_detail.getitemstring( i, "menu_id"))
	
	for k= 1 to ll_rowcount2
		if ls_menu_id = trim( dw_access.getitemstring( k, "menu_id")) then
			dw_access.setitem( k, "stat", 1)			
			dw_access.setitem( k, "group_add", &
				dw_detail.getitemnumber( i, "group_add"))
			dw_access.setitem( k, "group_modify", &
				dw_detail.getitemnumber( i, "group_modify"))
			dw_access.setitem( k, "group_delete", &
				dw_detail.getitemnumber( i, "group_delete"))
			dw_access.setitem( k, "group_s1", &
				dw_detail.getitemnumber( i, "group_s1"))
			dw_access.setitem( k, "group_s2", &
				dw_detail.getitemnumber( i, "group_s2"))
			dw_access.setitem( k, "group_s3", &
				dw_detail.getitemnumber( i, "group_s3"))
			dw_access.setitem( k, "group_s4", &
				dw_detail.getitemnumber( i, "group_s4"))
			dw_access.setitem( k, "group_s5", &
				dw_detail.getitemnumber( i, "group_s5"))
			
			exit 
		end if
	next	
next
dw_access.setredraw( true)
close menu_curs;

end subroutine

on w_sysgroup.create
int iCurrent
call super::create
this.cb_genaccess=create cb_genaccess
this.cb_copy=create cb_copy
this.cb_paste=create cb_paste
this.dw_access=create dw_access
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.cb_genaccess
this.Control[iCurrent+2]=this.cb_copy
this.Control[iCurrent+3]=this.cb_paste
this.Control[iCurrent+4]=this.dw_access
end on

on w_sysgroup.destroy
call super::destroy
destroy(this.cb_genaccess)
destroy(this.cb_copy)
destroy(this.cb_paste)
destroy(this.dw_access)
end on

event ue_retrieve_detail;call super::ue_retrieve_detail;string 		ls_group_id
long			ll_row

ll_row = message.longparm
if is_mode = "display" and ib_query = false then
	if dw_master.rowcount() > 0 and ll_row > 0 then		
		ls_group_id = dw_master.getitemstring( ll_row, "group_id")
		dw_detail.retrieve( ls_group_id)
	end if
end if
end event

type uo_dwnav from w_master_detail_1`uo_dwnav within w_sysgroup
integer x = 110
integer y = 1860
integer height = 116
end type

type uo_buttons from w_master_detail_1`uo_buttons within w_sysgroup
integer x = 3561
integer y = 152
end type

type cb_deleterow from w_master_detail_1`cb_deleterow within w_sysgroup
integer x = 1975
integer y = 1160
boolean enabled = false
end type

type cb_insertrow from w_master_detail_1`cb_insertrow within w_sysgroup
integer x = 1975
integer y = 1048
boolean enabled = false
end type

type dw_detail from w_master_detail_1`dw_detail within w_sysgroup
integer x = 55
integer y = 304
integer width = 3323
integer height = 1480
string dataobject = "d_sysgroupdet"
end type

type dw_master from w_master_detail_1`dw_master within w_sysgroup
integer x = 41
integer y = 0
integer width = 3319
integer height = 260
string dataobject = "d_sysgrouphdr"
end type

type gb_1 from w_master_detail_1`gb_1 within w_sysgroup
integer x = 37
integer y = 1544
integer width = 3314
end type

type gb_2 from w_master_detail_1`gb_2 within w_sysgroup
integer x = 37
integer y = 344
integer width = 3314
end type

type cb_genaccess from commandbutton within w_sysgroup
integer x = 3479
integer y = 1400
integer width = 402
integer height = 100
integer taborder = 50
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
string text = "All &Menu"
end type

event clicked;string &
	ls_group_id, ls_menu_id
long &
	ll_rowcount, i

if is_mode = "edit" or is_mode = "add" then
	ll_rowcount = dw_access.rowcount()
	
	dw_access.setredraw( false)
	for i = 1 to ll_rowcount
		dw_access.setitem( i, "stat", 1)
	next
	dw_access.setredraw( true)

else
	messagebox( "Auto Generate", "You must in edit or add mode")
end if
end event

type cb_copy from commandbutton within w_sysgroup
integer x = 3479
integer y = 1516
integer width = 402
integer height = 100
integer taborder = 60
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
string text = "&Copy Detail"
end type

event clicked;if is_mode = "display" then
	dw_detail.saveas( "", clipboard!, false)
else
	messagebox( "Copy Error", "You must in display mode")
end if
end event

type cb_paste from commandbutton within w_sysgroup
integer x = 3474
integer y = 1628
integer width = 402
integer height = 100
integer taborder = 70
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
string text = "&Paste Detail"
end type

event clicked;if is_mode = "add" or is_mode = "edit" then
	dw_detail.reset()
	dw_detail.importclipboard()
	wf_detail2access()
else
	messagebox( "Paste Error", "you must in add or edit mode")
end if
end event

type dw_access from datawindow within w_sysgroup
boolean visible = false
integer x = 55
integer y = 304
integer width = 3337
integer height = 1480
integer taborder = 30
boolean bringtotop = true
string title = "none"
string dataobject = "d_sysgroupdet2"
boolean vscrollbar = true
boolean border = false
boolean livescroll = true
end type

