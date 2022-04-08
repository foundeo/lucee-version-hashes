#!/bin/bash

#fetch json array of versions
version_data=$(curl -sS "https://release.lucee.org/rest/update/provider/list/ ")

versions=$(echo $version_data | jq -r '.[].version' | grep -v SNAPSHOT | grep -v RC | grep -v BETA | grep -v ALPH)

for version in $versions
do
        version_hash = $(curl -sL https://cdn.lucee.org/$version.jar | sha256sum)
        echo "$version|$version_hash"
        break
done
