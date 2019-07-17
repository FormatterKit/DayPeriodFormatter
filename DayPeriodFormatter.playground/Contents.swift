import Foundation
import DayPeriodFormatter

let formatter = DayPeriodFormatter()
let dateComponents = DateComponents(hour: 9, minute: 41)
formatter.string(from: dateComponents)

formatter.locale = Locale(identifier: "ja_JP")
formatter.string(from: dateComponents)
