// swift-tools-version:5.9
// (Xcode15.0+)

import PackageDescription

let package = Package(
    name: "LiveKit",
    platforms: [
        .iOS(.v13),
        .macOS(.v10_15),
        .macCatalyst(.v14),
        .visionOS(.v1),
        .tvOS(.v17),
    ],
    products: [
        .library(
            name: "LiveKit",
            targets: ["LiveKit"]
        ),
    ],
    dependencies: [
        // LOCAL WebRTC XCFramework (with USB device protection)
        .package(url: "https://github.com/apple/swift-protobuf.git", from: "1.29.0"),
        .package(url: "https://github.com/apple/swift-log.git", from: "1.6.2"),
        .package(url: "https://github.com/apple/swift-collections.git", from: "1.1.0"),
        // Only used for DocC generation
        .package(url: "https://github.com/apple/swift-docc-plugin.git", from: "1.3.0"),
        // Only used for Testing
        .package(url: "https://github.com/vapor/jwt-kit.git", from: "4.13.4"),
    ],
    targets: [
        .target(
            name: "LKObjCHelpers",
            publicHeadersPath: "include"
        ),
        .binaryTarget(
            name: "LiveKitWebRTC",
            path: "Frameworks/LiveKitWebRTC.xcframework"
        ),
        .target(
            name: "LiveKit",
            dependencies: [
                "LiveKitWebRTC",
                .product(name: "SwiftProtobuf", package: "swift-protobuf"),
                .product(name: "DequeModule", package: "swift-collections"),
                .product(name: "OrderedCollections", package: "swift-collections"),
                .product(name: "Logging", package: "swift-log"),
                "LKObjCHelpers",
            ],
            exclude: [
                "Broadcast/NOTICE",
            ],
            resources: [
                .process("PrivacyInfo.xcprivacy"),
            ],
            swiftSettings: [
                .enableExperimentalFeature("AccessLevelOnImport"),
            ]
        ),
        .testTarget(
            name: "LiveKitTests",
            dependencies: [
                "LiveKit",
                .product(name: "JWTKit", package: "jwt-kit"),
            ]
        ),
        .testTarget(
            name: "LiveKitTestsObjC",
            dependencies: [
                "LiveKit",
                .product(name: "JWTKit", package: "jwt-kit"),
            ]
        ),
    ],
    swiftLanguageVersions: [
        .v5,
    ]
)
