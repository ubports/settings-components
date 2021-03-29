add_subdirectory(Style)

project(LomiriSettingsMenusQml)

add_definitions(-DLOMIRISETTINGSCOMPONENTS_LIBRARY)

add_library(LomiriSettingsMenusQml MODULE
    plugin.cpp
    types.h
    ${LomiriSettingsMenusQml_SOURCES}
)

target_link_libraries(LomiriSettingsMenusQml
    Qt5::Core
    Qt5::Qml
    Qt5::Quick
    ${GLIB_LIBRARIES}
    ${GIO_LIBRARIES}
    ${QMENUMODEL_LDFLAGS}
    ${LIBUPSTART_LIBRARIES}
)

add_lsc_plugin(Lomiri.Settings.Menus 0.1 Lomiri/Settings/Menus TARGETS LomiriSettingsMenusQml)
