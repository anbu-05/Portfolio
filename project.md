# Project Status

## Current structure

This portfolio has a root `README.md` that links directly to project section folders.

The main sections are:

1. `embedded/`
2. `pcb-design/`
3. `rtl-design/`

## PCB design cleanup

The old top-level `PCB-design.md` file was removed. PCB design now lives in `pcb-design/README.md`.

Images are still stored in the shared `attachments/` folder. PCB project files link to them with `../attachments/...`.

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

Split the Embedded Systems section into an index and three project files: rover firmware, STM32 6DOF robotic arm, and MQTT PID conveyor.
