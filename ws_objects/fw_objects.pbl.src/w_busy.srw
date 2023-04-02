$PBExportHeader$w_busy.srw
forward
global type w_busy from window
end type
type st_remark from statictext within w_busy
end type
end forward

global type w_busy from window
integer width = 1614
integer height = 104
windowtype windowtype = popup!
long backcolor = 67108864
string icon = "AppIcon!"
boolean center = true
st_remark st_remark
end type
global w_busy w_busy

on w_busy.create
this.st_remark=create st_remark
this.Control[]={this.st_remark}
end on

on w_busy.destroy
destroy(this.st_remark)
end on

type st_remark from statictext within w_busy
integer x = 32
integer y = 12
integer width = 1541
integer height = 64
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
long textcolor = 33554432
long backcolor = 67108864
string text = "Tunggu sebentar ..."
alignment alignment = center!
boolean focusrectangle = false
end type

