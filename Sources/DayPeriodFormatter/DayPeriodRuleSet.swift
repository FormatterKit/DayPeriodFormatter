struct DayPeriodRuleSet {
    var atPeriodsByHour: [Int: DayPeriod] = [:]
    var periodRules: [(period: DayPeriod, hour: Int)] = []
    
    func period(for hour: Int) -> DayPeriod {
        return atPeriodsByHour[hour]
            ?? periodRules.last { $0.hour <= hour }?.period
            ?? periodRules.last!.period
    }
}

// MARK: - ExpressibleByDictionaryLiteral

extension DayPeriodRuleSet: ExpressibleByDictionaryLiteral {
    init(dictionaryLiteral elements: (DayPeriod, DayPeriodRule)...) {
        for (period, rule) in elements {
            switch rule {
            case .at(let time):
                atPeriodsByHour[time] = period
            case .range(let from, _):
                periodRules.append((period, from))
            }
        }
    }
}
