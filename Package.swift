// swift-tools-version: 6.4

import PackageDescription

let package = Package(
    name: "swift-symmetry-affine-geometry",
    platforms: [
        .macOS(.v27),
        .iOS(.v27),
        .tvOS(.v27),
        .watchOS(.v27),
        .visionOS(.v27),
    ],
    products: [
        .library(
            name: "Symmetry Affine Geometry",
            targets: ["Symmetry Affine Geometry"]
        ),
    ],
    dependencies: [
        .package(
            url: "https://github.com/swift-atoms/swift-symmetry.git",
            branch: "main"
        ),
        .package(
            url: "https://github.com/swift-molecules/swift-symmetry-linear.git",
            branch: "main"
        ),
        .package(
            url: "https://github.com/swift-molecules/swift-symmetry-dimension.git",
            branch: "main"
        ),
        .package(
            url: "https://github.com/swift-atoms/swift-affine.git",
            branch: "main"
        ),
        .package(
            url: "https://github.com/swift-atoms/swift-dimension.git",
            branch: "main"
        ),
        .package(
            url: "https://github.com/swift-atoms/swift-numeric.git",
            branch: "main"
        ),
        .package(
            url: "https://github.com/swift-atoms/swift-linear.git",
            branch: "main"
        ),
    ],
    targets: [
        .target(
            name: "Symmetry Affine Geometry",
            dependencies: [
                .product(name: "Symmetry", package: "swift-symmetry"),
                .product(name: "Symmetry Linear", package: "swift-symmetry-linear"),
                .product(name: "Affine", package: "swift-affine"),
                .product(name: "Dimension", package: "swift-dimension"),
            ]
        ),
        .testTarget(
            name: "Symmetry Affine Geometry Tests",
            dependencies: [
                "Symmetry Affine Geometry",
                .product(name: "Symmetry", package: "swift-symmetry"),
                .product(
                    name: "Symmetry Dimension",
                    package: "swift-symmetry-dimension"
                ),
                .product(name: "Affine", package: "swift-affine"),
                .product(name: "Dimension", package: "swift-dimension"),
                .product(name: "Linear", package: "swift-linear"),
                .product(name: "Numeric", package: "swift-numeric"),
                .product(
                    name: "Numeric Standard Library Integration",
                    package: "swift-numeric"
                ),
            ]
        ),
    ],
    swiftLanguageModes: [.v6]
)

for target in package.targets where ![.system, .binary, .plugin, .macro].contains(target.type) {
    let ecosystem: [SwiftSetting] = [
        .strictMemorySafety(),
        .enableUpcomingFeature("ExistentialAny"),
        .enableUpcomingFeature("InternalImportsByDefault"),
        .enableUpcomingFeature("MemberImportVisibility"),
        .enableUpcomingFeature("NonisolatedNonsendingByDefault"),
        .enableExperimentalFeature("Lifetimes"),
        .enableUpcomingFeature("InferIsolatedConformances"),
    ]

    let package: [SwiftSetting] = []

    target.swiftSettings = (target.swiftSettings ?? []) + ecosystem + package
}
