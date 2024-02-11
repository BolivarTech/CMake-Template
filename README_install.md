# Software Installation

## How to install VCPKG

Official [vcpkg](https://vcpkg.io/) site.

```cmd
cd external
git clone https://github.com/Microsoft/vcpkg.git
.\vcpkg\bootstrap-vcpkg.bat # windows
./vcpkg/bootstrap-vcpkg.sh # Unix
```

## How to install the Conan Package Manager

Official Conan Packet manager is [here](https://conan.io/).

Official installation guide is [here](https://docs.conan.io/2/).

The conan database is [here](https://conan.io/center/).

### Installation Steps

1. Install Python (3.7+)
2. Type ``pip install conan`` into the terminal to system wide install.
   1. Type ``pip install --user -U conan`` into the terminal for user install.
   2. Unix: Append conan to the PATH by: ``source ~/.profile``
4. Run the conan command: ``conan``
5. conan profile detect --force
6. conan profile path default

## Formatter and Static Analyzer

### Tooling

Clang-Format: Formatting tool for your C/C++ code:

- Documentation for [Clang-Format](https://clang.llvm.org/docs/ClangFormat.html)

Clang-Tidy: Static linting tool for your C/C++ code:

- Documentation for [Clang-Tidy](https://clang.llvm.org/extra/clang-tidy/)

Cmake-Format:

```bash
pip install cmake-format # python 3.7+
```

### Install Clang Tools

It's included in the LLVM toolchain, but also installable by apt, chocolatey, brew, winget etc.

The official [CLang](https://github.com/llvm/llvm-project) repository on Github.
