TARGET = Fluid
MODULE = fluid

QT += core
QT_PRIVATE += core-private

#DEFINES += QT_NO_CAST_TO_ASCII QT_NO_CAST_FROM_ASCII

HEADERS += \
    fluidglobal.h

include(src.pri)
load(qt_module)
