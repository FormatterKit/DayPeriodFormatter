struct DayPeriodRuleSet {
    private var rules: [(period: DayPeriod, rule: DayPeriodRule)] = []
    
    func period(for timeOfDay: TimeOfDay) -> DayPeriod? {
        return rules.first { $0.rule.matches(timeOfDay) }?.period
    }
}

// MARK: - ExpressibleByDictionaryLiteral

extension DayPeriodRuleSet: ExpressibleByDictionaryLiteral {
    init(dictionaryLiteral elements: (DayPeriod, DayPeriodRule)...) {
        rules = elements.sorted(by: { lhs, rhs in lhs.1 < rhs.1 })
    }
}
