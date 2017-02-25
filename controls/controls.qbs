import qbs 1.0

DynamicLibrary {
    name: "Fluid.Controls"
    targetName: "fluidcontrols"

    Depends { name: "cpp" }
    Depends { name: "Qt"; submodules: ["gui", "quick"] }

    Group {
        name: "C++ sources"
        files: "*.cpp"
        fileTags: "source"
        overrideTags: false
    }

    Group {
        name: "C++ headers"
        files: "*.h"
        fileTags: "source"
        overrideTags: false
    }

    Group {
        name: "QML files"
        files: ["*.qml", "qmldir", "+material/*.qml"]
        fileTags: "source"
        overrideTags: false
    }
}
