# Compile commands
ifeq ($(shell clang > /dev/null 2> /dev/null; echo $$?), $(shell echo 1))
export CC = clang
else
export CC = gcc
endif
ifeq ($(shell clang++ > /dev/null 2> /dev/null; echo $$?), $(shell echo 1))
export CXX = clang++
export LINK = clang++
else
export CXX = g++
export LINK = g++
endif

export CFLAGS = -O3
export CXXFLAGS = -O3 -c
export LFLAGS = -s -O3
export RM = rm -f

.PHONY: all clean dist-clean

all: sites-downloader sd

sites-downloader: main1.cpp
	$(CXX) $< $(CXXFLAGS) -o $@

sd: main.o functions.o aho.o trie.o
	$(LINK) $^ $(LFLAGS) -o $@

main.o: main.cpp
	$(CXX) $< $(CXXFLAGS) -o $@

functions.o: functions.cpp functions.hpp
	$(CXX) $< $(CXXFLAGS) -o $@

aho.o: aho.cpp aho.hpp
	$(CXX) $< $(CXXFLAGS) -o $@

trie.o: trie.cpp trie.hpp
	$(CXX) $< $(CXXFLAGS) -o $@

clean:
	$(RM) *.o

dist-clean:
	$(RM) *.o
