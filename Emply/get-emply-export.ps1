param(
    [string]$baseUrl = "https://api.emply.com/v1",
    [string]$customer = "nis",
    [string]$exportId = "839b99f9-3029-463d-9ee3-c12311de6a54", # Id of the Export in Emply (Integrations -> API -> Exports)
    [string]$apiKey = "",
    [int]$timeAgoInMins = 12
)

function Convert-TimetoISO8601 {
    param (
        [DateTime]$EndDate
    )

    # Set the end date to the current time
    $currentTime = Get-Date $EndDate -Format "yyyy-MM-ddTHH:mm:ss"

    # Calculate the start date as 10 minutes before the end date
    $startTime = Get-Date $EndDate.AddMinutes(-$timeAgoInMins) -Format "yyyy-MM-ddTHH:mm:ss"

    return @{ from=$startTime; to=$currentTime }
}
function Get-EmplyExports {
    param (
        [string]$CustomerId,
        [string]$ExportId,
        [string]$ApiKey
    )

    # Get the current time
    $currentDateTime = Get-Date

    # Convert dates
    $dates = Convert-TimetoISO8601 -EndDate $currentDateTime
    $fromDate = ($dates.from).replace(".", ":")
    $toDate = ($dates.to).replace(".", ":")

    # Define the base URL for the API
    $baseUrl = "https://api.emply.com/v1"

    # Construct the full URL for the request with query parameters
    $requestUrl = "{0}/{1}/exports/{2}?from={3}&to={4}&apiKey={5}" -f $baseUrl, $CustomerId, $ExportId, [uri]::EscapeDataString($fromDate), [uri]::EscapeDataString($toDate), $ApiKey

    # Set up the headers for the request
    $headers = @{
        "Accept" = "application/json"
    }

    # Send the GET request to the API
    try {
        $response = Invoke-RestMethod -Uri $requestUrl -Method Get -Headers $headers

        # Output the response
        return $response | ConvertTo-Json -Depth 4
    }
    catch {
        # Output any errors that occur
        Write-Error $_.Exception.Message
        Write-Output "Request URL: $requestUrl"
    }
}
function Get-EmplyExportEntity {
    param(
        [string]$CustomerId,
        [string]$ExportId,
        [string]$EntityId,
        [string]$ApiKey
    )

    # Define the base URL for the API
    $baseUrl = "https://api.emply.com/v1"

    # Construct the full URL for the request with query parameters
    $requestUrl = "{0}/{1}/exports/{2}/entities/{3}?apiKey={4}" -f $baseUrl, $CustomerId, $ExportId, $EntityId, $ApiKey

    # Set up the headers for the request
    $headers = @{
        "Accept" = "application/json"
    }

    # Send the GET request to the API
    try {
        $response = Invoke-RestMethod -Uri $requestUrl -Method Get -Headers $headers

        # Output the response
        return $response | ConvertTo-Json -Depth 4
    }
    catch {
        # Output any errors that occur
        Write-Error $_.Exception.Message
        Write-Output "Request URL: $requestUrl"
    }
}

$responseObject = Get-EmplyExports -CustomerId $customer -ExportId $exportId -ApiKey $apiKey | ConvertFrom-Json

foreach ($item in $responseObject) {
    $response = Get-EmplyExportEntity -baseUrl $baseUrl -customer $customer -exportId $exportId -entityId $item.id -apiKey $apiKey
    $response
}