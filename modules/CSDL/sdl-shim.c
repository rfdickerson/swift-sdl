#include "sdl-shim.h"

extern int getWindowPosCentered()
{
  return SDL_WINDOWPOS_CENTERED_DISPLAY(0);
}

extern unsigned int getOpenGLFlags()
{
  return SDL_WINDOW_OPENGL;
}
