@{
    externalId   = 'WorkerID'
    name         = @{
        familyName = 'LastName'
        givenName  = 'FirstName'
    }
    active       = { $_.'WorkerStatus' -eq 'Active' }
    userName     = 'UserID'
    displayName  = 'FullName'
    nickName     = 'UserID'
    userType     = 'WorkerType'
    title        = 'JobTitle'
    addresses    = @(
        @{
            type          = { 'work' }
            streetAddress = 'StreetAddress'
            locality      = 'City'
            postalCode    = 'ZipCode'
            country       = 'CountryCode'
        }
    )
    phoneNumbers = @(
        @{
            type  = { 'mobile' }
            value = 'PrivatePhone'
        }
    )
    "urn:ietf:params:scim:schemas:extension:enterprise:2.0:User" = @{
        organization   = 'Company'
        department     = 'Department'
        manager        = @{
            value = 'ManagerID'
        }
    }
}