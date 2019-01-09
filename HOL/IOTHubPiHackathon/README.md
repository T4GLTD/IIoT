# IoT Hub Hands on Lab (HoL)

## Overview

This Hands on Lab (HOL) demonstrates connecting an Azure IoT DevKit or Raspberry Pi running Raspian to [Azure IoT Hub] (https://azure.microsoft.com/en-us/services/iot-hub/).

Telemetry can be sent to Azure IoT Hub from any of the following simulated or physical devices:
- an [Azure IoT DevKit](https://microsoft.github.io/azure-iot-developer-kit/)
- an [Azure IoT DevKit Web Simulator](https://azure-samples.github.io/iot-devkit-web-simulator/)
- a [Sense HAT](https://www.raspberrypi.org/products/sense-hat/) device connected to the Raspberry Pi; or
- a [Sense HAT Emulator](https://www.raspberrypi.org/blog/sense-hat-emulator/) installed on the Raspberry Pi.
- a [Powershell Script](./Powershell) with AzureIoT module

Completing this HOL will provide you with the basic skills needed to connect and securely send telemetry from a physical device (e.g. a field device or field gateway) to the Azure IoT Hub.  Once data has been ingested into Azure IoT Hub, there are many possible processing outputs including complex event processing, stream processing, saving telemetry to blob storage or databases, analytics, training of Machine Learning models etc.

### Why Sense HAT?

We didn't want you to mess around with breadboards, jumper cables, resistors etc. This just wastes time and adds nothing to the goal of connecting a sensor to Azure IoT Hub. The Raspberry PI Sense HAT has all the necessary components installed on the circuit board, including a ready to use library, and a series of sensors to play with.

### Why Azure IoT DevKit?

The Azure IoT DevKit is a Microsoft Azure Certified is an all-in-one kit optimized for prototyping and developing Internet of Things (IoT) solutions leveraging Microsoft Azure services. It provides an Arduino compatible board with rich peripherals such as an OLED display, sensors, hardware debugging chip (ST-Link) and [STSAFE-A100 security chip](https://www.st.com/en/secure-mcus/stsafe-a100.html). It can use Visual Studio Code with Arduino Extension to quickly build a full-fledged IoT application that integrates multiple services like Azure IoT Hub, Logic App and Cognitive Services.  It may cost less than buying a Raspberry Pi + Sense Hat.

### Why HTTPS and REST?

For simplicity and to avoid downloading/compiling SDKs during the HOL, we chose to send the device telemetry to Azure IoT Hub using the [IoT Hub REST API](https://docs.microsoft.com/en-us/rest/api/iothub/) over HTTPS. Of course, you can use one of the many device SDKs available, which support sending messages over AMQP and MQTT. If you want to use the device SDKs, refer to the Using the .NET Device SDK section below.

## Lab Requirements

It is expected that you will have a base understanding of the following:
- Microsoft Azure (we will discuss the IoT specific aspects of Azure so are expecting attendees to understand Azure and the capabilities in a broader sense).
- Basic system administration skills (eg. SSH, SCP, copying file, etc.)
- Some development experience is beneficial but not required.

### HARDWARE 

Attendees may be provided with Azure IoT DevKit or can use their own hardware or simulator. You can order your hardware from a variety of online sites such as adafruit.com, amazon.com etc. Please order yours 3-4 weeks in advance of the HOL so it will arrive in time.

#### Devices

- [Azure IoT DevKit](https://microsoft.github.io/azure-iot-developer-kit/)
- [Raspberry Pi 3 Model B](https://www.raspberrypi.org/products/raspberry-pi-3-model-b/) or [Raspberry Pi Zero W](https://www.raspberrypi.org/products/raspberry-pi-zero-w/) with latest version of Raspian installed on the micro SD card. Using [NOOBS](https://www.raspberrypi.org/downloads/noobs/) works fine.  **Note:** if you are using the **Raspberry Pi Zero W**, make sure you bring the mini-HDMI to HMDI adapter for connectivity to a monitor as well as a USB hub so that you can connect a keyboard and mouse to the Pi. (if you already have a Pi 2 Model B with USB Wi-Fi dongle, that will probably work as well)
- 
#### Simulators

- [Azure IoT DevKit Web Simulator](https://azure-samples.github.io/iot-devkit-web-simulator/)
- [Sense HAT](https://www.raspberrypi.org/products/sense-hat/)
  If you don't want to use the physical Sense HAT, you can also use the [Sense HAT Emulator](https://www.raspberrypi.org/blog/sense-hat-emulator/) which comes with the Raspian O/S. You will use the sensors build into the Sense HAT to generate telemetry data as well as use the RGB LED matrix to display messages sent from your IoT solution. 

#### Laptop

- A laptop can be used to edit files in user friendly editors before transferring the files to the Raspberry Pi. Some labs can be completed using only a Raspberry Pi, but you will also need an HDMI-compatible monitor, mouse and keyboard.  
- A laptop can be used with Putty or Visual Studio Code and USB connection to connect to and debug the Azure IoT DevKit MxChip.
- Laptop will be used to connect to Azure Portal.

### SOFTWARE

For Azure IoT DevKit, the following software is recommended:
- [Visual Studio Code](https://code.visualstudio.com/)
- [Arduino](https://www.arduino.cc/en/Main/OldSoftwareReleases#previous) Use version 1.86 as 1.87 is currently not compatible
- [Azure IoT Tools](https://marketplace.visualstudio.com/items?itemName=vsciot-vscode.azure-iot-tools)
- [Azure IoT Edge](https://marketplace.visualstudio.com/items?itemName=vsciot-vscode.azure-iot-edge)
- [Python Extension](https://marketplace.visualstudio.com/items?itemName=ms-python.python)
- [PuTTY](http://www.chiark.greenend.org.uk/~sgtatham/putty/latest.html) or another SSH client. You may use PuTTY to connect to Azure IoT DevKit to configure wifi and IoT connection

For Raspberry Pi, the following software is recommended:
- [PuTTY](http://www.chiark.greenend.org.uk/~sgtatham/putty/latest.html) or another SSH client. You will use PuTTY to SSH from your laptop into your Raspberry Pi
- If you are using the Sense HAT Emulator (vs the physical device) and are emulating in from a laptop, you'll need to install VNC viewer on your laptop so that you can remotely view your Raspbian desktop. Download and install RealVNC from (https://www.realvnc.com/download/viewer/)
- If using a Windows based system, install [device explorer](https://github.com/Azure/azure-iot-sdk-csharp/releases/download/2018-3-13/SetupDeviceExplorer.msi). If using a Mac or Linux system, install [iothub-explorer](https://github.com/azure/iothub-explorer). You will use these tools to view the telemetry coming in from your Raspberry Pi into the IoT Hub. iothub-explorer is a command line based version of the device explorer (which runs on Windows based systems only)


### Azure and Power BI Subscriptions 

- An Azure subscription with permissions to create Azure services.  You can use a free Azure account, but you will not be able to complete all paths of the lab.  The free account does not allow the creation of solution accelerators.  
- OPTIONAL: A corporate Azure subscription. This is required if you plan to use a preconfigured solution. You can use a corporate MSDN Azure subscription or a subscription from your company. 
- OPTIONAL A PowerBI account (same account as the corporate Azure account).
- A basic understanding of Python and Linux.

## Pre-workshop Setup (Steps must be completed before the Hands On Lab Workshop)

Follow the instructions [here](/HOL/IOTHubPiHackathon/Prep) before you arrive on-site for the hands-on-lab workshop. 

## Hands on Workshop Steps

The following subsections of the Hands on Labs are as follows: 

### Morning

 * [1A - Hands on Lab Setup - Raspberry PI](/HOL/IOTHubPiHackathon/1A) <BR>
    **OR**<br>
 * [1B - Hands on Lab Setup - MXChip IoT DevKit](/HOL/IOTHubPiHackathon/1B)

 * 2 - Provision **ONE** of the following:<br>
   * a) [A Remote Monitoring Solution Accelerator](/HOL/IOTHubPiHackathon/2) <BR>
   **OR**<br>
   * b) [An IoT Hub](/HOL/IOTHubPiHackathon/2b)<br>

 * [3 - Connect IoT Device or Simulator to Azure IoT](/HOL/IOTHubPiHackathon/3)

### Afternoon

 * 4 - Route your IoT data using Stream Analytics to one (or both) of the following:<br>
   * a) [Power BI](/HOL/IOTHubPiHackathon/StreamAnalytics)<BR>
   **OR**
   * b) [Blob Storage](/HOL/IOTHubPiHackathon/BlobStorage)

 * [5 - Azure Functions](/HOL/IOTHubPiHackathon/AzureFunction)
 
 * [6 - Lab Clean-up](/HOL/IOTHubPiHackathon/Cleanup)

## Resources

[IoT Fundamentals](https://docs.microsoft.com/en-us/azure/iot-fundamentals/)
