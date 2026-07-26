KC2 Autoblock System (AutoHotkey v2)
A lightweight AutoHotkey v2 script that automates Perfect Blocks, Ripostes, Master Strikes, and Evades in Kingdom Come 2 using pixel detection.
Monitors the attack indicator (default: green shield) and triggers precise defensive actions.

Tested on 1920×1080 resolution.  
Adjust search area or tooltip position if using other resolutions — AI can assist with tuning.

🔧 Features
Pixel‑based autoblock detection (no injection/memory edits)

Perfect Block, Riposte, Master Strike, Evade, and Block‑Only modes

Single‑toggle system (one mode active at a time)

Auto‑disable after 10 min

Optional tooltips

High‑priority input handling

Runs only when KingdomCome.exe is active

ESC toggle‑off / F8 exit

🖥 Requirements
AutoHotkey v2.0+ → autohotkey.com

Windows 10/11

Kingdom Come 2 (PC)

⚙️ Installation
Install AutoHotkey v2

Download KC2_Autoblock.ahk

Run the script

Launch Kingdom Come 2

Use hotkeys below

🎮 Hotkeys
Key	Action
Numpad 1	Perfect Block + Riposte
Numpad 2	Master Strike
Numpad 3	Perfect Block Only
Numpad 4	Evade
Numpad 5	Toggle Tooltips
Numpad 6	Disable Active Mode
F8	Exit Script


🧠 How It Works
Scans a centered 900×900 region for:

ahk
color := 0x28BD59
variation := 5
Executes the correct combat sequence for the active mode.
Each mode auto‑disables after 10 minutes.

🛠 Config
ahk
color := 0x28BD59
variation := 5
searchWidth := 900
searchHeight := 900
tooltipPosXPercent := 10
tooltipPosYPercent := 190
🧩 Notes
Tested on 1920×1080

No game file edits or memory access

Simulated inputs only

Safe for single‑player use
