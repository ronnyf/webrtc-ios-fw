// swift-tools-version: 5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "libavcodec",
    products: [
        .library(
            name: "libavcodec",
            targets: ["libavcodec"]),
    ],
    targets: [
        .target(
            name: "libavcodec",
			path: "Sources",
			exclude: [
				"libavcodec/Makefile",
			],
			sources: [
				"libavcodec/",
				"libavutil/",
			],
			publicHeadersPath: "./"
		),
        .testTarget(
            name: "libavcodecTests",
            dependencies: ["libavcodec"]),
    ],
	cLanguageStandard: .gnu11,
	cxxLanguageStandard: .cxx20
)
