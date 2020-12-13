//
//  ForecastAPITest.swift
//  WeatherTests
//
//  Created by Bilal Ghanchi on 12/12/20.
//

import XCTest
@testable import Weather

class ForecastAPITest: XCTestCase {
    
    var objWeatherDetailsViewModel: WeatherDetailsViewModel!
    
    override func setUp() {
        self.objWeatherDetailsViewModel = WeatherDetailsViewModel()
    }

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testForecastAPI() {
        self.objWeatherDetailsViewModel.getForecastInfoAPI(latitude: UnitTestConstant.location.latitude, longitude: UnitTestConstant.location.longitude) { (result: Result<ForecastResponse, NetworkError<String>>) in
            
            XCTAssertNotNil(result)
            XCTAssertNil(result.error)
        }
    }

}

