$tenantId     = $env:TENANT_ID
$clientId     = $env:CLIENT_ID
$clientSecret = $env:CLIENT_SECRET

$authUri = "https://login.microsoftonline.com/$tenantId/oauth2/v2.0/token"
$authBody = @{
  client_id     = $clientId
  scope         = "https://graph.microsoft.com/.default"
  client_secret = $clientSecret
  grant_type    = "client_credentials"
}
$authResponse = Invoke-RestMethod -Method POST -Uri $authUri -Body $authBody -ContentType "application/x-www-form-urlencoded"
$token = $authResponse.access_token
$headers = @{ Authorization = "Bearer $token" }

$response = Invoke-RestMethod -Uri "https://graph.microsoft.com/beta/deviceManagement/deviceConfigurations" -Headers $headers -Method GET

$response.value | ConvertTo-Json -Depth 10 | Out-File "dev-policy.json"
