import qbs 1.0

DynamicLibrary {
    name: "libFluid"
    targetName: "Fluid"

    Depends { name: "cpp" }
    Depends { name: "Qt"; submodules: ["core"] }

    Export {
        Depends { name: "cpp" }
        cpp.includePaths: [product.sourceDirectory]
    }

    Group {
        name: "C++ sources"
        files: [
            "*.cpp"
        ]
        fileTags: "source"
        overrideTags: false
    }

    Group {
        name: "C++ headers"
        files: [
            "*.h"
        ]
        fileTags: "source"
        overrideTags: false
    }
}
