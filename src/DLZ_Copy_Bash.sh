#!/bin/bash
# -----=====-----=====-----=====-----=====-----=====-----=====
# Copies a single file from an existing Azure Blob storage
# location to an Adobe Experience Platform Data Landing Zone
# using the "Put Blob from URL" operation.
#
# Note that the Content-Length header value of zero is
# required for this type of Blob Service REST API operation
#
# Author:     Jeff Lewis (jeflewis@adobe.com)
# Created On: 2022-12-10
# -----=====-----=====-----=====-----=====-----=====-----=====

# Set Azure Blob-related settings
DATE_NOW=$(date -Ru | sed 's/\+0000/GMT/')
AZ_VERSION="2021-08-06"
FILE_NAME="<NAME OF FILE TO TRANSFER, WITH EXTENSION>"
AZ_BLOB_SRC_SAS_URL="https://<SOURCE ACCOUNT NAME>.blob.core.windows.net/<SOURCE CONTAINER NAME>/${FILE_NAME}?<SOURCE SAS TOKEN>"
AZ_BLOB_DEST_SAS_URL="https://<DEST ACCOUNT NAME>.blob.core.windows.net/<DEST CONTAINER NAME>/${FILE_NAME}?<DEST SAS TOKEN>"

# Execute HTTP PUT to copy file (remove '-v' flag to suppress verbose output)
curl -v -X PUT ${AZ_BLOB_DEST_SAS_URL} \
	-H "Content-Type: application/octet-stream" \
	-H "Content-Length: 0" \
	-H "x-ms-date: ${DATE_NOW}" \
	-H "x-ms-version: ${AZ_VERSION}" \
	-H "x-ms-blob-type: BlockBlob" \
	-H "x-ms-copy-source: ${AZ_BLOB_SRC_SAS_URL}"