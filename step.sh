#!/bin/bash
set -ex

result=`xcrun altool --notarize-app --primary-bundle-id $primary_bundle_identifier --username $itunescon_user --password $app_password --file $upload_binary_path`
echo $result
uuid=`echo $result | grep RequestUUID | sed -e 's/^RequestUUID = \([0-9A-F-]*\)/\1/'`
envman add --key NOTARIZE_REQUEST_UUID --value $uuid
