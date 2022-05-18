// swift-tools-version:5.5
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "CalendarTemplate",
    platforms: [
        .iOS(.v14)
    ],
    products: [
        .library(
            name: "CalendarTemplate",
            targets: ["CalendarTemplate"]),
    ],
    targets: [
        .target(
            name: "CalendarTemplate",
            dependencies: []),
        .testTarget(
            name: "CalendarTemplateTests",
            dependencies: ["CalendarTemplate"]),
    ]
)
