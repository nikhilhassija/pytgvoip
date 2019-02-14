# - Find tgvoip
# Find the native tgvoip includes and libraries
#
#  TGVOIP_INCLUDE_DIR - where to find VoIPController.h, etc.
#  TGVOIP_LIBRARIES   - List of libraries when using tgvoip.
#  TGVOIP_FOUND       - True if tgvoip found.

if(TGVOIP_INCLUDE_DIR)
        set(TGVOIP_FIND_QUIETLY TRUE)
endif(TGVOIP_INCLUDE_DIR)

set(FIND_TGVOIP_PATHS
        ~/Library/Frameworks
        /Library/Frameworks
        /usr/local
        /usr
        /sw
        /opt/local
        /opt/csw
        /opt
        $ENV{TGVOIP_LIBRARY_ROOT}
        $ENV{TGVOIP_INCLUDE_ROOT}
)

find_path(TGVOIP_INCLUDE_DIR
        VoIPController.h
        PATH_SUFFIXES tgvoip libtgvoip
        PATHS ${FIND_TGVOIP_PATHS}
)
find_library(TGVOIP_LIBRARY
        NAMES tgvoip tgvoip_static libtgvoip libtgvoip_static libtgvoip.dll
        PATHS ${FIND_TGVOIP_PATHS}
)

message(STATUS ${TGVOIP_INCLUDE_DIR})
message(STATUS ${TGVOIP_LIBRARY})

include(FindPackageHandleStandardArgs)
find_package_handle_standard_args(TGVOIP DEFAULT_MSG TGVOIP_INCLUDE_DIR TGVOIP_LIBRARY)

if(TGVOIP_FOUND)
        set(TGVOIP_LIBRARIES ${TGVOIP_LIBRARY})
else(TGVOIP_FOUND)
        set(TGVOIP_LIBRARIES)
endif(TGVOIP_FOUND)

mark_as_advanced(TGVOIP_INCLUDE_DIR)
mark_as_advanced(TGVOIP_LIBRARY)
