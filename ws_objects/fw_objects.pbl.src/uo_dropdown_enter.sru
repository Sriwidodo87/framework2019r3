$PBExportHeader$uo_dropdown_enter.sru
forward
global type uo_dropdown_enter from dropdownlistbox
end type
end forward

global type uo_dropdown_enter from dropdownlistbox
integer width = 1074
integer height = 468
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
long textcolor = 33554432
boolean allowedit = true
boolean vscrollbar = true
borderstyle borderstyle = stylelowered!
event ue_enter pbm_keydown
end type
global uo_dropdown_enter uo_dropdown_enter

event ue_enter;if NOT KeyDown(KeyControl!) and key=KeyEnter! then
    Send(Handle(this),256,9,Long(0,0))
    return 1
end if 
end event

on uo_dropdown_enter.create
end on

on uo_dropdown_enter.destroy
end on

