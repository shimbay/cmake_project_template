# Introduction

- A `CMake` based project template for `C++`, with test and benchmark template.
- Manage external dependencies by `CMake FindPackage`, the module config file are located in `cmake/module`.
- Export dependency tree by `graphviz` & `dot`, enable this feature by `-DENABLE_DT`.
- Support file with suffix of .cc or .cpp.
- Place test code in the same directory of source code, and with a suffix of `_test`.
- Place benchmark code in the same directory of source code, and with a suffix of `_benchmark`.

# Build

- `mkdir -p build && cd build && cmake .. -DENABLE_DT=ON && make -j 10`
