import qbs 1.0

DynamicLibrary {
    name: "Fluid.Core"
    targetName: "fluidcore"

    Depends { name: "cpp" }
    Depends { name: "Qt"; submodules: ["svg", "gui", "quick"] }
    Depends { name: "libFluid" }

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
        files: ["*.qml", "qmldir"]
        fileTags: "source"
        overrideTags: false
    }
}
