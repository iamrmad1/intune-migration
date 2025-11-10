resource "microsoft365wp_device_configuration_policy_windows10" "defender_policy" {
  display_name = "Windows Defender Antivirus Policy"
  description  = "Simple configuration profile for Windows 10"

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
