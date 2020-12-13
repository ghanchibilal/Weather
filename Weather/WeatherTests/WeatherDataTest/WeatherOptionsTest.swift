//
//  WeatherOptionsTest.swift
//  WeatherTests
//
//  Created by Bilal Ghanchi on 12/12/20.
//

import XCTest
@testable import Weather

class WeatherOptionsTest: XCTestCase {
    
    var weatherDetailsViewModel: WeatherDetailsViewModel!

    override func setUp() {
        self.weatherDetailsViewModel = WeatherDetailsViewModel()
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testWindSpeed() {
        
        let windData = weatherDetailsViewModel.getWindSpeed(data: UnitTestConstant.windSpeed)
        
        XCTAssertTrue(windData == UnitTestConstant.windSpeedResult)
    }
    
    func testHumidity() {
        
        let HumidityData = weatherDetailsViewModel.getHumidity(data: UnitTestConstant.humidity)
        
        XCTAssertTrue(HumidityData == UnitTestConstant.humidityResult)
    }
    
    func testPressure() {
        
        let pressureData = weatherDetailsViewModel.getPressure(data: UnitTestConstant.pressure)
        
        XCTAssertTrue(pressureData == UnitTestConstant.pressureResult)
    }
    
    func testDateTime() {
        
        let dateTimeData = weatherDetailsViewModel.getDateTime(data: UnitTestConstant.timestamp, isDate: true)
        
        XCTAssertTrue(dateTimeData == UnitTestConstant.dateTimeResult)
    }
    
    func testTime() {
        
        let timeData = weatherDetailsViewModel.getDateTime(data: UnitTestConstant.timestamp)
        
        XCTAssertTrue(timeData == UnitTestConstant.timeResult)
    }

}
