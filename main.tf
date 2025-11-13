data "msgraph_resource" "get_oma_uri_profile" {
  url = "deviceManagement/deviceConfigurations/55ea0269-239e-49e6-80ee-b61bf3cf0cb1"

  response_export_values = {
    all        = "@"
    display    = "displayName"
    profile_id = "id"
  }
}

output "retrieved_profile_name" {
  value = data.msgraph_resource.get_oma_uri_profile.output.display
}

output "retrieved_profile_id" {
  value = data.msgraph_resource.get_oma_uri_profile.output.profile_id
}

output "retrieved_profile_full" {
  value = data.msgraph_resource.get_oma_uri_profile.output.all
}
