# Makefile for LLVM Example

# Change these variables to your LLVM installation path
LLVM_CONFIG = ./bin/llvm-config
# LLVM_CXXFLAGS = `${LLVM_CONFIG} --cxxflags`
# fix this call
LLVM_CXXFLAGS = $(shell $(LLVM_CONFIG) --cxxflags)
LLVM_LDFLAGS = $(shell $(LLVM_CONFIG) --ldflags)
LLVM_LIBS = $(shell $(LLVM_CONFIG) --libs)
# LLVM_LDFLAGS += -lncurses

# Compiler and flags
CXX = clang++
CXXFLAGS = -Wall -std=c++11 $(LLVM_CXXFLAGS)

# Source and target
SRC = llvm_condbr.cpp
TARGET = llvm_condbr

all: $(TARGET)

$(TARGET): $(SRC)
	$(CXX) $(CXXFLAGS) -o $(TARGET) $(SRC) -lcurses $(LLVM_LDFLAGS)  $(LLVM_LIBS)

clean:
	rm -f $(TARGET)
