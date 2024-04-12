// swift-tools-version:5.3

import PackageDescription

let package = Package(
    name: "DSKit",
    platforms: [
        .iOS(.v13),
    ],
    products: [
        .library(name: "DSKit", targets: ["DSKit"]),
        .library(name: "DSKitSwiftUI", targets: ["DSKitSwiftUI"]),
        .library(name: "DSKitCalendar", targets: ["DSKitCalendar"]),
        .library(name: "DSKitFakery", targets: ["DSKitFakery"]),
    ],
    dependencies: [
        .package(url: "https://github.com/robb/Cartography", from: "4.0.0"),
        .package(url: "https://github.com/imodeveloperlab/ActiveLabel.swift", from: "1.1.7"),
        .package(url: "https://github.com/onevcat/Kingfisher", from: "7.10.1"),
        .package(url: "https://github.com/vadymmarkov/Fakery", from: "5.1.0"),
        .package(url: "https://github.com/airbnb/HorizonCalendar.git", from: "1.13.3"),
        .package(url: "https://github.com/SDWebImage/SDWebImageSwiftUI.git", from: "2.2.6")
    ],
    targets: [
        .target(
            name: "DSKit",
            dependencies: ["Cartography", "Kingfisher", .product(name: "ActiveLabel", package: "ActiveLabel.swift")],
            path: "UIKit/Sources/DSKit",
            resources: [
                .process("Appearance/Fonts/Noteworthy.plist"),
                .process("Appearance/Fonts/HoeflerText.plist")
            ]
        ),
        .target(
            name: "DSKitSwiftUI",
            dependencies: [
                .product(name: "SDWebImageSwiftUI", package: "SDWebImageSwiftUI.git")
            ],
            path: "SwiftUI/Sources"
        ),
        .target(
            name: "DSKitFakery",
            dependencies: ["Fakery"],
            path: "UIKit/Sources/DSKitFakery"
        ),
        .target(
            name: "DSKitCalendar",
            dependencies: ["DSKit", "HorizonCalendar"],
            path: "UIKit/Sources/DSKitCalendar"
        ),
        .testTarget(
            name: "DSKitTests",
            dependencies: ["DSKit"],
            path: "UIKit/Tests/DSKitTests"
        ),
    ]
)
