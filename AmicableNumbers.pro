#-------------------------------------------------
#
# Project created by QtCreator 2016-02-19T01:54:21
#
#-------------------------------------------------

QT       += core gui

greaterThan(QT_MAJOR_VERSION, 4): QT += widgets

TARGET = AmicableNumbers
TEMPLATE = app

SOURCES += main.cpp\
        mainwindow.cpp \
    worker.cpp \
    conststrings.cpp \
    dialogabout.cpp

HEADERS  += mainwindow.h \
    worker.h \
    conststrings.h \
    dialogabout.h

FORMS    += mainwindow.ui \
    dialogabout.ui

macx:ICON = my_app.icns

RC_FILE = myapp.rc

DISTFILES += \
    my_app.ico \
    android/AndroidManifest.xml \
    android/gradle/wrapper/gradle-wrapper.jar \
    android/gradlew \
    android/res/values/libs.xml \
    android/build.gradle \
    android/gradle/wrapper/gradle-wrapper.properties \
    android/gradlew.bat

RESOURCES += \
    AmicableNumbers.qrc

ANDROID_PACKAGE_SOURCE_DIR = $$PWD/android
