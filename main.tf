resource "microsoft365wp_device_compliance_policy_windows10" "example" {
  display_name = "Windows 10 Compliance Policy"
  description  = "Ensure Defender and BitLocker are enabled"

  password_required = true
  password_minimum_length = 8

  defender_enabled = true
  bitlocker_enabled = true
}
