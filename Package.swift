// swift-tools-version:5.4
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "RythmicoDTO",
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
    ]
)
