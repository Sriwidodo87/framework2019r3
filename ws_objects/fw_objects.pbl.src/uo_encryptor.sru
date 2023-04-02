$PBExportHeader$uo_encryptor.sru
$PBExportComments$Encrypts and decrypts strings
forward
global type uo_encryptor from nonvisualobject
end type
end forward

global type uo_encryptor from nonvisualobject
end type
global uo_encryptor uo_encryptor

type variables
string is_raw, is_encrypted, is_key="CGI"


end variables

forward prototypes
public function string of_set (string thestr)
public function STRING of_getraw ()
public function STRING of_getencrypted ()
public function string of_decrypt (string thestr)
public function string of_setkey (string thekey)
public function string of_set (string thetext, string thekey)
public function string of_decrypt (string thetext, string thekey)
end prototypes

public function string of_set (string thestr);string retVal, tempStr, tStr
int sourcePtr, keyPtr, keyLen, sourceLen, tempVal, tempKey
blob convert

retVal = is_raw
is_raw = thestr

keyPtr = 1
keyLen = len(is_key)
sourceLen = len(is_raw)
is_encrypted = ""
for sourcePtr = 1 to sourceLen
	tempVal = asc(right(is_raw, sourceLen - sourcePtr + 1))
	tempKey = asc(right(is_key, keyLen - keyPtr + 1))
	tempVal += tempKey
	// Added this section to ensure that ASCII Values stay within 0 to 255 range
	DO WHILE tempVal > 255
		if tempVal > 255 then
			tempVal = tempVal - 255
		end if
	LOOP
	// End of Section
	tStr = char(tempVal)
	convert = blob(tStr)
	tStr = string( convert, encodingANSI!)
	is_encrypted += tStr
	keyPtr ++
	if keyPtr > len(is_key) then keyPtr = 1
next

return is_encrypted
end function

public function STRING of_getraw ();return is_raw
end function

public function STRING of_getencrypted ();return is_encrypted
end function

public function string of_decrypt (string thestr);string retVal, tempStr, tStr
int sourcePtr, keyPtr, keyLen, sourceLen, tempVal, tempKey

is_encrypted = thestr

keyPtr = 1
keyLen = len(is_key)
// Fixed so that decryption is done on encrypted input string of proper length
//sourceLen = len(is_raw)
sourceLen = len(is_encrypted)
is_raw = ""
for sourcePtr = 1 to sourceLen
	tempVal = ascA(right(is_encrypted, len(is_encrypted) - sourcePtr + 1))
	tempKey = ascA(right(is_key, len(is_key) - keyPtr + 1))
	tempVal -= tempKey
	// Added this section to ensure that ASCII codes stay in 0 to 255 range
	DO WHILE tempVal < 0
		if tempVal < 0 then
			tempVal = tempVal + 255
		end if
	LOOP
	// end of section
	tStr = charA(tempVal)
	is_raw += tStr
	keyPtr ++
	if keyPtr > len(is_key) then keyPtr = 1
next

retVal = is_raw

return retVal
end function

public function string of_setkey (string thekey);string retVal
retVal = is_key
is_key = theKey
return retVal
end function

public function string of_set (string thetext, string thekey);of_setKey(theKey)
return of_set(theText)
end function

public function string of_decrypt (string thetext, string thekey);// Chagned input variable order to match documentation

of_setKey(theKey)
return of_decrypt(theText)
end function

on uo_encryptor.create
call super::create
TriggerEvent( this, "constructor" )
end on

on uo_encryptor.destroy
TriggerEvent( this, "destructor" )
call super::destroy
end on

