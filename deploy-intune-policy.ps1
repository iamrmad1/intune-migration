# Load required module
Import-Module Microsoft.Graph

# Create a credential object using Microsoft.Identity.Client (MSAL)
$clientId = $env:CLIENT_ID
$tenantId = $env:TENANT_ID
$clientSecret = $env:CLIENT_SECRET

# Authenticate using app credentials
Connect-MgGraph -ClientId $clientId -TenantId $tenantId -ClientSecret $clientSecret
Select-MgProfile -Name "beta"

$body = @{
    "@odata.type" = "#microsoft.graph.windows10EndpointProtectionConfiguration"
    displayName = "Windows Defender Policy"
    description = "Created via PowerShell CI/CD"
    firewallBlockStatefulFTP = $true
    defenderScanScheduleType = "fullScan"
}

Invoke-MgGraphRequest -Method POST -Uri "https://graph.microsoft.com/beta/deviceManagement/deviceConfigurations" -Body ($body | ConvertTo-Json -Depth 10)
