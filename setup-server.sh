#!/bin/bash

rootdir=`pwd`
username="$USER"

# Nginx configuration
scheme="https"
hostname="taiga.projects.kaleidos.net"

pushd ~
mkdir -p logs
mkdir -p conf
popd

# Bootstrap
source ./scripts/common.sh

# Setup and install services dependencies
source ./scripts/setup-postgresql.sh
source ./scripts/setup-redis.sh
source ./scripts/setup-rabbitmq.sh
source ./scripts/setup-nginx.sh

# Setup and install python related dependencies
source ./scripts/setup-builtessential.sh
source ./scripts/setup-python.sh
source ./scripts/setup-circus.sh
source ./scripts/setup-utils.sh

# Setup Taiga
source ./scripts/setup-repos.sh
source ./scripts/setup-server-front.sh
source ./scripts/setup-server-back.sh
