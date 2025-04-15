// swift-tools-version: 5.10
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "MoproFFI",
    platforms: [
        .macOS(.v10_15),
        .iOS(.v15),
    ],
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "MoproFFI",
            targets: ["MoproFFI"]),
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .target(
            name: "MoproFFI",
            dependencies: [
                .byName(name: "mopro")
            ],
            path: "Sources/"),
        .binaryTarget(
            name: "mopro",
            path: "Sources/MoproiOSBindings/MoproBindings.xcframework.zip"
        ),
        .testTarget(
            name: "MoproFFITests",
            dependencies: ["MoproFFI"],
            path: "Tests/",
            resources: [
                .process("MoproAssets/zkemail_input.json"),
                .process("MoproAssets/srs.local")
            ]
        )
    ]
)
