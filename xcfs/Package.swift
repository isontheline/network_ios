// swift-tools-version:5.3
import PackageDescription

_ = Package(
    name: "xcfs",
    platforms: [.macOS("11")],
    dependencies: [
        .package(url: "https://github.com/blinksh/FMake", from: "0.0.16")
    ],
    
    targets: [
        .binaryTarget(
            name: "ios_system",
            url: "https://github.com/holzschu/ios_system/releases/download/v3.0.6/ios_system.xcframework.zip",
            checksum: "c9c6dc4cde45cc271ccc8bd0553ce4d3149eced1f0ee3d9e0ce01885d93526e6"
        ),
        .target(
            name: "build",
            dependencies: ["FMake"]
        ),
    ]
)
