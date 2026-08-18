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
4. `embedded/servo-pid-controller-and-tuner.md`
5. `embedded/multithreaded-motion-control-firmware.md`
6. `pcb-design/README.md`
7. `pcb-design/power-distribution-board.md`
8. `pcb-design/power-splitter.md`
9. `pcb-design/pcb-paneling.md`
10. `pcb-design/stm32f103-development-board.md`
11. `pcb-design/six-wheel-traversal-control-board.md`
12. `pcb-design/ifx007t-motor-driver-board.md`
13. `pcb-design/lora-stm32f103-development-board.md`
14. `rtl-design/README.md`

## Last update

The Embedded Systems section is being simplified to match the short, neat style
of the PCB Design section. The index and every embedded project page are in
scope. Projects will be handled one at a time so suitable images can be added
during review.

The intended page style is a short overview with a small number of consistent
sections, minimal code, and project images where available. Existing technical
details should be condensed rather than expanded.

The shared ESP32-S3 motion-control project is now presented in two documents:

1. `embedded/servo-pid-controller-and-tuner.md` covers the position/speed PID
   controller, interactive browser tuner, tuning results, autodoor homing, and
   future model-based autotuning work.
2. `embedded/multithreaded-motion-control-firmware.md` covers the shared FreeRTOS
   architecture, procedural C ownership rules, MQTT command path, and separate
   autodoor and conveyor state machines.

The user built the entire system. The PID tuner was created because manual PID
tuning requires many trials; live controls and feedback make those iterations
more convenient and intuitive. A future goal is model-based PID autotuning using
plant identification and root-locus analysis. This is planned work, not a
currently implemented feature.

The PID controller supports both position and speed modes. The tuning workflow
is to adjust Kp, Ki, and Kd, command a target, and observe the live position and
speed response. Confirmed working milli-scaled firmware gains are Kp `500`, Ki
`5000`, and Kd `150`, corresponding to `0.5`, `5.0`, and `0.15` after scaling.

The project began as one shared firmware foundation and was adapted into two
machines: an autodoor and a conveyor. Both variants should be covered across the
two portfolio pages. The architecture page should give balanced coverage to the
FreeRTOS task design, MQTT communication, and machine state machines. Hardware
coverage should stay limited to the ESP32-S3, motor driver, quadrature encoder,
and presence sensors where applicable. The autodoor does not use presence
sensors; it performs homing to calibrate its position on each run.

The conveyor presence sensors detect trays for state-machine decisions and are
not part of its motor-motion feedback. Autodoor homing deliberately advances in
steps of roughly 250 encoder counts, checks for continued movement, and records
an endpoint when the encoder remains stalled long enough. This stepped process
explains the jerky motion visible in its demo video. The machines automate a CNC
workflow, but the portfolio presentation should emphasize the reusable firmware
and its applicability to PID control for other servo systems.

The most difficult work was obtaining good PID behavior and organizing a
multithreaded C application without object-oriented classes. The architecture
therefore needs to highlight explicit module APIs, ownership rules, protected
shared state, and coordination between FreeRTOS tasks. Successful tuning was
judged from the live response graph, particularly minimal overshoot. Implemented
safety-related controls currently include target bounds and an emergency stop;
broader safety behavior is unfinished, and adding motor-current sensing is a
future goal.

Both demo videos and representative extracted still frames are stored under the
matching directories in `embedded/attachments/`. The Embedded Systems index now
links the two replacement pages. The old pages were removed. Markdown whitespace
checks and all new local media-link checks pass.

Each page now presents its video through a clickable demonstration image and a
clearly labeled play link. This works on GitHub, where repository-hosted MP4
files are not reliably displayed as inline HTML video players.

Source projects already used for the embedded portfolio are:

1. `/home/anbu/Z/projects/internship/antropi/conveyor` - Conveyor ESP32-S3 MQTT/PID firmware.
2. `/home/anbu/Z/projects/robarm` - STM32 robotic arm firmware, PCB, and mechanical files.
3. `/home/anbu/Z/projects/Vyadh25-26/Silicon` - Team Vyadh rover module and prototype repo.

The current embedded pages are text-first technical writeups. They will now be
shortened and images will be added during the project-by-project review.
