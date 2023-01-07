#!/bin/bash
# -----=====-----=====-----=====-----=====-----=====-----=====
# Refreshes SAS token for Data Landing Zone, invalidating
# previous SAS tokens.
#
# The API response will contain new SAS credentials, and the
# AEP UI will also update the "view credentials" modal window
# with the updated credentials.
#
# Author:     Jeff Lewis (jeflewis@adobe.com)
# Created On: 2023-01-07
# -----=====-----=====-----=====-----=====-----=====-----=====

# API Settings
AEP_API_DLZ_SAS_REFRESH_URL="https://platform.adobe.io/data/foundation/connectors/landingzone/credentials?type=user_drop_zone&action=refresh"
ACCESS_TOKEN="<BEARER TOKEN>"
API_KEY="<AEP API CLIENT ID>"
IMS_ORG="<IMS ORG>"
SANDBOX_NAME="<NAME OF AEP SANDBOX>"

# Execute HTTP POST to refresh SAS credentials for DLZ (remove '-v' flag to suppress verbose output)
curl -v -X POST ${AEP_API_DLZ_SAS_REFRESH_URL} \
	-H "Authorization: Bearer ${ACCESS_TOKEN}" \
	-H "x-api-key: ${API_KEY}" \
	-H "x-gw-ims-org-id: ${IMS_ORG}" \
	-H "x-sandbox-name: ${SANDBOX_NAME}" \
	-H "Content-Type: application/json"
