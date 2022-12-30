// swift-tools-version: 5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "BHLSwiftUIHelpers",
    platforms: [
        .iOS(.v15),
        .macOS(.v12),
    ],
    products: [
        .library(
            name: "BHLSwiftUIHelpers",
            targets: ["BHLSwiftUIHelpers"]),
    ],
    dependencies: [
    ],
    targets: [
        .target(
            name: "BHLSwiftUIHelpers",
            dependencies: []),
        .testTarget(
            name: "BHLSwiftUIHelpersTests",
            dependencies: ["BHLSwiftUIHelpers"]),
    ]
)
