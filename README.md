# swift-result-builders

[![CI](https://github.com/capturecontext/swift-result-builders/actions/workflows/ci.yml/badge.svg)](https://github.com/capturecontext/swift-result-builders/actions/workflows/ci.yml) [![](https://img.shields.io/endpoint?url=https%3A%2F%2Fswiftpackageindex.com%2Fapi%2Fpackages%2Fcapturecontext%2Fswift-result-builders%2Fbadge%3Ftype%3Dswift-versions)](https://swiftpackageindex.com/capturecontext/swift-result-builders) [![](https://img.shields.io/endpoint?url=https%3A%2F%2Fswiftpackageindex.com%2Fapi%2Fpackages%2Fcapturecontext%2Fswift-result-builders%2Fbadge%3Ftype%3Dplatforms)](https://swiftpackageindex.com/capturecontext/swift-result-builders)

Set of general-purpose result builders written in swift

## Table of contents

- [Usage](#usage)
  - [ArrayBuilder](#arraybuilder)
- [Installation](#installation)
- [License](#license)


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

You can add `swift-result-builders` to an Xcode project by adding it as a package dependency.

1. From the **File** menu, select **Swift Packages › Add Package Dependency…**
2. Enter [`"https://github.com/capturecontext/swift-result-builders"`](https://github.com/capturecontext/swift-result-builders) into the package repository URL text field
3. Choose products you need to link to your project.

### Recommended

If you use SwiftPM for your project structure, add `swift-result-builders` dependency to your package file. 

```swift
.package(
  url: "https://github.com/capturecontext/swift-result-builders.git", 
  .upToNextMinor("0.0.2")
)
```

Do not forget about target dependencies:

```swift
.product(
  name: "<#Product#>", 
  package: "swift-result-builders"
)
```

## License

This library is released under the MIT license. See [LICENSE](./LICENSE) for details.
