====================
Setup RT Kernel
====================


ubuntu 20.04
============



Pop OS 20.04
============

.. warning::

  I have had nothing but issues trying to use pop os with the realtime kernel
  because of the system-md boot loader and the built in hardware drivers. Both
  these features are extremely nice when not using the RT-Preempt kernel patch 
  however cause many issues such as; computer fan and heat sensors not working,
  mouse pad keys not working, wifi driver issues, etc. Most of this stuff is
  caused by incompatibility between the gpu drivers and the RT kernel.
