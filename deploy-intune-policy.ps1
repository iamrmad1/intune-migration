# -----------------------------
# Intune Configuration Profile Deployment via Graph API
# -----------------------------

# Load environment variables
$tenantId     = $env:TENANT_ID
$clientId     = $env:CLIENT_ID
$clientSecret = $env:CLIENT_SECRET

# Step 1: Get access token from Azure AD
$authUri = "https://login.microsoftonline.com/$tenantId/oauth2/v2.0/token"
$authBody = @{
    client_id     = $clientId
    scope         = "https://graph.microsoft.com/.default"
    client_secret = $clientSecret
    grant_type    = "client_credentials"
}

Write-Host "Authenticating with Azure AD..."
$authResponse = Invoke-RestMethod -Method POST -Uri $authUri -Body $authBody -ContentType "application/x-www-form-urlencoded"
$accessToken = $authResponse.access_token
Write-Host "Access token acquired."

# Step 2: Prepare headers for Graph API
$headers = @{
    Authorization = "Bearer $accessToken"
    "Content-Type" = "application/json"
}

# Step 3: Define Windows Defender configuration profile
$body = @{
    "@odata.type" = "#microsoft.graph.windows10EndpointProtectionConfiguration"
    displayName   = "Windows Defender Policy 2"
    description   = "Created via PowerShell and Graph API"
    defenderScanScheduleType         = "fullScan"
    defenderScanType                 = "quick"
    defenderRealTimeProtectionEnabled = $true
    defenderCloudProtection          = "high"
    firewallBlockStatefulFTP         = $true
}

$jsonBody = $body | ConvertTo-Json -Depth 10

# Step 4: Send request to Graph API
$uri = "https://graph.microsoft.com/beta/deviceManagement/deviceConfigurations"
Write-Host "Sending configuration profile to Intune..."
$response = Invoke-RestMethod -Method POST -Uri $uri -Headers $headers -Body $jsonBody

# Step 5: Output response
Write-Host "Policy created successfully:"
$response
