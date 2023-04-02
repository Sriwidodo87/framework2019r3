$PBExportHeader$w_paper_size.srw
forward
global type w_paper_size from window
end type
type cb_ok from commandbutton within w_paper_size
end type
type tab_1 from tab within w_paper_size
end type
type tabpage_paper from userobject within tab_1
end type
type ddlb_source from dropdownlistbox within tabpage_paper
end type
type ddlb_size from dropdownlistbox within tabpage_paper
end type
type st_7 from statictext within tabpage_paper
end type
type st_6 from statictext within tabpage_paper
end type
type st_5 from statictext within tabpage_paper
end type
type ddlb_orientation from dropdownlistbox within tabpage_paper
end type
type gb_paper from groupbox within tabpage_paper
end type
type tabpage_paper from userobject within tab_1
ddlb_source ddlb_source
ddlb_size ddlb_size
st_7 st_7
st_6 st_6
st_5 st_5
ddlb_orientation ddlb_orientation
gb_paper gb_paper
end type
type tabpage_margin from userobject within tab_1
end type
type em_bottom from editmask within tabpage_margin
end type
type em_right from editmask within tabpage_margin
end type
type em_top from editmask within tabpage_margin
end type
type em_left from editmask within tabpage_margin
end type
type st_4 from statictext within tabpage_margin
end type
type st_3 from statictext within tabpage_margin
end type
type st_2 from statictext within tabpage_margin
end type
type st_1 from statictext within tabpage_margin
end type
type gb_margin from groupbox within tabpage_margin
end type
type tabpage_margin from userobject within tab_1
em_bottom em_bottom
em_right em_right
em_top em_top
em_left em_left
st_4 st_4
st_3 st_3
st_2 st_2
st_1 st_1
gb_margin gb_margin
end type
type tab_1 from tab within w_paper_size
tabpage_paper tabpage_paper
tabpage_margin tabpage_margin
end type
end forward

global type w_paper_size from window
string tag = " "
integer x = 832
integer y = 356
integer width = 1440
integer height = 936
boolean titlebar = true
string title = "Paper Size and Margins"
windowtype windowtype = response!
long backcolor = 10841658
boolean center = true
cb_ok cb_ok
tab_1 tab_1
end type
global w_paper_size w_paper_size

on w_paper_size.create
this.cb_ok=create cb_ok
this.tab_1=create tab_1
this.Control[]={this.cb_ok,&
this.tab_1}
end on

on w_paper_size.destroy
destroy(this.cb_ok)
destroy(this.tab_1)
end on

event open;str_paper_size str_paper_size
str_paper_size = message.powerobjectparm

tab_1.tabpage_margin.em_left.text 	=  string(str_paper_size.i_left)
tab_1.tabpage_margin.em_right.text 	=  string(str_paper_size.i_right)
tab_1.tabpage_margin.em_top.text 	=  string(str_paper_size.i_top)
tab_1.tabpage_margin.em_bottom.text 	=  string(str_paper_size.i_bottom)

tab_1.tabpage_paper.ddlb_orientation.selectitem(str_paper_size.i_orientation)
tab_1.tabpage_paper.ddlb_size.selectitem(str_paper_size.i_size)
tab_1.tabpage_paper.ddlb_source.selectitem(str_paper_size.i_source)

end event

type cb_ok from commandbutton within w_paper_size
integer x = 558
integer y = 712
integer width = 247
integer height = 92
integer taborder = 7
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Ok"
end type

event clicked;str_paper_size str_paper_size
string ls_orientation, ls_size, ls_source

ls_orientation= tab_1.tabpage_paper.ddlb_orientation.text
ls_size 	= tab_1.tabpage_paper.ddlb_size.text
ls_source 	= tab_1.tabpage_paper.ddlb_source.text

str_paper_size.i_left 		= double(tab_1.tabpage_margin.em_left.text) * 1000
str_paper_size.i_right 		= double(tab_1.tabpage_margin.em_right.text) * 1000
str_paper_size.i_top 		= double(tab_1.tabpage_margin.em_top.text) * 1000
str_paper_size.i_bottom 		= double(tab_1.tabpage_margin.em_bottom.text) * 1000
str_paper_size.i_orientation 	= tab_1.tabpage_paper.ddlb_orientation.selectitem(ls_orientation,0) - 1
str_paper_size.i_size 		= tab_1.tabpage_paper.ddlb_size.selectitem(ls_size,0) - 1
str_paper_size.i_source		= tab_1.tabpage_paper.ddlb_source.selectitem(ls_source,0) - 1

closewithreturn(parent, str_paper_size)

end event

type tab_1 from tab within w_paper_size
integer x = 32
integer y = 48
integer width = 1362
integer height = 636
integer taborder = 10
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long backcolor = 10841658
boolean raggedright = true
integer selectedtab = 1
tabpage_paper tabpage_paper
tabpage_margin tabpage_margin
end type

on tab_1.create
this.tabpage_paper=create tabpage_paper
this.tabpage_margin=create tabpage_margin
this.Control[]={this.tabpage_paper,&
this.tabpage_margin}
end on

on tab_1.destroy
destroy(this.tabpage_paper)
destroy(this.tabpage_margin)
end on

type tabpage_paper from userobject within tab_1
integer x = 18
integer y = 100
integer width = 1326
integer height = 520
long backcolor = 12632256
string text = "Paper"
long tabbackcolor = 10841658
long picturemaskcolor = 536870912
ddlb_source ddlb_source
ddlb_size ddlb_size
st_7 st_7
st_6 st_6
st_5 st_5
ddlb_orientation ddlb_orientation
gb_paper gb_paper
end type

on tabpage_paper.create
this.ddlb_source=create ddlb_source
this.ddlb_size=create ddlb_size
this.st_7=create st_7
this.st_6=create st_6
this.st_5=create st_5
this.ddlb_orientation=create ddlb_orientation
this.gb_paper=create gb_paper
this.Control[]={this.ddlb_source,&
this.ddlb_size,&
this.st_7,&
this.st_6,&
this.st_5,&
this.ddlb_orientation,&
this.gb_paper}
end on

on tabpage_paper.destroy
destroy(this.ddlb_source)
destroy(this.ddlb_size)
destroy(this.st_7)
destroy(this.st_6)
destroy(this.st_5)
destroy(this.ddlb_orientation)
destroy(this.gb_paper)
end on

type ddlb_source from dropdownlistbox within tabpage_paper
integer x = 338
integer y = 252
integer width = 850
integer height = 244
integer taborder = 6
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long backcolor = 16777215
boolean sorted = false
boolean vscrollbar = true
string item[] = {"Default","Upper","Lower","Middle","Manual","Envelope","Envelope manual","Auto","Tractor","Smallfmt","Largefmt","Large capacity","Cassette"}
borderstyle borderstyle = stylelowered!
end type

type ddlb_size from dropdownlistbox within tabpage_paper
integer x = 338
integer y = 156
integer width = 850
integer height = 244
integer taborder = 5
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long backcolor = 16777215
boolean sorted = false
boolean vscrollbar = true
string item[] = {"Default","Letter 8 1/2 x 11 in","LetterSmall 8 1/2 x 11in","Tabloid 17 x 11 inches","Ledger 17 x 11 in","Legal 8 1/2 x 14 in","Statement 5 1/2 x 8 1/2 in","Executive 7 1/4 x 10 1/2 in","A3 297 x 420 mm","A4 210 x 297 mm","A4 Small 210 x 297 mm","A5 148 x 210 mm","B4 250 x 354 mm","B5 182 x 257 mm","Folio 8 1/2 x 13 in","Quarto 215 x 275mm","10x14 in","11x17 in","Note 8 1/2 x 11 in","Envelope #9 3 7/8 x 8 7/8","Envelope #10 4 1/8 x 9 1/2","Envelope #11 4 1/2 x 10 3/8","Envelope #12  4 x 11 1/276","Envelope #14 5 x 11 1/2","C size sheet","D size sheet","E size sheet","Envelope DL 110 x 220mm","Envelope C5 162 x 229 mm","Envelope C3  324 x 458 mm","Envelope C4  229 x 324 mm","Envelope C6  114 x 162 mm","Envelope C65 114 x 229 mm","Envelope B4  250 x 353 mm","Envelope B5  176 x 250 mm","Envelope B6  176 x 125 mm","Envelope 110 x 230 mm","Envelope Monarch 3.875 x 7.5 in","6 3/4 Envelope 3 5/8 x 6 1/2 in","US Std Fanfold 14 7/8 x 11 in","German Std Fanfold 8 1/2 x 12 in","German Legal Fanfold 8 1/2 x 13 in"}
borderstyle borderstyle = stylelowered!
end type

type st_7 from statictext within tabpage_paper
integer x = 78
integer y = 256
integer width = 247
integer height = 72
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 16777215
long backcolor = 10841658
boolean enabled = false
string text = "Source :"
alignment alignment = right!
boolean focusrectangle = false
end type

type st_6 from statictext within tabpage_paper
integer x = 78
integer y = 168
integer width = 247
integer height = 72
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 16777215
long backcolor = 10841658
boolean enabled = false
string text = "Size :"
alignment alignment = right!
boolean focusrectangle = false
end type

type st_5 from statictext within tabpage_paper
integer x = 55
integer y = 76
integer width = 270
integer height = 72
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 16777215
long backcolor = 10841658
boolean enabled = false
string text = "Orientation :"
alignment alignment = right!
boolean focusrectangle = false
end type

type ddlb_orientation from dropdownlistbox within tabpage_paper
integer x = 338
integer y = 60
integer width = 850
integer height = 240
integer taborder = 4
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long backcolor = 16777215
boolean sorted = false
boolean vscrollbar = true
string item[] = {"Default","Landscape","Portrait"}
borderstyle borderstyle = stylelowered!
end type

type gb_paper from groupbox within tabpage_paper
integer x = 18
integer y = 8
integer width = 1280
integer height = 480
integer taborder = 3
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 16777215
long backcolor = 10841658
string text = "Paper"
end type

type tabpage_margin from userobject within tab_1
integer x = 18
integer y = 100
integer width = 1326
integer height = 520
long backcolor = 12632256
string text = "Margin"
long tabbackcolor = 10841658
long picturemaskcolor = 553648127
em_bottom em_bottom
em_right em_right
em_top em_top
em_left em_left
st_4 st_4
st_3 st_3
st_2 st_2
st_1 st_1
gb_margin gb_margin
end type

on tabpage_margin.create
this.em_bottom=create em_bottom
this.em_right=create em_right
this.em_top=create em_top
this.em_left=create em_left
this.st_4=create st_4
this.st_3=create st_3
this.st_2=create st_2
this.st_1=create st_1
this.gb_margin=create gb_margin
this.Control[]={this.em_bottom,&
this.em_right,&
this.em_top,&
this.em_left,&
this.st_4,&
this.st_3,&
this.st_2,&
this.st_1,&
this.gb_margin}
end on

on tabpage_margin.destroy
destroy(this.em_bottom)
destroy(this.em_right)
destroy(this.em_top)
destroy(this.em_left)
destroy(this.st_4)
destroy(this.st_3)
destroy(this.st_2)
destroy(this.st_1)
destroy(this.gb_margin)
end on

type em_bottom from editmask within tabpage_margin
integer x = 891
integer y = 316
integer width = 215
integer height = 76
integer taborder = 7
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long backcolor = 16777215
borderstyle borderstyle = stylelowered!
string mask = "###.##"
string displaydata = ""
end type

type em_right from editmask within tabpage_margin
integer x = 891
integer y = 140
integer width = 215
integer height = 76
integer taborder = 5
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long backcolor = 16777215
borderstyle borderstyle = stylelowered!
string mask = "###.##"
string displaydata = ""
end type

type em_top from editmask within tabpage_margin
integer x = 379
integer y = 316
integer width = 215
integer height = 76
integer taborder = 6
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long backcolor = 16777215
borderstyle borderstyle = stylelowered!
string mask = "###.##"
string displaydata = ""
end type

type em_left from editmask within tabpage_margin
integer x = 379
integer y = 140
integer width = 215
integer height = 76
integer taborder = 5
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long backcolor = 16777215
borderstyle borderstyle = stylelowered!
string mask = "###.##"
string displaydata = ""
end type

type st_4 from statictext within tabpage_margin
integer x = 667
integer y = 324
integer width = 206
integer height = 72
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 16777215
long backcolor = 10841658
boolean enabled = false
string text = "Bottom :"
alignment alignment = right!
boolean focusrectangle = false
end type

type st_3 from statictext within tabpage_margin
integer x = 667
integer y = 152
integer width = 206
integer height = 72
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 16777215
long backcolor = 10841658
boolean enabled = false
string text = "Right :"
alignment alignment = right!
boolean focusrectangle = false
end type

type st_2 from statictext within tabpage_margin
integer x = 183
integer y = 324
integer width = 178
integer height = 72
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 16777215
long backcolor = 10841658
boolean enabled = false
string text = "Top :"
alignment alignment = right!
boolean focusrectangle = false
end type

type st_1 from statictext within tabpage_margin
integer x = 219
integer y = 152
integer width = 142
integer height = 72
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 16777215
long backcolor = 10841658
boolean enabled = false
string text = "Left :"
alignment alignment = right!
boolean focusrectangle = false
end type

type gb_margin from groupbox within tabpage_margin
integer x = 18
integer y = 20
integer width = 1280
integer height = 468
integer taborder = 2
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 16777215
long backcolor = 10841658
string text = " Margin in Centimeter "
end type

