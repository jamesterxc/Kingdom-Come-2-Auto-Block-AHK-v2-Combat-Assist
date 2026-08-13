KC2 Autoblock System (Simplified AutoHotkey v2)
A lightweight, high‑speed AutoHotkey v2 script that automates Perfect Blocks, Ripostes, and Master Strikes in Kingdom Come 2 using pixel detection.
The script monitors a centered region of the screen for the enemy attack indicator (default: green shield) and instantly performs the correct defensive input.

Tested on 1920×1080 resolution.  
Other resolutions may require adjusting the search area or pixel color.

🖥 Required Software
AutoHotkey v2.0+ is required.  
This script will not run on AutoHotkey v1.

Download AutoHotkey v2 here:
👉 https://www.autohotkey.com/

🔧 Features
Pixel‑based autoblock detection
Two simple toggle modes (G and Y)
Fast, reliable input via SendInput
Realtime process priority for maximum responsiveness
Minimal codebase, low overhead
F8 and F12 emergency exit hotkeys

⚙️ Installation
Install AutoHotkey v2
Download KC2_Autoblock.ahk
Run the script
Launch Kingdom Come 2
Use the hotkeys below

🎮 Hotkeys
Key	Action
G	Perfect Block + Riposte combo (toggle)
Y	Master Strike (toggle)
F8	Exit script
F12	Emergency exit


🧠 How It Works
The script scans a centered 900×900 region for the attack indicator color:

ahk
color := 0x28BD59
variation := 5
When detected:

G mode performs Perfect Block → Riposte → follow‑up strike
Y mode performs Perfect Block → Master Strike timing input
Each mode loops until the same key is pressed again.

🛠 Configuration
ahk
color := 0x28BD59
variation := 5
searchWidth := 900
searchHeight := 900
Adjust these values if your resolution or UI color differs.

🧩 Notes
Requires AutoHotkey v2
No tooltips
No auto‑disable timer
No multi‑mode system

No game‑specific hotkey filtering

Safe for single‑player use
