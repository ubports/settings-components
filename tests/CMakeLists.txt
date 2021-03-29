include(QmlTest)

# QML tests that require graphical capabilities.
add_custom_target(uitests)
add_custom_target(xvfbuitests)

add_custom_target(alltests)
add_dependencies(alltests uitests)

add_custom_target(xvfballtests)
add_dependencies(xvfballtests xvfbuitests)

add_subdirectory(utils)

set(LSC_PLUGINPATH "${CMAKE_BINARY_DIR}/plugins" CACHE PATH "Path to pre-built l-s-c plugin dir.")

set(LSC_IMPORT_PATHS
    ${CMAKE_BINARY_DIR}/tests/qmltests/mocks
    ${CMAKE_BINARY_DIR}/tests/utils/modules
    ${LSC_PLUGINPATH}
)

macro(lsc_parse_arguments)
    cmake_parse_arguments(LSCTEST
        "${QMLTEST_OPTIONS}"
        "${QMLTEST_SINGLE}"
        "${QMLTEST_MULTI}"
        ${ARGN}
    )

    set(environment
        UNITY_TESTING=1
        LANGUAGE=C
        LC_ALL=C.UTF-8
        UITK_ICON_THEME=suru
    )
endmacro()

# add a graphical qml test
# see QmlTest.cmake for additional options
function(add_lsc_qmltest PATH COMPONENT_NAME)
    lsc_parse_arguments(${ARGN})
    add_qml_test(${PATH} ${COMPONENT_NAME}
        DEPENDS LomiriSettingsTest
        IMPORT_PATHS ${LSC_IMPORT_PATHS}
        TARGETS uitests
        ${ARGN}
        ENVIRONMENT ${environment}
                    ${LSCTEST_ENVIRONMENT}
    )
endfunction()

add_subdirectory(imports)
add_subdirectory(qmltests)
