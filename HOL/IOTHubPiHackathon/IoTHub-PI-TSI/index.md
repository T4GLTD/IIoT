# Introduction to Azure IoT Hub

![IoT Hub](/HOL/IOTHubPiHackathon/images/iothub.jpg)

Azure IoT Hub is a fully managed service that enables reliable and secure bidirectional communications between millions of IoT devices and a solution back end. Azure IoT Hub:

* Provides multiple device-to-cloud and 
* cloud-to-device communication options. These options include one-way messaging, file transfer, and request-reply methods.
* Provides built-in declarative message routing to other Azure services.
* Provides a queryable store for device metadata and synchronized state information.
* Enables secure communications and access control using per-device security keys or X.509 certificates.
* Provides extensive monitoring for device connectivity and device identity management events.
* Includes device libraries for the most popular languages and platforms.

## IoTHub: Connect, monitor, and manage billions of IoT assets

* **Establish** bi-directional communication with billions of IoT devices
* **Authenticate** per device for security-enhanced IoT solutions
* **Register** devices at scale with IoT Hub Device Provisioning Service
* **Manage** your IoT devices at scale with device management
* **Extend** the power of the cloud to your edge device

[![Azure IoT Hub](/HOL/IOTHubPiHackathon/images/iothubvideo.PNG)](https://channel9.msdn.com/Shows/Azure-Friday/Azure-IoT-Hub/player)


### In this lab you will

* Learn to Create IoT Hub

* Learn to use a Raspberry PI Simulator to connect to IoT Hub and send Data

* Learn to setup Time Series Insights (TSI) to visualize data coming into the IoT Hub

## 1. Create Resource Group

The infrastructure for your application is typically made up of many components – maybe a virtual machine, storage account, and virtual network, or a web app, database, database server, and 3rd party services. 

You do not see these components as separate entities, instead you see them as related and interdependent parts of a single entity. You want to deploy, manage, and monitor them as a group. Azure Resource Manager enables you to work with the resources in your solution as a group. You can deploy, update, or delete all the resources for your solution in a single, coordinated operation. 

You use a template for deployment and that template can work for different environments such as testing, staging, and production. Resource Manager provides security, auditing, and tagging features to help you manage your resources after deployment. 

Create a resource group to collect and manage all your application resources for this lab

![Resource Group](/HOL/IOTHubPiHackathon/images/01_Create_Resource_Group.png)

Click on **+ Add** button

![Add Resource Group](/HOL/IOTHubPiHackathon/images/02_Create_Resource_Group_Create.png)

Enter **Resource group name**,  Select **subscription** and **region**

Note: Since this is in a large group lab environment, you should use your initials in your resource group (and generally for all of your other Azure resources if you are in a lab environment) to ensure your Azure resource names are unique

E.g. AAAIoTRG if your initials are AAA.

Also, make note of whatever Region you choose (e.g. West US, Canada Central etc) and use this same region for all resources you create for your labs.

![Create Submit](/HOL/IOTHubPiHackathon/images/03_Create_Resource_Group_Submit.png)
2. Create IoT Hub

Create an IoT Hub to connect your real device or simulator to this IoTHub and start sending data.

Click on **Create a resource** and click on **Internet of Things**

![Create IoTHub](/HOL/IOTHubPiHackathon/images/iot.png)

Click on **IoT Hub**

![Create IoTHub](/HOL/IOTHubPiHackathon/images/04_Create_IoTHub.png)

Make sure you select the resource group you created in previous step. 

In the Name field, enter a unique name for your IoT hub. The name of your IoT hub must be **unique** across all IoT hubs.

In the Tier filed, select **S1 tier**.

You can choose from several tiers depending on how many features you want and how many messages you send through your solution per day. The free tier is intended for testing and evaluation. It allows 500 devices to be connected to the IoT hub and up to 8,000 messages per day. Each Azure subscription can create one IoT Hub in the free tier.

The **S1** tier allows total of 400,000 messages per unit per day.

For details about the other tier options, see [Choosing the right IoT Hub tier](https://azure.microsoft.com/en-us/pricing/details/iot-hub/).

![Create IoTHub](/HOL/IOTHubPiHackathon/images/05_Create_IoTHub_Submit_2.png)

## 3. Create Consumer Groups

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

## 4. Connect PI Simulator to IoT Hub

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

![Resource Group](/HOL/IOTHubPiHackathon/images/connection-string.png)

Click on the link below to go to the PI Simulator 
* You may wish to right-click and open in a new tab or browser window

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
