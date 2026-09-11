#!/bin/bash
set -e
RESOURCE_GROUP_NAME="rg-petcore"
APP_SERVICE_PLAN="plan-petcore"
WEBAPP_NAME="petcore-rm564555"
RUNTIME="JAVA:17-java17"
az webapp create \
  --resource-group "$RESOURCE_GROUP_NAME" \
  --plan "$APP_SERVICE_PLAN" \
  --name "$WEBAPP_NAME" \
  --runtime "$RUNTIME"
