# swift-result-builders

[![SwiftPM 6.2](https://img.shields.io/badge/swiftpm-6.2-ED523F.svg?style=flat)](https://swift.org/download/) ![Platforms](https://img.shields.io/badge/Platforms-iOS_13_|_macOS_10.15_|_Catalyst_|_tvOS_14_|_watchOS_7-ED523F.svg?style=flat) [![@capture_context](https://img.shields.io/badge/contact-@capture__context-1DA1F2.svg?style=flat&logo=twitter)](https://twitter.com/capture_context)

## Products

- **[ArrayBuilder](./Sources/ArrayBuilder)**


## Usage

### ArrayBuilder

Create initializers for your own collections, here is an example of `IdentifiedArray` extension for [`swift-identified-collections`](https://github.com/pointfreeco/swift-identified-collections)

```swift
import IdentifiedCollections
import ArrayBuilder

extension IdentifiedArray {
  @inlinable
  public init(
    id: KeyPath<Element, ID>,
    @ArrayBuilder<Element> uniqueElements: () -> [Element]
  ) {
    self.init(id: id, uniqueElements: uniqueElements())
  }
}

extension IdentifiedArray where Element: Identifiable, ID == Element.ID {
  @inlinable
  public init(
    @ArrayBuilder<Element> uniqueElements: () -> [Element]
  ) {
    self.init(uniqueElements: uniqueElements())
  }
}

func example(all: Bool) {
  IdentifiedArray(id: \.self) {
    if all {
      "all"
    } else {
    	"some"
    }
    "values"
    "are"
    "here"
  }
}
```

Array initializer is provided by default

```swift
[1,2,3,4,5,6,7] == Array {
  1
  2
  [3, 4]
  [[5], [6, 7]]
}
```

See more examples in [`Tests`](./Tests/ArrayBuilderTests/ArrayBuilderTests.swift)

## Installation

### Basic

You can add swift-result-builders to an Xcode project by adding it as a package dependency.

1. From the **File** menu, select **Swift Packages › Add Package Dependency…**
2. Enter [`"https://github.com/capturecontext/swift-result-builders"`](https://github.com/capturecontext/swift-result-builders) into the package repository URL text field
3. Choose products you need to link them to your project.

### Recommended

If you use SwiftPM for your project structure, add DeclarativeConfiguration to your package file.

```swift
.package(
	url: "git@github.com:capturecontext/swift-result-builders.git",
	.upToNextMinor(from: "0.0.1")
)
```
or via HTTPS

```swift
.package(
	url: "https://github.com:capturecontext/swift-result-builders.git",
	.upToNextMinor(from: "0.0.1")
)
```

Do not forget about target dependencies:

```swift
.product(
	name: "ArrayBuilder",
	package: "swift-result-builders"
)
```

## License

This library is released under the MIT license. See [LICENSE](./LICENSE) for details.
