[Embedded Systems](README.md)

# STM32 6DOF Robotic Arm

Source: [github.com/anbu-05/Robotic-Arm](https://github.com/anbu-05/Robotic-Arm)

This is a six-motor robotic arm controller built around an STM32F411. The
firmware focuses on direct motor control, ADC-based position feedback, runtime
tuning, and a USB serial command interface.

The project also has KiCad PCB files and mechanical model files, but this page
focuses on the embedded firmware side.

## Hardware / Platform

- STM32F411
- Six motor outputs
- Six ADC feedback channels
- PWM motor control
- USB CDC serial interface
- STM32 HAL / Cube-generated project structure
- `microrl` for the command-line interface

## What I Built

- USB CDC CLI for controlling and tuning the arm during testing.
- Six-channel ADC reading using DMA.
- ADC filtering for noisy position feedback.
- Closed-loop position control for each motor.
- Runtime parameter tuning without reflashing.
- Direction correction and position limiting.
- Motor coupling for joints that need synchronized movement.

## Firmware Architecture

The main loop continuously reads the feedback channels, updates control logic,
applies motor outputs, and processes incoming USB serial characters.

```c
while (1)
{
    read_ADC();
    measure_adc_range(range_to_check);
    position_control();
    motor_control(motors);
    ...
    microrl_insert_char(prl, ch);
}
```

The ADC is started in DMA mode for six channels:

```c
HAL_ADC_Start_DMA(&hadc1, AD_RES_BUFFER, 6);
```

Each motor has runtime state for PWM, direction, position feedback, target
position, target speed, and control flags.

## CLI Commands

The CLI makes the firmware testable from a serial monitor. Some of the useful
commands are:

```text
setmotor <motor> <pwm> <dir>
stop
setpos <motor> <position> <speed>
getpos <motor>
stoppos <motor>
setparam <param> <value>
getparam <param>
listparams
couple <master motor> <slave motor> <inverse>
decouple <master motor>
listcoupled
```

Example usage:

```text
setpos M0A 1800 120
setparam smooth_k 6
setparam deadband 8
couple M1A M1B 1
listcoupled
```

The CLI uses strict command names. For example, `setpos` is the command; random
variants are not treated as the same thing.

## Position Control

The position controller uses ADC feedback. It compares the target position with
the current motor position, chooses a direction, and scales PWM using a simple
proportional gain.

```c
int error = motors[i].target_pos - motors[i].pos;

if (error > pos_deadband) {
    motors[i].direction = 1;
    int pwm = error * pos_kp;
    if (pwm > motors[i].target_pwm)
        pwm = motors[i].target_pwm;
    motors[i].pwm = pwm;
}
```

This is deliberately simple. It is easier to tune and debug on real hardware
than a more complex controller.

## ADC Filtering

The ADC pipeline was built because the raw feedback was noisy. The filter path
uses:

- Median filtering
- Delayed spike rejection
- Deadband
- Exponential smoothing
- Optional rate limiting

The important tuning parameters are runtime-editable:

```text
adc_filter
spike_threshold
spike_start_delay
smooth_k
deadband
enable_rate_limit
max_step
```

The filtered value becomes the motor position used by the controller.

```c
uint16_t filtered = (prev * smooth_k + raw) / (smooth_k + 1);
adc_filtered[i] = filtered;
motors[i].pos = filtered;
```

## Motor Coupling

Motor coupling is for cases where two motors should move together. The CLI can
couple a master motor to a slave motor, with optional inverted direction.

```text
couple <master motor> <slave motor> <inverse>
decouple <master motor>
listcoupled
```

This lets the control code compute the master motor output and mirror it to the
slave instead of trying to tune two independent position loops for the same
joint.

## Debugging / Testing

The project notes show a lot of testing around serial reliability, ADC noise,
and live tuning. A few fixes that shaped the firmware:

- USB RX moved into a ring buffer so the CLI processing happens in the main
  loop.
- Runtime parameters replaced hardcoded macros for tuning.
- ADC filtering was adjusted after spike rejection caused startup values to
  stay at zero.
- `Ctrl+C` over the CLI is treated as an emergency stop path.

## Current Status

The repo contains the STM32 firmware, command notes, KiCad PCB files, and
mechanical model files. Photos and final deployment notes are left out for now
so they can be added after review.
