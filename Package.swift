// swift-tools-version: 6.2

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
