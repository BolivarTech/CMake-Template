all: prepare

install:
	sudo apt-get install gcc g++ cmake make doxygen git llvm pkg-config curl zip unzip tar python3-dev clang-format clang-tidy

prepare:
	rd /s /q build
	mkdir build

conan_d:
	rd /s /q build
	mkdir build
	cd build && conan install .. -s build_type=Debug --output-folder=. --build missing -s compiler.cppstd=17

conan_r:
	rd /s /q build
	mkdir build
	cd build && conan install .. -s build_type=Release --output-folder=. --build missing -s compiler.cppstd=17

clean:
	rd /s /q build
