#include <SDL2/SDL.h>
#include <spdlog/spdlog.h>

int main() {
    // Initialize SDL2.
    if (SDL_Init(SDL_INIT_EVERYTHING)) {
        spdlog::critical("Failed to initialize SDL2: {}", SDL_GetError());
        return 0;
    }
    spdlog::info("Initialized SDL2.");
    
    // Create window.
    SDL_Window* window = SDL_CreateWindow("Lipoic",
                                          SDL_WINDOWPOS_UNDEFINED, SDL_WINDOWPOS_UNDEFINED,
                                          1080, 1920,
                                          SDL_WINDOW_SHOWN);
    if (window == nullptr) {
        spdlog::critical("Failed to create window: {}", SDL_GetError());
        return 0;
    }
    spdlog::info("Created window.");
    
    bool is_running = true;
    while (is_running) {
        // Handle events.
        for (SDL_Event event; SDL_PollEvent(&event);) {
            if (event.type == SDL_QUIT) {
                is_running = false;
            }
        }
    }
    
    // Destroy window.
    SDL_DestroyWindow(window);
    spdlog::info("Destroyed window.");
    
    // Quit SDL2.
    SDL_Quit();
    spdlog::info("Quited SDL2.");
}
