#!/bin/bash -eux

# Change work directory
cd $(dirname $0)/../
PROJECT_ROOT=`pwd`
export SCRIPTS=$PROJECT_ROOT/scripts

npm install
