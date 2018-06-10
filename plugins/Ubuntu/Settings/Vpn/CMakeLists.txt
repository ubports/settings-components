project(UbuntuSettingsVpn)

add_subdirectory(Openvpn)
add_subdirectory(Pptp)
add_subdirectory(PreviewDialog)

find_package(Qt5Core REQUIRED)

include_directories(
    ${CMAKE_CURRENT_SOURCE_DIR}
    ${CMAKE_CURRENT_BINARY_DIR}
)

add_definitions(-DUBUNTUSETTINGSCOMPONENTS_LIBRARY)

add_library(UbuntuSettingsVpn MODULE
    plugin.cpp
    ubuntusettingsvpn.cpp
)

target_link_libraries(UbuntuSettingsVpn Qt5::Core Qt5::Qml Qt5::Quick)

add_usc_plugin(Ubuntu.Settings.Vpn 0.1 Ubuntu/Settings/Vpn TARGETS UbuntuSettingsVpn)
