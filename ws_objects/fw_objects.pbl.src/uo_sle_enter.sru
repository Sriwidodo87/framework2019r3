$PBExportHeader$uo_sle_enter.sru
forward
global type uo_sle_enter from singlelineedit
end type
end forward

global type uo_sle_enter from singlelineedit
integer width = 402
integer height = 72
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
long textcolor = 33554432
string text = "none"
borderstyle borderstyle = stylelowered!
event ue_enter pbm_keydown
end type
global uo_sle_enter uo_sle_enter

event ue_enter;if NOT KeyDown(KeyControl!) and key=KeyEnter! then
    Send(Handle(this),256,9,Long(0,0))
    return 1
end if 
end event

on uo_sle_enter.create
end on

on uo_sle_enter.destroy
end on

