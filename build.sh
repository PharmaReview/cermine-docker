#!/bin/bash
set -e

source .env

docker build -t pharmareview/cermine:${CERMINE_VERSION} --build-arg CERMINE_VERSION=${CERMINE_VERSION} .
