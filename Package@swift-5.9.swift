// swift-tools-version: 5.9

import PackageDescription

let package = Package(
	name: "swift-result-builders",
	products: [
		.library(
			name: "ArrayBuilder",
			targets: ["ArrayBuilder"]
		),
	],
	targets: [
		.target(name: "ArrayBuilder"),
		.testTarget(
			name: "ArrayBuilderTests",
			dependencies: [
				.target(name: "ArrayBuilder")
			]
		),
	]
)
