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
    dependencies: [
        .package(url: "https://github.com/apple/swift-collections", exact: "1.2.0")
    ],
    targets: [
        .target(name: "Core", dependencies: [
            .product(name: "HeapModule", package: "swift-collections")
        ]),
        .target(name: "Fundamentals", dependencies: ["Core"]),
        .target(name: "Neetcode", dependencies: ["Core"]),
        .target(name: "TestingCore", dependencies: []),
        .testTarget(
            name: "NeetcodeTests",
            dependencies: ["TestingCore", "Neetcode"]
        ),
    ]
)
