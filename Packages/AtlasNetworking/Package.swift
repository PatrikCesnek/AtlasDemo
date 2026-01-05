// swift-tools-version: 6.2

import PackageDescription

let package = Package(
    name: "AtlasNetworking",
    platforms: [
        .iOS(.v17)
    ],
    products: [
        .library(
            name: "AtlasNetworking",
            targets: ["AtlasNetworking"]
        ),
    ],
    dependencies: [
        .package(path: "../AtlasCore")
    ],
    targets: [
        .target(
            name: "AtlasNetworking",
            dependencies: [
                "AtlasCore"
            ]
        ),
        .testTarget(
            name: "AtlasNetworkingTests",
            dependencies: ["AtlasNetworking"]
        ),
    ]
)
