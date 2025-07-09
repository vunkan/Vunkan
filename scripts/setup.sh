#!/bin/bash -eux

# Change work directory
cd $(dirname $0)/../
PROJECT_ROOT=`pwd`
export SCRIPTS=$PROJECT_ROOT/scripts

# Load environment variables
source $PROJECT_ROOT/env

npm install

# Generate Xcode project using XcodeGen
envsubst < $PROJECT_ROOT/project.yml > $PROJECT_ROOT/project.generated.yml
swift run --package-path $SCRIPTS/external/_xcodegen xcodegen generate --spec $PROJECT_ROOT/project.generated.yml
rm $PROJECT_ROOT/project.generated.yml
