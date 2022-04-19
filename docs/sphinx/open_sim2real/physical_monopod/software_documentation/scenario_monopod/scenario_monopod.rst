.. _scenario_monopod_software_docs:

================
scenarIO Monopod
================

Scenario is an abstract layer that is used to interface with robots :footcite:`gym_ignition`
by exposing APIs to interact with a scene. The scene is defined as a World object that can
return Model objects. This allows the simulated or physical robot to be implemented as a
separate scenarIO back-end, which can be switched between.

The vanilla scenario package comes with everything required to interface into the
:ref:`ignition gazebo <why_ignition_gazebo>` simulator. Then the `scenario_monopod` package
extends this API with the monopod real-time backend.

This allows the physical robot and the simulated robot to be easily switched between
without requiring many changes to the upstream code (most changes are dependency related).


Package Architecture
====================

The architecture can be easily represented as a diagram. This diagram shows how `scenario_monopod`
simply implements the `monopod_sdk` API with the scenario interface. This means that we have both the
simulation and real-time backends in place. Which allow us to write code to control your robot just once,
it will interact either with the simulated or the real robot depending on the ScenarIO backend you enabled.

.. figure:: media/website-scenario_monopod.drawio.png

    Scenario monopod implements the scenario base class using the `monopod_sdk` API
    as the real-time backend for the physical robot. THis allows the `scenario_monopod` package to
    behave as a extension or plugin for the vanilla `scenario` :footcite:`gym_ignition`.


.. tip::

    The interface / implementation pattern is implemented using classic inheritance and
    polymorphism design patterns. Having such unified interface simplifies the process to expose it to
    other languages. Thanks to SWIG, we officially provide Python bindings of `scenario_monopod`,
    this way you can prototype your applications even faster! In both simulation and real!


.. footbibliography::
