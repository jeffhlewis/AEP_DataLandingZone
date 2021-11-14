<#
.Synopsis
   Upload a file to AEP Data Landing Zone 
.DESCRIPTION
   Uploads a single file from a local file store to an Adobe Experience Platform Data Landing Zone
.Prerequisites
	Ensure that the Az module is installed and that you're using PowerShell 7.1.3+
	Command to install Az module: 
		Install-Module -Name Az -Scope CurrentUser -Repository PSGallery -Force
.Author
    Jeff Lewis (jeflewis@adobe.com)
.CreatedOn
    2021-11-12
#>

# -----=====-----=====-----=====-----=====-----=====
# DLZ Container Settings
# -----=====-----=====-----=====-----=====-----=====
$containerName = "<DLZ CONTAINER NAME>"
$accountName   = "<DLZ ACCOUNT NAME>"
$sasURI        = "<DLZ SAS URI>"
$sasToken      = "<DLZ SAS TOKEN>"

# -----=====-----=====-----=====-----=====-----=====
# File and Path Settings
# -----=====-----=====-----=====-----=====-----=====
$srcFilePath   = "<FULL PATH TO FILE>"
$srcFileName   = Split-path $srcFilePath -leaf

# -----=====-----=====-----=====-----=====-----=====
# Generate Storage Context and Upload File
# -----=====-----=====-----=====-----=====-----=====
$clientContext = New-AzStorageContext -SasToken $sasToken -StorageAccountName $accountName
$response      = Set-AzStorageBlobContent -File $srcFilePath -Container $containerName -Blob $srcFileName -Force -Context $clientContext