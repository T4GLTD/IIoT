# Advanced Lab 1 - Simulated Temperature Sensor

In the Azure Marketplace, install the Simulated Temperature Sensor to IoT Edge Device.

## Prerequisites: 

1. Setup of IoT Edge Device (VM or Raspberry PI) 
1. Successful registration to IoT Hub.
1. Setup of Azure Container Registry

Follow the instructions to setup.
[Microsoft Edge Simulated Temperature Sensor](https://azuremarketplace.microsoft.com/en-us/marketplace/apps/microsoft.edge-simulated-temperature-sensor-ga?tab=Overview)

# Advanced Lab 2 - Send Messages via AMQP and MQTT

This tutorial will walk you through the steps to send messages via AMQP and MQTT. In the previous labs, we used HTTP/REST which is not ideal for IoT type scenarios as it will has high overhead, will have scale issues and generally isn't as fast.

## Raspberry Pi Configuration

1. Compiling requires more memory.  Increase the swap space to 500 MB.
   - Edit this file:  /etc/dphys-swapfile 
   - Change swap file sile to 500.  eg. CONF_SWAPSIZE=500
   - Stop the swapfile: /etc/init.d/dphys-swapfile stop
   - Start the swapfile: /etc/init.d/dphys-swapfile start
1. Clone the repository:  git clone --recursive https://github.com/Azure/azure-iot-sdk-python.git 
1. Compile by following these commands:

```
sudo apt-get update
sudo apt-get install -y git cmake build-essential curl libcurl4-openssl-dev libssl-dev uuid-dev
cmake --version 
cd azure-iot-sdk-python/build_all/linux
./setup.sh
./build.sh
```

4. Add connection string to the simple sample:

   - cd ../../device/samples 
   - sudo nano iothub_client_sample.py
   - add connection string <br>
   - python iothub_client_sample.py <br> <br>

Reference: https://github.com/Azure/azure-iot-sdk-python
