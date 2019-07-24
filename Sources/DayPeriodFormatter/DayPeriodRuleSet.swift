struct DayPeriodRuleSet {

    /// https://unicode.org/reports/tr35/tr35-dates.html#Fixed_periods
    var fixedPeriodsByHour: [Int: DayPeriod] = [:]

    /// https://unicode.org/reports/tr35/tr35-dates.html#Variable_periods
    var sortedVariablePeriods: [(period: DayPeriod, startHour: Int)] = []
    
    func period(for hour: Int) -> DayPeriod {

        // Prefer fixed period if it exists
        if let fixedPeriod = fixedPeriodsByHour[hour] {
            return fixedPeriod
        }

        // Find latest variable period starting not later than 'hour'
        let latestVariablePeriod = sortedVariablePeriods.last { $0.startHour <= hour }
        if let period = latestVariablePeriod {
            return period.period
        }

        // When all variable periods start after the hour use
        // period overlapping the day boundary – which is the last period
        let dayBoundaryOverlappingPeriod = sortedVariablePeriods.last!
        return dayBoundaryOverlappingPeriod.period
    }
}

// MARK: - ExpressibleByDictionaryLiteral

extension DayPeriodRuleSet: ExpressibleByDictionaryLiteral {
    init(dictionaryLiteral elements: (DayPeriod, DayPeriodRule)...) {
        for (period, rule) in elements {
            switch rule {
            case .at(let time):
                fixedPeriodsByHour[time] = period
            case .range(let from):
                sortedVariablePeriods.append((period, from))
            }
        }
    }
}
