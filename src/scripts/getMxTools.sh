#!/usr/bin/env bash
set -e

if [[ $# -eq 0 ]] ; then
    echo 'Missing arguments'
    exit 1
fi

MX_VERSION=$1

VERSION_PARTS=(${MX_VERSION//./ })

# Check that the Mendix Version is higher than 8
# That's when mendix started to supports mono 5.20.1 and openjdk11 
if [[ ${VERSION_PARTS[0]} -lt 8 ]] ; then
    echo "Mendix version below 8 is not supported"
    exit 1
fi

echo "Downloading mendix console tools for version ${MX_VERSION}"
mkdir /opt/downloads
curl -o /opt/downloads/mxbuild.tar.gz "https://cdn.mendix.com/runtime/mxbuild-$MX_VERSION.tar.gz"

echo "Extracting Mendix console tools"

# extract contents of the modeler directory to /opt/tools/
(cd /opt/tools/ && tar -xf /opt/downloads/mxbuild.tar.gz modeler --strip-components=1)

echo "Succesfully retrieved and configured Mendix console tools"
