# Source Files
HOME = H:/dev/FirstPhysicsEngine
TARGET = program

BIN = $(HOME)/bin
SRC = $(HOME)/src
INCLUDE = $(HOME)/include
LIB = $(HOME)/lib


# Compiler
CXX = g++
OBJ_FLAGS = -g -c


# Linking to static library files
LIB_FLAGS = -L$(LIB) -lglfw3 -lopengl32 -lgdi32

# Test Setup / Libraries
run-test:
	$(BIN)/test.exe
test: glad test_cpp
	$(info making test.exe...)
	$(CXX) $(BIN)/glad.o $(BIN)/test.o -g $(LIB_FLAGS) -o $(BIN)/test.exe
test_cpp:
	$(info compiling test...)
	$(CXX) test.cpp $(OBJ_FLAGS) -I$(INCLUDE) -o $(BIN)/test.o


# GLAD, required for GL calls
glad:
	$(info compiling glad...)
	$(CXX) $(INCLUDE)/GLAD/glad.c $(OBJ_FLAGS) -I$(INCLUDE) -o $(BIN)/glad.o

# MAKE commands...
clean:
	rm $(BIN)/*.o

destroy:
	rm $(BIN)/*

rebuild:
	make destroy
	make all

run:
	$(BIN)/$(TARGET).exe

.PHONY: all clean destroy run