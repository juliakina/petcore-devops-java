#!/bin/bash
set -e
RESOURCE_GROUP_NAME="rg-petcore"
WEBAPP_NAME="petcore-rm564555"
ORACLE_USERNAME="RM564555"
ORACLE_URL="jdbc:oracle:thin:@//oracle.fiap.com.br:1521/ORCL"
read -s -p "Senha Oracle: " ORACLE_PASSWORD
echo
az webapp config appsettings set \
  --name "$WEBAPP_NAME" \
  --resource-group "$RESOURCE_GROUP_NAME" \
  --settings \
  SPRING_DATASOURCE_USERNAME="$ORACLE_USERNAME" \
  SPRING_DATASOURCE_PASSWORD="$ORACLE_PASSWORD" \
  SPRING_DATASOURCE_URL="$ORACLE_URL"
unset ORACLE_PASSWORD
