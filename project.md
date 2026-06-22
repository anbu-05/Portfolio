# Project Status

## Current structure

This portfolio has a root `README.md` that links directly to project section folders.

The main sections are:

1. `embedded/`
2. `pcb-design/`
3. `rtl-design/`

Each section now has its own local `attachments/` folder instead of relying on a shared root attachment folder.

## PCB design cleanup

The old top-level `PCB-design.md` file was removed. PCB design now lives in `pcb-design/README.md`.

Images are stored inside each project section. PCB project files use `pcb-design/attachments/<document-name>/` through local `attachments/...` links.

Each PCB project file uses these sections:

1. `Schematic`
2. `Layout / Routing`
3. `3D Model / Printed PCB`
4. `Additional Info`

All design screenshots are treated as Altium screenshots.

## Files added

1. `embedded/README.md`
2. `embedded/rover-firmware.md`
3. `embedded/stm32-6dof-robotic-arm.md`
4. `embedded/mqtt-pid-conveyor.md`
5. `pcb-design/README.md`
6. `pcb-design/power-distribution-board.md`
7. `pcb-design/power-splitter.md`
8. `pcb-design/pcb-paneling.md`
9. `pcb-design/stm32f103-development-board.md`
10. `pcb-design/six-wheel-traversal-control-board.md`
11. `pcb-design/ifx007t-motor-driver-board.md`
12. `pcb-design/lora-stm32f103-development-board.md`
13. `rtl-design/README.md`

## Last update

Started the embedded portfolio writeup pass using these source projects:

1. `/home/anbu/Z/projects/internship/antropi/conveyor` - Conveyor ESP32-S3 MQTT/PID firmware.
2. `/home/anbu/Z/projects/robarm` - STM32 robotic arm firmware, PCB, and mechanical files.
3. `/home/anbu/Z/projects/Vyadh25-26/Silicon` - Team Vyadh rover module and prototype repo.

Updated the embedded pages as text-first technical writeups with short code and
command snippets, and refreshed the root and embedded index descriptions to
match. Photos and final deployment notes are intentionally left for a later
review pass.
