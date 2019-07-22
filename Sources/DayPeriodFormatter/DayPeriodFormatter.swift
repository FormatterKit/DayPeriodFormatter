import Foundation

public final class DayPeriodFormatter: Formatter {
    @objc public var locale: Locale?

    // MARK: -

    public override init() {
        super.init()
        self.locale = nil
    }

    @objc public func string(from dateComponents: DateComponents) -> String? {
        guard let hour = dateComponents.hour else {
            return nil
        }

        let locale = self.locale ?? .current
        if let languageCode = locale.languageCode,
            let ruleSet = DayPeriodFormatter.ruleSetsByLanguageCode[languageCode],
            let period = ruleSet.period(for: hour) {
            return string(for: period, languageCode: languageCode)
        }

        return nil
    }

    @objc public func string(from date: Date, in calendar: Calendar = .current) -> String? {
        return string(from: calendar.dateComponents([.hour, .minute], from: date))
    }

    // MARK: Formatter

    public override func string(for object: Any?) -> String? {
        switch object {
        case let dateComponents as DateComponents:
            return string(from: dateComponents)
        case let date as Date:
            return string(from: date)
        case let timeZone as TimeZone:
            let dateComponents = Calendar.current.dateComponents(in: timeZone, from: Date())
            return string(from: dateComponents)
        default:
            return nil
        }
    }

    public override func getObjectValue(_: AutoreleasingUnsafeMutablePointer<AnyObject?>?, for _: String, errorDescription _: AutoreleasingUnsafeMutablePointer<NSString?>?) -> Bool {
        return false
    }

    // MARK: NSCoding

    public required init?(coder: NSCoder) {
        super.init(coder: coder)
        self.locale = coder.decodeObject(forKey: #keyPath(locale)) as? Locale
    }
}
