# Template For C++ Projects

![C++](https://img.shields.io/badge/C%2B%2B-11%2F14%2F17%2F20%2F23-blue)
![License](https://img.shields.io/badge/License-MIT-blue)

This is a template for C++ projects. What you get:

- Library, executable and test code separated in distinct folders
- Use of modern CMake for building and compiling
- External libraries installed and managed by
  - [CPM](https://github.com/cpm-cmake/CPM.cmake) Package Manager OR
  - [Conan](https://conan.io/) Package Manager OR
  - [VCPKG](https://github.com/microsoft/vcpkg) Package Manager
- Unit testing using [Catch2](https://github.com/catchorg/Catch2) v2
- General purpose libraries: [JSON](https://github.com/nlohmann/json), [spdlog](https://github.com/gabime/spdlog), [cxxopts](https://github.com/jarro2783/cxxopts) and [fmt](https://github.com/fmtlib/fmt)
- Continuous integration testing with Github Actions and [pre-commit](https://pre-commit.com/)
- Code coverage reports, including automatic upload to [Codecov](https://codecov.io)
- Code documentation with [Doxygen](https://doxygen.nl/) and [Github Pages](https://franneck94.github.io/CppProjectTemplate/)
- Tooling: Clang-Format, Cmake-Format, Clang-tidy, Sanitizers

This project is provided "AS IS", no warranty, no responsibilities, no more documentation that the one included in this repository, but the scripts are so simples that it don't needed. ![winking](/images/winking.png)

## Structure

``` text
├── CMakeLists.txt
├── app
│   ├── CMakesLists.txt
│   └── main.cpp
├── cmake
│   └── cmake modules
├── docs
│   ├── Doxyfile
│   └── html/
├── external
│   ├── CMakesLists.txt
│   ├── ...
├── src
│   ├── CMakesLists.txt
│   ├── library.h
│   └── library.cpp
└── tests
    ├── CMakeLists.txt
    └── main.cpp
```

Library code goes into [src/](src/), main program code in [app/](app) and tests go in [tests/](tests/).

## Software Requirements

- CMake 3.27+
- GNU Makefile
- Doxygen
- Conan or VCPKG
- MSVC 2022 (or higher), G++9 (or higher), Clang++9 (or higher)
- Optional: Code Coverage (only on GNU|Clang): lcov, gcovr
- Optional: Makefile, Doxygen, Conan, VCPKG
  
### Windows

Chocolatey is a repository and packages management for Windows, it is like apt and yam on linux environments, making really easy the automatic packages install and administration on windows following DevOps automation approaches.

[Install Chocolatey](https://chocolatey.org/install#individual) is a little more complicated and is recommended follow the procedure on the link, but on summary the procedure is the follow.

1. Open PowerShell on administrative privileges (*Run as Administrator*)
2. With PowerShell, you must ensure *Get-ExecutionPolicy* is not *Restricted*. We suggest using *Bypass* to bypass the policy to get things installed or *AllSigned* for quite a bit more security.
3. Run *Get-ExecutionPolicy*. If it returns *Restricted*, then run *Set-ExecutionPolicy AllSigned* or *Set-ExecutionPolicy Bypass -Scope Process*.
4. Now run the following PowerShell command:

```PowerShell
Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))
```

5. Paste the copied text into your shell and press Enter.
6. Wait a few seconds for the command to complete.
7. If you don't see any errors, you are ready to use Chocolatey! Type choco or choco -? now, or see Getting Started for usage instructions.

To choco remember parameters on upgrade, be sure to set: 

```PowerShell
choco feature enable -n=useRememberedArgumentsForUpgrades
```

Now that Chocolatey is installed on your system, we can proceed to install the other dependencies using PowerShell.

To install Git, Make, LLVN, Doxygen and Python 3.12 used the follow command:

```PowerShell
choco install git make llvm doxygen.install python312 -y
```

To install cmake some parameters needs to be passed as follow:

```PowerShell
choco install cmake --installargs 'ADD_CMAKE_TO_PATH=System DESKTOP_SHORTCUT_REQUESTED=1 ALLUSERS=1' -y
```

If you wants more information about Chocolatey is recommended read the [official documentation](https://docs.chocolatey.org/en-us) page.

## Building

First, clone this repo and do the preliminary work:

```shell
git clone https://github.com/BolivarTech/CMake-Template
make prepare
```

- App Executable

```shell
cd build
cmake -DCMAKE_BUILD_TYPE=Release ..
cmake --build . --config Release --target main
cd app
./main
```

- Unit testing

```shell
cd build
cmake -DCMAKE_BUILD_TYPE=Debug ..
cmake --build . --config Debug --target unit_tests
cd tests
./unit_tests
```

- Documentation

```shell
cd build
cmake -DCMAKE_BUILD_TYPE=Debug ..
cmake --build . --config Debug --target docs
```

- Code Coverage (Unix only)

```shell
cd build
cmake -DCMAKE_BUILD_TYPE=Debug -DENABLE_COVERAGE=ON ..
cmake --build . --config Debug --target coverage
```

For more info about [CMake](./README_cmake.md) see on link.

A convenient [Git Command Line Cheat Sheet](./Git_command_line_cheat_sheet.md) is available on the link.
