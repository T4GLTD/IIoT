# Connect Your MXChip IoT DevKit to the IoT Hub
In this lab, you will provision an IoT Hub configure your IoT Device to connect to it. 

## Prepare Visual Studio Code environment

1. Launch VS Code
2. Configure VS Code with Arduino settings

* In Visual Studio Code, click File > Preference > Settings. Then click the ... and Open settings.json. 

<p align="center">
  <img src="/HOL/IOTHubPiHackathon/images/MXChipIotDevKit_user-settings-arduino.png" />
</p>

* Add following lines to configure Arduino depending on your platform
  * Note: add these to the end of any existing JSON lines that are there
  * Ensure you add a comma to separate existing lines from the new ones if any exist
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
* Ubuntu
  * Replace the {username} placeholder below with your username
```
"arduino.path": "/home/{username}/Downloads/arduino-1.8.8",
"arduino.additionalUrls": "https://raw.githubusercontent.com/VSChina/azureiotdevkit_tools/master/package_azureboard_index.json"
```

3.  Click "F1" to open the command palette, type and select *Arduino: Board Manager*
* Search for AZ3166 and install the latest version.


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
* Ubuntu: Run the following in terminal and log out and log in for the group change to take effect:

```
# Copy the default rules. This grants permission to the group 'plugdev'
sudo cp ~/.arduino15/packages/AZ3166/tools/openocd/0.10.0/linux/contrib/60-openocd.rules /etc/udev/rules.d/
sudo udevadm control --reload-rules

# Add yourself to the group 'plugdev'
# Logout and log back in for the group to take effect
sudo usermod -a -G plugdev $(whoami)
```

## Provision IoT Hub and connect IoT Device

1. Make sure your IoT DevKit is *not connected* to your computer. Start VS Code first, and then connect the DevKit to your computer.

2. Click "F1" to open the command palette, type and select *Azure IoT Device Workbench: Open Examples....* Then select *IoT DevKit* as board.

3. In the IoT Workbench Examples page, find *Get Started* and click *Open Sample*. Then select the default path to download the sample code.

<p align="center">
  <img src="/HOL/IOTHubPiHackathon/images/MXChipIotDevKit_open-sample.png" />
</p>

4. In the new opened project window, click "F1" to open the command palette, type and select *Azure IoT Device Workbench: Provision Azure Services....* Follow the step by step guide to finish provisioning your Azure IoT Hub and creating the IoT Hub device. 

<p align="center">
  <img src="/HOL/IOTHubPiHackathon/images/MXChipIotDevKit_cloud-provision.png" />
</p>

5. In the bottom-right status bar, check the *MXCHIP AZ3166* is shown as selected board and serial port with *STMicroelectronics* is used. 

<p align="center">
  <img src="/HOL/IOTHubPiHackathon/images/MXChipIotDevKit_select-com.png" />
</p>

6. Click "F1" to open the command palette, type and select *Azure IoT Device Workbench: Configure Device Settings...*, then select *Config Device Connection String > Select IoT Hub Device Connection String*.

7. On DevKit, hold down *button A*, push and release the *reset* button, and then release *button A*. Your DevKit enters configuration mode and saves the connection string. 

<p align="center">
  <img src="/HOL/IOTHubPiHackathon/images/MXChipIotDevKit_connection-string.png" />
</p>

## Upload code to IoT Device

1. Click F1 again, type and select *Azure IoT Device Workbench: Upload Device Code*. It starts compile and upload the code to DevKit. 

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

2. In the *Shared access policies* pane, click the *iothubowner policy*, and write down the Connection string of your IoT hub.  

<p align="center">
  <img src="/HOL/IOTHubPiHackathon/images/MXChipIotDevKit_azure-portal-conn-string.png" />
</p>

3. In VS Code, click "F1", type and select *Azure IoT Hub: Set IoT Hub Connection String*. Copy the connection string into it. 

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

[Back to Main HOL Instructions](/HOL/IOTHubPiHackathon/README.md)
