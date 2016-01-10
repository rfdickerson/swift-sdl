import CSDL
import CSDLShim

let options: UInt32 = UInt32(SDL_INIT_VIDEO)

if SDL_Init(options) < 0 {
    print("Unable to init SDL")
}

// SDL_VideoInit(NULL);

let centeredFlag = getWindowPosCentered();
let opengl = getOpenGLFlags();

var window: SDLWindow
window = SDL_CreateWindow(
        "An SDL window",
        centeredFlag,
        centeredFlag,
        800,
        600,
        opengl
             )

var maincontext: SDL_GLContext

SDL_Delay(5000)

SDL_Quit()
print( "Quitting ")
