//
//  WeatherAPITest.swift
//  WeatherTests
//
//  Created by Bilal Ghanchi on 12/12/20.
//

import XCTest
@testable import Weather

class WeatherAPITest: XCTestCase {
    
    var homeViewModel: HomeViewModel!
    
    override func setUp() {
        self.homeViewModel = HomeViewModel()
    }

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testWeatherAPI() {
        self.homeViewModel.getWeatherInfoAPI(latitude: UnitTestConstant.location.latitude, longitude: UnitTestConstant.location.longitude) { (result: Result<WeatherResponse, NetworkError<String>>) in
            
            XCTAssertNotNil(result)
            XCTAssertNil(result.error)
        }
    }
}
