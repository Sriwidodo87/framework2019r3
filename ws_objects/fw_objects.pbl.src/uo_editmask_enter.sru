$PBExportHeader$uo_editmask_enter.sru
forward
global type uo_editmask_enter from editmask
end type
end forward

global type uo_editmask_enter from editmask
integer width = 494
integer height = 80
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
long textcolor = 33554432
string text = "none"
alignment alignment = center!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
string mask = "[date]"
event ue_enter pbm_keydown
end type
global uo_editmask_enter uo_editmask_enter

event ue_enter;if NOT KeyDown(KeyControl!) and key=KeyEnter! then
    Send(Handle(this),256,9,Long(0,0))
    return 1
end if 
end event

on uo_editmask_enter.create
end on

on uo_editmask_enter.destroy
end on

