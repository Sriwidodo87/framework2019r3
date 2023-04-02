$PBExportHeader$w_print_preview.srw
forward
global type w_print_preview from window
end type
type uo_toolbar from u_cst_toolbarstrip within w_print_preview
end type
type dw_1 from datawindow within w_print_preview
end type
end forward

global type w_print_preview from window
integer width = 3351
integer height = 1384
boolean titlebar = true
string title = "Preview"
boolean controlmenu = true
windowtype windowtype = response!
windowstate windowstate = maximized!
long backcolor = 67108864
string icon = "AppIcon!"
boolean center = true
event ue_paper ( )
event ue_print ( )
event ue_first ( )
event ue_last ( )
event ue_prior ( )
event ue_next ( )
event ue_rulers ( )
event ue_zoomin ( )
event ue_zoomout ( )
event ue_normal ( )
uo_toolbar uo_toolbar
dw_1 dw_1
end type
global w_print_preview w_print_preview

type variables
datawindow idw_prev
end variables

event ue_paper();int li_wo,li_i
str_paper_size lstr_parm
str_paper_size str_message

lstr_parm.i_left= double (dw_1.object.datawindow.print.margin.left) /1000
lstr_parm.i_right= double (dw_1.object.datawindow.print.margin.right) /1000
lstr_parm.i_top= double (dw_1.object.datawindow.print.margin.top) /1000
lstr_parm.i_bottom= double (dw_1.object.datawindow.print.margin.bottom) /1000

lstr_parm.i_orientation = integer(dw_1.object.datawindow.print.orientation) + 1
lstr_parm.i_size = integer(dw_1.object.datawindow.print.paper.size) + 1
lstr_parm.i_source= integer(dw_1.object.datawindow.print.paper.source) + 1

openwithparm(w_paper_size,lstr_parm)
str_message = message.powerobjectparm
if isvalid(str_message) then 
	dw_1.object.datawindow.print.margin.left = str_message.i_left
	dw_1.object.datawindow.print.margin.right= str_message.i_right
	dw_1.object.datawindow.print.margin.top= str_message.i_top
	dw_1.object.datawindow.print.margin.bottom = str_message.i_bottom
	dw_1.object.datawindow.print.orientation= str_message.i_orientation
	dw_1.object.datawindow.print.paper.source = str_message.i_source
	dw_1.object.datawindow.print.paper.size = str_message.i_size
end if 
	



end event

event ue_print();openwithparm(w_print_option,dw_1)
if message.doubleparm= -1 then  return
dw_1.print( )
end event

event ue_first();dw_1.scrolltorow( 1)
end event

event ue_last();dw_1.scrolltorow(dw_1.rowcount( ))

end event

event ue_prior();dw_1.scrollpriorpage( )
end event

event ue_next();dw_1.scrollnextpage( )
end event

event ue_rulers();string ls_rulers

ls_rulers =dw_1.object.datawindow.print.preview.rulers 
if ls_rulers ='yes' then 
	dw_1.object.datawindow.print.preview.rulers ='no'
else
	dw_1.object.datawindow.print.preview.rulers ='yes'
end if 
end event

event ue_zoomin();if not isvalid (dw_1) then return

string ls_factor 
integer li_factor
ls_factor = dw_1.object.datawindow.print.preview.zoom
li_factor = integer(ls_factor)

li_factor = li_factor + 5
dw_1.object.datawindow.print.preview.zoom = li_factor
dw_1.modify("datawindow.zoom = " + string(li_factor))
end event

event ue_zoomout();if not isvalid (dw_1) then return

string ls_factor 
integer li_factor
ls_factor = dw_1.object.datawindow.print.preview.zoom
li_factor = integer(ls_factor)

li_factor = li_factor - 5
dw_1.object.datawindow.print.preview.zoom = li_factor
dw_1.modify("datawindow.zoom = " + string(li_factor))
end event

event ue_normal();dw_1.object.datawindow.print.preview.zoom = 100
end event

on w_print_preview.create
this.uo_toolbar=create uo_toolbar
this.dw_1=create dw_1
this.Control[]={this.uo_toolbar,&
this.dw_1}
end on

on w_print_preview.destroy
destroy(this.uo_toolbar)
destroy(this.dw_1)
end on

event open;//Add items to the toolbar
x = 0
y =0
 idw_prev = message.powerobjectparm
dw_1.settransobject( sqlca)
dw_1.retrieve('%')
dw_1.object.datawindow.print.preview = 'yes'
dw_1.object.datawindow.print.preview.rulers ='yes'

end event

event resize;if not isnull(newwidth) then 
	uo_toolbar.x=200
	
	//uo_toolbar.width = newwidth/3 
	dw_1.x =200
	dw_1.y =300
	dw_1.width= newwidth -140	
	dw_1.height = newheight -140	
end if 

end event

type uo_toolbar from u_cst_toolbarstrip within w_print_preview
event destroy ( )
integer x = 23
integer y = 28
integer width = 1285
integer taborder = 30
end type

on uo_toolbar.destroy
call u_cst_toolbarstrip::destroy
end on

event constructor;call super::constructor;//Window Open Event or User Object Post Constructor Event (avoid loading items in the controls Constructor event):
Long ll_ToolBarItem

ll_ToolBarItem = uo_toolbar.of_AddItem("First", "..\res\first32.png", uo_toolbar.LEFT)
uo_toolbar.of_DisplayText(ll_ToolBarItem, TRUE, uo_toolbar.LEFT)

ll_ToolBarItem = uo_toolbar.of_AddItem("Prior", "..\res\prior32.png", uo_toolbar.LEFT)
uo_toolbar.of_DisplayText(ll_ToolBarItem, TRUE, uo_toolbar.LEFT)

ll_ToolBarItem = uo_toolbar.of_AddItem("Next", "..\res\next32.png", uo_toolbar.LEFT)
uo_toolbar.of_DisplayText(ll_ToolBarItem, TRUE, uo_toolbar.LEFT)

ll_ToolBarItem = uo_toolbar.of_AddItem("Last", "..\res\last32.png", uo_toolbar.LEFT)
uo_toolbar.of_DisplayText(ll_ToolBarItem, TRUE, uo_toolbar.LEFT)

ll_ToolBarItem = uo_toolbar.of_AddItem("Print", "..\res\printbig.png", uo_toolbar.RIGHT)
uo_toolbar.of_DisplayText(ll_ToolBarItem, TRUE, uo_toolbar.RIGHT)
end event

event ue_buttonclicked;call super::ue_buttonclicked;CHOOSE CASE as_button
	CASE "First" 
		Parent.TriggerEvent("ue_first")
	
	CASE "Prior" 
		Parent.TriggerEvent("ue_prior")
	
	CASE "Next" 
		Parent.TriggerEvent("ue_next")
	
	CASE "Last" 
		Parent.TriggerEvent("ue_last")
	
	CASE "Print" 
		Parent.TriggerEvent("ue_print")
END CHOOSE
end event

type dw_1 from datawindow within w_print_preview
integer x = 37
integer y = 212
integer width = 2953
integer height = 956
integer taborder = 10
string title = "none"
boolean border = false
borderstyle borderstyle = stylelowered!
end type

event rbuttondown;//m_report lm_menuid
//m_frame lm_menu
//lm_menuid = parent.menuid
//lm_menuid.m_display.popmenu( parent.pointerx(),parent.pointery( ))
//
end event

