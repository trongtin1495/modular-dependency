// swift-tools-version: 6.1
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "HomeModule",
    platforms: [.iOS(.v13), .macOS(.v10_15)],
    products: [
        .library(
            name: "HomeModule",
            targets: ["HomeModule"]),
    ],
    dependencies: [
        .package(path: "../CommonModule"),
        .package(path: "../../Shared/UtilityModule")
    ],
    targets: [
        .target(
            name: "HomeModule",
            dependencies: [
                "CommonModule", "UtilityModule"
            ]),
        .testTarget(
            name: "HomeModuleTests",
            dependencies: ["HomeModule"]
        ),
    ]
)
