Install-Module Microsoft.Graph -Force -Scope CurrentUser

$secureSecret = ConvertTo-SecureString $env:CLIENT_SECRET -AsPlainText -Force
Connect-MgGraph -ClientId $env:CLIENT_ID -TenantId $env:TENANT_ID -ClientSecret $secureSecret
Select-MgProfile -Name "beta"

$body = @{
    "@odata.type" = "#microsoft.graph.windows10EndpointProtectionConfiguration"
    displayName = "Windows Defender Policy"
    description = "Created via PowerShell CI/CD"
    firewallBlockStatefulFTP = $true
    defenderScanScheduleType = "fullScan"
}

Invoke-MgGraphRequest -Method POST -Uri "https://graph.microsoft.com/beta/deviceManagement/deviceConfigurations" -Body ($body | ConvertTo-Json -Depth 10)
