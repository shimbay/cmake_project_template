#! /bin/bash

dir=$(dirname "${BASH_SOURCE[0]}")

pushd ${dir}/..

if test -z $(which cmake-format); then
  echo "cmake-format not found, please install cmake-format."
  exit 1
fi

cmake-format -i -l debug CMakeLists.txt

find cmake \
  \( -name "*.cmake" \) \
  -type f ! -path '*src/path/ignore/*' |
  xargs cmake-format -i -l debug
popd
