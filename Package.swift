// swift-tools-version:5.3

import PackageDescription

let package = Package(
    name: "network_ios",
    products: [
        .library(name: "network_ios", targets: ["network_ios"])
    ],
    dependencies: [
    ],
    targets: [
        .binaryTarget(
            name: "network_ios",
            url: "https://github.com/holzschu/network_ios/releases/download/v0.3/network_ios.xcframework.zip",
            checksum: "9fe5f119b2d5568d2255e2540f36e76525bfbeaeda58f32f02592ca8d74f4178"
        )
    ]
)
