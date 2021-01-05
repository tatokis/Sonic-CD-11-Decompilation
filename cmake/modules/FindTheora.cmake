# Based on FindVorbis originally from libsndfile
# https://github.com/libsndfile/libsndfile/blob/master/cmake/FindVorbis.cmake
#
#[=======================================================================[.rst:
FindTheora
----------

Finds the native theora, theoradec amd theorafile includes and libraries.

Imported Targets
^^^^^^^^^^^^^^^^

This module provides the following imported targets, if found:

``Theora::theora``
  The Theora library
``Theora::theoradec``
  The TheoraEnc library
``Theora::theorafile``
  The TheoraFile library

Result Variables
^^^^^^^^^^^^^^^^

This will define the following variables:

``Theora_Theora_INCLUDE_DIRS``
  List of include directories when using theora.
``Theora_Dec_INCLUDE_DIRS``
  List of include directories when using theoradec.
``Theora_File_INCLUDE_DIRS``
  List of include directories when using theorafile.
``Theora_Theora_LIBRARIES``
  List of libraries when using theora.
``Theora_Dec_LIBRARIES``
  List of libraries when using theoradec.
``Theora_File_LIBRARIES``
  List of libraries when using theorafile.
``Theora_FOUND``
  True if theora and requested components found.
``Theora_Theora_FOUND``
  True if theora found.
``Theora_Dec_FOUND``
  True if theoradec found.
``Theora_Dec_FOUND``
  True if theorafile found.

Cache variables
^^^^^^^^^^^^^^^

The following cache variables may also be set:

``Theora_Theora_INCLUDE_DIR``
  The directory containing ``theora/theora.h``.
``Theora_Dec_INCLUDE_DIR``
  The directory containing ``theora/theoradec.h``.
``Theora_File_INCLUDE_DIR``
  The directory containing ``theora/theoradec.h``.
``Theora_Theora_LIBRARY``
  The path to the theora library.
``Theora_Dec_LIBRARY``
  The path to the theoradec library.
``Theora_File_LIBRARY``
  The path to the theorafile library.

Hints
^^^^^

A user may set ``Theora_ROOT`` to a theora installation root to tell this module where to look.

#]=======================================================================]

if (Theora_Theora_INCLUDE_DIR)
	# Already in cache, be silent
	set (Theora_FIND_QUIETLY TRUE)
endif ()

set (Theora_Theora_FIND_QUIETLY TRUE)
set (Theora_Dec_FIND_QUIETLY TRUE)
set (Theora_File_FIND_QUIETLY TRUE)

find_package (Ogg QUIET)

find_package (PkgConfig QUIET)
pkg_check_modules (PC_Theora_Theora QUIET theora)
pkg_check_modules (PC_Theora_Dec QUIET theoradec)
pkg_check_modules (PC_Theora_File QUIET theorafile)

set (Theora_VERSION ${PC_Theora_Theora_VERSION})

find_path (Theora_Theora_INCLUDE_DIR theora/codec.h
	HINTS
		${PC_Theora_Theora_INCLUDEDIR}
		${PC_Theora_Theora_INCLUDE_DIRS}
		${Theora_ROOT}
	)

find_path (Theora_Dec_INCLUDE_DIR theora/theoradec.h
	HINTS
		${PC_Theora_Dec_INCLUDEDIR}
		${PC_Theora_Dec_INCLUDE_DIRS}
		${Theora_ROOT}
	)

find_path (Theora_File_INCLUDE_DIR theora/theorafile.h
	HINTS
		${PC_Theora_File_INCLUDEDIR}
		${PC_Theora_File_INCLUDE_DIRS}
		${Theora_ROOT}
	)

find_library (Theora_Theora_LIBRARY
	NAMES
		theora
		theora_static
		libtheora
		libtheora_static
	HINTS
		${PC_Theora_Theora_LIBDIR}
		${PC_Theora_Theora_LIBRARY_DIRS}
		${Theora_ROOT}
	)

find_library (Theora_Dec_LIBRARY
	NAMES
		theoradec
		theoradec_static
		libtheoradec
		libtheoradec_static
	HINTS
		${PC_Theora_Dec_LIBDIR}
		${PC_Theora_Dec_LIBRARY_DIRS}
		${Theora_ROOT}
	)

find_library (Theora_File_LIBRARY
	NAMES
		theorafile
		theorafile_static
		libtheorafile
		libtheorafile_static
	HINTS
		${PC_Theora_File_LIBDIR}
		${PC_Theora_File_LIBRARY_DIRS}
		${Theora_ROOT}
	)

include (FindPackageHandleStandardArgs)

if (Theora_Theora_LIBRARY AND Theora_Theora_INCLUDE_DIR AND Ogg_FOUND)
    set (Theora_Theora_FOUND TRUE)
endif ()

if (Theora_Dec_LIBRARY AND Theora_Dec_INCLUDE_DIR AND Theora_Theora_FOUND)
    set (Theora_Dec_FOUND TRUE)
endif ()

if (Theora_Theora_FOUND AND Theora_File_LIBRARY AND Theora_File_INCLUDE_DIR)
    set (Theora_File_FOUND TRUE)
endif ()

find_package_handle_standard_args (Theora
	REQUIRED_VARS
		Theora_Theora_LIBRARY
		Theora_Theora_INCLUDE_DIR
		Ogg_FOUND
	HANDLE_COMPONENTS
	VERSION_VAR Theora_VERSION)


if (Theora_Theora_FOUND)
	set (Theora_Theora_INCLUDE_DIRS ${THEORA_INCLUDE_DIR})
	set (Theora_Theora_LIBRARIES ${THEORA_LIBRARY} ${OGG_LIBRARIES})
    if (NOT TARGET Theora::theora)
		add_library (Theora::theora UNKNOWN IMPORTED)
		set_target_properties (Theora::theora PROPERTIES
			INTERFACE_INCLUDE_DIRECTORIES "${Theora_Theora_INCLUDE_DIR}"
			IMPORTED_LOCATION "${Theora_Theora_LIBRARY}"
			INTERFACE_LINK_LIBRARIES Ogg::ogg
		)
	endif ()

	if (Theora_Dec_FOUND)
		set (Theora_Dec_INCLUDE_DIRS ${Theora_Dec_INCLUDE_DIR})
		set (Theora_Dec_LIBRARIES ${Theora_Dec_LIBRARY} ${Theora_Dec_LIBRARIES})
		if (NOT TARGET Theora::theoradec)
			add_library (Theora::theoradec UNKNOWN IMPORTED)
			set_target_properties (Theora::theoradec PROPERTIES
				INTERFACE_INCLUDE_DIRECTORIES "${Theora_Dec_INCLUDE_DIR}"
				IMPORTED_LOCATION "${Theora_Dec_LIBRARY}"
				INTERFACE_LINK_LIBRARIES Theora::theora
			)
		endif ()
	endif ()

	if (Theora_File_FOUND)
		set (Theora_File_INCLUDE_DIRS ${Theora_File_INCLUDE_DIR})
		set (Theora_File_LIBRARIES ${Theora_File_LIBRARY} ${Theora_File_LIBRARIES})
		if (NOT TARGET Theora::theorafile)
			add_library (Theora::theorafile UNKNOWN IMPORTED)
			set_target_properties (Theora::theorafile PROPERTIES
				INTERFACE_INCLUDE_DIRECTORIES "${Theora_File_INCLUDE_DIR}"
				IMPORTED_LOCATION "${Theora_File_LIBRARY}"
				INTERFACE_LINK_LIBRARIES Theora::theora
			)
		endif ()
	endif ()

endif ()

mark_as_advanced (Theora_Theora_INCLUDE_DIR Theora_Theora_LIBRARY)
mark_as_advanced (Theora_Dec_INCLUDE_DIR Theora_Dec_LIBRARY)
mark_as_advanced (Theora_File_INCLUDE_DIR Theora_File_LIBRARY)
