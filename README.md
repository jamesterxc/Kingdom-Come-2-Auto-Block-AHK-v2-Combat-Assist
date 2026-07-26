Kingdom Come 2 – AutoHotkey Autoblock System
A high‑performance AutoHotkey v2 script that automates Perfect Blocks, Ripostes, Master Strikes, and Evades in Kingdom Come 2 using fast pixel detection.
The script watches a centered screen region for the enemy attack indicator (default: green shield) and instantly performs the correct defensive action.

Designed for players who want consistent, deterministic reactions without modifying game files or memory.

Features
Pixel‑based autoblock detection (no injection, no memory editing)

Perfect Block, Riposte, Master Strike, Evade, and Perfect Block Only modes

Only one mode active at a time (auto‑switching)

Automatic 10‑minute safety timeout

Optional tooltips showing active mode

High‑priority, low‑latency input handling

Script only runs when KingdomCome.exe is active

ESC failsafe toggle‑off

F8 quick exit

Requirements
AutoHotkey v2.0+  
https://www.autohotkey.com/

Windows 10/11

Kingdom Come 2 (PC)

Installation
Install AutoHotkey v2

Download KC2_Autoblock.ahk

Run the script

Launch Kingdom Come 2

Use the hotkeys below to activate modes

Hotkeys
Numpad1 – Perfect Block + Riposte
Numpad2 – Master Strike
Numpad3 – Perfect Block Only
Numpad4 – Evade
Numpad5 – Toggle tooltips
Numpad6 – Disable active mode
F8 – Exit script

How It Works
The script scans a 900×900 centered region for the attack indicator color:

Code
color := 0x28BD59
variation := 5
When detected, it executes the correct combat sequence for the active mode.
Only one mode can run at a time, and each mode auto‑disables after 10 minutes.

Configuration
Pixel Color

Code
color := 0x28BD59
variation := 5
Search Area

Code
searchWidth := 900
searchHeight := 900
Tooltip Position

Code
tooltipPosXPercent := 10
tooltipPosYPercent := 190
Troubleshooting
Autoblock not triggering

Increase variation (10–20)

Check resolution/UI color changes

Wrong action triggering

Only one mode can be active

Press Numpad6 to reset

Tooltip misplaced

Adjust tooltip position percentages

Script not responding

Ensure AutoHotkey v2 is installed

Confirm the game executable is KingdomCome.exe

Notes
No game file edits

No memory access

All actions are simulated inputs

Safe for single‑player use
