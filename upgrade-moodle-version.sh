#!/bin/bash

set -eu

NEW_MOODLE_VERSION=$1

git reset --hard HEAD
git pull

echo -n "-----> Editing & pushing Moodle version file..."
echo "$NEW_MOODLE_VERSION" > ./bin/version
git add ./bin/version
git commit -m "Upgrade version to $NEW_MOODLE_VERSION"
git push
echo "done"

echo -n "-----> Releasing and publishing a new tag..."
git fetch --all --tags
git tag -a "v$NEW_MOODLE_VERSION" -m "Release v$NEW_MOODLE_VERSION"
git push --tag
echo "done"
