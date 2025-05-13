// swift-tools-version: 6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "DSA",
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "DSA",
            targets: ["Neetcode"]),
    ],
    targets: [
        .target(name: "TestingCore"),
        .target(name: "Neetcode"),
        .testTarget(
            name: "NeetcodeTests",
            dependencies: ["TestingCore", "Neetcode"]
        ),
    ]
)
