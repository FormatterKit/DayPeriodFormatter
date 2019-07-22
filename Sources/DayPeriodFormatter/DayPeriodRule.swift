enum DayPeriodRule {
    case at(time: Int)
    case range(from: Int, to: Int)
    
    func matches(_ value: Int) -> Bool {
        switch self {
        case let .at(timeOfDay):
            return value == timeOfDay
        case let .range(from, to):
            if from < to {
                return (from ..< to).contains(value)
            } else {
                return !(to ..< from).contains(value)
            }
        }
    }
}

// MARK: - Equatable

extension DayPeriodRule: Equatable {
    static func == (lhs: DayPeriodRule, rhs: DayPeriodRule) -> Bool {
        switch (lhs, rhs) {
        case let (.at(lhstime), .at(rhstime)):
            return lhstime == rhstime
        case let (.range(lhsfrom, lhsto), .range(rhsfrom, rhsto)):
            return lhsfrom == rhsfrom && lhsto == rhsto
        default:
            return false
        }
    }
}

// MARK: - Comparable

extension DayPeriodRule: Comparable {
    static func < (lhs: DayPeriodRule, rhs: DayPeriodRule) -> Bool {
        switch (lhs, rhs) {
        case let (.at(lhstime), .at(rhstime)):
            return lhstime < rhstime
        case (.at, .range):
            return true
        default:
            return false
        }
    }
}

