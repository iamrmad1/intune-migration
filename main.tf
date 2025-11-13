resource "msgraph_resource" "oma_uri_profile" {
  url = "deviceManagement/deviceConfigurations"
  body = {
    "@odata.type" = "#microsoft.graph.windows10CustomConfiguration"
    displayName   = "Disable OneDrive Sync 2"
    description   = "Custom OMA-URI to disable OneDrive NGSC"

    omaSettings = [
      {
        "@odata.type" = "#microsoft.graph.omaSettingInteger"
        displayName   = "DisableFileSyncNGSC"
        omaUri        = "./Device/Vendor/MSFT/Policy/Config/OneDrive/DisableFileSyncNGSC"
        value         = 1
      }
    ]
  }

  response_export_values = {
    config_id = "id"
    all       = "@"
  }
}

output "config_id" {
  value = msgraph_resource.oma_uri_profile.output.config_id
}

output "resource_url" {
  value = msgraph_resource.oma_uri_profile.resource_url
}
