# DayPeriodFormatter

```swift
import Foundation
import DayPeriodFormatter

let formatter = DayPeriodFormatter()
let dateComponents = DateComponents(hour: 9, minute: 41)
formatter.string(from: dateComponents) // "morning"

// 150+ locales supported
formatter.locale = Locale(identifier: "ja")
formatter.string(from: dateComponents) // "朝"
```

## Requirements

- Swift 4.0+

## Installation

### Swift Package Manager

Add the DayPeriodFormatter package to your target dependencies in `Package.swift`:

```swift
import PackageDescription

let package = Package(
  name: "YourProject",
  dependencies: [
    .package(
        url: "https://github.com/FormatterKit/DayPeriodFormatter",
        from: "0.0.2"
    ),
  ]
)
```

Then run the `swift build` command to build your project.

## License

MIT

## Contact

Mattt ([@mattt](https://twitter.com/mattt))
