project(LomiriSettingsComponentsQml)

add_definitions(-DLOMIRISETTINGSCOMPONENTS_LIBRARY)

add_library(LomiriSettingsComponentsQml MODULE
    plugin.cpp
    serverpropertysynchroniser.cpp
)

target_link_libraries(LomiriSettingsComponentsQml
    Qt5::Core
    Qt5::Qml
    Qt5::Quick
)

add_lsc_plugin(Lomiri.Settings.Components 0.1 Lomiri/Settings/Components TARGETS LomiriSettingsComponentsQml)
