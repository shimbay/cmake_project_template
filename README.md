# Introduction

- A `CMake` based project template for `C++`, with test and benchmark template.
- Code file:
	- support file with suffix of .h or .cc or .cpp.
	- place test file in the same directory of source file, with a suffix of `_test`.
	- place benchmark file in the same directory of source file, with a suffix of `_benchmark`.
- Code format:
	- `script/format.sh` formats all the `C/C++` file, `CMake` file and `shell` script.
	- use `clang-format` to format `C/C++` file.
	- use `cmake-format` to format `CMake` file.
	- use `shfmt` to format `shell` script.
- Doc:
	- `doxygen` for `C++` document generation.
	- `html` document of `include` directory will be generated in `doc/api/html`.
- Manage external dependencies by `CMake find_package`, place the config file in `cmake/module`.
- Export cmake target dependency graph by `graphviz` & `dot`.

# Build

- `mkdir -p build && cd build && cmake .. && make -j 10`

# Dependency Graph

- `mkdir -p build && cd build && cmake .. && make dg`

![image](https://user-images.githubusercontent.com/7620259/131056521-24c7a688-a40c-4731-aa1d-52f91b14b509.png)
