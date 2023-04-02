$PBExportHeader$uo_button_enter.sru
forward
global type uo_button_enter from commandbutton
end type
end forward

global type uo_button_enter from commandbutton
integer width = 498
integer height = 100
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
string text = "none"
event ue_enter pbm_keydown
end type
global uo_button_enter uo_button_enter

event ue_enter;if NOT KeyDown(KeyControl!) and key=KeyEnter! then
    Send(Handle(this),256,9,Long(0,0))
    return 1
end if 
end event

on uo_button_enter.create
end on

on uo_button_enter.destroy
end on

