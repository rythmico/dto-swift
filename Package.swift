// swift-tools-version:5.5
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "RythmicoDTO",
    platforms: [
        .iOS(.v13),
        .macOS(.v10_15),
    ],
    products: [
        .library(name: "RythmicoDTO", targets: ["RythmicoDTO"]),
        .library(name: "StudentDTO", targets: ["StudentDTO"]),
        .library(name: "TutorDTO", targets: ["TutorDTO"]),
        .library(name: "CoreDTO", targets: ["CoreDTO"]),
    ],
    targets: [
        .target(name: "RythmicoDTO", dependencies: [
            .target(name: "StudentDTO"),
            .target(name: "TutorDTO"),
        ]),

        .target(name: "StudentDTO", dependencies: [
            .target(name: "CoreDTO"),
        ]),
        .testTarget(name: "StudentDTOTests", dependencies: [
            .target(name: "StudentDTO"),
            .product(name: "XCTJSONKit", package: "XCTJSONKit"),
        ]),

        .target(name: "TutorDTO", dependencies: [
            .target(name: "CoreDTO"),
        ]),
        .testTarget(name: "TutorDTOTests", dependencies: [
            .target(name: "TutorDTO"),
            .product(name: "XCTJSONKit", package: "XCTJSONKit"),
        ]),

        .target(name: "CoreDTO", dependencies: [
            .product(name: "FoundationEncore", package: "FoundationEncore"),
        ]),
        .testTarget(name: "CoreDTOTests", dependencies: [
            .target(name: "CoreDTO"),
            .product(name: "XCTJSONKit", package: "XCTJSONKit"),
        ]),
    ]
)

package.dependencies = [
    .package(url: "https://github.com/rythmico/FoundationEncore", .branch("main")),
    .package(url: "https://github.com/davdroman/XCTJSONKit", .branch("main")),
]
