$PBExportHeader$w_progress.srw
forward
global type w_progress from window
end type
type cb_cancel from commandbutton within w_progress
end type
type st_status from statictext within w_progress
end type
type hpb_status from hprogressbar within w_progress
end type
end forward

global type w_progress from window
integer width = 2002
integer height = 428
boolean titlebar = true
string title = "Processing ..."
windowtype windowtype = popup!
long backcolor = 67108864
string icon = "AppIcon!"
boolean center = true
cb_cancel cb_cancel
st_status st_status
hpb_status hpb_status
end type
global w_progress w_progress

on w_progress.create
this.cb_cancel=create cb_cancel
this.st_status=create st_status
this.hpb_status=create hpb_status
this.Control[]={this.cb_cancel,&
this.st_status,&
this.hpb_status}
end on

on w_progress.destroy
destroy(this.cb_cancel)
destroy(this.st_status)
destroy(this.hpb_status)
end on

type cb_cancel from commandbutton within w_progress
integer x = 731
integer y = 220
integer width = 389
integer height = 100
integer taborder = 10
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
string text = "&Cancel"
end type

event clicked;close( parent)
end event

type st_status from statictext within w_progress
integer x = 69
integer y = 40
integer width = 1829
integer height = 60
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
long textcolor = 33554432
long backcolor = 67108864
boolean focusrectangle = false
end type

type hpb_status from hprogressbar within w_progress
integer x = 69
integer y = 120
integer width = 1829
integer height = 60
unsignedinteger maxposition = 100
unsignedinteger position = 50
integer setstep = 1
end type

