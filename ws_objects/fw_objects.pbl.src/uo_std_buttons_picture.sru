$PBExportHeader$uo_std_buttons_picture.sru
forward
global type uo_std_buttons_picture from userobject
end type
type cb_close from u_cst_commandbutton within uo_std_buttons_picture
end type
type cb_print from u_cst_commandbutton within uo_std_buttons_picture
end type
type cb_delete from u_cst_commandbutton within uo_std_buttons_picture
end type
type cb_query_display from u_cst_commandbutton within uo_std_buttons_picture
end type
type cb_edit_save from u_cst_commandbutton within uo_std_buttons_picture
end type
type cb_add_cancel from u_cst_commandbutton within uo_std_buttons_picture
end type
end forward

global type uo_std_buttons_picture from userobject
integer width = 553
integer height = 820
long backcolor = 67108864
string text = "none"
long tabtextcolor = 33554432
long picturemaskcolor = 536870912
cb_close cb_close
cb_print cb_print
cb_delete cb_delete
cb_query_display cb_query_display
cb_edit_save cb_edit_save
cb_add_cancel cb_add_cancel
end type
global uo_std_buttons_picture uo_std_buttons_picture

type variables
window	iw_myparent
end variables

on uo_std_buttons_picture.create
this.cb_close=create cb_close
this.cb_print=create cb_print
this.cb_delete=create cb_delete
this.cb_query_display=create cb_query_display
this.cb_edit_save=create cb_edit_save
this.cb_add_cancel=create cb_add_cancel
this.Control[]={this.cb_close,&
this.cb_print,&
this.cb_delete,&
this.cb_query_display,&
this.cb_edit_save,&
this.cb_add_cancel}
end on

on uo_std_buttons_picture.destroy
destroy(this.cb_close)
destroy(this.cb_print)
destroy(this.cb_delete)
destroy(this.cb_query_display)
destroy(this.cb_edit_save)
destroy(this.cb_add_cancel)
end on

event constructor;iw_myparent = parent
end event

type cb_close from u_cst_commandbutton within uo_std_buttons_picture
integer x = 32
integer y = 680
integer width = 503
integer taborder = 80
string facename = "Verdana"
string text = "Close(F12)"
string theme = "SILVER"
string iconname = "../res/Close.png"
end type

event clicked;call super::clicked;iw_myparent.triggerevent( "ue_close")
end event

type cb_print from u_cst_commandbutton within uo_std_buttons_picture
integer x = 32
integer y = 548
integer width = 503
integer taborder = 70
string facename = "Verdana"
string text = "Print(F11)"
string theme = "SILVER"
string iconname = "../res/print.png"
end type

event clicked;call super::clicked;iw_myparent.triggerevent( "ue_print")
end event

type cb_delete from u_cst_commandbutton within uo_std_buttons_picture
integer x = 32
integer y = 416
integer width = 503
integer taborder = 60
string facename = "Verdana"
string text = "Delete(F3)"
string theme = "SILVER"
string iconname = "../res/Delete.png"
end type

event clicked;call super::clicked;iw_myparent.triggerevent( "ue_delete")
end event

type cb_query_display from u_cst_commandbutton within uo_std_buttons_picture
integer x = 32
integer y = 284
integer width = 503
integer taborder = 50
string facename = "Verdana"
string text = "Query(F2)"
string theme = "SILVER"
string iconname = "../res/search.png"
end type

event clicked;call super::clicked;iw_myparent.triggerevent( "ue_query_display")
end event

type cb_edit_save from u_cst_commandbutton within uo_std_buttons_picture
integer x = 32
integer y = 152
integer width = 503
integer taborder = 40
string facename = "Verdana"
string text = "Edit (F4)"
string theme = "SILVER"
string iconname = "../res/edit.png"
end type

event clicked;call super::clicked;iw_myparent.triggerevent( "ue_edit_save")
end event

type cb_add_cancel from u_cst_commandbutton within uo_std_buttons_picture
integer x = 32
integer y = 20
integer width = 503
integer taborder = 30
string facename = "Verdana"
string text = "Add (F1)"
string theme = "SILVER"
string iconname = "../res/add.png"
end type

event clicked;call super::clicked;iw_myparent.triggerevent("ue_add_cancel")
end event

