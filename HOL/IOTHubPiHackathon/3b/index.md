# Connect Your MXChip IoT DevKit to the IoT Hub
In this lab, you will provision an IoT Hub configure your IoT Device to connect to it. 

## Prepare Visual Studio Code environment

1. Launch VS Code
2. Configure VS Code with Arduino settings

* In Visual Studio Code, click File > Preferences > Settings. 
* Then click the ... (in the upper right corner) and click Open settings.json. 

<p align="center">
  <img src="/HOL/IOTHubPiHackathon/images/MXChipIotDevKit_user-settings-arduino.png" />
</p>

* Add following lines to configure Arduino depending on your platform
  * Note: If any settings already exist, add a comma after the last setting
  * Then insert the lines below after the existing settings (but before the closing curly brace } )
  
  * Windows
```
"arduino.path": "C:\\Program Files (x86)\\Arduino",
"arduino.additionalUrls": "https://raw.githubusercontent.com/VSChina/azureiotdevkit_tools/master/package_azureboard_index.json"
```
* macOS
```
"arduino.path": "/Applications",
"arduino.additionalUrls": "https://raw.githubusercontent.com/VSChina/azureiotdevkit_tools/master/package_azureboard_index.json"
```
<!--
* Ubuntu
  * Replace the {username} placeholder below with your username
```
"arduino.path": "/home/{username}/Downloads/arduino-1.8.8",
"arduino.additionalUrls": "https://raw.githubusercontent.com/VSChina/azureiotdevkit_tools/master/package_azureboard_index.json"
```
-->

3.  Press the "F1" key to open the command palette, type and select *Arduino: Board Manager*
* Note: An alternative to the "F1" key is to also click View > Command Pallette
* Search for AZ3166 in the search box
* You should find *MXChip - Microsoft Azure IoT Developer Kit* in the resulting list.
* Choose the latest version you can find from the *Select version* drop down and click *Install*.


<p align="center">
  <img src="/HOL/IOTHubPiHackathon/images/MXChipIotDevKit_install-az3166-sdk.png" />
</p>

## Install ST-Link drivers

ST-Link/V2 is the USB interface that IoT DevKit uses to communicate with your development machine. Follow the OS-specific steps to allow the machine access to your device.

* Windows: Download and install USB driver *(provide link to en.stsw-link009.zip)*
  * Unzip to a folder (e.g. en.stsw-link009)
  * Navigate to the folder and double-click the dpinst_amd64.exe 
     * This assuming you are running 64-bit windows
     * Accept defaults when prompted

* macOS: No driver is required for macOS.
<!--
* Ubuntu: Run the following in terminal and log out and log in for the group change to take effect:

```
# Copy the default rules. This grants permission to the group 'plugdev'
sudo cp ~/.arduino15/packages/AZ3166/tools/openocd/0.10.0/linux/contrib/60-openocd.rules /etc/udev/rules.d/
sudo udevadm control --reload-rules

# Add yourself to the group 'plugdev'
# Logout and log back in for the group to take effect
sudo usermod -a -G plugdev $(whoami)
```
-->

## Provision IoT Hub and connect IoT Device

1. Make sure your IoT DevKit is *not connected* to your computer. Start VS Code first, and then connect the DevKit to your computer.

2. Press the "F1" key to open the command palette, type and select *Azure IoT Device Workbench: Open Examples....* Then select *IoT DevKit* as board.

3. In the IoT Workbench Examples page, find *Get Started* and click *Open Sample*. Then select the default path to download the sample code.

<p align="center">
  <img src="/HOL/IOTHubPiHackathon/images/MXChipIotDevKit_open-sample.png" />
</p>

4. In the new opened VS Code project window, press "F1" to open the command palette, type and select *Azure IoT Device Workbench: Provision Azure Services....* Follow the step by step guide to finish provisioning your Azure IoT Hub and creating the IoT Hub device.
  * Note: You may want to prefix your Azure objects with something unique like your initials and HoL (e.g. AAAHoL)
  * E.g. your resource group could be AAAHoLrg, Iot Hub could be AAAHoLIoTHub
  * Choose the region (East US or East US 2 are good options)
  * Choose the F1: Free tier (do we want to recommend basic?)
  * Wait a few minutes while the IoTHub is created
  * Then follow the additional prompts to create the IoT Hub device

<p align="center">
  <img src="/HOL/IOTHubPiHackathon/images/MXChipIotDevKit_cloud-provision.png" />
</p>

5. In the bottom-right status bar, check the *MXCHIP AZ3166* is shown as selected board and serial port (most likely COM3) with *STMicroelectronics* is used. 

<p align="center">
  <img src="/HOL/IOTHubPiHackathon/images/MXChipIotDevKit_select-com.png" />
</p>

6. Press "F1" to open the command palette, type and select *Azure IoT Device Workbench: Configure Device Settings...*, then select *Config Device Connection String > Select IoT Hub Device Connection String*.

7. On DevKit, hold down *button A*, push and release the *reset* button, and then release *button A*. Your DevKit enters configuration mode and saves the connection string. 

<p align="center">
  <img src="/HOL/IOTHubPiHackathon/images/MXChipIotDevKit_connection-string.png" />
</p>

## Upload code to IoT Device

1. Press "F1" again, type and select *Azure IoT Device Workbench: Upload Device Code*. It starts to compile and upload the code to DevKit. 

<p align="center">
  <img src="/HOL/IOTHubPiHackathon/images/MXChipIotDevKit_arduino-upload.png" />
</p>

The DevKit reboots and starts running the code.

Note: If there are any errors or interruptions, you can always recover by running the command again.

## View the telemetry received by Azure IoT Hub

You can use Azure IoT Tools in Visual Studio Code to monitor device-to-cloud (D2C) messages in IoT Hub.

1. Sign into [Azure portal](https://portal.azure.com), and find the IoT Hub you created. 

<p align="center">
  <img src="/HOL/IOTHubPiHackathon/images/MXChipIotDevKit_azure-iot-hub-portal.png" />
</p>

2. In the *Shared access policies* pane, click the *iothubowner policy*
  * Under Shared access keys, and click the "Copy" button beside the *Connection string - primary key* to copy the Connection string of your IoT hub to your clipboard.  

<p align="center">
  <img src="/HOL/IOTHubPiHackathon/images/MXChipIotDevKit_azure-portal-conn-string.png" />
</p>

3. In VS Code, press "F1", type and select *Azure IoT Hub: Set IoT Hub Connection String*. Copy the connection string into it. 

<p align="center">
  <img src="/HOL/IOTHubPiHackathon/images/MXChipIotDevKit_set-iothub-connection-string.png" />
</p>

4. Expand the *AZURE IOT HUB DEVICES* pane on the right, right click on the device name you created and select *Start Monitoring D2C Message*.

<p align="center">
  <img src="/HOL/IOTHubPiHackathon/images/MXChipIotDevKit_monitor-d2c.png" />
</p>

5. In *OUTPUT* pane, you can see the incoming D2C messages to the IoT Hub.

<p align="center">
  <img src="/HOL/IOTHubPiHackathon/images/MXChipIotDevKit_d2c-output.png" />
</p>

## Send Message from IoT Hub to Device

1. Press "F1" again, type and select *Azure IoT Hub: Send C2D Message to Device*. 

<p align="center">
  <img src="/HOL/IOTHubPiHackathon/images/MXChipIotDevKit_send_c2d.png" />
</p>

2. Select an IoT Hub Device (e.g. the one you created earlier)

3. Enter the message to be sent to the device.  This can be "Hello World" or something more original.
* You should see the message appear on the 2nd line of your MXChip IoTDevKit display
* E.g.
  * Iot DevKit
  * Hello World
  * Running...
  * > Iot Hub

[Back to Main HOL Instructions](/HOL/IOTHubPiHackathon/README.md)
