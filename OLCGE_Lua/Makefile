CC=g++
# change this path to suit your lua-dev installation.
INCLUDE=-I /usr/include/lua5.2/
DFLAGS=-DUNICODE -DLINUX

# remove unused libraries
LIBS=-lstdc++ -lSDL2 -lGL -lGLEW -lm
OFLAGS=-c
CFLAGS=-g3 -Wfatal-errors -w -Wextra -std=c++11 -pedantic-errors $(INCLUDE) $(DFLAGS)

OBJECTS=main.o 

TARGET=olcge_lua

all: $(OBJECTS) Makefile
	$(CC) $(CFLAGS) -o $(TARGET)  $(OBJECTS) $(LIBS)

%.o: %.cpp Makefile *.h
	$(CC) $(CFLAGS) $(OFLAGS) -o $@ $<

clean:
	rm $(OBJECTS) $(TARGET)

