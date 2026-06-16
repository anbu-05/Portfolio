[Embedded Systems](README.md)

# Rover Firmware

As part of Team Vyadh, along with my teammates, I built two iterations of a Mars rover prototype.

The first iteration was "Dhrona".

[image]

The second iteration was "Pralay".

[image]

I focused mainly on the electrical systems. I built the systems and helped the team move from basic systems like Arduinos to more mainstream systems like STM32s and CAN networks.

[images]

We had to manufacture most of our things in house, so I also identified and improved the ways of doing things.

[images]

## Drive System

I worked on the creation of different versions of the rover drive system.

[images]

## Microcontroller Network Within The Rover

I designed and worked on the microcontroller network within the rover.

In Dhrona, it was ESP32s connected using UART buses.

[images]

Pralay was designed to use multiple STM32 nodes connected using a CAN bus.

[images]

## LoRa Based Controller

I made this LoRa based controller so it could reach ranges of up to 1km without line of sight. This was used to control the rover and its robotic arm for IRC 2025.

[image]

It uses an ESP32 and an SX1278 LoRa module.

[images]

## Yet To Fill

- IoT mesh networks
