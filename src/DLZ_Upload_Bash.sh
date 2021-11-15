#!/bin/bash
# -----=====-----=====-----=====-----=====-----=====-----=====
# Uploads a single file from a local file store to an Adobe 
# Experience Platform Data Landing Zone
#
# Author:     Jeff Lewis (jeflewis@adobe.com)
# Created On: 2021-11-12
# -----=====-----=====-----=====-----=====-----=====-----=====

# Set Azure Blob-related settings
DATE_NOW=$(date -Ru | sed 's/\+0000/GMT/')
AZ_VERSION="2018-03-28"
AZ_BLOB_URL="<URL TO BLOB ACCOUNT>"
AZ_BLOB_CONTAINER="<BLOB CONTAINER NAME>"
AZ_BLOB_TARGET="${AZ_BLOB_URL}/${AZ_BLOB_CONTAINER}"
AZ_SAS_TOKEN="<SAS TOKEN, STARTING WITH ? AND ENDING WITH %3D>"

# Path to the file we wish to upload
FILE_PATH="</PATH/TO/FILE>"
FILE_NAME=$(basename "$FILE_PATH")

# Execute HTTP PUT to upload file (remove '-v' flag to suppress verbose output)
curl -v -X PUT \
	-H "Content-Type: application/octet-stream" \
	-H "x-ms-date: ${DATE_NOW}" \
	-H "x-ms-version: ${AZ_VERSION}" \
	-H "x-ms-blob-type: BlockBlob" \
	--data-binary "@${FILE_PATH}" "${AZ_BLOB_TARGET}/${FILE_NAME}${AZ_SAS_TOKEN}"
