// swift-tools-version:5.6
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "DTO",
    platforms: [
        .iOS(.v13),
        .macOS(.v10_15),
    ],
    products: [
        .library(name: "DTO", targets: ["DTO"]),
        .library(name: "StudentDTO", targets: ["StudentDTO"]),
        .library(name: "TutorDTO", targets: ["TutorDTO"]),
        .library(name: "CoreDTO", targets: ["CoreDTO"]),
    ],
    targets: [
        .target(name: "DTO", dependencies: [
            .target(name: "StudentDTO"),
            .target(name: "TutorDTO"),
        ]),

        .target(name: "StudentDTO", dependencies: [
            .target(name: "CoreDTO"),
        ]),
        .testTarget(name: "StudentDTOTests", dependencies: [
            .target(name: "StudentDTO"),
            .target(name: "XCTDTOKit"),
        ]),

        .target(name: "TutorDTO", dependencies: [
            .target(name: "CoreDTO"),
        ]),
        .testTarget(name: "TutorDTOTests", dependencies: [
            .target(name: "TutorDTO"),
            .target(name: "XCTDTOKit"),
        ]),

        .target(name: "CoreDTO", dependencies: [
            .product(name: "FoundationEncore", package: "swift-foundation-encore"),
        ]),
        .testTarget(name: "CoreDTOTests", dependencies: [
            .target(name: "CoreDTO"),
            .target(name: "XCTDTOKit"),
        ]),

        .target(name: "XCTDTOKit", dependencies: [
            .product(name: "FoundationEncore", package: "swift-foundation-encore"),
            .product(name: "XCTJSONKit", package: "XCTJSONKit"),
        ]),
    ]
)

package.dependencies = [
    .package(url: "https://github.com/rythmico/swift-foundation-encore", branch: "main"),
    .package(url: "https://github.com/davdroman/XCTJSONKit", branch: "main"),
]
