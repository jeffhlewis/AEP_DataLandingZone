<#
.Synopsis
   Copy a file from Azure Blob Storage to AEP Data Landing Zone
.DESCRIPTION
   Copies a single file from an Azure Blob Store to an Adobe Experience Platform Data Landing Zone
.Prerequisites
	Ensure that the Az module is installed and that you're using PowerShell 7.1.3+
	Command to install Az module: 
		Install-Module -Name Az -Scope CurrentUser -Repository PSGallery -Force
.Author
    Jeff Lewis (jeflewis@adobe.com)
.CreatedOn
    2022-12-10
#>

# -----=====-----=====-----=====-----=====-----=====
# DLZ Container Settings
# -----=====-----=====-----=====-----=====-----=====
$destContainerName = "<DLZ CONTAINER NAME>"
$destAccountName   = "<DLZ ACCOUNT NAME>"
$destSasToken      = "<DLZ SAS TOKEN>"

# -----=====-----=====-----=====-----=====-----=====
# Source Blob Settings
# -----=====-----=====-----=====-----=====-----=====
$srcContainerName = "<SRC CONTAINER NAME>"
$srcAccountName   = "<SRC ACCOUNT NAME>"
$srcSasToken      = "<SRC SAS TOKEN>"
$fileName         = "<NAME OF FILE TO TRANSFER, WITH EXTENSION>"

# -----=====-----=====-----=====-----=====-----=====
# Generate Storage Context and Upload File
# -----=====-----=====-----=====-----=====-----=====
$srcContext  = New-AzStorageContext -SasToken $srcSasToken  -StorageAccountName $srcAccountName
$destContext = New-AzStorageContext -SasToken $destSasToken -StorageAccountName $destAccountName
$response    = Copy-AzStorageBlob -SrcContainer $srcContainerName -SrcBlob $fileName -Context $srcContext -DestContainer $destContainerName -DestBlob $fileName -DestContext $destContext