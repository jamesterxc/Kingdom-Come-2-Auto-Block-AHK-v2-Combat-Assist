#Requires AutoHotkey v2.0
#SingleInstance Force

; Performance & Environment Setup
ProcessSetPriority("Realtime")
A_MaxHotkeysPerInterval := 99000000
A_HotkeyInterval := 99000000
KeyHistory(0)
ListLines(0)
SetKeyDelay(-1, -1)
SetMouseDelay(-1)
SetDefaultMouseSpeed(0)
SetWinDelay(-1)
SetControlDelay(-1)
CoordMode("Pixel", "Screen")

; Configuration Section
color := 0x28BD59
variation := 5
searchWidth := 900
searchHeight := 900

screenWidth := A_ScreenWidth
screenHeight := A_ScreenHeight
startX := (screenWidth // 2) - (searchWidth // 2)
startY := (screenHeight // 2) - (searchHeight // 2)

global ToggleG := false
global ToggleT := false

; Toggle for G key
~*g:: {
    global ToggleG
    ToggleG := !ToggleG
    if (ToggleG) {
        SoundBeep(750, 300)
        while (ToggleG) {
            if PixelSearch(&foundX, &foundY, startX, startY, startX + searchWidth - 1, startY + searchHeight - 1, color, variation) {
                SendInput("{RButton Down}")
                Sleep 80
                SendInput("{RButton Up}")
                Sleep 20
                SendInput("{LButton Down}")
                Sleep 80
                SendInput("{LButton Up}")
                Sleep 150
                SendInput("{LButton Down}")
                Sleep 80
                SendInput("{LButton Up}")
            }
            Sleep 1
            if GetKeyState("g", "P") {
                break
            }
        }
    } else {
        SoundBeep(500, 300)
    }
}

; Toggle for Y key (formerly T)
~*y:: {
    global ToggleT
    ToggleT := !ToggleT
    if (ToggleT) {
        SoundBeep(750, 300)
        while (ToggleT) {
            if PixelSearch(&foundX, &foundY, startX, startY, startX + searchWidth - 1, startY + searchHeight - 1, color, variation) {
                SendInput("{LButton Down}")
                Sleep 80
                SendInput("{LButton Up}")
                Sleep 150
            }
            Sleep 1
            if GetKeyState("y", "P") {
                break
            }
        }
    } else {
        SoundBeep(500, 300)
    }
}

; Exit Script Hotkey
F8::ExitApp

; Fail-safe Exit Hotkey
~F12::ExitApp ; Ensures F12 works by adding ~ to the hotkey

; Feel free to add more error checks or debug lines if needed
