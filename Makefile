all: example

CSDL_DIR=modules/CSDL

sdl-shim: $(CSDL_DIR)/sdl-shim.c $(CSDL_DIR)/sdl-shim.h
	gcc -c $(CSDL_DIR)/sdl-shim.c -o $(CSDL_DIR)/sdl-shim.o
	ar -cvq $(CSDL_DIR)/libsdlshim.a $(CSDL_DIR)/*.o

example: sdl-shim main.swift
	swiftc -I $(CSDL_DIR) -lSDL2 -lsdlshim  -Xcc -Xlinker -L$(CSDL_DIR) main.swift
