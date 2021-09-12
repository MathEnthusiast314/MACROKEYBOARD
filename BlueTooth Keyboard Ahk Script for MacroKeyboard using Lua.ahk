
; HELLO, poeple who want info about making a second keyboard, using luamacros!

; Here's my LTT video about how I use the 2nd keyboard with Luamacros: https://www.youtube.com/watch?v=Arn8ExQ2Gjg

;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


;-------------2ND KEYBOARD USING LUAMACROS-----------------

#IfWinActive ahk_exe Adobe Premiere Pro.exe ;---EVERYTHING BELOW THIS LINE WILL ONLY WORK INSIDE PREMIERE PRO. But you can change this to anything you like. You can use Window Spy to determine the ahk_exe of any program, so that your macros will only work when and where you want them to.

;There is no code here. T'was just an example.
#Include Eval.ahk
#IfWinActive ;---- This will allow for everything below this line to work in ANY application.


F24::
FileRead, key, PATH\MACROKEYBOARD\Keypressed.txt
FileRead, Mode, PATH\MACROKEYBOARD\Mode1.txt
FileRead, Togg, PATH\MACROKEYBOARD\Toggle.txt
FileRead, TypedText, PATH\MACROKEYBOARD\AllText.txt
Sleep, 300
FileRead, TypedText, PATH\MACROKEYBOARD\AllText.txt
FileRead, TextToBeEvaluated, PATH\MACROKEYBOARD\Evaluating.txt
StringAbc := "abcdefghijklmnopqrstuvwxyz1234567890"

If (key = "tab" && Mode != "Locked!")
{
	StatusToggle()
} 

StatusToggle()
{
	Sleep, 350
	FileRead, Togg, PATH\MACROKEYBOARD\Toggle.txt
	If (Togg = "True!")
	{
		SoundPlay, PATH\MACROKEYBOARD\Sounds\ChangeIsTrue.mp3 ,  WAIT
	}
	else if (Togg = "False!")
	{
		SoundPlay, PATH\MACROKEYBOARD\Sounds\ChangeIsFalse.mp3 ,  WAIT
	}

}
;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
If (key = "enter")
{
	WhichMode(Mode)
}
If (key = "escape" &&(Togg = "True!" || Mode = "Locked!"))
{
	WhichMode(Mode)
}
If (key = "F1" &&(Togg = "True!" || Mode = "Locked!"))
{
	WhichMode(Mode)
}
If (key = "F2" &&(Togg = "True!" || Mode = "Locked!"))
{
	WhichMode(Mode)
}
If (key = "F3" &&(Togg = "True!" || Mode = "Locked!"))
{
	WhichMode(Mode)
}
If (key = "F4" &&(Togg = "True!" || Mode = "Locked!"))
{
	WhichMode(Mode)
}
If (key = "F5" &&(Togg = "True!" || Mode = "Locked!"))
{
	WhichMode(Mode)
}
If (key = "F6" &&(Togg = "True!" || Mode = "Locked!"))
{
	WhichMode(Mode)
}
If (key = "delete" &&(Togg = "True!" || Mode = "Locked!"))
{
	WhichMode(Mode)
}
;~~~~~~~~~~~~~~
WhichMode(Mode)
{
	Sleep, 350
	FileRead, Mode, PATH\MACROKEYBOARD\Mode1.txt
	If (Mode = "Windows!")
	{
		SoundPlay, PATH\MACROKEYBOARD\Sounds\Windows.mp3 ,  WAIT
	}
	else if (Mode = "Word!")
	{
		SoundPlay, PATH\MACROKEYBOARD\Sounds\Word.mp3 ,  WAIT
	}
	else if (Mode = "Desmos!")
	{
		SoundPlay, PATH\MACROKEYBOARD\Sounds\Desmos.mp3 ,  WAIT
	}
	else if (Mode = "Symbols!")
	{
		SoundPlay, PATH\MACROKEYBOARD\Sounds\Symbols.mp3 ,  WAIT
	}
	else if (Mode = "Tileman!")
	{
		SoundPlay, PATH\MACROKEYBOARD\Sounds\Tileman.mp3 ,  WAIT
	}
	else if (Mode = "Youtube!")
	{
		SoundPlay, PATH\MACROKEYBOARD\Sounds\Youtube.mp3 ,  WAIT
	}
	else if (Mode = "Evaluate!")
	{
		SoundPlay, PATH\MACROKEYBOARD\Sounds\Evaluate.mp3 ,  WAIT
	}
	else if (Mode = "Locked!")
	{
		SoundPlay, PATH\MACROKEYBOARD\Sounds\Locked.mp3 ,  WAIT
	}
	else if (Mode = "Locked!unlocked")
	{
		StatusToggle()
	}
	
}

;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~27-06-2020

/*
IfInString, StringAbc, %key%
{
	If (SubStr(TypedText, StrLen(TypedText)-StrLen("qq")+1,StrLen(TypedText))="qq"&&Mode = "Windows!"&&A_TimeSincePriorHotkey<2500)
	{
		Send !{F4}
	}
	else if (key = "q" && Mode = "Windows!")
	{
	Send ^w
	}
}
*/
If (key = "q" && Mode = "Windows!")
{
	Send ^w
}
If (key = "comma" && Mode = "Windows!")
{
	Send !{F4}
}
If (key = "w" && Mode = "Windows!")
{
	Send ^t
}
If(key = "c" && Mode = "Windows!")
{
	Send ^c
}
If(key = "p" && Mode = "Windows!")
{
	Send ^v
}
If(key = "n" && Mode = "Windows!")
{
	Run Notepad
}
If(key = "minus" && Mode = "Windows!")
{
	Send ^+{Tab}
}
If(key = "equals" && Mode = "Windows!")
{
	Send ^{Tab}
}
If(key = "d" && Mode = "Windows!")
{
	FormatTime, TimeString, , dd-MM-yyyy
	Send %TimeString%
}
If(key = "slash" && Mode = "Windows!")
{
	Send, {ALT DOWN}{TAB}
	Sleep, 1500
	Send, {ALT UP}
}
If(key = "s" && Mode = "Windows!")
{
	Send, #+s
}
If(key = "t" && Mode = "Windows!")
{
	Winset, Alwaysontop, , A
}




;Symbols~~~~~~~~~~~~26/6/2020


;---IfInString, StringAbc, %key%
;---{	
If(key = "period" && Mode = "Symbols!" ){
	If (SubStr(TypedText, StrLen(TypedText)-StrLen("gmail")+1,StrLen(TypedText))="gmail"&&Mode = "Symbols!")
	{
		Send yourgmail@gmail.com
	}
	If (SubStr(TypedText, StrLen(TypedText)-StrLen("email")+1,StrLen(TypedText))="email"&&Mode = "Symbols!")
	{
		Send youremail@hotmail.com
	}
	If (SubStr(TypedText, StrLen(TypedText)-StrLen("smile")+1,StrLen(TypedText))="smile"&&Mode = "Symbols!")
	{
		Send {Alt down}{Numpad1}{ALT UP}
	}
	If (SubStr(TypedText, StrLen(TypedText)-StrLen("heart")+1,StrLen(TypedText))="heart"&&Mode = "Symbols!")
	{
		Send {Alt down}{Numpad3}{ALT UP}
	}
	If (SubStr(TypedText, StrLen(TypedText)-StrLen("diamond")+1,StrLen(TypedText))="diamond"&&Mode = "Symbols!")
	{
		Send {Alt down}{Numpad4}{ALT UP}
	}
	If (SubStr(TypedText, StrLen(TypedText)-StrLen("clubs")+1,StrLen(TypedText))="clubs"&&Mode = "Symbols!")
	{
		Send {Alt down}{Numpad5}{ALT UP}
	}
	If (SubStr(TypedText, StrLen(TypedText)-StrLen("spades")+1,StrLen(TypedText))="spades"&&Mode = "Symbols!")
	{
		Send {Alt down}{Numpad6}{ALT UP}
	}
	If (SubStr(TypedText, StrLen(TypedText)-StrLen("dot")+1,StrLen(TypedText))="dot"&&Mode = "Symbols!")
	{
		Send {Alt down}{Numpad7}{ALT UP}
	}
	If (SubStr(TypedText, StrLen(TypedText)-StrLen("circle")+1,StrLen(TypedText))="circle"&&Mode = "Symbols!")
	{
		Send {Alt down}{Numpad9}{ALT UP}
	}
	If (SubStr(TypedText, StrLen(TypedText)-StrLen("male")+1,StrLen(TypedText))="male"&&Mode = "Symbols!")
	{
		Send {Alt down}{Numpad1}{Numpad1}{ALT UP}
	}
	If (SubStr(TypedText, StrLen(TypedText)-StrLen("female")+1,StrLen(TypedText))="female"&&Mode = "Symbols!")
	{
		Send {Alt down}{Numpad1}{Numpad2}{ALT UP}
	}
	If (SubStr(TypedText, StrLen(TypedText)-StrLen("music1")+1,StrLen(TypedText))="music1"&&Mode = "Symbols!")
	{
		Send {Alt down}{Numpad1}{Numpad3}{ALT UP}
	}
	If (SubStr(TypedText, StrLen(TypedText)-StrLen("music2")+1,StrLen(TypedText))="music2"&&Mode = "Symbols!")
	{
		Send {Alt down}{Numpad1}{Numpad4}{ALT UP}
	}
	If (SubStr(TypedText, StrLen(TypedText)-StrLen("sun")+1,StrLen(TypedText))="sun"&&Mode = "Symbols!")
	{
		Send {Alt down}{Numpad1}{Numpad5}{ALT UP}
	}
	If (SubStr(TypedText, StrLen(TypedText)-StrLen("dleft")+1,StrLen(TypedText))="dleft"&&Mode = "Symbols!")
	{
		Send {Alt down}{Numpad1}{Numpad6}{ALT UP}
	}
	If (SubStr(TypedText, StrLen(TypedText)-StrLen("dright")+1,StrLen(TypedText))="dright"&&Mode = "Symbols!")
	{
		Send {Alt down}{Numpad1}{Numpad7}{ALT UP}
	}
	If (SubStr(TypedText, StrLen(TypedText)-StrLen("varrow")+1,StrLen(TypedText))="varrow"&&Mode = "Symbols!")
	{
		Send {Alt down}{Numpad1}{Numpad8}{ALT UP}
	}
	If (SubStr(TypedText, StrLen(TypedText)-StrLen("tooexcited")+1,StrLen(TypedText))="tooexcited"&&Mode = "Symbols!")
	{
		Send {Alt down}{Numpad1}{Numpad9}{ALT UP}
	}
	If (SubStr(TypedText, StrLen(TypedText)-StrLen("dash")+1,StrLen(TypedText))="dash"&&Mode = "Symbols!")
	{
		Send {Alt down}{Numpad1}{Numpad9}{Numpad6}{ALT UP}
	}
If (SubStr(TypedText, StrLen(TypedText)-StrLen("equals")+1,StrLen(TypedText))="equals"&&Mode = "Symbols!")
	{
		Send {Alt down}{Numpad2}{Numpad0}{Numpad5}{ALT UP}
	}
	If (SubStr(TypedText, StrLen(TypedText)-StrLen("fatdash")+1,StrLen(TypedText))="fatdash"&&Mode = "Symbols!")
	{
		Send {Alt down}{Numpad2}{Numpad2}{ALT UP}
	}
	If (SubStr(TypedText, StrLen(TypedText)-StrLen("aup")+1,StrLen(TypedText))="aup"&&Mode = "Symbols!")
	{
		Send {Alt down}{Numpad2}{Numpad4}{ALT UP}
	}
	If (SubStr(TypedText, StrLen(TypedText)-StrLen("adown")+1,StrLen(TypedText))="adown"&&Mode = "Symbols!")
	{
		Send {Alt down}{Numpad2}{Numpad5}{ALT UP}
	}
	If (SubStr(TypedText, StrLen(TypedText)-StrLen("aright")+1,StrLen(TypedText))="aright"&&Mode = "Symbols!")
	{
		Send {Alt down}{Numpad2}{Numpad6}{ALT UP}
	}
	If (SubStr(TypedText, StrLen(TypedText)-StrLen("aleft")+1,StrLen(TypedText))="aleft"&&Mode = "Symbols!")
	{
		Send {Alt down}{Numpad2}{Numpad7}{ALT UP}
	}
	If (SubStr(TypedText, StrLen(TypedText)-StrLen("harrow")+1,StrLen(TypedText))="harrow"&&Mode = "Symbols!")
	{
		Send {Alt down}{Numpad2}{Numpad9}{ALT UP}
	}
	If (SubStr(TypedText, StrLen(TypedText)-StrLen("dup")+1,StrLen(TypedText))="dup"&&Mode = "Symbols!")
	{
		Send {Alt down}{Numpad3}{Numpad0}{ALT UP}
	}
	If (SubStr(TypedText, StrLen(TypedText)-StrLen("ddown")+1,StrLen(TypedText))="ddown"&&Mode = "Symbols!")
	{
		Send {Alt down}{Numpad3}{Numpad1}{ALT UP}
	}
	If (SubStr(TypedText, StrLen(TypedText)-StrLen("sqrr")+1,StrLen(TypedText))="sqrr"&&Mode = "Symbols!")
	{
		Send {Alt down}{Numpad2}{Numpad5}{Numpad3}{ALT UP}
	}
	If (SubStr(TypedText, StrLen(TypedText)-StrLen("box")+1,StrLen(TypedText))="box"&&Mode = "Symbols!")
	{
		Send {Alt down}{Numpad2}{Numpad5}{Numpad4}{ALT UP}
	}
	If (SubStr(TypedText, StrLen(TypedText)-StrLen("function")+1,StrLen(TypedText))="function"&&Mode = "Symbols!")
	{
		Send {Alt down}{Numpad0}{Numpad1}{Numpad3}{Numpad1}{ALT UP}
	}
	If (SubStr(TypedText, StrLen(TypedText)-StrLen("ellipses")+1,StrLen(TypedText))="ellipses"&&Mode = "Symbols!")
	{
		Send {Alt down}{Numpad0}{Numpad1}{Numpad3}{Numpad3}{ALT UP}
	}
	If (SubStr(TypedText, StrLen(TypedText)-StrLen("quotesopen")+1,StrLen(TypedText))="quotesopen"&&Mode = "Symbols!")
	{
		Send {Alt down}{Numpad0}{Numpad1}{Numpad4}{Numpad7}{ALT UP}
	}
	If (SubStr(TypedText, StrLen(TypedText)-StrLen("quotesclose")+1,StrLen(TypedText))="quotesclose"&&Mode = "Symbols!")
	{
		Send {Alt down}{Numpad0}{Numpad1}{Numpad4}{Numpad8}{ALT UP}
	}
	If (SubStr(TypedText, StrLen(TypedText)-StrLen("alpha")+1,StrLen(TypedText))="alpha"&&Mode = "Symbols!")
	{
		Send {Alt down}{Numpad2}{Numpad2}{Numpad4}{ALT UP}
	}
	If (SubStr(TypedText, StrLen(TypedText)-StrLen("beta")+1,StrLen(TypedText))="beta"&&Mode = "Symbols!")
	{
		Send {Alt down}{Numpad2}{Numpad2}{Numpad5}{ALT UP}
	}
	If (SubStr(TypedText, StrLen(TypedText)-StrLen("pi")+1,StrLen(TypedText))="pi"&&Mode = "Symbols!")
	{
		Send {Alt down}{Numpad2}{Numpad2}{Numpad7}{ALT UP}
	}
	If (SubStr(TypedText, StrLen(TypedText)-StrLen("sigma")+1,StrLen(TypedText))="sigma"&&Mode = "Symbols!")
	{
		Send {Alt down}{Numpad2}{Numpad2}{Numpad8}{ALT UP}
	}
	If (SubStr(TypedText, StrLen(TypedText)-StrLen("longdash")+1,StrLen(TypedText))="longdash"&&Mode = "Symbols!")
	{
		Send {Alt down}{Numpad0}{Numpad1}{Numpad5}{Numpad1}{ALT UP}
	}
	If (SubStr(TypedText, StrLen(TypedText)-StrLen("multiply")+1,StrLen(TypedText))="multiply"&&Mode = "Symbols!")
	{
		Send {Alt down}{Numpad0}{Numpad2}{Numpad1}{Numpad5}{ALT UP}
	}
	If (SubStr(TypedText, StrLen(TypedText)-StrLen("bigdeg")+1,StrLen(TypedText))="bigdeg"&&Mode = "Symbols!")
	{
		Send {Alt down}{Numpad1}{Numpad6}{Numpad7}{ALT UP}
	}
	If (SubStr(TypedText, StrLen(TypedText)-StrLen("doubleleft")+1,StrLen(TypedText))="doubleleft"&&Mode = "Symbols!")
	{
		Send {Alt down}{Numpad1}{Numpad7}{Numpad4}{ALT UP}
	}
	If (SubStr(TypedText, StrLen(TypedText)-StrLen("doubleright")+1,StrLen(TypedText))="doubleright"&&Mode = "Symbols!")
	{
		Send {Alt down}{Numpad1}{Numpad7}{Numpad5}{ALT UP}
	}
	If (SubStr(TypedText, StrLen(TypedText)-StrLen("doublelines")+1,StrLen(TypedText))="doublelines"&&Mode = "Symbols!")
	{
		Send {Alt down}{Numpad1}{Numpad8}{Numpad6}{ALT UP}
	}
	If (SubStr(TypedText, StrLen(TypedText)-StrLen("infinity")+1,StrLen(TypedText))="infinity"&&Mode = "Symbols!")
	{
		Send {Alt down}{Numpad2}{Numpad3}{Numpad6}{ALT UP}
	}
	If (SubStr(TypedText, StrLen(TypedText)-StrLen("phi")+1,StrLen(TypedText))="phi"&&Mode = "Symbols!")
	{
		Send {Alt down}{Numpad2}{Numpad3}{Numpad7}{ALT UP}
	}
	If (SubStr(TypedText, StrLen(TypedText)-StrLen("intersection")+1,StrLen(TypedText))="intersection"&&Mode = "Symbols!")
	{
		Send {Alt down}{Numpad2}{Numpad3}{Numpad9}{ALT UP}
	}
	If (SubStr(TypedText, StrLen(TypedText)-StrLen("tripleequals")+1,StrLen(TypedText))="tripleequals"&&Mode = "Symbols!")
	{
		Send {Alt down}{Numpad2}{Numpad4}{Numpad0}{ALT UP}
	}
	If (SubStr(TypedText, StrLen(TypedText)-StrLen("plusominus")+1,StrLen(TypedText))="plusominus"&&Mode = "Symbols!")
	{
		Send {Alt down}{Numpad2}{Numpad4}{Numpad1}{ALT UP}
	}
	If (SubStr(TypedText, StrLen(TypedText)-StrLen("gtoet")+1,StrLen(TypedText))="gtoet"&&Mode = "Symbols!")
	{
		Send {Alt down}{Numpad2}{Numpad4}{Numpad2}{ALT UP}
	}
	If (SubStr(TypedText, StrLen(TypedText)-StrLen("ltoet")+1,StrLen(TypedText))="ltoet"&&Mode = "Symbols!")
	{
		Send {Alt down}{Numpad2}{Numpad4}{Numpad3}{ALT UP}
	}
	If (SubStr(TypedText, StrLen(TypedText)-StrLen("divide")+1,StrLen(TypedText))="divide"&&Mode = "Symbols!")
	{
		Send {Alt down}{Numpad2}{Numpad4}{Numpad6}{ALT UP}
	}
	If (SubStr(TypedText, StrLen(TypedText)-StrLen("approx")+1,StrLen(TypedText))="approx"&&Mode = "Symbols!")
	{
		Send {Alt down}{Numpad2}{Numpad4}{Numpad7}{ALT UP}
	}
	If (SubStr(TypedText, StrLen(TypedText)-StrLen("smalldeg")+1,StrLen(TypedText))="smalldeg"&&Mode = "Symbols!")
	{
		Send {Alt down}{Numpad2}{Numpad4}{Numpad8}{ALT UP}
	}
	If (SubStr(TypedText, StrLen(TypedText)-StrLen("cube")+1,StrLen(TypedText))="cube"&&Mode = "Symbols!")
	{
		Send {Alt down}{Numpad0}{Numpad1}{Numpad7}{Numpad9}{ALT UP}
	}
	If (SubStr(TypedText, StrLen(TypedText)-StrLen("sqrt")+1,StrLen(TypedText))="sqrt"&&Mode = "Symbols!")
	{
		Send {Alt down}{Numpad2}{Numpad5}{Numpad1}{ALT UP}
	}
	If (SubStr(TypedText, StrLen(TypedText)-StrLen("theta")+1,StrLen(TypedText))="theta"&&Mode = "Symbols!")
	{
		Send θ
	}
	If (SubStr(TypedText, StrLen(TypedText)-StrLen("therefore")+1,StrLen(TypedText))="therefore"&&Mode = "Symbols!")
	{
		Send ∴
	}
	If (SubStr(TypedText, StrLen(TypedText)-StrLen("integral")+1,StrLen(TypedText))="integral"&&Mode = "Symbols!")
	{
		Send ∫
	}
	If (SubStr(TypedText, StrLen(TypedText)-StrLen("include")+1,StrLen(TypedText))="include"&&Mode = "Symbols!")
	{
		Send ∈
	}
}	
;---}


;~~~~~~~27-06-2020


;~~get URL~~~~~~~~~~~~~~~~~~~~~~~~~~https://www.autohotkey.com/boards/viewtopic.php?t=3702

GetActiveBrowserURL() {
	global ModernBrowsers, LegacyBrowsers
	WinGetClass, sClass, A
	If sClass In % ModernBrowsers
		Return GetBrowserURL_ACC(sClass)
	Else If sClass In % LegacyBrowsers
		Return GetBrowserURL_DDE(sClass) ; empty string if DDE not supported (or not a browser)
	Else
		Return ""
}
GetBrowserURL_DDE(sClass) {
	WinGet, sServer, ProcessName, % "ahk_class " sClass
	StringTrimRight, sServer, sServer, 4
	iCodePage := A_IsUnicode ? 0x04B0 : 0x03EC ; 0x04B0 = CP_WINUNICODE, 0x03EC = CP_WINANSI
	DllCall("DdeInitialize", "UPtrP", idInst, "Uint", 0, "Uint", 0, "Uint", 0)
	hServer := DllCall("DdeCreateStringHandle", "UPtr", idInst, "Str", sServer, "int", iCodePage)
	hTopic := DllCall("DdeCreateStringHandle", "UPtr", idInst, "Str", "WWW_GetWindowInfo", "int", iCodePage)
	hItem := DllCall("DdeCreateStringHandle", "UPtr", idInst, "Str", "0xFFFFFFFF", "int", iCodePage)
	hConv := DllCall("DdeConnect", "UPtr", idInst, "UPtr", hServer, "UPtr", hTopic, "Uint", 0)
	hData := DllCall("DdeClientTransaction", "Uint", 0, "Uint", 0, "UPtr", hConv, "UPtr", hItem, "UInt", 1, "Uint", 0x20B0, "Uint", 10000, "UPtrP", nResult) ; 0x20B0 = XTYP_REQUEST, 10000 = 10s timeout
	sData := DllCall("DdeAccessData", "Uint", hData, "Uint", 0, "Str")
	DllCall("DdeFreeStringHandle", "UPtr", idInst, "UPtr", hServer)
	DllCall("DdeFreeStringHandle", "UPtr", idInst, "UPtr", hTopic)
	DllCall("DdeFreeStringHandle", "UPtr", idInst, "UPtr", hItem)
	DllCall("DdeUnaccessData", "UPtr", hData)
	DllCall("DdeFreeDataHandle", "UPtr", hData)
	DllCall("DdeDisconnect", "UPtr", hConv)
	DllCall("DdeUninitialize", "UPtr", idInst)
	csvWindowInfo := StrGet(&sData, "CP0")
	StringSplit, sWindowInfo, csvWindowInfo, `" ;"; comment to avoid a syntax highlighting issue in autohotkey.com/boards
	Return sWindowInfo2
}

GetBrowserURL_ACC(sClass) {
	global nWindow, accAddressBar
	If (nWindow != WinExist("ahk_class " sClass)) ; reuses accAddressBar if it's the same window
	{
		nWindow := WinExist("ahk_class " sClass)
		accAddressBar := GetAddressBar(Acc_ObjectFromWindow(nWindow))
	}
	Try sURL := accAddressBar.accValue(0)
	If (sURL == "") {
		WinGet, nWindows, List, % "ahk_class " sClass ; In case of a nested browser window as in the old CoolNovo (TO DO: check if still needed)
		If (nWindows > 1) {
			accAddressBar := GetAddressBar(Acc_ObjectFromWindow(nWindows2))
			Try sURL := accAddressBar.accValue(0)
		}
	}
	If ((sURL != "") and (SubStr(sURL, 1, 4) != "http")) ; Modern browsers omit "http://"
		sURL := "http://" sURL
	If (sURL == "")
		nWindow := -1 ; Don't remember the window if there is no URL
	Return sURL
}

; "GetAddressBar" based in code by uname
; Found at http://autohotkey.com/board/topic/103178-/?p=637687

GetAddressBar(accObj) {
	Try If ((accObj.accRole(0) == 42) and IsURL(accObj.accValue(0)))
		Return accObj
	Try If ((accObj.accRole(0) == 42) and IsURL("http://" accObj.accValue(0))) ; Modern browsers omit "http://"
		Return accObj
	For nChild, accChild in Acc_Children(accObj)
		If IsObject(accAddressBar := GetAddressBar(accChild))
			Return accAddressBar
}

IsURL(sURL) {
	Return RegExMatch(sURL, "^(?<Protocol>https?|ftp)://(?<Domain>(?:[\w-]+\.)+\w\w+)(?::(?<Port>\d+))?/?(?<Path>(?:[^:/?# ]*/?)+)(?:\?(?<Query>[^#]+)?)?(?:\#(?<Hash>.+)?)?$")
}
Acc_Init()
{
	static h
	If Not h
		h:=DllCall("LoadLibrary","Str","oleacc","Ptr")
}
Acc_ObjectFromWindow(hWnd, idObject = 0)
{
	Acc_Init()
	If DllCall("oleacc\AccessibleObjectFromWindow", "Ptr", hWnd, "UInt", idObject&=0xFFFFFFFF, "Ptr", -VarSetCapacity(IID,16)+NumPut(idObject==0xFFFFFFF0?0x46000000000000C0:0x719B3800AA000C81,NumPut(idObject==0xFFFFFFF0?0x0000000000020400:0x11CF3C3D618736E0,IID,"Int64"),"Int64"), "Ptr*", pacc)=0
	Return ComObjEnwrap(9,pacc,1)
}
Acc_Query(Acc) {
	Try Return ComObj(9, ComObjQuery(Acc,"{618736e0-3c3d-11cf-810c-00aa00389b71}"), 1)
}
Acc_Children(Acc) {
	If ComObjType(Acc,"Name") != "IAccessible"
		ErrorLevel := "Invalid IAccessible Object"
	Else {
		Acc_Init(), cChildren:=Acc.accChildCount, Children:=[]
		If DllCall("oleacc\AccessibleChildren", "Ptr",ComObjValue(Acc), "Int",0, "Int",cChildren, "Ptr",VarSetCapacity(varChildren,cChildren*(8+2*A_PtrSize),0)*0+&varChildren, "Int*",cChildren)=0 {
			Loop %cChildren%
				i:=(A_Index-1)*(A_PtrSize*2+8)+8, child:=NumGet(varChildren,i), Children.Insert(NumGet(varChildren,i-8)=9?Acc_Query(child):child), NumGet(varChildren,i-8)=9?ObjRelease(child):
			Return Children.MaxIndex()?Children:
		} Else
			ErrorLevel := "AccessibleChildren DllCall Failed"
	}
}
ModernBrowsers := "ApplicationFrameWindow,Chrome_WidgetWin_0,Chrome_WidgetWin_1,Maxthon3Cls_MainFrm,MozillaWindowClass,Slimjet_WidgetWin_1"
	LegacyBrowsers := "IEFrame,OperaWindowClass"
	
	sURL := GetActiveBrowserURL()
;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


If(key = "a" && Mode = "Desmos!" && InStr(sURL, "desmos.com"))
{
	Send, ^o
}
If(key = "semicolon" && Mode = "Desmos!" && InStr(sURL, "desmos.com"))
{
	Send, ^!x
}
If(key = "n" && Mode = "Desmos!" && InStr(sURL, "desmos.com"))
{
	Send, ^!o
}
If(key = "f" && Mode = "Desmos!" && InStr(sURL, "desmos.com"))
{
	Send, ^!f
}
If(key = "t" && Mode = "Desmos!" && InStr(sURL, "desmos.com"))
{
	Send, ^!t
}
If(key = "comma" && Mode = "Desmos!" && InStr(sURL, "desmos.com"))
{
	Send, ^z
}
If(key = "period" && Mode = "Desmos!" && InStr(sURL, "desmos.com"))
{
	Send, ^+z
}
If(key = "2" && Mode = "Desmos!" && InStr(sURL, "desmos.com"))
{
	Send, sqrt
}
If(key = "3" && Mode = "Desmos!" && InStr(sURL, "desmos.com"))
{
	Send, cbrt
}
If(key = "4" && Mode = "Desmos!" && InStr(sURL, "desmos.com"))
{
	Send, nthroot
}
If(key = "7" && Mode = "Desmos!" && InStr(sURL, "desmos.com"))
{
	Send, sum
}
If(key = "6" && Mode = "Desmos!" && InStr(sURL, "desmos.com"))
{
	Send, int
}
If(key = "8" && Mode = "Desmos!" && InStr(sURL, "desmos.com"))
{
	Send, prod
}
If(key = "9" && Mode = "Desmos!" && InStr(sURL, "desmos.com"))
{
	Send, pi
}
If(key = "0" && Mode = "Desmos!" && InStr(sURL, "desmos.com"))
{
	Send, theta
}


;~~~~27-06-2020

If(key = "r" && Mode = "Tileman!" && InStr(sURL, "tileman.io"))
{
	Send {left}
	Sleep, 100
	Send {down}
	Sleep, 100
	Send {left}
	Sleep, 100
	Send {down}
	Sleep, 100
	Send {left}
	Sleep, 100
	Send {down}
	Sleep, 100
	Send {left}
	Sleep, 100
	Send {down}
}

;~~~~03-07-2020



If(key = "slash" && Mode = "Youtube!" && InStr(sURL, "youtube.com"))
{
	Send, ?
}

If(key = "F8" && Mode = "Youtube!" && Togg = "False!" )
{
	Send, k
	
}
If(key = "F7" && Mode = "Youtube!" && Togg = "False!" )
{
	Send, j
	
}
If(key = "F9" && Mode = "Youtube!" && Togg = "False!" )
{
	Send, l
	
}
If(key = "left" && Mode = "Youtube!" && Togg = "False!" )
{
	Send, +p
	
}
If(key = "right" && Mode = "Youtube!" && Togg = "False!" )
{
	Send, +n
	
}
If(key = "minus" && Mode = "Youtube!" && Togg = "False!" )
{
	Send, ,
	
}
If(key = "equals" && Mode = "Youtube!" && Togg = "False!" )
{
	Send, .
	
}
If(key = "leftbracket" && Mode = "Youtube!" && Togg = "False!" )
{
	Send, +,
	
}
If(key = "rightbracket" && Mode = "Youtube!" && Togg = "False!" )
{
	Send, +.
	
}
If(key = "1" && Mode = "Youtube!" && Togg = "False!" )
{
	Send, f
	
}
If(key = "2" && Mode = "Youtube!" && Togg = "False!" )
{
	Send, t
	
}
If(key = "3" && Mode = "Youtube!" && Togg = "False!" )
{
	Send, i
	
}
If(key = "F6" && Mode = "Youtube!" && Togg = "False!" )
{
	Send, /
	
}



;~~~~~~~~~~~~10-07-2020
If(key = "slash" && Mode = "Evaluate!" )
{

	#SingleInstance Force
	SetBatchLines, -1
	TheRequiredValue := Eval(TextToBeEvaluated)
	TheRequiredValue := StrJoin(TheRequiredValue, "`n")
	TheEqualsSign := " = "
	MsgBox %TextToBeEvaluated%%TheEqualsSign%%TheRequiredValue%	
}



;~~~~
IfInString, StringAbc, %key%
{
	If (SubStr(TypedText, StrLen(TypedText)-StrLen("abcd")+1,StrLen(TypedText))="abcd"&&Mode = "Locked!")
	{
		SoundPlay, PATH\MACROKEYBOARD\Sounds\Unlocked.mp3 ,  WAIT
		FileAppend, unlocked, PATH\MACROKEYBOARD\Mode1.txt
	}
}



Return ;from luamacros F24
;THE BLOCK OF CODE ABOVE is the original, simple Luamacros-dependant script.