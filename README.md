# Introduction

- A `CMake` based project template for `C++`, with test and benchmark template.
- Manage external dependencies by `CMake FindPackage`, the module config file are located in `cmake/module`.
- Export dependency tree by `graphviz` & `dot`, enable this feature by `-DENABLE_DT`.
- Code file
	- Support file with suffix of .cc or .cpp.
	- Place test code in the same directory of source code, and with a suffix of `_test`.
	- Place benchmark code in the same directory of source code, and with a suffix of `_benchmark`.
- Code format
	- `script/format.sh` formats all the `C/C++` file, `CMake` file and `shell` script.
- Doc
	- `Doxygen` for `C++` document generation.
	```
	doxygen .doxygen.conf
	```
	- `html` document will output to `doc/api/html` directory

# Build

- `mkdir -p build && cd build && cmake .. && make -j 10`

# Dependency Graph

- `make dt`

![image](https://user-images.githubusercontent.com/7620259/131056521-24c7a688-a40c-4731-aa1d-52f91b14b509.png)
