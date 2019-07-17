@testable import DayPeriodFormatter
import Foundation
import XCTest

final class DayPeriodFormatterTests: XCTestCase {
    var formatter = DayPeriodFormatter()
    
    func testStringForDateComponents() {
        formatter.locale = Locale(identifier: "en")
        
        let midnightDateComponents = DateComponents(hour: 0, minute: 0)
        let morningDateComponents = DateComponents(hour: 9, minute: 41)
        let noonDateComponents = DateComponents(hour: 12, minute: 00)
        let afternoonDateComponents = DateComponents(hour: 13, minute: 37)
        let eveningDateComponents = DateComponents(hour: 19, minute: 58)
        let nightDateComponents = DateComponents(hour: 23, minute: 11)

        XCTAssertEqual("midnight", formatter.string(from: midnightDateComponents))
        XCTAssertEqual("morning", formatter.string(from: morningDateComponents))
        XCTAssertEqual("noon", formatter.string(from: noonDateComponents))
        XCTAssertEqual("afternoon", formatter.string(from: afternoonDateComponents))
        XCTAssertEqual("evening", formatter.string(from: eveningDateComponents))
        XCTAssertEqual("night", formatter.string(from: nightDateComponents))
    }
    
    func testStringForNonEnglishLocale() {
        formatter.locale = Locale(identifier: "te")
        
        let morningDateComponents = DateComponents(hour: 9, minute: 41)
        let afternoonDateComponents = DateComponents(hour: 13, minute: 37)
        let eveningDateComponents = DateComponents(hour: 19, minute: 58)
        let nightDateComponents = DateComponents(hour: 23, minute: 11)
        
        XCTAssertEqual("ఉదయం", formatter.string(from: morningDateComponents))
        XCTAssertEqual("మధ్యాహ్నం", formatter.string(from: afternoonDateComponents))
        XCTAssertEqual("సాయంత్రం", formatter.string(from: eveningDateComponents))
        XCTAssertEqual("రాత్రి", formatter.string(from: nightDateComponents))
    }

    static var allTests = [
        ("testStringForDateComponents", testStringForDateComponents),
        ("testStringForNonEnglishLocale", testStringForNonEnglishLocale)
    ]
}
