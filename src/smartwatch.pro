TEMPLATE = app
TARGET = SmartDrumKit

QT += qml quick bluetooth sensors xml network

CONFIG += C++11


SOURCES += main.cpp

RESOURCES += qml.qrc

OTHER_FILES += \
            $$files(*.qml)

# Additional import path used to resolve QML modules in Qt Creator's code model
# QML_IMPORT_PATH =

# Default rules for deployment.
# include(deployment.pri)

ANDROID_PACKAGE_SOURCE_DIR = $$PWD/android

HEADERS +=

