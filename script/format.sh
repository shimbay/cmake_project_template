#! /bin/bash

dir=$(dirname "${BASH_SOURCE[0]}")

pushd ${dir}

find . -name "*_format.sh" | xargs -I {} bash -c {}

popd
