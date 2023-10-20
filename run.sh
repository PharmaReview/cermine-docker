#!/bin/bash
set -e

source .env

docker run \
    --rm \
    --name cermine \
    -p 8072:8080 \
    pharmareview/cermine:${CERMINE_VERSION} \
    $@
