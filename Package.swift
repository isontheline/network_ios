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
            // Built by .github/workflows/build.yml on tag push (iOS, simulator and Mac Catalyst slices).
            // After tagging, copy the SHA 256 printed in the GitHub release notes here.
            url: "https://github.com/isontheline/network_ios/releases/download/v0.4/network_ios.xcframework.zip",
            checksum: "REPLACE-WITH-SHA256-FROM-THE-v0.4-RELEASE-NOTES"
        )
    ]
)
