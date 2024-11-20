# ##############################################################################
# Make to generate project's files structures
# Author: Julian Bolivar
# Date: 2023-10-09
.PHONY: all setup prepare conan_d conan_r build clean install gen_docs

BUILD_DIR := build
DOC_DIR := docs
BUILD_TYPE ?= Debug

all: prepare cmake gen_docs

setup:
	sudo apt-get install gcc g++ cmake make doxygen git llvm pkg-config curl zip unzip tar python3-dev clang-format clang-tidy

prepare: clean
	mkdir ${BUILD_DIR}

conan_d:
	rd /s /q ${BUILD_DIR}
	mkdir ${BUILD_DIR}
	cd ${BUILD_DIR} && conan install .. -s build_type=Debug --output-folder=. --build missing -s compiler.cppstd=17

conan_r:
	rd /s /q ${BUILD_DIR}
	mkdir ${BUILD_DIR}
	cd ${BUILD_DIR} && conan install .. -s build_type=Release --output-folder=. --build missing -s compiler.cppstd=17

${BUILD_DIR}/Makefile:
	cd ${BUILD_DIR} && \
	cmake -DCMAKE_BUILD_TYPE=${BUILD_TYPE} .. && \
	cmake --build . --config ${BUILD_TYPE} --target main

cmake: ${BUILD_DIR}/Makefile

build: cmake

clean:
	-rd /s /q ${BUILD_DIR}
	-rd /s /q ${DOC_DIR}\latex
	-rd /s /q ${DOC_DIR}\html
	-del ${DOC_DIR}\refman.pdf

install:
	$(MAKE) -C ${BUILD_DIR} install

gen_docs:
	cd ${BUILD_DIR} && \
	cmake -DCMAKE_BUILD_TYPE=${BUILD_TYPE} .. && \
	cmake --build . --config ${BUILD_TYPE} --target docs && \
	cd ..\${DOC_DIR}\latex && \
	.\make.bat && \
	copy refman.pdf ..
	-rd /s /q ${DOC_DIR}\latex
	-rd /s /q ${DOC_DIR}\html
