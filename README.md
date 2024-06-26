# Microsoft Entra API-driven inbound provisioning
This project hosts resources and samples to help you get started with [Microsoft Entra API-driven inbound provisioning](https://learn.microsoft.com/azure/active-directory/app-provisioning/inbound-provisioning-api-concepts). With API-driven inbound provisioning, Microsoft Entra provisioning service now supports integration with any system of record. Customers and partners can use any automation tool of their choice to retrieve workforce data from the system of record and ingest it into Microsoft Entra ID and connected on-premises Active Directory domains.

## Content hierarchy
The project directories are organized by the integration platform / tool that you'd like to use for implementing your API client.

* [**LogicApps** directory](./LogicApps): Do you prefer using Azure LogicApps for your inbound provisioning integration? This sub-directory hosts a sample Logic Apps workflow (CSV2SCIMBulkUpload) to help you get started!
* [**Postman** directory](./Postman): Looking for a Postman collection to evaluate the inbound provisioning API? Your search ends here. This sub-directory has Postman request collection and environment files to help you get started!
* [**PowerShell** directory](./PowerShell): Are you a PowerShell scripting fan? This sub-directory has a sample CSV2SCIM PowerShell script that can read any CSV file and convert the contents to a SCIM bulk request payload that you can send to the inbound provisioning API endpoint.

## Start here
https://learn.microsoft.com/en-us/entra/identity/app-provisioning/inbound-provisioning-api-powershell

## Emply resources
https://help.emply.com/hc/en-us/articles/360055609472-Export-JSON-Package
https://help.emply.com/hc/en-us/articles/8879475145117-Create-export-file-JSON-Package

https://learn.microsoft.com/en-us/entra/identity/app-provisioning/inbound-provisioning-api-powershell
https://www.christianfrohn.dk/2024/04/18/modifying-the-attribute-mapping-in-api-driven-provisioning-to-on-premises-active-directory/
https://learn.microsoft.com/en-us/entra/identity/app-provisioning/inbound-provisioning-api-powershell#generate-bulk-request-with-custom-scim-schema
https://learn.microsoft.com/en-us/entra/identity/app-provisioning/inbound-provisioning-api-faqs


https://identity-man.eu/2023/10/25/using-the-brand-new-entra-inbound-provisioning-api-for-identity-lifecycle-management/

## Provisioning App
### API-driven provisioning to Microsoft Entra ID
ObjectID = 08ee8014-f2fa-4d05-860e-d1188df0cfee

### Update the schema with the custom SCIM schema extension from the AttributeMapping.psd1 file
.\CSV2SCIM.ps1 -Path '.\emply-output.csv' -UpdateSchema -ServicePrincipalId "08ee8014-f2fa-4d05-860e-d1188df0cfee" -TenantId "NordicInsuranceSoftware.onmicrosoft.com" -ScimSchemaNamespace "urn:ietf:params:scim:schemas:extension:nis:1.0:User"
$AttributeMapping = Import-PowerShellDataFile '.\AttributeMapping.psd1'
.\CSV2SCIM.ps1 -Path '.\emply-output.csv' -AttributeMapping $AttributeMapping -ValidateAttributeMapping

### Get flat list (payload) of all csv fields under the custom SCIM schema namespace
.\CSV2SCIM.ps1 -Path '.\emply-output.csv' -AttributeMapping $AttributeMapping -ScimSchemaNamespace "urn:ietf:params:scim:schemas:extension:nis:1.0:User"  > BulkRequestPayloadWithCustomNamespace.json



install-module Microsoft.Graph.Reports -scope AllUsers -force
install-module Microsoft.Graph.Applications -scope AllUsers -force


 cd G:\Github\entra-id-inbound-provisioning
 
 $AttributeMapping = Import-PowerShellDataFile '.\AttributeMapping.psd1'
 .'.\CSV2SCIM.ps1' `
     -Path '.\emply-output.csv' `
     -ServicePrincipalId '08ee8014-f2fa-4d05-860e-d1188df0cfee' `
     -AttributeMapping $AttributeMapping `
     -Verbose


## Get Logs for Last Cycle 
$Logs = .'.\CSV2SCIM.ps1' `
    -ServicePrincipalId '08ee8014-f2fa-4d05-860e-d1188df0cfee' `
    -GetPreviousCycleLogs -NumberOfCycles 2 `
    -Verbose