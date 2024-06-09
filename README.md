# Microsoft Entra API-driven inbound provisioning
This project hosts resources and samples to help you get started with [Microsoft Entra API-driven inbound provisioning](https://learn.microsoft.com/azure/active-directory/app-provisioning/inbound-provisioning-api-concepts). With API-driven inbound provisioning, Microsoft Entra provisioning service now supports integration with any system of record. Customers and partners can use any automation tool of their choice to retrieve workforce data from the system of record and ingest it into Microsoft Entra ID and connected on-premises Active Directory domains.

## Content hierarchy
The project directories are organized by the integration platform / tool that you'd like to use for implementing your API client.

* [**LogicApps** directory](./LogicApps): Do you prefer using Azure LogicApps for your inbound provisioning integration? This sub-directory hosts a sample Logic Apps workflow (CSV2SCIMBulkUpload) to help you get started!
* [**Postman** directory](./Postman): Looking for a Postman collection to evaluate the inbound provisioning API? Your search ends here. This sub-directory has Postman request collection and environment files to help you get started!
* [**PowerShell** directory](./PowerShell): Are you a PowerShell scripting fan? This sub-directory has a sample CSV2SCIM PowerShell script that can read any CSV file and convert the contents to a SCIM bulk request payload that you can send to the inbound provisioning API endpoint.

## Start here
https://learn.microsoft.com/en-us/entra/identity/app-provisioning/inbound-provisioning-api-powershell