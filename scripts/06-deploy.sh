#!/bin/bash
set -e
RESOURCE_GROUP_NAME="rg-petcore"
WEBAPP_NAME="petcore-rm564555"
JAR_PATH="target/challenge_petcore-0.0.1-SNAPSHOT.jar"
chmod +x mvnw
./mvnw clean package -DskipTests
az webapp deploy \
  --resource-group "$RESOURCE_GROUP_NAME" \
  --name "$WEBAPP_NAME" \
  --src-path "$JAR_PATH" \
  --type jar
