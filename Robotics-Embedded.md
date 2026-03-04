[main menu](README.md)
# Mars Rover prototype
as part of team vyadh, along with my teammates, i built two iterations of a mars rover prototype.

the first iteration, "Dhrona"
[image]
the second iteration, "Pralay"
[image]

i focused mainly on the electrical systems. not only did i build the systems, i also made the team move on from using basic systems like arduinos to more mainstream systems like STM32s and CAN networks

[images]

we end up having to manufacture most of our things in house, i also identified and improved the ways of doing things

[images]
### drive system
i worked in the creation of the different versions of our rover's drive system.

[images]
### robotic arm
i worked in the control and kinematics of our robotic arm on the dhrona rover.

[images]

### microcontroller network within the rover

i designed and worked on the microcontroller network within the rover.

in dhrona it was esp32's connected using UART buses. 
[images]
pralay was designed to use multiple STM32 nodes connected using a CAN bus.
[images]
### LoRa based controller
i made this LoRa based controller to that could reach ranges of upto 1km (w/o LoS) to control the rover. this was used to control our rover and it's robotic arm for IRC 2025

[image]

it uses an ESP32 and an SX1278 LoRa module.

[images]

---
yet to fill:
- IoT mesh networks