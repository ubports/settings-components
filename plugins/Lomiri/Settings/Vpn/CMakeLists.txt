project(LomiriSettingsVpn)

add_subdirectory(Openvpn)
add_subdirectory(Pptp)
add_subdirectory(PreviewDialog)

find_package(Qt5Core REQUIRED)

include_directories(
    ${CMAKE_CURRENT_SOURCE_DIR}
    ${CMAKE_CURRENT_BINARY_DIR}
)

add_definitions(-DLOMIRISETTINGSCOMPONENTS_LIBRARY)

add_library(LomiriSettingsVpn MODULE
    plugin.cpp
    lomirisettingsvpn.cpp
)

target_link_libraries(LomiriSettingsVpn Qt5::Core Qt5::Qml Qt5::Quick)

add_usc_plugin(Lomiri.Settings.Vpn 0.1 Lomiri/Settings/Vpn TARGETS LomiriSettingsVpn)
