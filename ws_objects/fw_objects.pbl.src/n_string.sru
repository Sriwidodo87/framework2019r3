$PBExportHeader$n_string.sru
forward
global type n_string from nonvisualobject
end type
end forward

global type n_string from nonvisualobject
end type
global n_string n_string

forward prototypes
public function string of_add_space (string as_data, integer ai_length, string as_align)
end prototypes

public function string of_add_space (string as_data, integer ai_length, string as_align);string &
	ls_data
integer &
	i, li_lendata, li_add_space
	

as_data = trim( as_data)
li_lendata = len( as_data)

as_align = upper( as_align)

if li_lendata = ai_length then
	return as_data
else
	if li_lendata < ai_length then
		// add space
		li_add_space = ai_length - li_lendata
		for i = 1 to li_add_space
			if as_align = "RIGHT" then
				as_data = " " + as_data 
			else
				as_data = as_data + " "
			end if
		next
		return as_data
	else
		ls_data = left( as_data, ai_length)
		return ls_data
	end if
end if
	

end function

on n_string.create
call super::create
TriggerEvent( this, "constructor" )
end on

on n_string.destroy
TriggerEvent( this, "destructor" )
call super::destroy
end on

