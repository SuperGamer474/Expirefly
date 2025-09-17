// swift-tools-version:5.10
import PackageDescription

let package = Package(
    name: "expirefly",
    platforms: [
        .iOS(.v16)
    ],
    products: [
        .library(name: "expirefly", targets: ["expirefly"]),
    ],
    dependencies: [
        .package(url: "https://source.skip.tools/skip.git", from: "1.6.18"),
        .package(url: "https://source.skip.tools/skip-fuse.git", from: "1.0.2"),
        .package(url: "https://source.skip.tools/skip-fuse-ui.git", from: "1.10.0"),
    ],
    targets: [
        .target(
            name: "expirefly",
            dependencies: [
                .product(name: "SkipFuseUI", package: "skip-fuse-ui"),
            ],
            path: "Sources/expirefly",
            plugins: [.plugin(name: "skipstone", package: "skip")]
        )
    ]
)