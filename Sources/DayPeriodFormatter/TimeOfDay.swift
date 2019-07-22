import class Foundation.Scanner
import struct Foundation.CharacterSet

private let minutesPerHour: Int = 60
private let hoursPerDay: Int = 24
private let minutesPerDay: Int = minutesPerHour * hoursPerDay

struct TimeOfDay: Equatable {
    private var rawValue: Int
    
    var hour: Int {
        return rawValue.quotientAndRemainder(dividingBy: minutesPerHour).quotient % hoursPerDay
    }
    
    var minute: Int {
        return rawValue % minutesPerHour
    }
    
    init(hour: Int, minute: Int) {
        rawValue = (max(hour, 0) * minutesPerHour) + max(minute, 0)
    }
    
    private init(rawValue: Int) {
        self.rawValue = max(rawValue, 0)
    }
}

// MARK: - Comparable

extension TimeOfDay: Comparable {
    static func < (lhs: TimeOfDay, rhs: TimeOfDay) -> Bool {
        return lhs.rawValue < rhs.rawValue
    }
}

// MARK: - ExpressibleByStringLiteral

extension TimeOfDay: ExpressibleByStringLiteral {
    init(stringLiteral value: String) {
        var hour: Int = 0
        var minute: Int = 0
        
        let scanner = Scanner(string: value)
        scanner.charactersToBeSkipped = CharacterSet(charactersIn: ":")
        guard scanner.scanInt(&hour), scanner.scanInt(&minute) else {
            fatalError("Invalid: \(value)")
        }
        
        self.init(hour: hour, minute: minute)
    }
}
