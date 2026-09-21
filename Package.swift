// swift-tools-version: 5.9
import PackageDescription

let package = Package(
    name: "SensiAuraKeys",
    platforms: [
        .iOS(.v13)
    ],
    products: [
        .library(name: "SensiAuraKeys", type: .dynamic, targets: ["SensiAuraKeys"])
    ],
    targets: [
        .target(name: "SensiAuraKeys", path: "Sources/SensiAuraKeys"),
        .testTarget(name: "SensiAuraKeysTests", dependencies: ["SensiAuraKeys"], path: "Tests/SensiAuraKeysTests")
    ]
)
