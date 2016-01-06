import CSDL

let options: UInt32 = UInt32(SDL_INIT_VIDEO)

if SDL_Init(options) < 0 {
    print("Unable to init SDL")
}

var window: UnsafeMutablePointer<SDL_Window>
window = SDL_CreateWindow(
        "An SDL window",
        SDL_WINDOWPOS_CENTERED,
        SDL_WINDOWPOS_CENTERED,
        800,
        600,
        SDL_WINDOW_OPENGL
             )

var maincontext: SDL_GLContext

SDL_Quit()
print( "Quitting ")
