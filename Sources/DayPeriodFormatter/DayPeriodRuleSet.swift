struct DayPeriodRuleSet {
    private var rules: [(period: DayPeriod, rule: DayPeriodRule)] = []
    
    func period(for hour: Int) -> DayPeriod? {
        return rules.first { $0.rule.matches(hour) }?.period
    }
}

// MARK: - ExpressibleByDictionaryLiteral

extension DayPeriodRuleSet: ExpressibleByDictionaryLiteral {
    init(dictionaryLiteral elements: (DayPeriod, DayPeriodRule)...) {
        rules = elements.sorted(by: { lhs, rhs in lhs.1 < rhs.1 })
    }
}
