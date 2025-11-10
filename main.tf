resource "msgraph_device_management_configuration_policy" "defender_policy" {
  display_name = "Windows Defender Antivirus Policy"
  description  = "Basic Defender settings for Windows 10"
  platform     = "windows10"

  settings_catalog {
    settings = [
      {
        name       = "Allow AntiSpyware"
        category   = "Microsoft Defender Antivirus"
        value_type = "boolean"
        value      = true
      },
      {
        name       = "Turn on behavior monitoring"
        category   = "Microsoft Defender Antivirus"
        value_type = "boolean"
        value      = true
      }
    ]
  }

}
