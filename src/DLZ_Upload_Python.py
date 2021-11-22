# -----=====-----=====-----=====-----=====-----=====-----=====
# Uploads a single file from a local file store to an 
# Adobe Experience Platform Data Landing Zone using
# Python and the Azure Python v12 SDK.
# 
# Author:     Jeff Lewis (jeflewis@adobe.com)
# Created On: 2021-11-23
# -----=====-----=====-----=====-----=====-----=====-----=====

import os
from azure.storage.blob import ContainerClient

try:
    # Set Azure Blob-related settings
    sasUri = "<SAS URI>"
    srcFilePath = "<FULL PATH TO FILE>" 
    srcFileName = os.path.basename(srcFilePath)

    # Connect to container using SAS URI
    containerClient = ContainerClient.from_container_url(sasUri)

    # Upload file to Data Landing Zone with overwrite enabled
    with open(srcFilePath, "rb") as fileToUpload:
        containerClient.upload_blob(srcFileName, fileToUpload, overwrite=True)

except Exception as ex:
    print("Exception: " + ex.strerror)