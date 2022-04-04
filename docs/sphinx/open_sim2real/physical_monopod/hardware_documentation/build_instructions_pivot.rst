Central Pivot Build Instructions
================================

Introduction
------------

The Central Pivot is part of the complete Monopod, and its purpose is to constrain the Robotic Leg in a 2D plane. 
Unlike the Robotic Leg, however, the Central Pivot is an original design from OpenSim2Real. The following steps 
should be done in order, after all parts have arrived.

..figure:: cp_images/cp_material_2.jpg

Waterjet Parts Preparation
--------------------------

If that has not been done already, waterjet the required parts in the BOM out of quarter-inch aluminum:
- 2pc :ref`Axle Holder 1 <https://github.com/OpenSim2Real/hardware_repository/blob/main/cad/central-pivot/axle-holder-1.dxf>`
- 1pc :ref`Baseplate <https://github.com/OpenSim2Real/hardware_repository/blob/main/cad/central-pivot/baseplate.dxf>`
- 1pc :ref`Collar Mount <https://github.com/OpenSim2Real/hardware_repository/blob/main/cad/central-pivot/collar-mount.dxf>`
- 1pc :ref`Electronic Holder <https://github.com/OpenSim2Real/hardware_repository/blob/main/cad/central-pivot/electronic-holder.dxf>`
- 1pc :ref`Roof Piece <https://github.com/OpenSim2Real/hardware_repository/blob/main/cad/central-pivot/roof.dxf>`
- 1pc :ref`Lower Base <https://github.com/OpenSim2Real/hardware_repository/blob/main/cad/central-pivot/lower-base.dxf>`
- 1pc :ref`Upper Base <https://github.com/OpenSim2Real/hardware_repository/blob/main/cad/central-pivot/upper-base.dxf>`

Deburr all the edges of the waterjet cut pieces to avoid getting cut by sharp edges.

3D Printed Parts Preparation
---------------------------

If not done already, 3D print the required parts in the BOM. The following parts should result: 
- 2pc :ref`Axle Mount 1 <https://github.com/OpenSim2Real/hardware_repository/blob/main/cad/central-pivot/axle-mount-1.stl>`
- 1pc :ref`Collar 1 <https://github.com/OpenSim2Real/hardware_repository/blob/main/cad/central-pivot/collar-1.stl>`
- 1pc :ref`Collar 2 <https://github.com/OpenSim2Real/hardware_repository/blob/main/cad/central-pivot/collar-2.stl>`
- 1pc :ref`Lower Dowel Mount <https://github.com/OpenSim2Real/hardware_repository/blob/main/cad/central-pivot/dowel-mount-lower.stl>`
- 1pc :ref`Upper Dowel Mount <https://github.com/OpenSim2Real/hardware_repository/blob/main/cad/central-pivot/dowel-mount-upper.stl>`
- 1pc :ref`TI Launchxl Holder <https://github.com/OpenSim2Real/hardware_repository/blob/main/cad/central-pivot/ti-launchpad-holder.stl>`
- 1pc :ref`Leg Adapter Piece <https://github.com/OpenSim2Real/hardware_repository/blob/main/cad/central-pivot/leg-adapter.stl>`

Remove all support material at this stage of preparation.

Axle Mount Preparation
------------------------

Parts needed for this step:
* 2pc 3D printed Axle Mount pieces.
* 2pc Aluminum Axle Holder pieces.
* 4pc M2.5x6.3mm helicoils.
* 4pc sleeve bearing for 6mm shaft, 4mm length.
* 4pc 6-32 bolts, 1" long.
* 4pc 6-32 locknuts

..figure:: cp_images/shaft_holder_1.jpg

* Insert one sleeve bushing into each end of each 3D printed Axle Mount. 
* Insert a 6mm diameter shaft into each Axle Mount with the bushings to check that the bushings are aligned 
  within their housing. Superglue or epoxy the bushings into the Axle Mounts.

..figure:: cp_images/shaft_holder_2.jpg

Using a M2.5 helicoil tap, tap the 2 small holes on the Axle Mounts. Using a M2.5 helicoil insertion tool, 
insert M2.5 helicoils into these tapped holes. Using a M2.5 helicoil tang breakoff tool, break off the tangs 
inside the M2.5 helicoils.

..figure:: cp_images/shaft_holder_3.jpg

Finally, secure the 3D printed shaft holders to the Axle Holder aluminum plates with 6-32 bolts and nuts.

..figure:: cp_images/shaft_holder_4.jpg

Parts from this step:
* 2pc Completed Axle Mounts

Baseplate Preparation
---------------------

Parts needed for this step:
* 1pc Aluminum "Baseplate"
* 1pc 1/4"-20 screw with 1" length, flat head
* 1pc Aluminum Unthreaded Spacer 1/2" OD, 2" Long, for 1/4" Screw Size

In the center hole of the baseplate, drill a countersink for a 1/4" screw. Tap the hole for a 1/4" screw. Test 
insert a 1/4" screw - a good fit should have the bolt sit flush so that the baseplate could lie flat on a table. 

Once a good fit on the 1/4" screw has been determined, loctite the bolt onto the baseplate.

..figure:: cp_images/cp_stage_2.jpg
..figure:: cp_images/cp_stage_2_2.jpg

Secure the cylindrical untreaded standoff on a tabletop vise. Screw the standoff onto the 1/4" screw protruding 
out of the baseplate. Ensure there is no gap between the standoff and the baseplate. 

..figure:: cp_images/cp_stage_1.jpg
..figure:: cp_images/cp_stage_1_2.jpg

Optionally, a small hole can be drilled and tapped into the side of the aluminum spacer, and tapped with a M2.5 thread. 
This allows an M2.5 set screw to be inserted to secure any shaft which enters the hole.

Parts from this step:
* 1pc Unfinished Central Pivot Assembly

Upwards Assembly: Part 1
------------------------

Parts needed for this step:
* 1pc Unfinished Central Pivot Assembly
* 1pc "Collar 1" 3D printed piece.
* 1pc "Collar 2" 3D printed piece.
* 1pc Aluminum "Lower Base"
* 1pc Aluminum "Collar Mount"
* 1pc Flanged Sleeve Bearing for 1/2" Shaft Diameter and 3/4" Housing ID, 1/2" Long
* 1pc Clamping Two-Piece Shaft Collar for 1/2" Diameter
* 1pc Notched Disc Spring for 1/2" Shaft Diameter, 0.0330" Thick
* 4pc Male-Female Threaded Hex Standoff, 1/2" Hex Size, 1-1/2" Long, 1/4"-20 Thread Size
* 4pc Button Head Hex Drive Screw, 1/4"-20 Thread Size, 1/2" Long
* 2pc Thrust Ball Bearing for 1-1/2" Shaft Diameter, 2-1/8" OD, 0.437" Thick
* 1pc Notched Disc Spring for 1/2" Shaft Diameter, 0.0330" Thick

Slide the first 3D printed collar piece "Collar 1" down the cylindrical standoff on the baseplate, and ensure that 
it lies flat on the baseplate.

..figure:: cp_images/cp_stage_3.jpg

Slide the wide thrust bearing around the 3D printed collar, and ensure that it lies flat on the baseplate.

..figure:: cp_images/cp_stage_4.jpg

Slide the "Lower Base" aluminum platform around the 3D printed collar, and ensure that it lies flat on top of the thrust 
bearing. Slide the flanged bearing around the cylindrical standoff until the flange lies flat on top of the "Lower Base".

..figure:: cp_images/cp_stage_5.jpg
..figure:: cp_images/cp_stage_5_2.jpg

Slide the second 3D printed collar piece "Collar 2" down the cylindrical standoff, and ensure that it lies flat on the 
"Lower Base". Slide the second wide thrust bearing around the 3D printed collar, and ensure that it lies flat on the 
lowest platform.

..figure:: cp_images/cp_stage_6.jpg

Slide the circular aluminum piece "Collar Mount" down the cylindrical standoff, and ensure that it lies flat on top of the 
thrust bearing.

..figure:: cp_images/cp_stage_7.jpg
..figure:: cp_images/cp_stage_7_2.jpg

Slide a disc spring and a 1/2" shaft collar down the cylindrical standoff. Applying pressure on top of the shaft 
collar, secure the shaft collar with the provided screws. This compresses the 2 thrust bearings, allowing the 
lowest aluminum platform to rotate freely, but remain constrained.

..figure:: cp_images/cp_stage_8.jpg
..figure:: cp_images/cp_stage_8_2.jpg

Using 4 1/4"-20 screws, secure 4 threaded standoffs with length 1-1/2" onto the 4 holes on the lowest aluminum 
platform.

..figure:: cp_images/cp_stage_8_3.jpg
..figure:: cp_images/cp_stage_8_4.jpg

Parts from this step:
* 1pc Unfinished Central Pivot Assembly

Shaft Preparation
-----------------

Parts needed for this step:
* 1pc Rotary Shaft 316 Stainless Steel, 6mm Diameter, 400 mm Long
* 1pc Aluminum "Upper Base"

Slide the 6mm diamter aluminum shaft into the hole of the cylindrical standoff. Slide the second lowest aluminum 
plate "Upper Base" on top of the 4 threaded standoffs of length 1-1/2". 

..figure:: cp_images/cp_stage_9.jpg
..figure:: cp_images/cp_stage_9_1.jpg
..figure:: cp_images/cp_stage_9_2.jpg

With a fine marker, mark a point 14mm above the upper surface of the second lowest aluminum plate. This is the 
recommended length of the shaft such that it would fit inside the encoder in the next steps. Using a handsaw, 
cut the shaft at this length.

Insert the shorter segment of the shaft into the hole of the cylindrical standoff, and ensure that it is a loose 
fit. Layer the lower portion of the shaft with thin tape to ensure a tight fit. Slide this shaft into the 
cylindrical standoff and confirm a tight fit.

..figure:: cp_images/cp_stage_9_3.jpg
..figure:: cp_images/cp_stage_9_4.jpg

Finally, cut a segment of length 160mm out of the remaining 6mm diameter shaft.

..figure:: cp_images/shaft.jpg

Parts from this step:
* 1pc Horizontal Angle Shaft(the shorter one)
* 1pc Vertical Angle Shaft(the longer one)
* 1pc Aluminum "Upper Base"

Upwards Assembly: Part 2
------------------------

Parts needed for this step:
* 1pc Unfinished Central Pivot Assembly
* 1pc AEDM-5810-Z12 Optical Encoder
* 1pc Horizontal Angle Shaft
* 2pc M2.5x12mm bolts
* 2pc M2.5 locknuts
* 4pc Male-Female Threaded Hex Standoff, 1/2" Hex Size, 3/4" Long, 1/4"-20 Thread Size
* 4pc Male-Female Threaded Hex Standoff, 1/2" Hex Size, 3" Long, 1/4"-20 Thread Size
* 1pc "Upper Base"
* 2pc Axle Mounts from previous steps

Slide the encoder base over the 6mm aluminum shaft. Secure it with 2 M2.5 bolts and nuts. 

..figure:: cp_images/cp_stage_10.jpg

Secure the "Upper Base" aluminum piece top of the 4 threaded standoffs, with 4 more threaded standoffs with 
length 3/4". 

Slide the encoder cover over the 6mm aluminum shaft, and connect it to the encoder base. Following the instructions 
in the encoder manual, tighten the set-screw  connecting the encoder code wheel with the 6mm shaft, using the 
provided set-screw. After that, prime the encoder as per the instructions in the encoder manual.

TODO: provide link to the encoder manual.

..figure:: cp_images/cp_stage_11.jpg
..figure:: cp_images/cp_stage_11_2.jpg

On top of the topmost threaded standoffs, place the 2 Axle Mounts. Secure these in place using 
4 threaded standoffs of length 3". 

..figure:: cp_images/cp_stage_12.jpg
..figure:: cp_images/cp_stage_12_2.jpg

Parts from this step:
* 1pc Unfinished Central Pivot Assembly

Shaft Alignment
---------------

Parts needed for this step:
* 1pc Unfinished Central Pivot Assembly
* 1pc Vertical Angle Shaft
* 1pc AEDM-5810-Z12 Optical Encoder
* 4pc Screw Collar for 6 mm Shaft diameter
* 1pc Lower Dowel Mount 3D printed piece
* 2pc M2.5x12mm bolts

Arrange the following components in the following order from left-to-right, leaving 14mm of shaft on one end of a 
shaft-holder.
* Axle Mount
* 6mm screw collar
* 6mm screw collar
* Lower Dowel Mount
* 6mm screw collar
* 6mm screw collar
* Axle Mount

The shaft collars constrain the location of the Lower Dowel Mount on the 6mm diameter shaft, ensuring that it remains 
centered.

..figure:: cp_images/cp_stage_13.jpg
..figure:: cp_images/cp_stage_14.jpg
..figure:: cp_images/cp_stage_14_2.jpg
..figure:: cp_images/cp_stage_14_3.jpg

Once the shaft collars have been positioned, epoxy the Lower Dowel Mount onto the shaft. This prevents the Lower Dowel 
Mount from slipping on the shaft.

After aligning the shaft such that there is 14mm of shaft on one end of a Axle Mount, screw in the shaft-collars. 
This locks the axial position of the shaft, while still allowing rotary motion.

Slide the encoder base over the 6mm aluminum shaft on one end of a Axle Mount, and secure it with 2 M2.5 screws.

Slide the encoder cover over the 6mm aluminum shaft, and connect it to the encoder base. 

..figure:: cp_images/shaft_holder_5.jpg

Following the instructions in the encoder manual, tighten the set-screw connecting the encoder code wheel with the 
6mm shaft, using the provided set-screw. After that, prime the encoder as per the instructions in the encoder manual.

Parts from this step:
* 1pc Unfinished Central Pivot Assembly

Upwards Assembly: Part 3
------------------------

Parts needed for this step:
* 1pc Unfinished Central Pivot Assembly
* 1pc 2m length, 1" OD aluminum tube
* 1pc Aluminum "Roof Piece"
* 1pc Aluminum "Electronics Holder"
* 1pc 3D printed "Upper Dowel Mount"
* 4pc 1/4"-20 locknuts
* 4pc Female Threaded Hex Standoff, 1/4" Hex, 2" Long, 6-32 Thread
* 8pc Button Head Hex Drive Screw, 6-32 Thread Size, 1/2" Long
* 4pc Head Screw 10-32 Thread Size, 2" Long, Partially Threaded
* 4pc Nylon-Insert Locknut 10-32 Thread Size

Measure a point on the long aluminum boom about 10-20cm from one end, and apply a layer of duct tape around it. 
This adds friction to the aluminum boom, preventing it from rotating.

Connect the lower boom-holder and the upper boom-holder around the aluminum boom at the location of the duct tape, 
securing both ends with 4 10-32 bolts and locknuts.

..figure:: cp_images/cp_stage_15.jpg
..figure:: cp_images/cp_stage_15_2.jpg

Secure the "Roof" aluminum plate on top of the 4 shaft-collars using 4 1/4" locknuts. 

..figure:: cp_images/cp_stage_16.jpg
..figure:: cp_images/cp_stage_16_2.jpg
..figure:: cp_images/cp_stage_16_3.jpg

Secure 4 6-32 standoffs on top of the upper aluminum plate using 6-32 screws.

..figure:: cp_images/cp_stage_16_4.jpg
..figure:: cp_images/cp_stage_16_5.jpg

Secure the "Electronics Holder" aluminum plate on top of the 4 6-32 standoffs using 6-32 screws.

..figure:: cp_images/cp_stage_16_6.jpg
..figure:: cp_images/cp_stage_16_7.jpg

Parts from this step:
* 1pc Unfinished Central Pivot Assembly

Wiring the Central Pivot Encoders
---------------------------------

Parts needed for this step:
* 1pc Unfinished Central Pivot Assembly
* 2pc TI LAUNCHXL microcontrollers
* 2pc TI DRV8305 motor driver boards
* 2pc TI LAUNCHXL holders, 3D printed
* 1 spool of 5-wire cable
* 20pc JST sockets
* 4pc JST 5-pin housings, Male.

Designate one of the TI LAUNCHXL microcontroller boards to control the Robotic Leg, and designate the other TI LAUNCHXL 
microcontroller board to control the Central Pivot. On the Robotic leg board, attach the TI DRV8305 motor driver boards, 
as described in the documentation. 

Attach both boards to the 3D printed TI LAUNCHXL holders, and secure them in place with zipties. Attach the boards to 
the "Roof" and "Electronics Holder" aluminum plates.

Measure out 2 20cm lengths of the 5-wire cable and cut them there. At both ends, crimp JST sockets.

At both ends of each cable, connect JST 5-pin housings such that the encoder pins on the TI LAUNCHXL boards align to the 
encoder pins on the Central Pivot Encoders. Refer to the documentation for the TI LAUNCHXL and the documentation for 
the encoders for clarification:
* :ref`Encoder Documentation <https://www.mouser.ca/datasheet/2/678/avgo_s_a0001422768_1-2290945.pdf>`
* :ref`TI LAUNCHXL User Guide <https://www.ti.com/lit/ug/sprui11b/sprui11b.pdf>`

Connect the Central Pivot board to the Central Pivot encoders with these new cables.

..figure:: cp_images/cp_complete_1.jpg
..figure:: cp_images/cp_complete_2.jpg
..figure:: cp_images/cp_complete_3.jpg
..figure:: cp_images/cp_complete_4.jpg
..figure:: cp_images/cp_complete_5.jpg

Parts from this step:
* 1pc Unfinished Central Pivot Assembly

Central Pivot to Robotic Leg Adapter
------------------------------------

Parts needed for this step:
* 1pc Unfinished Central Pivot Assembly
* 1pc 3D-printed leg adapter piece

Connect the end of the Central Pivot boom to the adapter piece using epoxy.

..figure:: in_images/adapter.jpg
..figure:: in_images/adapter_1.jpg
..figure:: in_images/adapter_2.jpg
..figure:: in_images/adapter_3.jpg
..figure:: in_images/adapter_4.jpg
..figure:: in_images/adapter_5.jpg

Parts from this step:
* 1pc Finished Central Pivot Assembly