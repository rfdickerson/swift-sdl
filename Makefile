all: clean example

CSDL_DIR=modules/CSDL
CGLEW_DIR=modules/CGlew

sdl-shim: $(CSDL_DIR)/sdl-shim.c $(CSDL_DIR)/sdl-shim.h
	gcc -c $(CSDL_DIR)/sdl-shim.c -o $(CSDL_DIR)/sdl-shim.o
	ar -cvq $(CSDL_DIR)/libsdlshim.a $(CSDL_DIR)/*.o

example: sdl-shim main.swift
	swiftc -I $(CGLEW_DIR) -I $(CSDL_DIR) -lsdlshim -Xcc -Xlinker -L$(CSDL_DIR) main.swift

clean:
	rm $(CSDL_DIR)/*a $(CSDL_DIR)/*.o
