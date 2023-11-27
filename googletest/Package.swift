// swift-tools-version: 5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "googletest",
    products: [
        .library(
            name: "googletest",
            targets: ["googletest"]),
		.library(
			name: "googlemock",
			targets: ["googlemock"]),
		.executable(
			name: "gtest",
			targets: ["gtest_main"]),
		.executable(
			name: "gmock",
			targets: ["gmock_main"]),
    ],
    targets: [
        .target(
            name: "googletest",
			path: "googletest",
			exclude: [
				"src/gtest_main.cc",
				"src/gtest-all.cc",
			],
			sources: [
				"src"
			],
			publicHeadersPath: "include",
			cSettings: [
				.headerSearchPath("."),
			]
		),
		.target(
			name: "googlemock",
			dependencies: [
				"googletest",
			],
			path: "googlemock",
			exclude: [
				"src/gmock-all.cc",
				"src/gmock_main.cc",
			],
			sources: [
				"src"
			],
			publicHeadersPath: "include"
		),
		.executableTarget(
			name: "gtest_main",
			dependencies: [
				"googletest",
			],
			path: "googletest",
			sources: [
				"src/gtest_main.cc"
			],
			publicHeadersPath: "include",
			cSettings: [
				.headerSearchPath("."),
			]
		),
		.executableTarget(
			name: "gmock_main",
			dependencies: [
				"googlemock",
			],
			path: "googlemock",
			sources: [
				"src/gmock_main.cc"
			],
			publicHeadersPath: "include",
			cSettings: [
				.headerSearchPath("."),
			]
		),
    ],
	cLanguageStandard: .gnu11,
	cxxLanguageStandard: .gnucxx20
)
