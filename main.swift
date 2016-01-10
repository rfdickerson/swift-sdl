import CSDL
import CSDLShim
import CGlew

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

var target: SDL_DisplayMode = SDL_DisplayMode()
var closest: SDL_DisplayMode = SDL_DisplayMode()
target.w = 800
target.h = 600
target.format = 0
target.refresh_rate = 0

SDL_GetClosestDisplayMode(0, &target, &closest)

SDL_GL_SetAttribute(SDL_GL_CONTEXT_PROFILE_MASK, getSDLContextProfileCore());
SDL_GL_SetAttribute(SDL_GL_DOUBLEBUFFER, 1);
SDL_GL_SetAttribute(SDL_GL_DEPTH_SIZE, 24);
SDL_GL_SetAttribute(SDL_GL_ACCELERATED_VISUAL, 1);

let points: [Float] = [0.0, 0.5, 0.0,
			0.5, -0.5, 0.0,
			-0.5, -0.5, 0.0			
		      ]


// var vbo: Int32
// glGenBuffers(1, &vbo)
// glBindBuffer(GL_ARRAY_BUFFER, vbo)
// glBufferData(GL_ARRAY_BUFFER, 9 * 4, points, GL_STATIC_DRAW)

var maincontext: SDL_GLContext

maincontext = SDL_GL_CreateContext(window)

SDL_GL_MakeCurrent(window, maincontext)

glClearColor(0.0, 0.0, 0.0, 1.0 )
glClear(UInt32(GL_COLOR_BUFFER_BIT | GL_DEPTH_BUFFER_BIT))

print( glGetString(UInt32(GL_VERSION)))

SDL_GL_SwapWindow(window)

SDL_Delay(5000)

SDL_Quit()
print( "Quitting ")
