$PBExportHeader$w_bkg.srw
forward
global type w_bkg from window
end type
type p_1 from picture within w_bkg
end type
end forward

global type w_bkg from window
integer width = 3095
integer height = 1204
boolean border = false
windowtype windowtype = child!
windowstate windowstate = maximized!
long backcolor = 553648127
string icon = "AppIcon!"
integer transparency = 30
p_1 p_1
end type
global w_bkg w_bkg

on w_bkg.create
this.p_1=create p_1
this.Control[]={this.p_1}
end on

on w_bkg.destroy
destroy(this.p_1)
end on

event open;long ll_backcolor= Rgb(199,236,238)
long ll_dwcolor = rgb(223,249,251)
//backcolor = ll_backcolor

end event

type p_1 from picture within w_bkg
integer x = 37
integer y = 24
integer width = 649
integer height = 504
string picturename = "..\res\pb.jpg"
boolean focusrectangle = false
end type

