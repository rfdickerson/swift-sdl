#include "sdl-shim.h"

int getWindowPosCentered()
{
  return SDL_WINDOWPOS_CENTERED_DISPLAY(0);
}

unsigned int getOpenGLFlags()
{
  return SDL_WINDOW_OPENGL;
}

int getSDLContextProfileCore() {

  return SDL_GL_CONTEXT_PROFILE_CORE;

}
