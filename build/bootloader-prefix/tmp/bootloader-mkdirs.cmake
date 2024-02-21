# Distributed under the OSI-approved BSD 3-Clause License.  See accompanying
# file Copyright.txt or https://cmake.org/licensing for details.

cmake_minimum_required(VERSION 3.5)

file(MAKE_DIRECTORY
  "/home/liam/repos/esp-idf/components/bootloader/subproject"
  "/home/liam/Documents/PlatformIO/Projects/thermostat/build/bootloader"
  "/home/liam/Documents/PlatformIO/Projects/thermostat/build/bootloader-prefix"
  "/home/liam/Documents/PlatformIO/Projects/thermostat/build/bootloader-prefix/tmp"
  "/home/liam/Documents/PlatformIO/Projects/thermostat/build/bootloader-prefix/src/bootloader-stamp"
  "/home/liam/Documents/PlatformIO/Projects/thermostat/build/bootloader-prefix/src"
  "/home/liam/Documents/PlatformIO/Projects/thermostat/build/bootloader-prefix/src/bootloader-stamp"
)

set(configSubDirs )
foreach(subDir IN LISTS configSubDirs)
    file(MAKE_DIRECTORY "/home/liam/Documents/PlatformIO/Projects/thermostat/build/bootloader-prefix/src/bootloader-stamp/${subDir}")
endforeach()
if(cfgdir)
  file(MAKE_DIRECTORY "/home/liam/Documents/PlatformIO/Projects/thermostat/build/bootloader-prefix/src/bootloader-stamp${cfgdir}") # cfgdir has leading slash
endif()
