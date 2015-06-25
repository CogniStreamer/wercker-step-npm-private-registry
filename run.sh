#!/bin/bash

if [ -z "$WERCKER_NPM_PRIVATE_REGISTRY_HOST" ]; then
	# Stop execution if the host is not provided
	fail "Please provide a private registry host"
fi

if [ -e "~/.npmrc" ]; then
	# Remove existing .npmrc file if it exists
	rm ~/.npmrc
fi

if [[ $WERCKER_NPM_PRIVATE_REGISTRY_HOST == http* ]]; then
	# If the host starts with http, use it as is
	REGISTRY=$WERCKER_NPM_PRIVATE_REGISTRY_HOST
	npm set registry $REGISTRY
else
	# Prepend the host with http:// if it was not set
	REGISTRY=http://$WERCKER_NPM_PRIVATE_REGISTRY_HOST
	npm set registry $REGISTRY
fi

if [ -n "$WERCKER_NPM_PRIVATE_REGISTRY_AUTH_TOKEN" ]; then
	# Append the token to the ~/.npmrc file
	
	# Remove http: or https:
	TEMP = ${REGISTRY#*:}
	
	# Remove trailing slash
	TEMP = ${TEMP%/}
	
	# Write the line to the ~/.npmrc file
	echo "$TEMP/:_authToken=\"$WERCKER_NPM_PRIVATE_REGISTRY_AUTH_TOKEN\"" >> ~/.npmrc
fi