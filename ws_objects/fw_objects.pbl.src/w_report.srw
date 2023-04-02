$PBExportHeader$w_report.srw
forward
global type w_report from window
end type
type pb_preview from picturebutton within w_report
end type
type cb_search from commandbutton within w_report
end type
type cb_retrieve from commandbutton within w_report
end type
type dw_cari from datawindow within w_report
end type
type dw_report from datawindow within w_report
end type
end forward

global type w_report from window
integer width = 3378
integer height = 1868
boolean titlebar = true
string title = "Untitled"
boolean controlmenu = true
boolean minbox = true
boolean maxbox = true
boolean resizable = true
long backcolor = 67108864
string icon = "AppIcon!"
boolean center = true
pb_preview pb_preview
cb_search cb_search
cb_retrieve cb_retrieve
dw_cari dw_cari
dw_report dw_report
end type
global w_report w_report

type variables
string is_windowprn
end variables

on w_report.create
this.pb_preview=create pb_preview
this.cb_search=create cb_search
this.cb_retrieve=create cb_retrieve
this.dw_cari=create dw_cari
this.dw_report=create dw_report
this.Control[]={this.pb_preview,&
this.cb_search,&
this.cb_retrieve,&
this.dw_cari,&
this.dw_report}
end on

on w_report.destroy
destroy(this.pb_preview)
destroy(this.cb_search)
destroy(this.cb_retrieve)
destroy(this.dw_cari)
destroy(this.dw_report)
end on

event open;long ll_backcolor= Rgb(199,236,238)
backcolor = ll_backcolor

if  is_windowprn ="" or isnull( is_windowprn) then 
	 is_windowprn = this.classname() +'_rpt'
end if 

dw_cari.settransobject(sqlca)
dw_report.settransobject(sqlca)
//dw_cari.retrieve('%')
//dw_report.retrieve('%')

end event

type pb_preview from picturebutton within w_report
integer x = 2935
integer y = 72
integer width = 110
integer height = 96
integer taborder = 20
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
boolean originalsize = true
string picturename = "Print!"
alignment htextalign = left!
end type

type cb_search from commandbutton within w_report
integer x = 2213
integer y = 64
integer width = 256
integer height = 112
integer taborder = 20
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "Search "
end type

type cb_retrieve from commandbutton within w_report
integer x = 2482
integer y = 64
integer width = 402
integer height = 112
integer taborder = 20
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "&Retrieve"
end type

type dw_cari from datawindow within w_report
integer x = 50
integer y = 68
integer width = 2126
integer height = 108
integer taborder = 10
string title = "none"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type dw_report from datawindow within w_report
integer x = 37
integer y = 256
integer width = 3186
integer height = 1440
integer taborder = 10
string title = "none"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

