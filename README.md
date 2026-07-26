Kingdom Come 2 – AutoHotkey Autoblock System
A lightweight, high‑performance AutoHotkey v2 script that automates Perfect Blocks, Ripostes, Master Strikes, and Evades in Kingdom Come 2 using pixel detection.
The script monitors a defined screen region for the enemy attack indicator (default: green shield) and instantly performs the correct combat input when triggered.

This project is designed for players who want deterministic, consistent defensive reactions without modifying game files or memory.

Features
Pixel‑based autoblock detection (no memory editing, no injection)
Perfect Block, Riposte, Master Strike, Evade, and Perfect Block Only modes
Single‑toggle system — only one combat mode can be active at a time
Automatic 10‑minute safety timeout
Tooltips showing active mode (can be disabled)
High‑performance input handling (zero delays, high priority)
Game‑specific hotkeys — script only runs when KingdomCome.exe is active
Failsafe ESC toggle-off
F8 quick exit

Requirements
AutoHotkey v2.0+  
Download: https://www.autohotkey.com/

Windows 10/11
Kingdom Come 2 (PC version)
Installation
Install AutoHotkey v2.
Download this script (KC2_Autoblock.ahk).
Double‑click the .ahk file to run it.
Launch Kingdom Come 2.
Press the hotkeys listed below to activate the desired defensive mode.

Hotkeys & Combat Actions
Numpad1 — Perfect Block + Riposte (Full Counter Combo)
Toggle key: Numpad1  
Action sequence:
Perfect Block
Riposte
Follow‑up strike
Numpad2 — Master Strike
Toggle key: Numpad2  
Action sequence:
Perfect Block
Master Strike timing window
Numpad3 — Perfect Block Only
Toggle key: Numpad3  
Action sequence:
Perfect Block only
(Also triggers Master Strike if stance is opposite)

Numpad4 — Evade
Toggle key: Numpad4  
Action sequence:
Block input temporarily
Step left + jump
Quick recovery
Auto‑unblock after 10 seconds
Numpad5 — Toggle Tooltip Visibility
Turns on/off the on‑screen tooltip showing active mode.
Numpad6 — Disable Active Mode
Instantly deactivates whichever mode is currently running.
Does not interfere with normal ESC behavior.
F8 — Exit Script
Immediately closes the script.

How It Works
The script continuously scans a centered 900×900 pixel region for the enemy attack indicator color:

Code
color := 0x28BD59
variation := 5
When detected, the script executes the correct combat input sequence for the active mode.

Only one mode can be active at a time.
Activating a new mode automatically disables the previous one.

Each mode auto‑disables after 10 minutes to prevent accidental long‑term toggling.

Configuration
You can modify these values at the top of the script:

Pixel Color
ahk
color := 0x28BD59
variation := 5
Search Area
ahk
searchWidth := 900
searchHeight := 900
Tooltip Position
ahk
tooltipPosXPercent := 10
tooltipPosYPercent := 190
Performance Settings
Already optimized — no changes recommended.

Troubleshooting
Autoblock doesn’t trigger
Increase variation (try 10–20).
Ensure your game resolution hasn’t changed.
Verify the attack indicator color matches your UI settings.
Wrong action triggers
Check that only one toggle is active.
Press Numpad6 to reset all toggles.
Tooltip in wrong place
Adjust tooltipPosXPercent and tooltipPosYPercent.
Script not responding
Make sure AutoHotkey v2 is installed (v1 scripts will not run).
Confirm the game executable is KingdomCome.exe.

Notes
This script does not modify game files.
This script does not access game memory.

All actions are simulated keyboard/mouse inputs.

Safe for single‑player use.
