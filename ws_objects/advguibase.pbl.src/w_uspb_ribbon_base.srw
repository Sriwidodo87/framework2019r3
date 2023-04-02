$PBExportHeader$w_uspb_ribbon_base.srw
forward
global type w_uspb_ribbon_base from window
end type
end forward

global type w_uspb_ribbon_base from window
integer width = 3378
integer height = 1408
boolean titlebar = true
string title = "Untitled"
boolean controlmenu = true
boolean minbox = true
boolean maxbox = true
boolean resizable = true
long backcolor = 67108864
string icon = "AppIcon!"
boolean center = true
end type
global w_uspb_ribbon_base w_uspb_ribbon_base

on w_uspb_ribbon_base.create
call super::create
end on

on w_uspb_ribbon_base.destroy
call super::destroy
if IsValid(MenuID) then destroy(MenuID)
end on

event open;call super::open;//
end event

event resize;call super::resize;//
end event

event activate;call super::activate;//
end event

event close;call super::close;//
end event

event closequery;call super::closequery;//
end event

