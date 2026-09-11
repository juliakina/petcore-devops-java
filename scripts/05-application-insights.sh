#!/bin/bash
set -e
RESOURCE_GROUP_NAME="rg-petcore"
APP_INSIGHTS_NAME="ai-petcore"
LOCATION="brazilsouth"
az extension add --name application-insights --upgrade
az provider register --namespace Microsoft.Insights
az provider register --namespace Microsoft.OperationalInsights
az monitor app-insights component create \
  --app "$APP_INSIGHTS_NAME" \
  --location "$LOCATION" \
  --resource-group "$RESOURCE_GROUP_NAME" \
  --application-type web
