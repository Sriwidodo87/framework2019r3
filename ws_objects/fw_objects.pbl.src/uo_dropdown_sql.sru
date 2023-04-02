$PBExportHeader$uo_dropdown_sql.sru
forward
global type uo_dropdown_sql from dropdownlistbox
end type
end forward

global type uo_dropdown_sql from dropdownlistbox
integer width = 1074
integer height = 468
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
long textcolor = 33554432
boolean vscrollbar = true
borderstyle borderstyle = stylelowered!
event ue_enter pbm_keydown
end type
global uo_dropdown_sql uo_dropdown_sql

forward prototypes
public subroutine popitem (string as_sql, character ac_delimiter, transaction atr_trans)
end prototypes

event ue_enter;if NOT KeyDown(KeyControl!) and key=KeyEnter! then
    Send(Handle(this),256,9,Long(0,0))
    return 1
end if 
end event

public subroutine popitem (string as_sql, character ac_delimiter, transaction atr_trans);string &
	ls_data1, ls_data2, ls_item

declare datacur dynamic cursor for sqlsa ;
prepare sqlsa from :as_sql using atr_trans;
open datacur;
do while atr_trans.sqlcode = 0
	fetch datacur into :ls_data1, :ls_data2;
	if atr_trans.sqlcode = 0 then
		ls_data2 = f_check_null_string( ls_data2)
		ls_item = trim( ls_data1) + &
			" " + ac_delimiter + " " + &
			trim( ls_data2)
		this.additem( ls_item)
	end if
loop
close datacur;
end subroutine

on uo_dropdown_sql.create
end on

on uo_dropdown_sql.destroy
end on

