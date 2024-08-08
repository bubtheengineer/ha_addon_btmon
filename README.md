# BTmon Addon for Home Assistant

This wraps the btmon3.py file in a HA addon.  It allows you to connect to a Brultech energy monitor and relay the power consumption data to other endpoints (Emoncms, MQTT, etc...).  
In my use-case I'm using a XBee module connected to HA yellow via USB, and this provides a wireless serial link to the Brultech ECM-1240.
