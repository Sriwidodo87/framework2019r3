$PBExportHeader$n_system.sru
forward
global type n_system from nonvisualobject
end type
type s_temp from structure within n_system
end type
type os_filedatetime from structure within n_system
end type
type os_finddata from structure within n_system
end type
type os_systemdatetime from structure within n_system
end type
end forward

type os_filedatetime from structure
 unsignedlong  ul_lowdatetime
 unsignedlong  ul_highdatetime
end type

type os_finddata from structure
 unsignedlong  ul_fileattributes
 os_filedatetime  str_creationtime
 os_filedatetime  str_lastaccesstime
 os_filedatetime  str_lastwritetime
 unsignedlong  ul_filesizehigh
 unsignedlong  ul_filesizelow
 unsignedlong  ul_reserved0
 unsignedlong  ul_reserved1
 character  ch_filename[260]
 character  ch_alternatefilename[14]
end type

type os_systemdatetime from structure
    uint        wYear
    uint        wMonth
    uint        wDayOfWeek
    uint        wDay
    uint        wHour
    uint        wMinute
    uint        wSecond
    uint        wMillisecond
end type

global type n_system from nonvisualobject
end type
global n_system n_system

type prototypes
FUNCTION boolean CreateDirectoryA(ref string path, long attr) LIBRARY "kernel32.dll"
FUNCTION boolean RemoveDirectoryA( ref string path ) LIBRARY "KERNEL32.DLL" 
FUNCTION long FindFirstFileA & 
  ( string filename, ref os_finddata findfiledata) & 
      LIBRARY "KERNEL32.DLL"
end prototypes

forward prototypes
public function string of_get_temppath ()
public subroutine of_rmdir (string as_path)
end prototypes

public function string of_get_temppath ();ContextKeyword lcxk_base
string ls_temp[]

this.GetContextService("Keyword", lcxk_base)
lcxk_base.getContextKeywords("TEMP", ls_temp)
RETURN ls_temp[1]

end function

public subroutine of_rmdir (string as_path);
end subroutine

on n_system.create
call super::create
TriggerEvent( this, "constructor" )
end on

on n_system.destroy
TriggerEvent( this, "destructor" )
call super::destroy
end on

