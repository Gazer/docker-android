#!/bin/sh

SDK_VERSION=`grep sdk_version versions | cut -d "=" -f 2`

for version in `seq 19 25` ; do
  BUILD_TOOLS=`grep tools$version versions | cut -d "=" -f 2`

  echo "Creating Dockerfile$version sdk $SDK_VERSION tools $BUILD_TOOLS"

  cat Dockerfile.template | \
    sed "s/{SDK_VERSION}/$SDK_VERSION/" | \
    sed "s/{VERSION}/$version/" | \
    sed "s/{BUILD_TOOLS}/$BUILD_TOOLS/" > Dockerfile$version
done
