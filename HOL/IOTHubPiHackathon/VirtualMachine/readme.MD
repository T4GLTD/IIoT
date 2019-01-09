# IoT Edge Virtual Machine

A Virtual Machine in Azure or on-premise can be setup with the IoT Edge runtime.

The scripts in this folder are part of installing on Linux x64-based Ubuntu 18.04 Virtual Machine in Azure.
https://docs.microsoft.com/en-us/azure/iot-edge/how-to-install-iot-edge-linux

## Configure IoT Hub Device 
Once the script has been run on the virtual machine, the following configuration should be setup:
1. Under IoT Hub - Automatic Device Management - Register new IoT Edge device in IoT Hub,
2. Specify Device Id: mylinuxvm1
3. Click Save
4. Click on device details and copy secondary connection string for step below

## Configure IoT Edge Device Connection

1. Execute in virtual machine shell or copy file using scp

```
sudo nano /etc/iotedge/config.yaml
```
Find the provisioning section of the file and uncomment the manual provisioning mode. Update the value of device_connection_string with the connection string from your IoT Edge device.

```
provisioning:
  source: "manual"
  device_connection_string: "<ADD DEVICE CONNECTION STRING HERE>"

# provisioning: 
#   source: "dps"
#   global_endpoint: "https://global.azure-devices-provisioning.net"
#   scope_id: "{scope_id}"
#   registration_id: "{registration_id}"
```

The script can be copied using the following command:
```
scp myuser@myvm:/etc/iotedge/config.yaml config.yaml
```

The file permissions should be verified if file is copied
```
chmod 400 /etc/iotedge/config.yaml
```

## Restart Service
Once config script is configured, restart the iotedge daemon
```
sudo systemctl restart iotedge
```

## Verify Logs
```
journalctl -u iotedge --no-pager --no-full
```
If the logs look similar to this, the IoT Edge Runtime was provisioned successfully

```
[INFO] - Pulling image mcr.microsoft.com/azureiotedge-agent:1.0...
[INFO] - Successfully pulled image mcr.microsoft.com/azureiotedge-agent:1.0
[INFO] - Creating module edgeAgent...
[INFO] - Successfully created module edgeAgent
[INFO] - Starting module edgeAgent...
[INFO] - Successfully started module edgeAgent
[INFO] - [work] - - - "POST /modules/%24edgeAgent/genid/636818855486202143… "-" pid(8998)
[INFO] - Querying system info...
[INFO] - Successfully queried system info
[INFO] - [mgmt] - - - "GET /systeminfo?api-version=2018-06-28 HTTP/1.1" 20… "-" pid(8998)
roo
```


If the IoT Edge Runtime is not provisioned, the following error will be shown in the logs:

```
[WARN] - Error in watchdog when checking for edge runtime status:
[WARN] - Edge runtime module has not been created in IoT Hub. Please make sure this device is an IoT Edge capable device.
```

Ensure that an IoT Edge Device has been created in IoT Hub (not an IoT Device).

## Detailed Debug Logging

https://docs.microsoft.com/en-us/azure/iot-edge/troubleshoot

## Check Status

```
sudo iotedge list
```

```
NAME             STATUS           DESCRIPTION      CONFIG
edgeAgent        running          Up 2 minutes     mcr.microsoft.com/azureiotedge-agent:1.0
```