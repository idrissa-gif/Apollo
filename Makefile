# Compiler and flags
CXX = g++
CXXFLAGS = -std=c++11 -O3

# Source files
SRC = uci.cpp bbmagic.cpp board.cpp movegen.cpp bitboard.cpp testing.cpp eval.cpp search.cpp zobrist.cpp transpo.cpp

# Object files
OBJ = $(SRC:.cpp=.o)

# Output executable
TARGET = apollo

# Default rule
all: $(TARGET)

# Rule to build the target
$(TARGET): $(OBJ)
	$(CXX) $(CXXFLAGS) -o $@ $(OBJ)
	strip $@

# Rule to build object files
%.o: %.cpp
	$(CXX) $(CXXFLAGS) -c $< -o $@

# Clean up build files
clean:
	rm -f $(OBJ) $(TARGET)

# Phony targets
.PHONY: all clean