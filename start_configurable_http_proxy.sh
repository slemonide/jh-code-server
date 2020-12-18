#!/bin/sh

CONFIGPROXY_AUTH_TOKEN=$(openssl rand -hex 32)

echo $CONFIGPROXY_AUTH_TOKEN

mkdir -p ~/.local/share/

echo "CONFIGPROXY_AUTH_TOKEN=$CONFIGPROXY_AUTH_TOKEN" > ~/.local/share/chip-proxy

configurable-http-proxy --api-port 8001 $@
