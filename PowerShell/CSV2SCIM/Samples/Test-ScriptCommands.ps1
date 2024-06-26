# ## Test Update Schema
# .'.\src\CSV2SCIM.ps1' `
#     -Path '.\Samples\csv-with-1000-records.csv' `
#     -ServicePrincipalId '995aed29-05e3-4f1a-883e-f17b023d5c81' `
#     -ScimSchemaNamespace 'urn:ietf:params:scim:schemas:extension:csv:1.0:User' -UpdateSchema
# exit

# ## Validate Attribute Mapping
# $AttributeMapping = Import-PowerShellDataFile '.\Samples\AttributeMapping.psd1'
# .'.\src\CSV2SCIM.ps1' `
#     -Path '.\Samples\csv-with-1000-records.csv' `
#     -AttributeMapping $AttributeMapping -ValidateAttributeMapping
# exit

# ## Test Generation
# $AttributeMapping = Import-PowerShellDataFile '.\Samples\AttributeMapping.psd1'
# .'.\src\CSV2SCIM.ps1' `
#     -Path '.\Samples\csv-with-1000-records.csv' `
#     -AttributeMapping $AttributeMapping `
#     -ScimSchemaNamespace 'urn:ietf:params:scim:schemas:extension:csv:1.0:User'
# exit

# ## Test Generation and Send Request to Azure AD
# $AttributeMapping = Import-PowerShellDataFile '.\Samples\AttributeMapping.psd1'
# .'.\src\CSV2SCIM.ps1' `
#     -Path '.\Samples\csv-with-2-records.csv' `
#     -ServicePrincipalId '08ee8014-f2fa-4d05-860e-d1188df0cfee' `
#     -AttributeMapping $AttributeMapping `
#     -Verbose
# exit

# ## Test Generation and Send Request to Azure AD using Certificate
# $AttributeMapping = Import-PowerShellDataFile '.\Samples\AttributeMapping.psd1'
# .'.\src\CSV2SCIM.ps1' `
#     -Path '.\Samples\csv-with-2-records.csv' `
#     -AttributeMapping $AttributeMapping `
#     -ServicePrincipalId '08ee8014-f2fa-4d05-860e-d1188df0cfee' `
#     -ClientId '3762674d-470e-41db-9115-9f2914ccded4' -ClientCertificate (Get-ChildItem Cert:\CurrentUser\My\AF1C6C090CB75782711672DE47C55C45E407EC05) `
#     -Verbose
# exit

## Get Logs for Last Cycle 
$Logs = .'.\CSV2SCIM.ps1' `
    -ServicePrincipalId '08ee8014-f2fa-4d05-860e-d1188df0cfee' `
    -GetPreviousCycleLogs -NumberOfCycles 2 `
    -Verbose
exit
