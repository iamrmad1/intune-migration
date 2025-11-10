resource "msgraph_device_management_configuration_policy" "windows_defender_policy" {
  display_name = "Basic Windows Defender Policy"
  description  = "Simple configuration profile for Windows 10"
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
