$PBExportHeader$uo_std_buttons.sru
forward
global type uo_std_buttons from userobject
end type
type cb_first from commandbutton within uo_std_buttons
end type
type cb_prev from commandbutton within uo_std_buttons
end type
type cb_next from commandbutton within uo_std_buttons
end type
type cb_last from commandbutton within uo_std_buttons
end type
type cb_close from commandbutton within uo_std_buttons
end type
type cb_print from commandbutton within uo_std_buttons
end type
type cb_delete from commandbutton within uo_std_buttons
end type
type cb_query_display from commandbutton within uo_std_buttons
end type
type cb_edit_save from commandbutton within uo_std_buttons
end type
type cb_add_cancel from commandbutton within uo_std_buttons
end type
end forward

global type uo_std_buttons from userobject
integer width = 3790
integer height = 148
long backcolor = 553648127
string text = "none"
long tabtextcolor = 134217750
long picturemaskcolor = 536870912
cb_first cb_first
cb_prev cb_prev
cb_next cb_next
cb_last cb_last
cb_close cb_close
cb_print cb_print
cb_delete cb_delete
cb_query_display cb_query_display
cb_edit_save cb_edit_save
cb_add_cancel cb_add_cancel
end type
global uo_std_buttons uo_std_buttons

type variables
window	iw_myparent
end variables

on uo_std_buttons.create
this.cb_first=create cb_first
this.cb_prev=create cb_prev
this.cb_next=create cb_next
this.cb_last=create cb_last
this.cb_close=create cb_close
this.cb_print=create cb_print
this.cb_delete=create cb_delete
this.cb_query_display=create cb_query_display
this.cb_edit_save=create cb_edit_save
this.cb_add_cancel=create cb_add_cancel
this.Control[]={this.cb_first,&
this.cb_prev,&
this.cb_next,&
this.cb_last,&
this.cb_close,&
this.cb_print,&
this.cb_delete,&
this.cb_query_display,&
this.cb_edit_save,&
this.cb_add_cancel}
end on

on uo_std_buttons.destroy
destroy(this.cb_first)
destroy(this.cb_prev)
destroy(this.cb_next)
destroy(this.cb_last)
destroy(this.cb_close)
destroy(this.cb_print)
destroy(this.cb_delete)
destroy(this.cb_query_display)
destroy(this.cb_edit_save)
destroy(this.cb_add_cancel)
end on

event constructor;iw_myparent = parent
end event

type cb_first from commandbutton within uo_std_buttons
integer x = 1874
integer y = 8
integer width = 352
integer height = 100
integer taborder = 60
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
string text = "&First (F5)"
boolean flatstyle = true
end type

event clicked;iw_myparent.triggerevent( "ue_first")
end event

type cb_prev from commandbutton within uo_std_buttons
integer x = 2235
integer y = 8
integer width = 352
integer height = 100
integer taborder = 60
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
string text = "P&rev (F6)"
boolean flatstyle = true
end type

event clicked;iw_myparent.triggerevent( "ue_prev")
end event

type cb_next from commandbutton within uo_std_buttons
integer x = 2601
integer y = 8
integer width = 352
integer height = 100
integer taborder = 60
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
string text = "&Next (F7)"
boolean flatstyle = true
end type

event clicked;iw_myparent.triggerevent( "ue_next")
end event

type cb_last from commandbutton within uo_std_buttons
integer x = 2967
integer y = 8
integer width = 352
integer height = 100
integer taborder = 60
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
string text = "&Last (F8)"
boolean flatstyle = true
end type

event clicked;iw_myparent.triggerevent( "ue_last")
end event

type cb_close from commandbutton within uo_std_buttons
integer x = 3333
integer y = 8
integer width = 352
integer height = 100
integer taborder = 70
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
string text = "&Close (F12)"
boolean flatstyle = true
end type

event clicked;iw_myparent.triggerevent( "ue_close")
end event

type cb_print from commandbutton within uo_std_buttons
integer x = 1472
integer y = 8
integer width = 352
integer height = 100
integer taborder = 60
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
string text = "&Print (F11)"
boolean flatstyle = true
end type

event clicked;iw_myparent.triggerevent( "ue_print")
end event

type cb_delete from commandbutton within uo_std_buttons
integer x = 1106
integer y = 8
integer width = 352
integer height = 100
integer taborder = 50
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
string text = "&Delete (F3)"
boolean flatstyle = true
end type

event clicked;iw_myparent.triggerevent( "ue_delete")
end event

type cb_query_display from commandbutton within uo_std_buttons
integer x = 741
integer y = 8
integer width = 352
integer height = 100
integer taborder = 40
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
string text = "&Query (F2)"
boolean flatstyle = true
end type

event clicked;iw_myparent.triggerevent( "ue_query_display")
end event

type cb_edit_save from commandbutton within uo_std_buttons
integer x = 375
integer y = 8
integer width = 352
integer height = 100
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
string text = "&Edit (F4)"
boolean flatstyle = true
end type

event clicked;iw_myparent.triggerevent( "ue_edit_save")
end event

type cb_add_cancel from commandbutton within uo_std_buttons
integer x = 14
integer y = 8
integer width = 352
integer height = 100
integer taborder = 10
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
string text = "&Add (F1)"
boolean flatstyle = true
end type

event clicked;iw_myparent.triggerevent("ue_add_cancel")
end event

