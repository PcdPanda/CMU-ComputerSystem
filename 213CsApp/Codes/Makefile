all:test

CC=g++
CPPFLAGS=-g -std=c++11 -ggdb

test:test.o
	$(CC) -o $@ $^

test.o:main.cpp
	$(CC) $(CPPFLAGS) -o $@ -c $^

clean:
	rm test.o test