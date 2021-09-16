// swift-tools-version:5.4
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "RythmicoDTOs",
    products: [
        .library(name: "RythmicoDTOs", targets: ["RythmicoDTOs"]),
        .library(name: "StudentDTOs", targets: ["StudentDTOs"]),
        .library(name: "TutorDTOs", targets: ["TutorDTOs"]),
    ],
    targets: [
        .target(name: "RythmicoDTOs", dependencies: [
            .target(name: "StudentDTOs"),
            .target(name: "TutorDTOs"),
        ]),
        .target(name: "StudentDTOs", dependencies: [
            .target(name: "CoreDTOs"),
        ]),
        .target(name: "TutorDTOs", dependencies: [
            .target(name: "CoreDTOs"),
        ]),
        .target(name: "CoreDTOs"),
    ]
)
