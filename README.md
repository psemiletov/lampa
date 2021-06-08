# lampa
A Bash-script to control Elgato Key Light Air

Deps: Bash, curl

Before use:

1. Connect your lamp with the router using Android/Iphone Control Center.

2. Look at the router's settings pages for the lamp IP address (for TP-Link, see "DHCP Clients List"). It's better to bind MAC with this IP at router's "IP and MAC binding" settings.

3. Edit the variable ADDR at this script for the actual IP of the lamp.


When the lamp is turned on:

1. Run lampa.sh

2. Follow the on-screen help to control your lamp.

3. You can also use the presets. See the "preset.json" as example. Use as:

./lampa.sh preset