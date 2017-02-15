TEMPLATE = app
TARGET += tst_material
CONFIG += qmltestcase
QT += quickcontrols2

DEFINES += QUICK_TEST_SOURCE_DIR=\\\"$$FLUID_SOURCE_TREE/tests/auto/controls\\\"

SOURCES += \
    $$PWD/material.cpp
