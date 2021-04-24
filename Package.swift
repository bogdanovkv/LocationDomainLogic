// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "LocationDomainLogic",
    products: [
        // Products define the executables and libraries a package produces, and make them visible to other packages.
        .library(
            name: "LocationDomainLogic",
            targets: ["LocationDomainLogic"]),
    ],
    dependencies: [
        // Dependencies declare other packages that this package depends on.
		.package(url: "https://github.com/bogdanovkv/LocationDomainAbstraction.git", from: "1.0.0"),
		.package(url: "https://github.com/bogdanovkv/LocationRepositoryAbstraction.git", from: "1.0.0"),
		.package(url: "https://github.com/bogdanovkv/DomainAbstraction.git", from: "1.0.0"),
		.package(url: "https://github.com/bogdanovkv/UserSettingsRepositoryAbstraction.git", from: "1.0.0"),
	],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages this package depends on.
        .target(
            name: "LocationDomainLogic",
			dependencies: [.byName(name: "LocationRepositoryAbstraction"),
						   .byName(name: "LocationDomainAbstraction"),
						   .byName(name: "DomainAbstraction"),
						   .byName(name: "UserSettingsRepositoryAbstraction")]),
        .testTarget(
            name: "LocationDomainLogicTests",
            dependencies: ["LocationDomainLogic"]),
    ]
)
