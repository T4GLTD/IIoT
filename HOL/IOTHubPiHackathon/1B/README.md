## Hands on Lab - Initial Setup - MXChip IoT DevKit with Arduino

* Copied on Jan 4, 2019 from https://docs.microsoft.com/en-us/azure/iot-hub/iot-hub-arduino-iot-devkit-az3166-get-started
* Minor clarifications added

### Prepare your hardware

Hook up the following hardware to your computer:
- DevKit board
- Micro-USB cable

<p align="center">
  <img src="/HOL/IOTHubPiHackathon/images/MXChipIotDevKit_hardware.jpg" />
</p>

To connect the DevKit to your computer, follow these steps:
1. Connect the USB end to your computer.
2. Connect the Micro-USB end to the DevKit.
3. The green LED for power confirms the connection.

<p align="center">
  <img src="/HOL/IOTHubPiHackathon/images/MXChipIotDevKit_connect.jpg" />
</p>

If you have already experimented with your MXChip IoT DevKit prior to this workshop, and have configured it or downloaded programs to it, you will need to reinstall the firmware.
* These steps can also be followed anytime you need to reset your MXChip IoT DevKit

[MXChip IoT DevKit - Upgrade / ReInstall Firmware](/HOL/IOTHubPiHackathon/1B/firmware)

If you are using your MXChip for the first time, you can continue on to the "Configure Wi-Fi" step below

### Configure Wi-Fi

IoT projects rely on internet connectivity. Use the following instructions to configure the DevKit to connect to Wi-Fi.

#### Enter AP mode

* Hold down button B
* Push and release the reset button (while still holding button B)
* Wait a second or two (until the screen displays "IoT DevKit") then release button B

Your DevKit enters AP mode for configuring Wi-Fi. The screen displays the service set identifier (SSID) of the DevKit and the configuration portal IP address.

<p align="center">
  <img src="/HOL/IOTHubPiHackathon/images/MXChipIotDevKit_wifi-ap.jpg" />
</p>
<p align="left">
  <img src="/HOL/IOTHubPiHackathon/images/MXChipIotDevKit_set-ap-mode.gif" />
</p>

#### Connect to DevKit AP
Now, use another Wi-Fi enabled device (computer or mobile phone) to connect to the DevKit SSID (highlighted in the previous image). Leave the password empty.

<p align="center">
  <img src="/HOL/IOTHubPiHackathon/images/MXChipIotDevKit_connect-ssid.png" />
</p>

#### Configure Wi-Fi for the DevKit
* Open the IP address shown on the DevKit screen on your computer or mobile phone browser
* Select the Wi-Fi network that you want the DevKit to connect to and then type the password and select *Connect*
  * Note: The Wi-Fi network and password will be provided in the classroom

<p align="center">
  <img src="/HOL/IOTHubPiHackathon/images/MXChipIotDevKit_wifi-portal.png" />
</p>
When the connection succeeds, the DevKit reboots in a few seconds. You then see the Wi-Fi name and IP address on the screen:

<!---
Changed picture to point to MXChipIotDevKit_firmware instead of MXChipIotDevKit_wifi-ip since it was closer to what I was seeing on my MXChip
-->

<p align="center">
  <img src="/HOL/IOTHubPiHackathon/images/MXChipIotDevKit_firmware.jpg" /> 
</p>

* After Wi-Fi is configured, your credentials will persist on the device for that connection, even if the device is unplugged. 
* For example, if you configure the DevKit for Wi-Fi in your home and then take the DevKit to the office, you will need to reconfigure AP mode (starting at the step in the "Enter AP Mode" section) to connect the DevKit to your office Wi-Fi. 

### Start using the DevKit

The default app running on the DevKit checks the latest version of the firmware and displays some sensor diagnosis data for you.

### Upgrade to the latest firmware

* Note: Since v1.1, DevKit enables ST-SAFE in bootloader. You need to upgrade the firmware if you are running a version prior to v1.1.
* If you need a firmware upgrade, the screen will show the current and latest firmware versions.
* To upgrade, follow the instructions here: [MXChip IoT DevKit - Upgrade / ReInstall Firmware](/HOL/IOTHubPiHackathon/1B/firmware)

<p align="center">
  <img src="/HOL/IOTHubPiHackathon/images/MXChipIotDevKit_firmware.jpg" />
</p>

* Note: This is a one-time effort. After you start developing on the DevKit and upload your app, the latest firmware will come with your app.

### Test various sensors

Press button B to test the sensors. Continue pressing and releasing the button B to cycle through each sensor.

<p align="center">
  <img src="/HOL/IOTHubPiHackathon/images/MXChipIotDevKit_sensors.jpg" />
</p>

Briefly explain other buttons?

* E.g. A button does?
* Reset will 'reboot' your device (but will retain WiFi settings or running programs)

------------------------------

[Back to Main HOL Instructions](/HOL/IOTHubPiHackathon/README.md)
