$PBExportHeader$n_uspb_base.sru
forward
global type n_uspb_base from nonvisualobject
end type
end forward

global type n_uspb_base from nonvisualobject
end type
global n_uspb_base n_uspb_base

on n_uspb_base.create
call super::create
TriggerEvent( this, "constructor" )
end on

on n_uspb_base.destroy
TriggerEvent( this, "destructor" )
call super::destroy
end on

