[main menu](README.md)

# printed and tested
### Power distribution board

this PDB was designed to handle upto 200A at 24v, with reverse voltage and current sensing capabilities. the first iteration was manufactured by JLC PCB and the second iteration by Lion Circuits

<p align="center">
  <img src="attachments/Pasted_image_20260314031010.png" width="600"/>
</p>

<p align="center">
  <img src="attachments/Pasted_image_20260314030624.png" width="600"/>
</p>

<p align="center">
  <img src="attachments/Pasted_image_20260314030638.png" width="600"/>
</p>

<p align="center">
  <img src="attachments/Pasted_image_20260314030711.png" width="600"/>
</p>

printed by lion circuits, assembled by me

<p align="center">
  <img src="attachments/Pasted_image_20260314030827.png" width="600"/>
</p>

<p align="center">
  <img src="attachments/Pasted_image_20260314030747.png" width="600"/>
</p>

<p align="center">
  <img src="attachments/Pasted_image_20260314030758.png" width="600"/>
</p>

i reached this very high current capacity by having exposed copper pads (or aluminium in this case). this way i can tin these pads with solder and allow for extremely high currents to pass through it

<p align="center">
  <img src="attachments/Pasted_image_20260314030815.png" width="600"/>
</p>

the design has gone through multiple iterations

<p align="center">
  <img src="attachments/Pasted_image_20260314031419.png" width="600"/>
</p>

<p align="center">
  <img src="attachments/Pasted_image_20260314031407.png" width="600"/>
</p>

### Power splitter
designed alongside the PDB is a power splitter, to expand the capabilities of the PDB

<p align="center">
  <img src="attachments/Pasted_image_20260314031631.png" width="600"/>
</p>

<p align="center">
  <img src="attachments/Pasted_image_20260314031703.png" width="600"/>
</p>

<p align="center">
  <img src="attachments/Pasted_image_20260314031838.png" width="600"/>
</p>

<p align="center">
  <img src="attachments/Pasted_image_20260314031855.png" width="600"/>
</p>

this also had two iterations, first from JLC PCB, and second from lion circuits

<p align="center">
  <img src="attachments/Pasted_image_20260314034023.png" width="600"/>
</p>

<p align="center">
  <img src="attachments/Pasted_image_20260314034045.png" width="600"/>
</p>
### PCB paneling
i tried paneling PCBs to try and optimize for cost. i used mousebites to make breakable PCBs
got it manufactured by JLC PCB

<p align="center">
  <img src="attachments/Pasted_image_20260314032944.png" width="600"/>
</p>

<p align="center">
  <img src="attachments/Pasted_image_20260314032958.png" width="600"/>
</p>

<p align="center">
  <img src="attachments/Pasted_image_20260314032910.png" width="600"/>
</p>

### STM32F103 development board

i made this board as my first board with embedded ICs instead of using dev boards. i made this board as a sample for my future embedded IC boards

got it manufactured from JLC PCB

<p align="center">
  <img src="attachments/Pasted_image_20260314033249.png" width="600"/>
</p>

<p align="center">
  <img src="attachments/Pasted_image_20260314033300.png" width="600"/>
</p>

<p align="center">
  <img src="attachments/Pasted_image_20260314033349.png" width="600"/>
</p>

<p align="center">
  <img src="attachments/Pasted_image_20260314033359.png" width="600"/>
</p>

<p align="center">
  <img src="attachments/Pasted_image_20260314033934.png" width="600"/>
</p>
### 6 wheel traversal control board
the board was supposed to both control 6 motors and also take encoder output from all 6. this wouldnt be an easy task, but if i end up finishing it, it can be used as a single board to control a robotic arm or control a rover's traversal
##### fully custom (only design)
this was built around a STM32H523RET6
<p align="center">
  <img src="attachments/Pasted_image_20260314032054.png" width="600"/>
</p>

<p align="center">
  <img src="attachments/Pasted_image_20260314032107.png" width="600"/>
</p>

<p align="center">
  <img src="attachments/Pasted_image_20260314032120.png" width="600"/>
</p>

<p align="center">
  <img src="attachments/Pasted_image_20260314032137.png" width="600"/>
</p>
##### using blue-pills (actually got it manufactured)
this one i made with cost constraints and doability in mind. got it manufactured by lioncircuits
i even have a linkedin post about it: [linkedin](https://www.linkedin.com/posts/anbu2005_wrapped-up-a-dense-mixed-signal-pcb-that-activity-7419736452894318592-AMzt?utm_source=share&utm_medium=member_desktop&rcm=ACoAAEXDZ1sBJ3ZTzo3_Oydhf2Fe5uGQyPaNE2Q)
<p align="center">
  <img src="attachments/Pasted_image_20260314031038.png" width="600"/>
</p>

<p align="center">
  <img src="attachments/Pasted_image_20260314031143.png" width="600"/>
</p>

<p align="center">
  <img src="attachments/Pasted_image_20260314031202.png" width="600"/>
</p>

<p align="center">
  <img src="attachments/Pasted_image_20260314031220.png" width="600"/>
</p>

<p align="center">
  <img src="attachments/Pasted_image_20260314031251.png" width="600"/>
</p>

<p align="center">
  <img src="attachments/Pasted_image_20260314031310.png" width="600"/>
</p>


# Designs (yet to be printed and tested)
### IFX007T Motor driver board

i was sick of depending on proprietary motor driver solutions. motor drivers that did not have an open schematic, so that i could just replace the parts whenever i needed

i also really liked the simplicity of packing the entire motor driver circuit into a single IC. and so after a bit of research, i first found the BTS7960. we ended up using it on the rover for IRC26

<p align="center">
  <img src="attachments/Pasted_image_20260314034728.png" width="600"/>
</p>

<p align="center">
  <img src="attachments/Pasted_image_20260314034738.png" width="600"/>
</p>

i then later found out they dont manufacture BTS7960s anymore, so i had to find an alternative IC. which wasnt a hard task. that's how i ended up on the IFX007T

<p align="center">
  <img src="attachments/Pasted_image_20260314034840.png" width="600"/>
</p>

<p align="center">
  <img src="attachments/Pasted_image_20260314034847.png" width="600"/>
</p>

<p align="center">
  <img src="attachments/Pasted_image_20260314034900.png" width="600"/>
</p>

the ICs are rated for 55A, so i made sure to design the PCB such that it can also support 55A.

<p align="center">
  <img src="attachments/Pasted_image_20260314034937.png" width="600"/>
</p>

the reason it has a potentiometer is to control the slew rate of the half bridge mosfets, because this was, like earlier ones, a prototype motor driver based on which other motor drivers will be built

<p align="center">
  <img src="attachments/Pasted_image_20260314035002.png" width="600"/>
</p>

the concept is the same as the PDB, you tin the copper behind the motor driver to allow for more current to pass through. the thicker your solder, the more current this can handle
### LoRa + STM32F103 development board

this board combines the popular STM32F103 with an RFM98W (433mhz) LoRa module.

<p align="center">
  <img src="attachments/Pasted_image_20260314034239.png" width="600"/>
</p>

<p align="center">
  <img src="attachments/Pasted_image_20260314034257.png" width="600"/>
</p>

<p align="center">
  <img src="attachments/Pasted_image_20260314034313.png" width="600"/>
</p>

<p align="center">
  <img src="attachments/Pasted_image_20260314034321.png" width="600"/>
</p>

it includes protection circuitry for over voltage, reverse voltage, over current

<p align="center">
  <img src="attachments/Pasted_image_20260314034348.png" width="600"/>
</p>

<p align="center">
  <img src="attachments/Pasted_image_20260314034405.png" width="600"/>
</p>

the purpose of this also is to first create it and verify that we can infact create something like this and get it working, and create more modules based off of this