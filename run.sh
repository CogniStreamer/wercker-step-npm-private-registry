#!/bin/bash

if [ -z "$WERCKER_NPM_PRIVATE_REGISTRY_HOST" ]; then
	fail "Please provide a private registry host"
fi

if [[ $WERCKER_NPM_PRIVATE_REGISTRY_HOST == http* ]]; then
	echo "Registry starts with http"

	REGISTRY=$WERCKER_NPM_PRIVATE_REGISTRY_HOST
	npm set registry $REGISTRY
else
	REGISTRY=http://$WERCKER_NPM_PRIVATE_REGISTRY_HOST
	
	echo $REGISTRY
	
	npm set registry $REGISTRY
fi

if [ -n "$WERCKER_NPM_PRIVATE_REGISTRY_USERNAME" ] && [ -n "$WERCKER_NPM_PRIVATE_REGISTRY_PASSWORD" ] && [ -z "$WERCKER_NPM_PRIVATE_REGISTRY_EMAIL" ]; then

echo "Add user with username $WERCKER_NPM_REGISTRY_USERNAME"

npm adduser --registry $REGISTRY <<EOF
$WERCKER_NPM_REGISTRY_USERNAME
$WERCKER_NPM_REGISTRY_PASSWORD
$WERCKER_NPM_REGISTRY_EMAIL
EOF
fi