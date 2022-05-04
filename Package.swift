// swift-tools-version:5.3

import PackageDescription

let package = Package(
    name: "DSKit",
    platforms: [
            .iOS(.v13),
        ],
    products: [
        // Products define the executables and libraries a package produces, and make them visible to other packages.
        .library(name: "DSKit", targets: ["DSKit"]),
        .library(name: "DSKitCalendar", targets: ["DSKitCalendar"]),
        .library(name: "DSKitFakery", targets: ["DSKitFakery"]),
    ],
    dependencies: [
        // Dependencies declare other packages that this package depends on.
        .package(url: "https://github.com/robb/Cartography", from: "4.0.0"),
        .package(url: "https://github.com/imodeveloperlab/ActiveLabel.swift", from: "1.1.7"),
        .package(url: "https://github.com/onevcat/Kingfisher", from: "7.1.2"),
        .package(url: "https://github.com/vadymmarkov/Fakery", from: "5.1.0"),
        .package(url: "https://github.com/airbnb/HorizonCalendar.git", from: "1.13.3"),
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages this package depends on.
        .target(
            name: "DSKit",
            dependencies: ["Cartography",
                           "Kingfisher",
                            .product(name: "ActiveLabel", package: "ActiveLabel.swift")]
        ),
        .target(
            name: "DSKitFakery",
            dependencies: ["Fakery"]),
        .target(
            name: "DSKitCalendar",
            dependencies: ["DSKit", "HorizonCalendar"]),
        .testTarget(
            name: "DSKitTests",
            dependencies: ["DSKit"]),
    ]
)
