#!/bin/bash -eux

PROJECT_ROOT=$(cd `dirname $0`/../; pwd)
REQUIRED_XCODE_VERSION=`cat $PROJECT_ROOT/.xcode-version`
SELECTED_XCODE_VERSION=`xcodebuild -version | perl -ne 'print if $.==1' | perl -pe 's/Xcode ([\d\.]*)/$1/g;'`

if [ $REQUIRED_XCODE_VERSION = $SELECTED_XCODE_VERSION ]; then
    echo "✅ Xcode version."
    exit 0
else
    echo "❌ Xcode version mismatch. Use Xcode $REQUIRED_XCODE_VERSION ."
    exit 1
fi
