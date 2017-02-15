TEMPLATE = app
TARGET += tst_core
CONFIG += qmltestcase

DEFINES += QUICK_TEST_SOURCE_DIR=\\\"$$FLUID_SOURCE_TREE/tests/auto/controls\\\"

SOURCES += \
    $$PWD/core.cpp
