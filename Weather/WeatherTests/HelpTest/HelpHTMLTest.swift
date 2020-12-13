//
//  HelpHTMLTest.swift
//  WeatherTests
//
//  Created by Bilal Ghanchi on 12/12/20.
//

import XCTest
@testable import Weather

class HelpHTMLTest: XCTestCase {

    var helpViewModel: HelpViewModel!
    
    override func setUp() {
        self.helpViewModel = HelpViewModel()
    }
    
    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testHTMLUrl() {
        let url = helpViewModel.getHelpURL()
        XCTAssertNotNil(url)
    }
}
