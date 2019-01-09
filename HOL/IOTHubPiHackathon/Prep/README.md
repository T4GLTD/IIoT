## Pre-workshop Setup (Must be completed in advance of the HOL)

Please perform the following steps in advance of the Hands-on-labs otherwise you will spend a significant time during the workshop performing these steps.

### Azure Setup

Ensure that a trial, MSDN or Enterprise Azure subscription is available with access to create resources.

### IoT DevKit Setup

An IoT DevKit will be provided to attendees for those who do not have an IoT DevKit or Raspberry Pi.  This device will be connected to your Azure IoT Hub in your Azure subscription.

### Laptop Setup - IoT DevKit

For Azure IoT DevKit, the following software is recommended:
- [Visual Studio Code](https://code.visualstudio.com/)
- [Arduino v1.86](https://www.arduino.cc/en/Main/OldSoftwareReleases#previous) Use version 1.86 as 1.87 is currently not compatible
- [Azure IoT Tools](https://marketplace.visualstudio.com/items?itemName=vsciot-vscode.azure-iot-tools)
- [Azure IoT Edge](https://marketplace.visualstudio.com/items?itemName=vsciot-vscode.azure-iot-edge)
- [Python Extension](https://marketplace.visualstudio.com/items?itemName=ms-python.python)
- [PuTTY](http://www.chiark.greenend.org.uk/~sgtatham/putty/latest.html) or another SSH client. You may use PuTTY to connect to Azure IoT DevKit to configure wifi and IoT connection

### Raspberry Pi Setup (Optional)

If providing your own Raspberry Pi, you will need to walk through the following steps on your Raspberry Pi prior to the hands-on-lab. <BR>

1. Ensure your Raspberry Pi can boot [Raspian] (https://www.raspberrypi.org/downloads/) from the SD card. 
  - Follow the instructions to install the operating system: [NOOBS] (https://www.raspberrypi.org/downloads/noobs/) 
  - If you have a new microSD card that hasn't been formatted before, use [SDFormatter](https://www.sdcard.org/downloads/formatter_4/eula_windows/) to do a full format of the card.
  - Insert the microSD card into your Pi and connect the power supply. 
  - Click to install Raspbian
     <p align="center">
        <img src="/HOL/IOTHubPiHackathon/Prep/Images/NOOBS_Install.jpg" width="50%" height="50%"/>
      </p>
   - Confirm the deletion of content on the SD card and the installation of the OS. 
      <p align="center">
        <img src="/HOL/IOTHubPiHackathon/Prep/Images/ConfirmInstall.jpg" width="50%" height="50%"/>
      </p>
2. If you do not have the Sense HAT and will be using the Sense HAT Emulator, you will have to run through some extra steps to ensure that you access the Sense HAT Emulator graphically: 
  - First, run through the steps to ensure it's installed. Verify by checking under 'Programming' in the Raspian GUI.

      <p align="center">
        <img src="/HOL/IOTHubPiHackathon/Prep/Images/SenseHat.jpg"  width="50%" height="50%"/>
      </p>
      
   - Next, make sure that VNC is enabled. We will be using VNC so that a physical monitor will not be required for the labs. 
     - Select Menu -> Preferences -> Raspberry Pi Configuration -> Interfaces.
     
        <p align="center">
          <img src="/HOL/IOTHubPiHackathon/images/menu.jpg"  width="50%" height="50%"/>
        </p>
        
     - Ensure VNC is Enabled.
     
        <p align="center">
          <img src="/HOL/IOTHubPiHackathon/images/enableVNC.jpg"  width="50%" height="50%"/>
        </p>
         
3. Enable SSH on the Raspberry Pi. You will be SSH-ing to the Raspberry Pi to modify and execute scripts. 
  
  - In the menu, choose "Preferences", then "Raspberry Pi Configuration"
  - Enable SSH


### Laptop Setup - Raspberry Pi

The following steps will walk you through the installation of tools that you need to run on your laptop for this lab: 

1. Install [nodejs](https://nodejs.org/en/download/).  This is a prerequisite for iothub-explorer.
1. Install [iothub-explorer](https://github.com/azure/iothub-explorer).  This tool is used to view telemetry coming into the IoT Hub.
1. OPTIONAL if using a laptop, download and install [PuTTY](http://www.chiark.greenend.org.uk/~sgtatham/putty/latest.html). We will use PuTTY to SSH into the Raspberry Pi to perform various functions throughout the lab. 
1. OPTIONAL if using a laptop and the Sense HAT Emulator (vs the physical device), you'll need to install VNC viewer on your laptop so that you can remotely view your Raspbian desktop. Download and install RealVNC from (https://www.realvnc.com/download/viewer/)
1. Ensure your Azure subscription login is working and you have sufficient permissions to create resources.

