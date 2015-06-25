#!/bin/bash

if [ -z "$WERCKER_NPM_PRIVATE_REGISTRY_HOST" ]; then
	# Stop execution if the host is not provided
	fail "Please provide a private registry host"
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
	echo $WERCKER_NPM_PRIVATE_REGISTRY_AUTH_TOKEN >> ~/.npmrc
fi