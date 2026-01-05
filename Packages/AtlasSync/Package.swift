// swift-tools-version: 6.2
import PackageDescription

let package = Package(
    name: "AtlasSync",
    platforms: [
        .iOS(.v17)
    ],
    products: [
        .library(
            name: "AtlasSync",
            targets: ["AtlasSync"]
        ),
    ],
    dependencies: [
        .package(path: "../AtlasCore"),
        .package(path: "../AtlasNetworking"),
        .package(path: "../AtlasStorage")
    ],
    targets: [
        .target(
            name: "AtlasSync",
            dependencies: [
                "AtlasCore",
                "AtlasNetworking",
                "AtlasStorage"
            ]
        ),
        .testTarget(
            name: "AtlasSyncTests",
            dependencies: ["AtlasSync"]
        ),
    ]
)
