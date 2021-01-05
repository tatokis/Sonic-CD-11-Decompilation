find_package(Vorbis REQUIRED)
find_package(Theora REQUIRED)

add_library(theoraplay
    theoraplay.c
    theoraplay_cvtrgb.h
    theoraplay.h
)

target_include_directories (theoraplay PUBLIC ${CMAKE_CURRENT_SOURCE_DIR})
target_link_libraries(theoraplay Vorbis::vorbis Theora::theora Theora::theoradec)
