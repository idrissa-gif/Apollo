# Compiler and flags
CXX = g++
CXXFLAGS = -std=c++11 -O3

# Source files
SRC = uci.cpp bbmagic.cpp board.cpp movegen.cpp bitboard.cpp testing.cpp eval.cpp search.cpp zobrist.cpp transpo.cpp

# Object files
OBJ = $(SRC:.cpp=.o)

# Build directory (sibling of Apollo)
BUILD_DIR = ../build

# Output executable (inside build directory)
TARGET = $(BUILD_DIR)/apollo

# Default rule
all: $(TARGET)

# Rule to build the target
$(TARGET): $(OBJ)
	@mkdir -p $(BUILD_DIR)         # Create build directory if it doesn't exist
	$(CXX) $(CXXFLAGS) -o $@ $(OBJ) # Link the object files to create the executable
	strip $@                        # Strip the executable to reduce size

# Rule to build object files
$(BUILD_DIR)/%.o: %.cpp
	@mkdir -p $(BUILD_DIR)           # Create build directory if it doesn't exist
	$(CXX) $(CXXFLAGS) -c $< -o $@  # Compile the source files into object files in the build directory

# Clean up build files
clean:
	rm -rf $(BUILD_DIR)              # Remove the build directory and all its contents

# Phony targets
.PHONY: all clean