# Displays logs from today, newest at the bottom.

Get-WinEvent -ea SilentlyContinue `
 -FilterHashtable @{ProviderName= "iotedged";
   LogName = "application"; StartTime = [datetime]::Today} |
 select TimeCreated, Message |
 sort-object @{Expression="TimeCreated";Descending=$false} |
 format-table -autosize -wrap