// swift-tools-version: 6.0
import PackageDescription

let package = Package(
    name: "AppIntentsPro",
    platforms: [.iOS(.v18), .macOS(.v15), .watchOS(.v11)],
    products: [
        .library(name: "AppIntentsPro", targets: ["AppIntentsPro"]),
    ],
    targets: [
        .target(name: "AppIntentsPro"),
        .testTarget(name: "AppIntentsProTests", dependencies: ["AppIntentsPro"]),
    ]
)
