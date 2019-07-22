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
