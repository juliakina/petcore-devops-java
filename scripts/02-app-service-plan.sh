#!/bin/bash
set -e
RESOURCE_GROUP_NAME="rg-petcore"
APP_SERVICE_PLAN="plan-petcore"
LOCATION="brazilsouth"
az appservice plan create \
  --name "$APP_SERVICE_PLAN" \
  --resource-group "$RESOURCE_GROUP_NAME" \
  --location "$LOCATION" \
  --sku F1 \
  --is-linux
