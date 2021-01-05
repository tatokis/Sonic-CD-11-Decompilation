find_package(SDL2 REQUIRED)
find_package(Threads REQUIRED)
find_package(Vorbis REQUIRED)

include_directories(${SDL2_INCLUDE_DIRS})

add_executable (soniccd
    Animation.cpp
    Animation.hpp
    Audio.cpp
    Audio.hpp
    Collision.cpp
    Collision.hpp
    Debug.cpp
    Debug.hpp
    Drawing.cpp
    Drawing.hpp
    Ini.cpp
    Ini.hpp
    Input.cpp
    Input.hpp
    main.cpp
    Math.cpp
    Math.hpp
    Object.cpp
    Object.hpp
    Palette.cpp
    Palette.hpp
    Player.cpp
    Player.hpp
    Reader.cpp
    Reader.hpp
    RetroEngine.cpp
    RetroEngine.hpp
    Scene3D.cpp
    Scene3D.hpp
    Scene.cpp
    Scene.hpp
    Script.cpp
    Script.hpp
    Sprite.cpp
    Sprite.hpp
    String.cpp
    String.hpp
    Text.cpp
    Text.hpp
    Userdata.cpp
    Userdata.hpp
    Video.cpp
    Video.hpp
)

target_link_libraries(soniccd ${SDL2_LIBRARIES} theoraplay ${CMAKE_THREAD_LIBS_INIT} Vorbis::vorbis Vorbis::vorbisfile)
