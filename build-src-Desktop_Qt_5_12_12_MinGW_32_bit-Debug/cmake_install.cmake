# Install script for directory: C:/Users/rapha/Documents/GitHub/OpenHD-ImageWriter/src

# Set the install prefix
if(NOT DEFINED CMAKE_INSTALL_PREFIX)
  set(CMAKE_INSTALL_PREFIX "C:/Program Files (x86)/OpenHDImageWriter")
endif()
string(REGEX REPLACE "/$" "" CMAKE_INSTALL_PREFIX "${CMAKE_INSTALL_PREFIX}")

# Set the install configuration name.
if(NOT DEFINED CMAKE_INSTALL_CONFIG_NAME)
  if(BUILD_TYPE)
    string(REGEX REPLACE "^[^A-Za-z0-9_]+" ""
           CMAKE_INSTALL_CONFIG_NAME "${BUILD_TYPE}")
  else()
    set(CMAKE_INSTALL_CONFIG_NAME "Debug")
  endif()
  message(STATUS "Install configuration: \"${CMAKE_INSTALL_CONFIG_NAME}\"")
endif()

# Set the component getting installed.
if(NOT CMAKE_INSTALL_COMPONENT)
  if(COMPONENT)
    message(STATUS "Install component: \"${COMPONENT}\"")
    set(CMAKE_INSTALL_COMPONENT "${COMPONENT}")
  else()
    set(CMAKE_INSTALL_COMPONENT)
  endif()
endif()

# Is this installation the result of a crosscompile?
if(NOT DEFINED CMAKE_CROSSCOMPILING)
  set(CMAKE_CROSSCOMPILING "FALSE")
endif()

# Set default install directory permissions.
if(NOT DEFINED CMAKE_OBJDUMP)
  set(CMAKE_OBJDUMP "C:/Qt/Tools/mingw730_32/bin/objdump.exe")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for each subdirectory.
  include("C:/Users/rapha/Documents/GitHub/OpenHD-ImageWriter/build-src-Desktop_Qt_5_12_12_MinGW_32_bit-Debug/dependencies/zlib-1.2.11/cmake_install.cmake")
  include("C:/Users/rapha/Documents/GitHub/OpenHD-ImageWriter/build-src-Desktop_Qt_5_12_12_MinGW_32_bit-Debug/dependencies/cmcurl/cmake_install.cmake")
  include("C:/Users/rapha/Documents/GitHub/OpenHD-ImageWriter/build-src-Desktop_Qt_5_12_12_MinGW_32_bit-Debug/dependencies/cmliblzma/cmake_install.cmake")
  include("C:/Users/rapha/Documents/GitHub/OpenHD-ImageWriter/build-src-Desktop_Qt_5_12_12_MinGW_32_bit-Debug/dependencies/zstd-1.5.0/build/cmake/cmake_install.cmake")
  include("C:/Users/rapha/Documents/GitHub/OpenHD-ImageWriter/build-src-Desktop_Qt_5_12_12_MinGW_32_bit-Debug/dependencies/libarchive-3.5.2/cmake_install.cmake")
  include("C:/Users/rapha/Documents/GitHub/OpenHD-ImageWriter/build-src-Desktop_Qt_5_12_12_MinGW_32_bit-Debug/dependencies/fat32format/cmake_install.cmake")

endif()

if(CMAKE_INSTALL_COMPONENT)
  set(CMAKE_INSTALL_MANIFEST "install_manifest_${CMAKE_INSTALL_COMPONENT}.txt")
else()
  set(CMAKE_INSTALL_MANIFEST "install_manifest.txt")
endif()

string(REPLACE ";" "\n" CMAKE_INSTALL_MANIFEST_CONTENT
       "${CMAKE_INSTALL_MANIFEST_FILES}")
file(WRITE "C:/Users/rapha/Documents/GitHub/OpenHD-ImageWriter/build-src-Desktop_Qt_5_12_12_MinGW_32_bit-Debug/${CMAKE_INSTALL_MANIFEST}"
     "${CMAKE_INSTALL_MANIFEST_CONTENT}")
