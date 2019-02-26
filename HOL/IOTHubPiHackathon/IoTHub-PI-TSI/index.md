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

* **Subscription**: Choose your subscription
* **Resource group**: Type in a resource group name
  * Note: Since this is in a large group lab environment, you should use your initials in your resource group (and generally for all of your other Azure resources if you are in a lab environment) to ensure your Azure resource names are unique
  * E.g. AAAIoTrg if your initials are AAA (rg abbreviation for resource group)
* **Region**: Choose a region
  * Whatever Region you choose (e.g. West US, Canada Central etc) and use this same region for all resources you create for your labs.

![Create Submit](/HOL/IOTHubPiHackathon/images/03_Create_Resource_Group_Submit.png)

## 2. Create IoT Hub

Create an IoT Hub to connect your real device or simulator to this IoTHub and start sending data.

Click on **Create a resource** and click on **Internet of Things**

![Create IoTHub](/HOL/IOTHubPiHackathon/images/iot.png)

Click on **IoT Hub**

![Create IoTHub](/HOL/IOTHubPiHackathon/images/04_Create_IoTHub.png)

* **Subscription**: Choose your subscription
* **Resource group**: Select the resource group you created in previous steps
* **Region**: Choose the same region you used for your resource group
* **IoT Hub**: Choose a unique name for your IoT Hub (e.g. AAAIoTHub)
* Click **Next: Size and scale** button at bottom of screen

![Create IoTHub](/HOL/IOTHubPiHackathon/images/05_Create_IoTHub_Submit_2.png)

On the Size and Scale screen:

* **Pricing and Scale Tier**: Select **S1: Standard tier**
  * This will cost about $1 / day but will give you the functionality required for any of the labs
  * For details about the other tier options, see [Choosing the right IoT Hub tier](https://azure.microsoft.com/en-us/pricing/details/iot-hub/).

![Create IoTHub](/HOL/IOTHubPiHackathon/images/06_Create_IoTHub_Size_Scale.PNG)

* Click **Review + Create**
* Review information
* Click **Create**
* This will take 2-3 minutes

## 3. Create Consumer Groups

Consumer groups are a key element in Azure event ingestion services that allow consuming applications with a separate view of the event stream. Each consuming application can use the groups to read the streaming data independently at their own pace and with their own offset. These consumer groups will be created in advance but will be used later in this or other labs.

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
  - "timeseriesinsightsevents"
      <p align="center">
         <img src="/HOL/IOTHubPiHackathon/images/consumerGroups.PNG" /> 
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

![Resource Group](/HOL/IOTHubPiHackathon/images/pi_message.png)

Messages will start flowing into IoT Hub
Close your Device details window in the Azure portal
Click "Overview" on your IoT Hub to see some high level metrics and charts showing message activity

![Resource Group](/HOL/IOTHubPiHackathon/images/iothub_messages.png)


## 5. Create Azure Time Series Insights and Visualize Raspberry PI Device Data

![Time Series Insights](/HOL/IOTHubPiHackathon/images/timeseriesinsights.jpg)

## Create Time Series Insights

Azure Time Series Insights is a fully managed analytics, storage, and visualization service for managing IoT-scale time-series data in the cloud. It provides massively scalable time-series data storage and enables you to explore and analyze billions of events streaming in from all over the world in seconds. Use Time Series Insights to store and manage terabytes of time-series data, explore and visualize billions of events simultaneously, conduct root-cause analysis, and to compare multiple sites and assets.

Time Series Insights has four key jobs:

* First, it's fully integrated with cloud gateways like Azure IoT Hub and Azure Event Hubs. It easily connects to these event sources and parses JSON from messages and structures that have data in clean rows and columns. It joins metadata with telemetry and indexes your data in a columnar store.
* Second, Time Series Insights manages the storage of your data. To ensure data is always easily accessible, it stores your data in memory and SSD’s for up to 400 days. You can interactively query billions of events in seconds – on demand.
* Third, Time Series Insights provides out-of-the-box visualization via the TSI explorer. 
* Fourth, Time Series Insights provides a query service, both in the TSI explorer and by using APIs that are easy to integrate for embedding your time series data into custom applications.

<iframe src="https://channel9.msdn.com/Shows/Internet-of-Things-Show/Time-Series-Insight-for-IoT-apps/player" width="480" height="270" allowFullScreen frameBorder="0"></iframe>

In this lab you will learn

* How to set up a Time Series Insights (TSI) environment
* Explore
* Analyze time series data of your IoT solutions or connected things


Click on **Create a Resource** and click on **Internet of Things**

![Create Time Series Insights](/HOL/IOTHubPiHackathon/images/01_Create_Time_Series_Insights.png)

Click on **Time Series Insights**

![Create Time Series Insights](/HOL/IOTHubPiHackathon/images/tsi.png)

* **Environment Name**: Choose a unique name for your TSI environment (e.g. AAAIoTTSI)
* **Subscription**: Choose your subscription
* **Resource group**: Select the resource group you created in previous steps
* **Region**: Choose the same region you used for your resource group
* **Tier**: Choose S1
* Click **Next: Event Source*** at the bottom of the screen

Note: This TSI resource will cost roughly $5 / 24 hour period so ensure you delete it at the end of the day

![Create Time Series Insights Submit](/HOL/IOTHubPiHackathon/images/02_Create_Time_Series_Inisghts_Submit.png)

### Create Event Source

* **Name**: Choose a name for your TSI Event Source (does not need to be unique) (e.g. tsieventsource)
* **Source Type**: Choose **IoT Hub**
* **Select a hub**: Choose **Select existing**
* **Subscription**: Choose your subscription
* **IoT Hub name**: Select the IoT Hub you created in previous steps
* **IoT Hub access policy name**: Choose **iothubowner**
* **IoT Hub consumer group**: Choose **timeseriesinsightevents**
  * Note: This must match one of the consumer groups you created earlier in your IoT Hub
* Click **Review + Create*** at the bottom of the screen

<!--
![Create Event Source](/HOL/IOTHubPiHackathon/images/03_Create_Event_Source.png)
-->

![Create Event Source Submit](/HOL/IOTHubPiHackathon/images/03_Create_Event_Source_Submit.PNG)

* Review the information
* Click **Create*** at the bottom of the screen
* This will take 1-2 minutes to create

<--! Stopped here.  Need to generate screenshots for initial views of pi simulator -->

### Setup Time Series Insights
* Click "Resource groups" and then click on your lab resource group
* Click on the Time Series Insights environment resource

### Time Series Insights Explorer

Go To Time Series Insights Explorer

![Visualize Data](/HOL/IOTHubPiHackathon/images/05_GoTo_TSI_Explorer.png)

Update with screenshots that would make sense with just 1 device
* Change measures
  * Events
  * Temperature
  * Humidity
* View data in a table
