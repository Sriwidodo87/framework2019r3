$PBExportHeader$w_print_option.srw
forward
global type w_print_option from window
end type
type sle_printer from singlelineedit within w_print_option
end type
type ddlb_range from dropdownlistbox within w_print_option
end type
type st_print from statictext within w_print_option
end type
type cb_printer from commandbutton within w_print_option
end type
type cb_cancel from commandbutton within w_print_option
end type
type cbx_collate from checkbox within w_print_option
end type
type cbx_print_to_file from checkbox within w_print_option
end type
type st_3 from statictext within w_print_option
end type
type sle_page_range from singlelineedit within w_print_option
end type
type rb_pages from radiobutton within w_print_option
end type
type rb_current_page from radiobutton within w_print_option
end type
type rb_all from radiobutton within w_print_option
end type
type em_copies from editmask within w_print_option
end type
type st_copies from statictext within w_print_option
end type
type st_printer from statictext within w_print_option
end type
type cb_print from commandbutton within w_print_option
end type
type gb_1 from groupbox within w_print_option
end type
end forward

global type w_print_option from window
string tag = " "
integer x = 672
integer y = 268
integer width = 1856
integer height = 1084
boolean titlebar = true
string title = " Print Options"
windowtype windowtype = response!
long backcolor = 10841658
toolbaralignment toolbaralignment = alignatleft!
boolean center = true
sle_printer sle_printer
ddlb_range ddlb_range
st_print st_print
cb_printer cb_printer
cb_cancel cb_cancel
cbx_collate cbx_collate
cbx_print_to_file cbx_print_to_file
st_3 st_3
sle_page_range sle_page_range
rb_pages rb_pages
rb_current_page rb_current_page
rb_all rb_all
em_copies em_copies
st_copies st_copies
st_printer st_printer
cb_print cb_print
gb_1 gb_1
end type
global w_print_option w_print_option

type variables
string is_page_range
datawindow idw_dw
end variables

forward prototypes
private subroutine wf_page_range (radiobutton who)
end prototypes

private subroutine wf_page_range (radiobutton who);choose case who
		
	case rb_all
		sle_page_range.text = ''
		sle_page_range.enabled = false
		is_page_range = 'a'
		
	case rb_current_page
		sle_page_range.text = ''
		sle_page_range.enabled = false
		is_page_range = 'c'
		
	case rb_pages		
		sle_page_range.enabled = true
		is_page_range = 'p'
		
end choose
end subroutine

event open;idw_dw = message.powerobjectparm
sle_printer.text = idw_dw.describe('datawindow.printer')
is_page_range = 'a'

end event

on w_print_option.create
this.sle_printer=create sle_printer
this.ddlb_range=create ddlb_range
this.st_print=create st_print
this.cb_printer=create cb_printer
this.cb_cancel=create cb_cancel
this.cbx_collate=create cbx_collate
this.cbx_print_to_file=create cbx_print_to_file
this.st_3=create st_3
this.sle_page_range=create sle_page_range
this.rb_pages=create rb_pages
this.rb_current_page=create rb_current_page
this.rb_all=create rb_all
this.em_copies=create em_copies
this.st_copies=create st_copies
this.st_printer=create st_printer
this.cb_print=create cb_print
this.gb_1=create gb_1
this.Control[]={this.sle_printer,&
this.ddlb_range,&
this.st_print,&
this.cb_printer,&
this.cb_cancel,&
this.cbx_collate,&
this.cbx_print_to_file,&
this.st_3,&
this.sle_page_range,&
this.rb_pages,&
this.rb_current_page,&
this.rb_all,&
this.em_copies,&
this.st_copies,&
this.st_printer,&
this.cb_print,&
this.gb_1}
end on

on w_print_option.destroy
destroy(this.sle_printer)
destroy(this.ddlb_range)
destroy(this.st_print)
destroy(this.cb_printer)
destroy(this.cb_cancel)
destroy(this.cbx_collate)
destroy(this.cbx_print_to_file)
destroy(this.st_3)
destroy(this.sle_page_range)
destroy(this.rb_pages)
destroy(this.rb_current_page)
destroy(this.rb_all)
destroy(this.em_copies)
destroy(this.st_copies)
destroy(this.st_printer)
destroy(this.cb_print)
destroy(this.gb_1)
end on

type sle_printer from singlelineedit within w_print_option
integer x = 306
integer y = 68
integer width = 1047
integer height = 84
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long backcolor = 15780518
boolean enabled = false
boolean autohscroll = false
borderstyle borderstyle = stylelowered!
end type

type ddlb_range from dropdownlistbox within w_print_option
integer x = 293
integer y = 712
integer width = 1065
integer height = 288
integer taborder = 120
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 16777215
string text = "All Pages In Range"
boolean sorted = false
string item[] = {"All pages in range","Even pages","Odd pages"}
borderstyle borderstyle = stylelowered!
end type

type st_print from statictext within w_print_option
integer x = 59
integer y = 728
integer width = 224
integer height = 68
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 16777215
long backcolor = 10841658
boolean enabled = false
string text = "Group"
alignment alignment = right!
boolean focusrectangle = false
end type

type cb_printer from commandbutton within w_print_option
integer x = 1408
integer y = 320
integer width = 338
integer height = 88
integer taborder = 110
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Prin&ter..."
end type

on clicked;printsetup()
sle_printer.text = idw_dw.describe('datawindow.printer')
end on

type cb_cancel from commandbutton within w_print_option
integer x = 1408
integer y = 212
integer width = 338
integer height = 88
integer taborder = 100
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Cancel"
boolean cancel = true
end type

on clicked;closewithreturn(parent,-1)
end on

type cbx_collate from checkbox within w_print_option
integer x = 1390
integer y = 592
integer width = 489
integer height = 68
integer taborder = 80
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 16777215
long backcolor = 10841658
string text = "Collate"
end type

type cbx_print_to_file from checkbox within w_print_option
integer x = 1390
integer y = 500
integer width = 434
integer height = 68
integer taborder = 70
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 16777215
long backcolor = 10841658
string text = "Print to Fi&le"
end type

type st_3 from statictext within w_print_option
integer x = 105
integer y = 564
integer width = 1211
integer height = 112
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 16777215
long backcolor = 10841658
boolean enabled = false
string text = "Enter page number and/or page range. For example: 1,3,5-12"
boolean focusrectangle = false
end type

type sle_page_range from singlelineedit within w_print_option
integer x = 462
integer y = 464
integer width = 837
integer height = 84
integer taborder = 60
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 16777215
boolean autohscroll = false
borderstyle borderstyle = stylelowered!
end type

event modified;rb_pages.checked = true
end event

type rb_pages from radiobutton within w_print_option
integer x = 146
integer y = 476
integer width = 297
integer height = 68
integer taborder = 50
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 16777215
long backcolor = 10841658
string text = "Page:"
end type

on clicked;wf_page_range(this)
end on

type rb_current_page from radiobutton within w_print_option
integer x = 146
integer y = 408
integer width = 462
integer height = 68
integer taborder = 40
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 16777215
long backcolor = 10841658
string text = "Current page"
end type

on clicked;wf_page_range(this)
end on

type rb_all from radiobutton within w_print_option
integer x = 146
integer y = 340
integer width = 247
integer height = 68
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 16777215
long backcolor = 10841658
string text = "&All"
boolean checked = true
end type

on clicked;wf_page_range(this)
end on

type em_copies from editmask within w_print_option
integer x = 306
integer y = 164
integer width = 242
integer height = 88
integer taborder = 10
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 16777215
string text = "1"
borderstyle borderstyle = stylelowered!
string mask = "#####"
end type

type st_copies from statictext within w_print_option
integer x = 64
integer y = 180
integer width = 224
integer height = 68
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 16777215
long backcolor = 10841658
boolean enabled = false
string text = "Copies:"
boolean focusrectangle = false
end type

type st_printer from statictext within w_print_option
integer x = 64
integer y = 68
integer width = 210
integer height = 68
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 16777215
long backcolor = 10841658
boolean enabled = false
string text = "Printer:"
boolean focusrectangle = false
end type

type cb_print from commandbutton within w_print_option
integer x = 1408
integer y = 100
integer width = 338
integer height = 88
integer taborder = 90
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Print"
boolean default = true
end type

event clicked;string tmp, command
long row 
string	docname, named
int	value

choose case lower(left(ddlb_range.text,1)) // determine rangeinclude (all,even,odd)
	case 'a' // all
		tmp = '0'
	case 'e' // even
		tmp = '1'
	case 'o' //odd
		tmp = '2'
end choose

command = 'datawindow.print.page.rangeinclude = '+tmp
if cbx_collate.checked then // collate output ?
	command = command +  " datawindow.print.collate = yes"
else
	command = command +  " datawindow.print.collate = no"
end if
choose case is_page_range // did they pick a page range?
	case 'a'  // all
		tmp = ''
	case 'c' // current page?
		row = idw_dw.getrow()
		tmp = idw_dw.describe("evaluate('page()',"+string(row)+")")
	case 'p' // a range?
		tmp = sle_page_range.text
end choose		
if len(tmp) > 0 then command = command +  " datawindow.print.page.range = '"+tmp+"'"

// number of copies ?
if len(em_copies.text) > 0 then command = command +  " datawindow.print.copies = "+em_copies.text

if cbx_print_to_file.checked then // print to file ?
	value = GetFileSaveName("Print To File", docname, named, "PRN", "Print (*.PRN),*.PRN")
	if value = 1 then 
		command = command + " datawindow.print.filename = '"+docname+"'"
	else // they canceled out of the dialog so quit completely
		return
	end if
end if

// now alter the datawindow
tmp = idw_dw.modify(command)

if len(tmp) > 0 then // if error the display the 
	messagebox('Error Setting Print Options','Error message = ' + tmp + '~r~nCommand = ' + command)
	return
end if

closewithreturn(parent,1)

end event

type gb_1 from groupbox within w_print_option
integer x = 69
integer y = 280
integer width = 1298
integer height = 408
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 16777215
long backcolor = 10841658
string text = "Page range"
end type

