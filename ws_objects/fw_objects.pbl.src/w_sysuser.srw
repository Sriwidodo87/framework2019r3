$PBExportHeader$w_sysuser.srw
forward
global type w_sysuser from w_master_1
end type
end forward

global type w_sysuser from w_master_1
string tag = "m_admuser"
integer width = 2670
integer height = 1152
string title = "User Maintenance"
boolean center = false
end type
global w_sysuser w_sysuser

forward prototypes
public function string wf_delete ()
public subroutine wf_pre_update ()
end prototypes

public function string wf_delete ();string &
	ls_user_id

ls_user_id = dw_master.getitemstring( dw_master.getrow(), &
	"user_id")
delete from sysuser where user_id = :ls_user_id;
commit;
return "User id : " + ls_user_id + "deleted"
end function

public subroutine wf_pre_update ();dw_master.SetItem(1,'user_password',gf_simple_encode(dw_master.Object.user_password[1],'1'))
end subroutine

on w_sysuser.create
int iCurrent
call super::create
end on

on w_sysuser.destroy
call super::destroy
end on

type uo_dwnav from w_master_1`uo_dwnav within w_sysuser
integer x = 59
integer y = 880
integer width = 1353
end type

type uo_buttons from w_master_1`uo_buttons within w_sysuser
integer x = 2043
integer y = 28
end type

type dw_master from w_master_1`dw_master within w_sysuser
integer y = 16
integer width = 1929
integer height = 468
string dataobject = "d_sysuser"
end type

type gb_1 from w_master_1`gb_1 within w_sysuser
integer x = 14
integer y = 496
integer height = 44
long backcolor = 134217731
end type

