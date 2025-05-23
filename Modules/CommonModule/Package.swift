// swift-tools-version: 6.1
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "CommonModule",
    platforms: [.iOS(.v13), .macOS(.v10_15)],
    products: [
        .library(
            name: "CommonModule",
            targets: ["CommonModule"]),
    ],
    dependencies: [
        .package(url: "https://github.com/Swinject/Swinject", from: "2.9.1"),
    ],
    targets: [
        .target(
            name: "CommonModule",
            dependencies: ["Swinject"]
        ),
        .testTarget(
            name: "CommonModuleTests",
            dependencies: ["CommonModule"]
        ),
    ]
)
