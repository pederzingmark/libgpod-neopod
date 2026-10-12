// swift-tools-version:5.9
import PackageDescription

// libgpod (LGPL, see Sources/CGPod/COPYING.LGPL) as a dynamic library, so the app can ship it as a separate dylib users can replace.
// It needs GLib from Homebrew: `brew install glib`.
let glibInclude = ["-I/opt/homebrew/include/glib-2.0", "-I/opt/homebrew/lib/glib-2.0/include", "-I/opt/homebrew/opt/gettext/include", "-I/opt/homebrew/include/gdk-pixbuf-2.0"]

let package = Package(
    name: "GPod",
    platforms: [.macOS(.v14)],
    products: [.library(name: "gpod", type: .dynamic, targets: ["CGPod"])],
    targets: [
        .target(
            name: "CGPod",
            path: "Sources/CGPod",
            exclude: ["COPYING.LGPL"],
            cSettings: [
                .headerSearchPath("."),
                .define("HAVE_CONFIG_H"),
                .define("HAVE_LIBXML"),  // parses ExtendedSysInfoXml (cover formats); without it that file is silently ignored
                .unsafeFlags(["-I/usr/include/libxml2"]),
                .define("LIBGPOD_BLOB_DIR", to: "\"/nonexistent\""),
                .unsafeFlags(["-w"] + glibInclude),
            ],
            linkerSettings: [
                .unsafeFlags(["-L/opt/homebrew/lib", "-L/opt/homebrew/opt/gettext/lib"]),
                .linkedLibrary("glib-2.0"), .linkedLibrary("gobject-2.0"), .linkedLibrary("gmodule-2.0"), .linkedLibrary("gdk_pixbuf-2.0"), .linkedLibrary("intl"), .linkedLibrary("z"), .linkedLibrary("xml2"),
            ]
        ),
    ]
)
