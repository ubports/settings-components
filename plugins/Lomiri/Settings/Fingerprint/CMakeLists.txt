project(LomiriSettingsFingerprintQml)

include_directories(
    ${CMAKE_CURRENT_SOURCE_DIR}
    ${CMAKE_CURRENT_BINARY_DIR}
)
add_definitions(-DLOMIRISETTINGSFINGERPRINT_LIBRARY)
QT5_ADD_RESOURCES(assets assets.qrc)
add_library(LomiriSettingsFingerprintQml MODULE
    plugin.cpp
    lomirisettingsfingerprint.cpp
    ${assets}
)
target_link_libraries(LomiriSettingsFingerprintQml Qt5::Core Qt5::Qml Qt5::Quick)
add_usc_plugin(Lomiri.Settings.Fingerprint 0.1 Lomiri/Settings/Fingerprint TARGETS LomiriSettingsFingerprintQml)
