Robotic Leg Testing Procedure & Troubleshooting
===============================================

Introduction
------------

Once the robotic leg has been assembled, there are several tests that can be run to ensure that the Robotic Leg 
was assembled correctly, and that no parts were damaged during assembly.

Basic Mechanical Checks
-----------------------

There are several checks to confirm that each modular actuator has been assembled correctly:

* Turning the motor should produce a smooth motion in the output pulley, with little to no noise or friction
  See the Troubleshooting section if unusual noises are observed.

* Motor and encoder wires should not move when the motor is turned, as motor and encoder wires should not be 
  touching any moving parts. 

* The set screws that connect the motor rotor to the motor shaft should be re-inserted.

* Motors rotor should have no contact with the motor stator. Check this by slowly turning the rotor, and observing if
  there is any contact with the stator due to metallic debris. See the Troubleshooting section if contact is observed.

* Actuator shells should have little to no gaps in between them. 

* All bolts between the actuator shells should be tightened.

Troubleshooting
---------------

If unusual noises are observed when spinning an actuator, there are several possible causes:

* Check if there is magnetic debris between each motor stator and rotor. Any magnetic debris can be removed by 
  disassembling the actuator and removing the motor, removing debris from the stator and rotor with strong 
  adhesive tape, and reassembling the motor. 

* Check if the source of the noise is from the bearings. If open bearings are used, debris can enter the space 
  between the ball bearings, causing noise and friction. This problem can be avoided by using closed bearings.

* Check if the encoder disc is scraping against the encoder electronics. This problem indicates that the encoder 
  disc is either running too low or too high on the motor shaft, or that the encoder disc is not perfectly 
  horizontal on the encoder disc holder. Careful reassembly of this subcomponent is required.

* Check if there is any plastic or metal debris within the actuator shells. These can be removed with adhesive 
  tape, or with a small vacuum.

..figure:: in_images/damage_1.jpg
..figure:: in_images/damage_2.jpg
..figure:: in_images/damage_3.jpg

Handling the encoder disk
-------------------------

Handling the encoder disk is a delicate process which might permanently scratch the disk if not done properly. A 
scratched encoder disk will cause an incorrect position to be read, resulting in control problems. 
Special precautions must be taken to reduce the risk of this happening:

* Cover the lines of the encoder disk with tape whenever the encoder disk must be moved.

* Alway lay the encoder disk on a flat, clean surface whenever it must be put aside.

* Clean the encoder disk with adhesive tape, or a fine brush.

* Relay all handling precautions taken to the relevant machine shop technicians.

..figure:: leg_images/encoder_care_1.jpg
..figure:: leg_images/encoder_care_2.jpg

..figure:: leg_images/motor_spacing.jpg

..figure:: leg_images/frictioner.jpg

..figure:: in_images/full_leg.jpg



