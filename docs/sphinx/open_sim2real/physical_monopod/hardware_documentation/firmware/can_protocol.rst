.. _can_protocol:

CAN Protocol
============

Introduction
=============

The CAN protocol describes hardware nodes communicating with each other through CAN messages. This page documents
the different CAN messages being sent throughout our system.

This page is adapted from ODRI's page on CAN protocol. Many of the messages remain unchanged, but we added several
additional messages. The original page is as follows:

- `ODRI CAN Protocol <https://open-dynamic-robot-initiative.github.io/mw_dual_motor_torque_ctrl/can_interface.html>`_

Our CAN network consists of 3 nodes: The TI LAUNCHXL board that controls the motors of the Robotic Leg, the TI LAUNCHXL
board that reads the encoders on the Central Pivot, and a computer which interfaces with the CAN network through a
CAN interface.

.. figure:: fm_images/can.PNG

   Illustration of the CAN network

Messages sent from the Robotic Leg Board
=========================================

+-------+---------------------------------------------------+--------------+---------------------------------------------------+
| ID    | Meaning                                           | Size [Bytes] | Structure of the data                             |
+=======+===================================================+==============+===================================================+
| 0x010 | Status                                            | 1            | see `Status Message`_                             |
+-------+---------------------------------------------------+--------------+---------------------------------------------------+
| 0x020 | Current :math:`I_q` (both motors)                 | 8            | - MDL: :math:`I_q` of motor 1                     |
|       |                                                   |              | - MDH: :math:`I_q` of motor 2                     |
+-------+---------------------------------------------------+--------------+---------------------------------------------------+
| 0x030 | Encoder Position (both motors)                    | 8            | - MDL: Position of motor 1                        |
|       |                                                   |              | - MDH: Position of motor 2                        |
+-------+---------------------------------------------------+--------------+---------------------------------------------------+
| 0x040 | Velocity (both motors)                            | 8            | - MDL: Velocity of motor 1                        |
|       |                                                   |              | - MDH: Velocity of motor 2                        |
+-------+---------------------------------------------------+--------------+---------------------------------------------------+
| 0x060 | Encoder Index Position                            | 5            | - MDL (4 Bytes): Motor position at the index tick |
|       |                                                   |              | - MDH (1 Byte): ID of the motor                   |
|       | *This is not sent with a fixed rate but whenever* |              |                                                   |
|       | *the encoder index is detected.*                  |              |                                                   |
+-------+---------------------------------------------------+--------------+---------------------------------------------------+
| 0x070 | Acceleration (both motors)                        | 8            | - MDL: Acceleration of motor 1                    |
|       |                                                   |              | - MDH: Acceleration of motor 2                    |
+-------+---------------------------------------------------+--------------+---------------------------------------------------+

.. important::

    The motor data (current, position, velocity) is send as Q24 values. Divide
    by 2\ :sup:`24` to get the float representation.

Status Message
--------------

The status message contains one byte of data which is structured as follows:

+-------------+---------------------+----------------------+--------------------+-----------------------+---------------------+
| Bit 5-7     | Bit 4               | Bit 3                | Bit 2              | Bit 1                 | Bit 0               |
+=============+=====================+======================+====================+=======================+=====================+
|  Error Code |  Flag motor 2 ready | Flag motor 2 enabled | Flag motor 1 ready |  Flag motor 1 enabled | Flag system enabled |
+-------------+---------------------+----------------------+--------------------+-----------------------+---------------------+

A motor is "ready" when the alignment process is finished.

Error Codes
-----------

+------------+---------------------------------------------------------------------------------------------------+
| Error Code | Meaning                                                                                           |
+============+===================================================================================================+
| 0          | No Error                                                                                          |
+------------+---------------------------------------------------------------------------------------------------+
| 1          | Motor 1 Encoder Error                                                                             |
+------------+---------------------------------------------------------------------------------------------------+
| 2          | CAN Receive Timeout                                                                               |
+------------+---------------------------------------------------------------------------------------------------+
| 3          | Critical Motor Temperature (currently unused)                                                     |
+------------+---------------------------------------------------------------------------------------------------+
| 4          | Some error in the Position Converter module                                                       |
+------------+---------------------------------------------------------------------------------------------------+
| 5          | Position Rollover (position exceeded max value)                                                   |
|            |                                                                                                   |
|            | *This error is by default disabled. To enable it, send a ENABLE\_POS\_ROLLOVER\_ERROR=1 command.* |
+------------+---------------------------------------------------------------------------------------------------+
| 7          | Motor 2 Encoder Error                                                                             |
+------------+---------------------------------------------------------------------------------------------------+

Note that the error code for critical motor temperature won't be used for now,
as we don't have any temperature sensing. As this might be added in the future,
I already reserve an error code for this, though.

Messages sent to the Robotic Leg Board
======================================

+-------+-------------------+---------------------------------+--------------------------------------------+
| ID    | Name              | Meaning [Unit]                  | Structure of the data                      |
+=======+===================+=================================+============================================+
| 0x000 | CAN\_ID\_COMMANDS | Command                         | - MDL: value                               |
|       |                   |                                 | - MDH: command code (see `Command Codes`_) |
+-------+-------------------+---------------------------------+--------------------------------------------+
| 0x005 | CAN\_ID\_IqRef    | Current :math:`I_q` Reference   | - MDL: IqRef for motor 1                   |
|       |                   | :math:`[A]`                     | - MDH: IqRef for motor 2                   |
+-------+-------------------+---------------------------------+--------------------------------------------+
| 0x006 | CAN\_ID\_KP       | Gains for P controller          | - MDL: P gain for motor 1                  |
|       |                   | :math:`[\frac{A}{mrev}]`        | - MDH: P gain for motor 2                  |
+-------+-------------------+---------------------------------+--------------------------------------------+
| 0x007 | CAN\_ID\_KD       | Gains for D controller          | - MDL: D gain for motor 1                  |
|       |                   | :math:`[\frac{A}{kmrev / min}]` | - MDH: D gain for motor 2                  |
+-------+-------------------+---------------------------------+--------------------------------------------+
| 0x008 | CAN\_ID\_POS\_REF | Reference for P controller      | - MDL: Reference position for motor 1      |
|       |                   | :math:`[mrev]`                  | - MDH: Reference position for motor 2      |
+-------+-------------------+---------------------------------+--------------------------------------------+
| 0x009 | CAN\_ID\_VEL\_REF | Reference for D controller      | - MDL: Reference velocity for motor 1      |
|       |                   | :math:`[\frac{kmrev}{min}]`     | - MDH: Reference velocity for motor 2      |
+-------+-------------------+---------------------------------+--------------------------------------------+

:math:`mrev` = motor revolutions.  E.g. 0.5 is half a revolution, 1.0 a full revolution, 2.0 two revolutions, etc.

.. important::

    Please note that current reference values have to be send as Q24 values.  To
    convert float to Q24 multiply by 2\ :sup:`24` and round to an integer.

Command Codes
--------------

A command message (ID = 0) consists of two parts. The high bytes (MDH) contain a
code that is associated with a specific parameter (see table below) while the
lower bytes (MDL) contain the value that is to be assigned to the parameter.

+------+------------------------------------------+--------------------------------------------------------------------------+--------+---------+
| Code | Name                                     | Meaning [Unit]                                                           | Value  | Default |
+======+==========================================+==========================================================================+========+=========+
| 0x01 | ENABLE\_SYS                              | Enable the system.                                                       | 0/1    | 1       |
+------+------------------------------------------+--------------------------------------------------------------------------+--------+---------+
| 0x02 | ENABLE\_MTR1                             | Enable Motor 1                                                           | 0/1    | 0       |
+------+------------------------------------------+--------------------------------------------------------------------------+--------+---------+
| 0x03 | ENABLE\_MTR2                             | Enable Motor 2                                                           | 0/1    | 0       |
+------+------------------------------------------+--------------------------------------------------------------------------+--------+---------+
| 0x04 | ENABLE\_VSPRING1                         | Enable virtual spring mode for motor 1                                   | 0/1    | 0       |
+------+------------------------------------------+--------------------------------------------------------------------------+--------+---------+
| 0x05 | ENABLE\_VSPRING2                         | Enable virtual spring mode for motor 2                                   | 0/1    | 0       |
+------+------------------------------------------+--------------------------------------------------------------------------+--------+---------+
| 0x0C | SEND\_CURRENT                            | Send motor currents via CAN                                              | 0/1    | 0       |
+------+------------------------------------------+--------------------------------------------------------------------------+--------+---------+
| 0x0D | SEND\_POSITION                           | Send encoder positions via CAN                                           | 0/1    | 0       |
+------+------------------------------------------+--------------------------------------------------------------------------+--------+---------+
| 0x0E | SEND\_VELOCITY                           | Send motor velocities via CAN                                            | 0/1    | 0       |
+------+------------------------------------------+--------------------------------------------------------------------------+--------+---------+
| 0x0F | SEND\_ADC6                               | Send ADC inputs A6/B6 via CAN                                            | 0/1    | 0       |
+------+------------------------------------------+--------------------------------------------------------------------------+--------+---------+
| 0x14 | SEND\_ALL                                | Disable/Enable all of the configurable CAN messages                      | 0/1    | 0       |
+------+------------------------------------------+--------------------------------------------------------------------------+--------+---------+
| 0x1E | SET\_CAN\_RECV\_TIMEOUT                  | Set CAN Receive Timeout in milliseconds. Set to zero to disable timeout. | uint32 | 0       |
+------+------------------------------------------+--------------------------------------------------------------------------+--------+---------+
| 0x1F | ENABLE\_POS\_ROLLOVER\_ERROR             | Enable the position rollover error                                       | 0/1    | 0       |
+------+------------------------------------------+--------------------------------------------------------------------------+--------+---------+
| 0x28 | CAN\_CMD\_P\_CONTROLLER\_LIMIT\_IQ\_MTR1 | Set the current limit for the P controller of motor 1 [A]                | IQ24   | 0       |
+------+------------------------------------------+--------------------------------------------------------------------------+--------+---------+
| 0x29 | CAN\_CMD\_P\_CONTROLLER\_LIMIT\_IQ\_MTR2 | Set the current limit for the P controller of motor 2 [A]                | IQ24   | 0       |
+------+------------------------------------------+--------------------------------------------------------------------------+--------+---------+
| 0x2A | CAN\_CMD\_D\_CONTROLLER\_LIMIT\_IQ\_MTR1 | Set the current limit for the D controller of motor 1 [A]                | IQ24   | 0       |
+------+------------------------------------------+--------------------------------------------------------------------------+--------+---------+
| 0x2B | CAN\_CMD\_D\_CONTROLLER\_LIMIT\_IQ\_MTR2 | Set the current limit for the D controller of motor 2 [A]                | IQ24   | 0       |
+------+------------------------------------------+--------------------------------------------------------------------------+--------+---------+

Example: To enable motor 1, set MDH = 2 and MDL = 1.

Nomenclature: When refering to sending commands in this documentation, the
following nomenclature is used: ``NAME=value``. Example: ``ENABLE_SYS=1`` to
enable the system.

Messages sent from the Central Pivot Board
==========================================

+-------+---------------------------------------------------+--------------+---------------------------------------------------+
| ID    | Meaning                                           | Size [Bytes] | Structure of the data                             |
+=======+===================================================+==============+===================================================+
| 0x010 | Status                                            | 1            | see `Status Message`_                             |
+-------+---------------------------------------------------+--------------+---------------------------------------------------+
| 0x031 | Encoder Position (both Central Pivot Encoders)    | 8            | - MDL: Angular Position of Encoder 1              |
|       |                                                   |              | - MDH: Angular Position of Encoder 2              |
+-------+---------------------------------------------------+--------------+---------------------------------------------------+
| 0x041 | Velocity (both Central Pivot Encoders)            | 8            | - MDL: Angular Velocity of Encoder 1              |
|       |                                                   |              | - MDH: Angular Velocity of Encoder 2              |
+-------+---------------------------------------------------+--------------+---------------------------------------------------+
| 0x071 | Acceleration (both Central Pivot Encoders)        | 8            | - MDL: Angular Acceleration of Encoder 1          |
|       |                                                   |              | - MDH: Angular Acceleration of Encoder 2          |
+-------+---------------------------------------------------+--------------+---------------------------------------------------+

.. important::

    The motor data (current, position, velocity) is send as Q24 values. Divide
    by 2\ :sup:`24` to get the float representation.

CAN Receive Timeout
--------------------

The embedded software on the board provides a security feature that disables the
motors in case the CAN connection is interrupted or the controller on the PC
exits without properly shutting down the system. This is done by simply checking
the time since the last current :math:`I_q` reference was received and raising
an error if it exceeds a specified timeout.

Note that by default, this feature is disabled! If you want to use it, you have
to enable it by specifying a timeout duration greater than zero (see Command
Codes above). There are a few consequences that have to be kept in mind:

- Before enabling the motors, set the current references to zero, otherwise the
  timeout may be trigger immediately when enabled. Note that this is good
  practice anyway as it clears potentially dangerous previous reference values.

- Current references have to be sent in a loop, even if the values do not
  change.

The timeout is only checked when motors are enabled and current references are
not zero. This means that, as long as the current reference is zero, it is okay
to enable the timeout during intialization even if current commands are not send
immediately.

When the timeout is triggered, an error is set and the system is disabled. You
can simply reenable it by sending (in this order) enable system command, a
current=0 command and enable motor commands.
