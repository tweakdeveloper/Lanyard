// swift-tools-version: 6.0

import PackageDescription

let package = Package(
  name: "Lanyard",
  platforms: [.iOS(.v13)],
  products: [.library(name: "Lanyard", targets: ["Lanyard"])],
  dependencies: [
    .package(url: "https://github.com/apple/swift-docc-plugin", from: "1.0.0")
  ],
  targets: [
    .target(name: "Lanyard"),
    .testTarget(name: "LanyardTests", dependencies: ["Lanyard"]),
  ],
  swiftLanguageModes: [.version("6")]
)
