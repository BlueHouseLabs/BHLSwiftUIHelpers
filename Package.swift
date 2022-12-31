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
        .package(url: "https://github.com/BlueHouseLabs/BHLSwiftHelpers.git", from: "0.1.0"),
    ],
    targets: [
        .target(
            name: "BHLSwiftUIHelpers",
            dependencies: [
                .product(name: "BHLSwiftHelpers", package: "BHLSwiftHelpers"),
            ]),
        .testTarget(
            name: "BHLSwiftUIHelpersTests",
            dependencies: ["BHLSwiftUIHelpers"]),
    ]
)
