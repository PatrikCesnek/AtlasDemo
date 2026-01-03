// swift-tools-version: 6.2
import PackageDescription

let package = Package(
    name: "AtlasMap",
    platforms: [
        .iOS(.v17)
    ],
    products: [
        .library(
            name: "AtlasMap",
            targets: ["AtlasMap"]
        ),
    ],
    dependencies: [
        .package(path: "../AtlasCore"),
        .package(path: "../AtlasStorage"),
        .package(path: "../AtlasSync")
    ],
    targets: [
        .target(
            name: "AtlasMap",
            dependencies: [
                "AtlasCore",
                "AtlasStorage",
                "AtlasSync"
            ]
        ),
        .testTarget(
            name: "AtlasMapTests",
            dependencies: ["AtlasMap"]
        ),
    ]
)
