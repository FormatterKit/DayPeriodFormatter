struct DayPeriodRuleSet {
    var atPeriodsByHour: [Int: DayPeriod] = [:]
    var periodRules: [(period: DayPeriod, rule: DayPeriodRule)] = []
    
    func period(for hour: Int) -> DayPeriod? {
        return atPeriodsByHour[hour] ?? periodRules.first { $0.rule.matches(hour) }?.period
    }
}

// MARK: - ExpressibleByDictionaryLiteral

extension DayPeriodRuleSet: ExpressibleByDictionaryLiteral {
    init(dictionaryLiteral elements: (DayPeriod, DayPeriodRule)...) {
        for (period, rule) in elements {
            switch rule {
            case .at(let time):
                atPeriodsByHour[time] = period
            case .range:
                periodRules.append((period, rule))
            }
        }
    }
}
