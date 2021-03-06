TEMPLATE = lib
TARGET = qml-ARToolkit
QT += qml quick multimedia
CONFIG += qt plugin c++11

CONFIG -= android_install

TARGET = $$qtLibraryTarget($$TARGET)
uri = ARToolkit

SOURCES += \
    qml-artoolkit_plugin.cpp \
    artoolkit.cpp \
    artoolkit_filter_runnable.cpp \
    artoolkit_video_filter.cpp \
    artoolkit_object.cpp

HEADERS += \
    qml-artoolkit_plugin.h \
    artoolkit.h \
    artoolkit_video_filter.h \
    artoolkit_filter_runnable.h \
    artoolkit_object.h

DISTFILES = qmldir \
    artoolkit.qmltypes

qmldir.files = qmldir artoolkit.qmltypes


installPath = $$[QT_INSTALL_QML]/$$replace(uri, \\., /)
qmldir.path = $$installPath
target.path = $$installPath
INSTALLS += target qmldir

#Change these paths according to your artoolkit directory
INCLUDEPATH += /home/chili/artoolkit5/include

android{
   LIBS+=  -L$$PWD/../../artoolkit5/android/libs/armeabi-v7a
   LIBS+=  -lARWrapper
}

!android{
    LIBS+= -L$$PWD/../../artoolkit5/lib -L$$PWD/../../artoolkit5/lib/linux-x86_64
    LIBS+= -lAR -lARICP -lARWrapper
}

#Define DEBUG_FPS if you want to print the fps
#DEFINES += DEBUG_FPS



#Remember to add make install in the build steps; in android remove the default steps make install and the build apk

#For android projects don't forget to add the libs into the apk
#    ANDROID_EXTRA_LIBS = \
#        $$PWD/../../artoolkit5/android/libs/armeabi-v7a/libc++_shared.so \
#        $$PWD/../../artoolkit5/android/libs/armeabi-v7a/libARWrapper.so
