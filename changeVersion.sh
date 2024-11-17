#!/bin/bash
OLD_VERSION=$(mvn help:evaluate -Dexpression=project.version -q -DforceStdout)
IFS='.' read -ra VERSION_PARTS <<< "$OLD_VERSION"
VERSION_PARTS[2]=$((VERSION_PARTS[2] + 1))
NEW_VERSION="${VERSION_PARTS[0]}.${VERSION_PARTS[1]}.${VERSION_PARTS[2]}"      
mvn versions:set -DnewVersion=$NEW_VERSION