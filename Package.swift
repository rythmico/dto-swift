// swift-tools-version:5.5
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "RythmicoDTO",
    platforms: [
        .macOS(.v10_15),
        .iOS(.v13),
    ],
    products: [
        .library(name: "RythmicoDTO", targets: ["RythmicoDTO"]),
        .library(name: "StudentDTO", targets: ["StudentDTO"]),
        .library(name: "TutorDTO", targets: ["TutorDTO"]),
    ],
    targets: [
        .target(name: "RythmicoDTO", dependencies: [
            .target(name: "StudentDTO"),
            .target(name: "TutorDTO"),
        ]),

        .target(name: "StudentDTO", dependencies: [
            .target(name: "CoreDTO"),
        ]),

        .target(name: "TutorDTO", dependencies: [
            .target(name: "CoreDTO"),
        ]),

        .target(name: "CoreDTO"),
        .testTarget(name: "CoreDTOTests", dependencies: [
            .target(name: "CoreDTO"),
            .product(name: "XCTJSONKit", package: "XCTJSONKit"),
        ]),
    ]
)

package.dependencies = [
    .package(url: "https://github.com/davdroman/XCTJSONKit", .branch("main")),
]
