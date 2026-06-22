[Embedded Systems](README.md)

# Rover Firmware

Source: [github.com/TeamVyadhVIT/Silicon](https://github.com/TeamVyadhVIT/Silicon)

As part of Team Vyadh, I worked on embedded and electrical systems for Mars
rover prototypes. This page covers the firmware/electrical side only. Photos
and final deployment details are intentionally left out for now.

The Silicon repo is organized as a set of rover modules and prototypes instead
of one single firmware app. The local source includes STM32 traversal projects,
encoder experiments, science-kit sensor tests, and mechanical/electrical support
files.

## Hardware / Platform

- STM32F103 traversal prototypes
- STM32F446 traversal/BTS prototype
- Arduino/PlatformIO encoder tests
- Science-kit sensor tests
- BME environmental sensor prototype
- NPK sensor script
- Stepper motor test
- 3D-printed support parts for wiring, connectors, and encoder mounts

## What I Built

- Rover electrical systems and embedded prototypes.
- Traversal firmware experiments on STM32.
- Encoder test firmware for measuring motor speed and direction.
- Sensor bring-up code for science-kit modules.
- Support tooling and prototype code while moving from simpler Arduino-style
  tests toward STM32-based rover modules.

## Firmware Architecture

The repo has separate module branches/worktrees for different parts of the
rover. The important embedded areas visible in the source are:

- `module/traversal` for STM32 traversal firmware experiments.
- `prototype/encoders` for encoder reading and RPM tests.
- `module/science_kit` for sensor and actuator prototypes.
- `module/3D_prints` for mechanical support parts used around electronics.

This structure matches how rover subsystems are usually developed: each module
gets tested separately before being integrated into the full rover.

## Traversal Firmware

The traversal source includes multiple STM32CubeIDE projects, including
`traversal_v1`, `traversal_v3`, and `traversal_BTS`. These were used as
firmware prototypes for motor-control and traversal experiments.

The `traversal_BTS` project targets an STM32F446 and points toward a BTS-style
motor-driver traversal setup. The other traversal projects target STM32F103
boards.

## Encoder Prototypes

The encoder prototypes started with simple PlatformIO sketches. One version
measures pulse timing between encoder edges:

```cpp
void isr() {
  if (time_flag) {
    time0 = micros();
    time_flag = !time_flag;
  }
  else {
    time1 = micros();
    time_flag = !time_flag;
  }
}
```

Another version counts encoder pulses over a fixed time window and reads the
direction channel:

```cpp
void isr() {
  counter++;
  motor_dir = digitalRead(3);
}
```

This kind of isolated encoder testing is useful before integrating feedback into
the traversal controller.

## Science Kit Prototypes

The science-kit source includes small prototypes for:

- BME sensor bring-up
- NPK sensor reading
- Stepper motor testing
- A robotic-arm inverse-kinematics experiment

These are kept separate from traversal firmware so each sensor or actuator can
be tested independently.

## Debugging / Testing

Most of this repo is prototype-oriented. The useful evidence is in the module
split and the small test programs:

- Encoder tests print PWM, timing, direction, and RPM values over serial.
- STM32 projects keep generated CubeIDE project files and build outputs.
- Science-kit tests isolate individual sensors or actuators before integration.
- 3D-print files support practical electronics mounting, such as XT60 holders
  and encoder mounts.

## Current Status

The page is intentionally conservative. The source shows embedded experiments
and subsystem prototypes, but final rover deployment notes and photos should be
added only after review.
