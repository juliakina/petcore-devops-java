#!/bin/bash
set -e
RESOURCE_GROUP_NAME="rg-petcore"
LOCATION="brazilsouth"
az group create --name "$RESOURCE_GROUP_NAME" --location "$LOCATION"
