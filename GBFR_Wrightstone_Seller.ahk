#SingleInstance Force
#Requires AutoHotkey v2+

ClearKeys() {
	SendInput "{w up}"
	Sleep 5
	SendInput "{LButton up}"
	Sleep 5
    SendInput "{3 up}"
	Sleep 5
    SendInput "{s up}"
	Sleep 5
}

PushButton(key, delay) {
    SendInput "{" key " down}"
	Sleep delay
	SendInput "{" key " up}"
}

RunScript() {
    ;select 30 stones
    selected := 30
	Loop {
		PushButton("LButton", Random(30,50))
        Sleep Random(30,40)
        PushButton("w", Random(30,50))
        selected--
	} Until selected < 1

    ;trade window stuff
    Sleep Random(300,400)
    PushButton("3", Random(30,50))
    Sleep Random(50,100)
    PushButton("w", Random(30,50))
    Sleep Random(30,40)
    PushButton("LButton", Random(30,50))
    Sleep Random(150,200)
    PushButton("LButton", Random(30,50))
    Sleep Random(30,40)
    PushButton("s", Random(30,50))
    Sleep Random(30,40)
    PushButton("LButton", Random(30,50))
    Sleep Random(150,200)
    PushButton("LButton", Random(30,50))
    Sleep 100
}

$F1:: {
	SetTimer(RunScript, 10)
}

$+F1:: {
	ClearKeys()
	SetTimer(RunScript, 0)
}

$+esc:: {
	ClearKeys()
	exitapp
}