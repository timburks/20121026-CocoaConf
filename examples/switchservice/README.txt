This sample is used as a switch to control an LED connected to pin P2_1.

The switch service UUID is A696CB2B-F3A4-4240-B74D-C457C253857B and the switch state UUID is
AEDA780E-1CCF-4B85-BCA0-3484F295D031. You can write a single byte to the switch to turn it on or
off. A value of hex 0 will turn off the light, any other positive value will turn on the light.

This sample can be used to trigger a power mosfet to power any larger loads or switches.