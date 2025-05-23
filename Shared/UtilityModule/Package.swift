// swift-tools-version: 6.1
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "UtilityModule",
    platforms: [.iOS(.v13), .macOS(.v10_15)],
    products: [
        .library(
            name: "UtilityModule",
            targets: ["UtilityModule"]),
    ],
    targets: [
        .target(
            name: "UtilityModule"),
        .testTarget(
            name: "UtilityModuleTests",
            dependencies: ["UtilityModule"]
        ),
    ]
)
