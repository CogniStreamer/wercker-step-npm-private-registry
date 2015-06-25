#!/bin/bash

if [ -z "$WERCKER_NPM_REGISTRY_HOST" ]; then
	if [ $WERCKER_NPM_REGISTRY_HOST === http*]; then
		REGISTRY=$WERCKER_NPM_REGISTRY_HOST
		npm set registry $REGISTRY
	else
		REGISTRY=http://$WERCKER_NPM_REGISTRY_HOST
		npm set registry $REGISTRY
	fi
fi

if [ -z "$WERCKER_NPM_REGISTRY_USERNAME" ]; then
	fail "Please provide a username"
fi

if [ -z "$WERCKER_NPM_REGISTRY_PASSWORD" ]; then
	fail "Please provide a password"
fi

if [ -z "$WERCKER_NPM_REGISTRY_EMAIL" ]; then
	fail "Please provide an email address"
fi

if [ -z "$REGISTRY" ]; then
npm adduser <<EOF
$WERCKER_NPM_REGISTRY_USERNAME
$WERCKER_NPM_REGISTRY_PASSWORD
$WERCKER_NPM_REGISTRY_EMAIL
EOF
else
npm adduser --registry $REGISTRY <<EOF
$WERCKER_NPM_REGISTRY_USERNAME
$WERCKER_NPM_REGISTRY_PASSWORD
$WERCKER_NPM_REGISTRY_EMAIL
EOF
fi