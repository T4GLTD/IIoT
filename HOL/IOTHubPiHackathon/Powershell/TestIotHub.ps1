<# 
Install-Module -Name AzureIoT -Scope CurrentUser
#>

$iotconnectionstring = Read-Host -Prompt "IoT Secondary Connection String"
$iothubname = Read-Host -Prompt "Iot Hub Name"
$iothuburi = "${iothubname}.azure-devices.net" 
$deviceId = "powershell"

#To Operate the Device Side of the IoT Hub
#region RegisterDevice
$deviceParams = @{
    iotConnString = $iotconnectionstring
    deviceId = $deviceId

}
$device = Register-IoTDevice @deviceParams
$device = Get-IotDeviceKey -deviceId $deviceId -iotConnString $iotconnectionstring
#endregion

#region Create a DeviceClient
$deviceClientParams = @{
    deviceId = $device.DeviceId
    deviceKey = $device.DevicePrimaryKey
    iotHubUri = $iothuburi
}
$deviceClient = Get-IoTDeviceClient @deviceClientParams 
$deviceClient
#endregion

# sample payload


$payload = @{
    DeviceId= $deviceId 
    ExternalTemperature= 0 
    Humidity= 7.42866516113 
    Temperature= 37.8324356079 
    pitch= "2.14371527549" 
    roll= "301.881776918" 
    yaw= "160.873863408"
}

$json = $payload  | ConvertTo-Json
#region send message from device
$deviceMessageParams = @{
    deviceClient = $deviceClient
    messageString = $json 
}
Send-IoTDeviceMessage @deviceMessageParams
#endregion

<#
#region Receive message from cloud
$message = Receive-IoTCloudMessage -deviceClient $deviceClient
$message 
$message[1] 
#endregion

#To operate the Cloud site of the IoT hub:
#region Create a CloudClient
$CloudClientParams = @{
    iotConnString = $iotconnectionstring
}
$cloudClient = Get-IoTCloudClient @CloudClientParams 
$cloudClient    00:01:00         Microsoft.Azure.Devices.IotHubConnection            
#endregion

#region send message from Cloud
$cloudMessageParams = @{
    deviceId =  $device.DeviceId
    messageString =  $json 
    cloudClient = $cloudClient
}
Send-IoTCloudMessage @cloudMessageParams
#endregion

#region Receive message from Device
$message = Receive-IoTDeviceMessage -iotConnString "HostName=myIoTHub.azure-devices.net;SharedAccessKeyName=iothubowner;SharedAccessKey=HwbsdfsfsdfsdgsdgdfmbHh7w1QM2KvRE="
#endregion

#>