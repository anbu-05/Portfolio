[Embedded Systems](README.md)

# MQTT PID Conveyor

Source: [github.com/anbu-05/conveyor_control_firmware](https://github.com/anbu-05/conveyor_control_firmware)

This is an ESP32-S3 conveyor controller made for antropi robotics. It controls
one conveyor using a BTS7960 motor driver, two tray sensors, encoder feedback,
serial debug commands, and MQTT high-level commands.

The firmware is written as an ESP-IDF project. The main goal is to move trays
between conveyors without letting MQTT or serial debug code directly control the
motor pins.

## Hardware / Platform

- ESP32-S3
- BTS7960 motor driver
- Two tray sensors:
  - `S0` = entry sensor
  - `S1` = exit sensor
- Quadrature encoder input
- ESP-IDF / FreeRTOS

The tray sensors are active-low in the current firmware:

```text
GPIO 0 = tray detected
GPIO 1 = no tray
```

The firmware derives tray presence from the two sensors:

```text
has_tray = S0 detected OR S1 detected
```

## What I Built

- MQTT command interface for TX, RX, emergency stop, clear error, direction,
  RSSI, and PID gain tuning.
- A conveyor job state machine that owns all tray-transfer behavior.
- Serial debug commands for testing sensors, motors, config, and jobs.
- Runtime configuration stored in NVS for values like speed gains and timeout
  values.
- Feedback publishing for job state, tray presence, errors, direction, and RSSI.

## Firmware Architecture

The firmware is split into small FreeRTOS tasks and modules:

- `mqtt_task` receives remote commands and publishes feedback.
- `command_task` handles serial debug commands.
- `sensor_task` reads the tray sensors.
- `encoder_task` reads motor encoder data.
- `motor_pid_task` handles speed control.
- `motor_task` applies motor requests to the driver.
- `conveyor_job` owns the high-level TX/RX state machine.

MQTT does not directly run the conveyor logic. It parses strict payloads,
checks basic preconditions, and sends a command to the conveyor job queue.

```c
typedef enum {
    CONVEYOR_CMD_START_TX,
    CONVEYOR_CMD_START_RX,
    CONVEYOR_CMD_EMERGENCY_STOP,
    CONVEYOR_CMD_CLEAR_ERROR
} conveyor_cmd_type_t;
```

The state machine tracks the current state and how long it has been active.
That elapsed time is sent in MQTT feedback as `state_elapsed_ms`.

```c
typedef enum {
    CONVEYOR_STATE_IDLE,
    CONVEYOR_STATE_TX_WAIT_FOR_TX1_DETECT,
    CONVEYOR_STATE_TX_WAIT_FOR_TX1_CLEAR,
    CONVEYOR_STATE_RX_WAIT_FOR_RX0,
    CONVEYOR_STATE_RX_WAIT_FOR_RX1,
    CONVEYOR_STATE_TX_DONE,
    CONVEYOR_STATE_RX_DONE,
    CONVEYOR_STATE_ERROR,
    CONVEYOR_STATE_ESTOP
} conveyor_state_t;
```

## MQTT Control

The MQTT parser is intentionally strict. It accepts exact payloads instead of
loose JSON variants.

```text
{"type":"tx"}
{"type":"rx"}
{"type":"emergency_stop"}
{"type":"clear_error"}
{"type":"setkp","value":"0.010"}
{"type":"setkd","value":"0.010"}
{"type":"resetk"}
{"type":"setdirection","value":"s0tos1"}
{"type":"setdirection","value":"s1tos0"}
{"type":"getdirection"}
{"type":"getrssi"}
```

The command topic is specific to one conveyor:

```text
conveyor/C0/cmd
```

Emergency stop can be sent to one conveyor or all conveyors:

```text
conveyor/C0/emergency
conveyor/all/emergency
```

Feedback is published on:

```text
conveyor/C0/feedback
conveyor/C0/tray
```

Example feedback:

```json
{"id":"C0","state":"TX_WAIT_FOR_TX1_CLEAR","state_elapsed_ms":320,"s0":1,"s1":0,"direction":"S0_TO_S1"}
```

## TX / RX Behavior

TX means the conveyor is sending a tray out.

- TX starts only when the state is `IDLE`.
- TX requires a tray to already be present.
- The motor runs until `S1` detects the tray and then clears again.
- If the tray disappears before reaching `S1`, the firmware enters `ERROR`.

RX means the conveyor is receiving a tray.

- RX starts only when the state is `IDLE`.
- RX requires the conveyor to be empty.
- The firmware waits for `S0`.
- Once `S0` detects a tray, the motor starts.
- The motor stops as soon as `S1` detects the tray.

This keeps tray-transfer behavior centralized instead of spreading it across
MQTT, serial debug, and motor code.

## Debugging / Testing

Serial debug output is machine-readable, so a script can watch events without
parsing free-form text.

```text
READY conveyor
EVENT SENSOR S0 1 0
EVENT JOB C0 TX_WAIT_FOR_TX1_CLEAR
ERR NO_TRAY
```

The runtime config system allows tuning without reflashing:

```text
getconfig tx_detect_timeout_ms
setconfig tx_detect_timeout_ms 7000
setkp 0.010
setkd 0.010
resetk
```

MQTT can tune only the P/D speed gains. More powerful actions stay behind the
serial debug interface.

## Current Status

The repo contains the ESP-IDF firmware, detailed docs for MQTT and serial
control, and state-machine documentation. Photos and final deployment notes are
left out for now so they can be added after review.
