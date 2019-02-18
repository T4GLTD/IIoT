## Create Consumer Groups

Consumer groups are a key element in Azure event ingestion services that allow consuming applications with a separate view of the event stream. Each consuming application can use the groups to read the streaming data independently at their own pace and with their own offet. These consumer groups will be created in advance but will be used later in this lab.

1. Open the [Azure Portal](https://portal.azure.com/) tab and navigate to your IoT Hub service that you provisioned above
  - Click the *resource group* icon -> click the name of the resource group you created above -> click the IoT Hub service
      <p align="center">
         <img src="/HOL/IOTHubPiHackathon/images/ResourceGroupForIoTHub.JPG" /> 
      </p>

2. Under the "Settings" subsection, select "Built-In endpoints"
3. Find the "Events" endpoint
4. In the settings page that appears below "Events", add the following consumer groups in the "Create new consumer group" text box.  If mulitple people are using the same IoT Hub, append your initials to the consumer group name so that each user gets their own groups.
  - "deviceexplorer"
  - "asa"
  - "tsi"
      <p align="center">
         <img src="/HOL/IOTHubPiHackathon/images/consumerGroups.jpg" /> 
      </p>
3. Click "Save"

## Connect PI Simulator to IoT Hub

![Resource Group](/HOL/IOTHubPiHackathon/images/pi_simulator.png)

Connect a Simulator to your IoT Hub and stream data. 


### In this lab you will

* Learn to create a device using Azure Portal

* Connect the simulator to IoT Hub

* Send telemetry data to Azure

## Create a Device

Go To your IoT Hub in the portal and click on **IoT Devices**


![Resource Group](/HOL/IOTHubPiHackathon/images/iot_devices.png)

Click on **+ Add** and enter a **Device ID** and click **Save**. 

![Resource Group](/HOL/IOTHubPiHackathon/images/add_device.png)

Click on the device and copy the primary key connection string. 

![Resource Group](/HOL/IOTHubPiHackathonimages/connection-string.png)

Click on the link below to go to the PI Simulator 

[PI Simulator](https://azure-samples.github.io/raspberry-pi-web-simulator/#GetStarted)

Replace the connection string with the primary key connection string copied in the previous steps

![Resource Group](/HOL/IOTHubPiHackathon/images/pi_connection_string_before.png)

After you copy the connection string should look like below

![Resource Group](/HOL/IOTHubPiHackathon/images/pi_connection_string_after.png)

Click Run and start sending messages. LED will start blinking

![Resource Group](/HOL/IOTHubPiHackathon/images/images/pi_message.png)

Messages will start flowing into IoT Hub

![Resource Group](/HOL/IOTHubPiHackathon/images/iothub_messages.png)

>**You will work with Labs in the Next Module to Visualize the Data flowing into IoT Hub**
