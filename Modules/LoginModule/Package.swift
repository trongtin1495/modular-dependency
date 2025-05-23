// swift-tools-version: 6.1
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "LoginModule",
    platforms: [.iOS(.v13), .macOS(.v10_15)],
    products: [
        .library(
            name: "LoginModule",
            targets: ["LoginModule"]),
    ],
    dependencies: [
        .package(path: "../CommonModule"),
        .package(path: "../../Shared/UtilityModule")
    ],
    targets: [
        .target(
            name: "LoginModule",
            dependencies: [
                "CommonModule", "UtilityModule"
            ]
        ),
        .testTarget(
            name: "LoginModuleTests",
            dependencies: ["LoginModule"]
        ),
    ]
)
