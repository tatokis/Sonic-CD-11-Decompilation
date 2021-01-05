cmake_minimum_required(VERSION 3.3)
project(Sonic-CD-11-Decompilation)

list(APPEND CMAKE_MODULE_PATH "${CMAKE_CURRENT_LIST_DIR}/cmake/modules")

add_subdirectory (dependencies/all/theoraplay)
add_subdirectory(SonicCDDecomp)
