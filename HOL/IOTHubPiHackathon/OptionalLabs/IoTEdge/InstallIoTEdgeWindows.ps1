<# https://docs.microsoft.com/en-us/azure/iot-edge/quickstart

    This script will install IoT Edge runtime.  It currently works on Windows Insider Build October 2018 release or later.
    The aka.ms/iotedge-win alias is a reference to https://github.com/Azure/iotedge/blob/master/scripts/windows/setup/IotEdgeSecurityDaemon.ps1

    This step requires connection string from IOT Hub Device. 
    The connection string can be acquired by running commands in Azure Client Shell

    az iot hub device-identity create --device-id myEdgeDevice --hub-name {hub_name} --edge-enabled

    az iot hub device-identity show-connection-string --device-id myEdgeDevice --hub-name {hub_name}

    Note this command currently produces error
    Exception setting "OutputEncoding": "The handle is invalid.
    "
    At line:3 char:1
    + [Console]::OutputEncoding = New-Object -typename System.Text.ASCIIEnc ...
    + ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
        + CategoryInfo          : NotSpecified: (:) [], SetValueInvocationException
        + FullyQualifiedErrorId : ExceptionWhenSetting

    The Windows 10 host machine produces error

    The container host is on unsupported build version 17134.
    Please use a container host running one of the following build versions for running Windows containers:
    17763

    The prerequisites for installation of the IoT Edge Security daemon are not met. Please fix all known issues before rerunning this script.

    https://github.com/Azure/iotedge/issues/496
#>
. {Invoke-WebRequest -useb aka.ms/iotedge-win} | Invoke-Expression; `
Install-SecurityDaemon -Manual -ContainerOs Windows