// swift-tools-version: 6.2
import PackageDescription

let package = Package(
    name: "AtlasStorage",
    platforms: [
        .iOS(.v17)
    ],
    products: [
        .library(
            name: "AtlasStorage",
            targets: ["AtlasStorage"]
        ),
    ],
    dependencies: [
        .package(path: "../AtlasCore")
    ],
    targets: [
        .target(
            name: "AtlasStorage",
            dependencies: [
                "AtlasCore"
            ]
        ),
        .testTarget(
            name: "AtlasStorageTests",
            dependencies: ["AtlasStorage"]
        ),
    ]
)
