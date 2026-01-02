// swift-tools-version: 6.2

import PackageDescription

let package = Package(
    name: "AtlasCore",
    platforms: [
        .iOS(.v17)
    ],
    products: [
        .library(
            name: "AtlasCore",
            targets: ["AtlasCore"]
        ),
    ],
    dependencies: [ ],
    targets: [
        .target(
            name: "AtlasCore",
            dependencies: []
        ),
        .testTarget(
            name: "AtlasCoreTests",
            dependencies: ["AtlasCore"]
        ),
    ]
)
