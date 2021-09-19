// swift-tools-version:5.4
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

        .target(
            name: "XCTJSONKit",
            dependencies: [.product(name: "CustomDump", package: "swift-custom-dump")],
            linkerSettings: [.linkedFramework("XCTest")]
        ),
        .testTarget(name: "XCTJSONKitTests", dependencies: [
            .target(name: "XCTJSONKit"),
        ]),
    ]
)

package.dependencies = [
    .package(url: "https://github.com/pointfreeco/swift-custom-dump", from: "0.1.3"),
]
