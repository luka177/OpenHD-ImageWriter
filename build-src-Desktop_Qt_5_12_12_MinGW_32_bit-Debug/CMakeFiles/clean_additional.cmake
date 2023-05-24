# Additional clean files
cmake_minimum_required(VERSION 3.16)

if("${CONFIG}" STREQUAL "" OR "${CONFIG}" STREQUAL "Debug")
  file(REMOVE_RECURSE
  "CMakeFiles\\OpenHDImageWriter_autogen.dir\\AutogenUsed.txt"
  "CMakeFiles\\OpenHDImageWriter_autogen.dir\\ParseCache.txt"
  "OpenHDImageWriter_autogen"
  "dependencies\\cmcurl\\lib\\CMakeFiles\\cmcurl_autogen.dir\\AutogenUsed.txt"
  "dependencies\\cmcurl\\lib\\CMakeFiles\\cmcurl_autogen.dir\\ParseCache.txt"
  "dependencies\\cmcurl\\lib\\cmcurl_autogen"
  "dependencies\\cmliblzma\\CMakeFiles\\cmliblzma_autogen.dir\\AutogenUsed.txt"
  "dependencies\\cmliblzma\\CMakeFiles\\cmliblzma_autogen.dir\\ParseCache.txt"
  "dependencies\\cmliblzma\\cmliblzma_autogen"
  "dependencies\\fat32format\\CMakeFiles\\fat32format_autogen.dir\\AutogenUsed.txt"
  "dependencies\\fat32format\\CMakeFiles\\fat32format_autogen.dir\\ParseCache.txt"
  "dependencies\\fat32format\\fat32format_autogen"
  "dependencies\\libarchive-3.5.2\\libarchive\\CMakeFiles\\archive_static_autogen.dir\\AutogenUsed.txt"
  "dependencies\\libarchive-3.5.2\\libarchive\\CMakeFiles\\archive_static_autogen.dir\\ParseCache.txt"
  "dependencies\\libarchive-3.5.2\\libarchive\\archive_static_autogen"
  "dependencies\\zlib-1.2.11\\CMakeFiles\\zlibstatic_autogen.dir\\AutogenUsed.txt"
  "dependencies\\zlib-1.2.11\\CMakeFiles\\zlibstatic_autogen.dir\\ParseCache.txt"
  "dependencies\\zlib-1.2.11\\zlibstatic_autogen"
  "dependencies\\zstd-1.5.0\\build\\cmake\\lib\\CMakeFiles\\libzstd_static_autogen.dir\\AutogenUsed.txt"
  "dependencies\\zstd-1.5.0\\build\\cmake\\lib\\CMakeFiles\\libzstd_static_autogen.dir\\ParseCache.txt"
  "dependencies\\zstd-1.5.0\\build\\cmake\\lib\\libzstd_static_autogen"
  )
endif()
