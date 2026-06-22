[PCB design projects](README.md)

# IFX007T Motor Driver Board

I wanted a motor driver with an open schematic so parts could be replaced when needed. The design is based on IFX007T.

## Schematic

The idea started from a BTS7960-based motor driver used on the rover for IRC26.

<p align="center">
  <img src="attachments/ifx007t-motor-driver-board/schematic-bts7960-reference-1.png" width="600"/>
</p>

<p align="center">
  <img src="attachments/ifx007t-motor-driver-board/schematic-bts7960-reference-2.png" width="600"/>
</p>

## Layout / Routing

<p align="center">
  <img src="attachments/ifx007t-motor-driver-board/layout-routing.png" width="600"/>
</p>

## 3D Model / Printed PCB

<p align="center">
  <img src="attachments/ifx007t-motor-driver-board/3d-model-printed-pcb-1.png" width="600"/>
</p>

<p align="center">
  <img src="attachments/ifx007t-motor-driver-board/3d-model-printed-pcb-2.png" width="600"/>
</p>

## Additional Info

The BTS7960 is no longer manufactured, so I moved to the IFX007T.

<p align="center">
  <img src="attachments/ifx007t-motor-driver-board/additional-info-ifx007t-1.png" width="600"/>
</p>

<p align="center">
  <img src="attachments/ifx007t-motor-driver-board/additional-info-ifx007t-2.png" width="600"/>
</p>

The ICs are rated for 55A, so the PCB was designed to support 55A.

The potentiometer controls the slew rate of the half-bridge MOSFETs. This was a prototype motor driver that future motor drivers could be based on.

Like the PDB, the copper behind the motor driver can be tinned with solder to allow more current to pass through. The thicker the solder, the more current this can handle.
