# SPDX-FileCopyrightText: 2023 yuzu Emulator Project
# SPDX-License-Identifier: GPL-2.0-or-later

if (MSVC)
    option(YUZU_VCPKG_AUTO_UPDATE "Auto update the vcpkg submodule during CMake configure" ON)
else()
    option(YUZU_VCPKG_AUTO_UPDATE "Auto update the vcpkg submodule during CMake configure" OFF)
endif()

if (YUZU_VCPKG_AUTO_UPDATE)
    find_package(Git QUIET)
    if (Git_FOUND)
        message(STATUS "Updating vcpkg submodule")
        execute_process(
            COMMAND ${GIT_EXECUTABLE} submodule update --init externals/vcpkg
            WORKING_DIRECTORY ${PROJECT_SOURCE_DIR}
            RESULT_VARIABLE GIT_SUBMODULE_RESULT
        )
        if (NOT GIT_SUBMODULE_RESULT EQUAL 0)
            message(WARNING "vcpkg submodule update failed with exit code ${GIT_SUBMODULE_RESULT}")
        endif()
    else()
        message(WARNING "Git not found, cannot auto-update vcpkg submodule")
    endif()
endif()
