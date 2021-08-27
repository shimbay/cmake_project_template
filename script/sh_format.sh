#! /bin/bash

dir=$(dirname "${BASH_SOURCE[0]}")

pushd ${dir}/..

if test -z $(which shfmt); then
  echo "shfmt not found, please install shfmt."
  exit 1
fi

find script \
  \( -name "*.sh" \) \
  -type f ! -path '*src/path/ignore/*' |
  xargs shfmt -l -w -i 2
popd
