; generic warning box that pops when
; user attempts to use a 'stretch' hotkey
HotkeyWarning()
{
	MsgBox, No one-handed hotkeys!
}

; current window activators for frequently used programs
SetTitleMatchMode, RegEx

#!a:: WinActivate, .*Atom.*
#!p:: WinActivate, .*Windows PowerShell.*|posh.*
#!v:: WinActivate, .*Microsoft Visual Studio.*
#!j:: WinActivate, .*Mozilla Firefox$
#!s:: WinActivate, .*Sublime Text 2.*
#!o:: WinActivate, .*Microsoft Outlook.*
#!h:: WinActivate, .*HexChat.*
#!c:: WinActivate, .*Visual Studio Code.*

; launch the windows snipping tool
#!n::
Run, snippingtool
WinWaitActive, ahk_class Microsoft-Windows-Tablet-SnipperToolbar
{
    send ^{PrintScreen}
}
return


; keyboard remapping (for regular typing)
$z::Send p
$+z::Send P
$p::Send z
$+p::Send Z

$t::Send j
$+t::Send J
$j::Send t
$+j::Send T

$n::Send k
$+n::Send K
$k::Send n
$+k::Send N

$r::Send l
$+r::Send L
$l::Send r
$+l::Send R

$o::Send v
$+o::Send V
$v::Send d
$+v::Send D
$d::Send o
$+d::Send O

; $f::Send r
; F::R
; $r::Send f
; R::F



; alt + alt -> escape. specifically in place for
; mode switching in vim
<!RAlt::Send {Escape}
>!LAlt::Send {Escape}


/*
Hotkeys here effect physical keys as written, and do not
'respect' the swaps put in place by the keyboard remapping
*/

; ^ - Ctrl
; ! - Alt

; left handed hotkeys to avoid
<^s::HotkeyWarning()
<^c::HotkeyWarning()
<^v::HotkeyWarning()
<^x::HotkeyWarning()
<^z::HotkeyWarning()
<^f::HotkeyWarning()
<^t::HotkeyWarning()
<^F4::HotkeyWarning()
<!F4::HotkeyWarning()

; right handed hotkeys to avoid
>^o::HotkeyWarning()
>^l::HotkeyWarning()
>^k::HotkeyWarning()
>^p::HotkeyWarning()
>^m::HotkeyWarning() ; vs
>^,::HotkeyWarning() ; vs
>^.::HotkeyWarning() ; vs

CapsLock::
if GetKeyState("LCtrl", "p")
  send, {CapsLock}
else if GetKeyState(";", "p")
  send, {Enter}
else
  send, {End}
Return

; suspend / resume hotkeys
#!Pause::Suspend
