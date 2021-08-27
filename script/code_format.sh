#! /bin/bash

dir=$(dirname "${BASH_SOURCE[0]}")

pushd ${dir}/..

if test -z $(which clang-format); then
  echo "clang-format not found, please install clang-format."
  exit 1
fi

find include src cmd test benchmark \
  \( -name "*.h" -o -name "*.cpp" -o -name "*.c" -o -name "*.cc" \) \
  -type f ! -path '*src/path/ignore/*' |
  xargs clang-format -verbose -i
popd
