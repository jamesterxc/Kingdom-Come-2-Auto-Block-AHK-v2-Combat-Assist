#Requires AutoHotkey v2.0  ; Ensures the script is compatible with AutoHotkey v2
#SingleInstance Force  ; Prevents multiple instances of the script from running at the same time

; ---------------------------------------------------
; Performance & Environment Setup  (No changes needed)
; ---------------------------------------------------
ProcessSetPriority "High"   ; Sets process priority to high for better responsiveness
A_MaxHotkeysPerInterval := 99000000  ; Prevents AutoHotkey from blocking hotkeys due to rapid presses
A_HotkeyInterval := 99000000         ; Ensures no limit on hotkey activation speed
KeyHistory(0)                        ; Disables key history to reduce memory usage
ListLines(0)                          ; Disables script execution logging to improve efficiency
SetKeyDelay -1                        ; Reduces input delay for keyboard inputs
SetMouseDelay -1                      ; Reduces input delay for mouse actions
SetDefaultMouseSpeed 0                ; Sets default mouse movement speed to instant
SetWinDelay -1                        ; Reduces delays when interacting with windows
SetControlDelay -1                    ; Reduces delays when controlling UI elements
CoordMode "Pixel", "Screen"            ; Sets pixel search to use screen coordinates (instead of window coordinates)
CoordMode "ToolTip", "Screen"          ; Ensures tooltips appear based on screen coordinates
;-----------------------------------------------------------


; ---------------------------------------------------
; Customization Section (Editable Parameters)
; ---------------------------------------------------

; **Pixel Color to Detect (Change this if needed)**
color := 0x28BD59  ; The color code to search for (default is the green shield in-game)
variation := 5     ; Allowed variation in color detection (increase if color detection is inconsistent)

; **Search Area (Change these if needed)**
searchWidth := 900   ; Width of the search area in pixels
searchHeight := 900  ; Height of the search area in pixels

; **Automatically Adjusts Search Area Based on Screen Size**
startX := (A_ScreenWidth // 2) - (searchWidth // 2)  ; Center the search area horizontally
startY := (A_ScreenHeight // 2) - (searchHeight // 2) ; Center the search area vertically

; **Tooltip Position (Modify if you want to move the tooltip)**
tooltipPosXPercent := 10  ; Horizontal position as a percentage (0-100)
tooltipPosYPercent := 190 ; Vertical position as a percentage (0-100)

; **Converts percentage position to actual screen pixels**
tooltipX := (A_ScreenWidth * tooltipPosXPercent) // 100
tooltipY := (A_ScreenHeight * tooltipPosYPercent) // 100
;-----------------------------------------------------------



; ---------------------------------------------------
; Global Variables (No changes needed)
; ---------------------------------------------------
toggleStates := Map()  ; Stores the state of each toggle key
activeToggle := ""     ; Keeps track of the currently active toggle
showTooltips := true   ; Controls whether tooltips are displayed (Tab toggles this)

; ---------------------------------------------------
; Function: ToggleAction
; Handles enabling and disabling the toggles
; ---------------------------------------------------
ToggleAction(key, message) {
    global toggleStates, activeToggle, tooltipX, tooltipY, showTooltips

    ; If a toggle is already active and a different toggle is pressed, deactivate the previous one
    if (activeToggle && activeToggle != key) {
        DeactivateToggle(activeToggle)
    }

    ; Initialize toggle state if it does not exist
    if !toggleStates.Has(key) {
        toggleStates[key] := { state: false, timer: "" }
    }
    toggle := toggleStates[key]
    toggle.state := !toggle.state  ; Toggle the state (ON/OFF)

    if toggle.state {
        ; Enable new toggle
        activeToggle := key
        if showTooltips {
            ToolTip(message, tooltipX, tooltipY)  ; Show tooltip at specified position
        }
        SetTimer(() => AutoDisableToggle(key), -600000)  ; Auto disable after 10 minutes
        toggle.timer := ExecuteAction.Bind(key)  ; Bind the key to ExecuteAction
        SetTimer(toggle.timer, 1)  ; Start the action loop
    } else {
        ; Disable the toggle
        DeactivateToggle(key)
    }
}

; ---------------------------------------------------
; Function: AutoDisableToggle
; Ensures that any active toggle is deactivated after 10 minutes
; ---------------------------------------------------
AutoDisableToggle(key) {
    global toggleStates, activeToggle
    if (activeToggle = key) {  ; Ensure we're only disabling the currently active toggle
        DeactivateToggle(key)  ; Disable the toggle
        ToolTip("")  ; Remove the tooltip
    }
}

; ---------------------------------------------------
; Function: DeactivateToggle
; Turns off a toggle when switching or pressing ESC
; ---------------------------------------------------
DeactivateToggle(key) {
    global toggleStates, activeToggle
    if toggleStates.Has(key) {
        toggle := toggleStates[key]
        toggle.state := false  ; Set toggle to OFF
        SetTimer(toggle.timer, 0)  ; Stop its action loop
        if (activeToggle == key) {
            ToolTip("")  ; Hide tooltip
            SetTimer(RemoveTooltip, 0)  ; Stop tooltip auto-hide timer
            activeToggle := ""  ; Reset active toggle
        }
    }
}

; ---------------------------------------------------
; Function: ExecuteAction
; Performs the assigned action when the target pixel is detected
; ---------------------------------------------------
ExecuteAction(key) {
    global toggleStates, startX, startY, searchWidth, searchHeight, color, variation
    toggle := toggleStates[key]
    while toggle.state {  ; Continue execution while toggle is active
        if PixelSearch(&foundX, &foundY, startX, startY, startX + searchWidth - 1, startY + searchHeight - 1, color, variation) {
            ; Action based on active toggle key
            Switch key {
                case "f":  ; Perfect Block and Riposte   /  Master Strike (If your stance is opposite of the enemies)   -Single-Press F to activate
                    Send("{LButton Down}")
                    Sleep 80
                    Send("{LButton Up}")
                    Sleep 20
                    Send("{RButton Down}")
                    Sleep 80
                    Send("{RButton Up}")
                    Sleep 150
                    Send("{LButton Down}")
                    Sleep 80
                    Send("{LButton Up}")
                case "r":  ; Master Strike
                    Send("{LButton Down}")
                    Sleep 80
                    Send("{LButton Up}")
                    Sleep 150
                case "v":  ; Evade
                    BlockInput(true)
                    SetTimer(() => BlockInput(false), -10000)
                    Send("{w Up}{d Up}{s Up}")
                    Send("{a Down}")
                    Sleep 10
                    Send("{a Down}{Space Down}")
                    Sleep 80
                    Send("{Space Up}{a Up}")
                    Sleep 700
                    BlockInput(false)
                case "e":  ; Perfect Block Only  /  Master Strike (If your stance is opposite of the enemies)    -Single-Press E to activate
                    Send("{LButton Down}")
                    Sleep 80
                    Send("{LButton Up}")
                    Sleep 20
                    Send("{RButton Down}")
                    Sleep 80
                    Send("{RButton Up}")
                    Sleep 150
            }
        }
        Sleep 1  ; Prevents high CPU usage
    }
}

; ---------------------------------------------------
; Function: RemoveTooltip
; Clears the tooltip when the timer expires
; ---------------------------------------------------
RemoveTooltip() {
    global showTooltips
    if showTooltips {
        ToolTip("")  ; Hides the tooltip
    }
}

; ---------------------------------------------------
; Hotkeys Section (User Inputs)
; ---------------------------------------------------
#HotIf WinActive("ahk_exe KingdomCome.exe")  ; Makes sure script only runs when the game is active
~*Numpad1::ToggleAction("f", "Perfect Block and Riposte")
~*Numpad2::ToggleAction("r", "Master Strike")
~*Numpad4::ToggleAction("v", "Evade")
~*Numpad3::ToggleAction("e", "Perfect Block Only")

; **ESC Key: Disable Active Toggle (WITHOUT interfering with normal ESC behavior)**
~*Numpad6::{ 
    DeactivateToggle(activeToggle)
}

; **Tab Key: Toggle Tooltip Visibility (WITHOUT interfering with normal Tab behavior)**
~*Numpad5::{
    global showTooltips
    showTooltips := !showTooltips  ; Toggle tooltip visibility
    if !showTooltips {
        ToolTip("")  ; Hide tooltip if tooltips are disabled
    }
}

#HotIf  ; End of game-specific hotkeys

; **F8 Key: Exits the script completely**
F8::ExitApp
