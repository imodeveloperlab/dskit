// swift-tools-version:5.5
import PackageDescription

let package = Package(
    name: "DSKit",
    platforms: [
        .iOS(.v15)
    ],
    products: [
        .library(name: "DSKit", targets: ["DSKit"]),
    ],
    dependencies: [
        // Here, the .git suffix is acceptable because it's part of the URL
        .package(url: "https://github.com/SDWebImage/SDWebImageSwiftUI.git", from: "2.2.6")
    ],
    targets: [
        .target(
            name: "DSKit",
            dependencies: [
                // Corrected: Refer to the package by its name without the .git suffix
                .product(name: "SDWebImageSwiftUI", package: "SDWebImageSwiftUI")
            ]
        )
    ]
)
