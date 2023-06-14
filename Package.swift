// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "SyntaxHighlighter",
    platforms: [
        .macOS("13"),
        .iOS("16"),
    ],
    products: [
        .library(name: "SyntaxHighlighter", targets: ["SyntaxHighlighter"]),
    ],
    dependencies: [
        .package(url: "https://github.com/schwa/Everything", branch: "main"),
        .package(url: "https://github.com/schwa/swift-tree-sitter", branch: "jwight/cpp_support"),
        .package(url: "https://github.com/apple/swift-syntax", branch: "main"),
    ],
    targets: [
        .target(
            name: "SyntaxHighlighter",
            dependencies: [
                "Everything",
                .product(name: "SwiftTreeSitter", package: "swift-tree-sitter"),
                .product(name: "SwiftSyntax", package: "Swift-Syntax"),
                .product(name: "SwiftParser", package: "Swift-Syntax"),
            ],
            resources: [
                .copy("Themes/Bare.xccolortheme"),
                .copy("Themes/Basic.xccolortheme"),
                .copy("Themes/Civic.xccolortheme"),
                .copy("Themes/Classic (Dark).xccolortheme"),
                .copy("Themes/Classic (Light).xccolortheme"),
                .copy("Themes/Default (Dark).xccolortheme"),
                .copy("Themes/Default (Light).xccolortheme"),
                .copy("Themes/Dusk.xccolortheme"),
                .copy("Themes/High Contrast (Dark).xccolortheme"),
                .copy("Themes/High Contrast (Light).xccolortheme"),
                .copy("Themes/Low Key.xccolortheme"),
                .copy("Themes/Midnight.xccolortheme"),
                .copy("Themes/Presentation (Dark).xccolortheme"),
                .copy("Themes/Presentation (Light).xccolortheme"),
                .copy("Themes/Presentation Large (Dark).xccolortheme"),
                .copy("Themes/Presentation Large (Light).xccolortheme"),
                .copy("Themes/Printing.xccolortheme"),
                .copy("Themes/Spartan.xccolortheme"),
                .copy("Themes/Sunset.xccolortheme"),
            ]
        ),
        .testTarget(
            name: "SyntaxHighlighterTests",
            dependencies: ["SyntaxHighlighter"]
        ),
    ]
)
