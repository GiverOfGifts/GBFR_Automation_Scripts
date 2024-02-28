#SingleInstance Force
#Requires AutoHotkey v2+


ToRGB(color) {
    return Map("r", (color >> 16) & 0xFF, "g", (color >> 8) & 0xFF, "b", color & 0xFF)
}

CompareColors(c1, c2, variance) {
    rdiff := Abs(c1["r"] - c2["r"])
    gdiff := Abs(c1["g"] - c2["g"])
    bdiff := Abs(c1["b"] - c2["b"])

    return rdiff <= variance && gdiff <= variance && bdiff <= variance
}

RepeatIsActive() {
	ref1 := PixelGetColor(1047,1027, "Slow")
    ref2 := PixelGetColor(1048,1042, "Slow")
    ref3 := PixelGetColor(1032,1023, "Slow")

	ref1_cmp := CompareColors(ToRGB(ref1), ToRGB(0xffe66e), 40)
    ref2_cmp := CompareColors(ToRGB(ref2), ToRGB(0x9f9145), 40)
    ref3_cmp := CompareColors(ToRGB(ref3), ToRGB(0x9f9145), 40)

	return ref1_cmp && ref2_cmp && ref3_cmp
}

AntiAfkPromptIsUp() {
	ref1 := PixelGetColor(1630,507, "Slow")
    ref2 := PixelGetColor(1949,663, "Slow")
    ref3 := PixelGetColor(1698,694, "Slow")
	ref4 := PixelGetColor(1753,482, "Slow")
	ref5 := PixelGetColor(1762,507, "Slow")
	ref6 := PixelGetColor(1619,484, "Slow")

    ref1_cmp := CompareColors(ToRGB(ref1), ToRGB(0xFFF5B5), 40)
    ref2_cmp := CompareColors(ToRGB(ref2), ToRGB(0xFAFAF0), 40)
    ref3_cmp := CompareColors(ToRGB(ref3), ToRGB(0xFAFAF0), 40)
    ref4_cmp := CompareColors(ToRGB(ref4), ToRGB(0xFFF5B5), 40)
    ref5_cmp := CompareColors(ToRGB(ref5), ToRGB(0xFFF5B5), 40)
    ref6_cmp := CompareColors(ToRGB(ref6), ToRGB(0xFFF9B9), 40)

	return ref1_cmp && ref2_cmp && ref3_cmp && ref4_cmp && ref5_cmp && ref6_cmp
}

ClearScreenActive() {
	ref1 := PixelGetColor(689,110, "Slow")
    ref2 := PixelGetColor(1071,98, "Slow")
    ref3 := PixelGetColor(1505,96, "Slow")

	ref1_cmp := CompareColors(ToRGB(ref1), ToRGB(0x653d11), 40)
    ref2_cmp := CompareColors(ToRGB(ref2), ToRGB(0xFFFb9d), 40)
    ref3_cmp := CompareColors(ToRGB(ref3), ToRGB(0xffffd4), 40)

	OutputDebug "1 " ref1_cmp
	OutputDebug "1 " ref1
	OutputDebug "2 " ref2_cmp
	OutputDebug "2 " ref2
	OutputDebug "3 " ref3_cmp
	OutputDebug "3 " ref3

	return ref1_cmp && ref2_cmp && ref3_cmp
}

ClearKeys() {
	SendInput "{w up}"
	Sleep 5
	SendEvent "{LButton up}"
	Sleep 5
}

PushButton(key, delay) {
    SendInput "{" key " down}"
	Sleep delay
	SendInput "{" key " up}"
}

RunScript() {
	if AntiAfkPromptIsUp() {
		PushButton("w", Random(50,75))
	}

	if not RepeatIsActive() {
		Pushbutton("3", Random(50,75))
	}

	Sleep Random(75,100)
	PushButton("LButton", Random(50,75))
	Sleep 200
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