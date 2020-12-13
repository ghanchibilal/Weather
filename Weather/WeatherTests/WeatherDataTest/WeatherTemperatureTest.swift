//
//  WeatherTemperatureTest.swift
//  WeatherTests
//
//  Created by Seema Bilal on 13/12/20.
//

import XCTest
@testable import Weather

class WeatherTemperatureTest: XCTestCase {

    var weatherDetailsViewModel: WeatherDetailsViewModel!

    override func setUp() {
        self.weatherDetailsViewModel = WeatherDetailsViewModel()
    }
    
    override func tearDown() {
        LocalStorageManager.setTempretureUnit(unit: .celsius)
    }

    func testCelsiusTemperature() {
        
        LocalStorageManager.setTempretureUnit(unit: .celsius)
        
        let temperatureData = weatherDetailsViewModel.getTemperature(data: UnitTestConstant.temperature)
        
        XCTAssertTrue(temperatureData == UnitTestConstant.temperatureResultCelsius)
        XCTAssertFalse(temperatureData == UnitTestConstant.temperatureResultFahrenheit)
    }
    
    func testFahrenheitTemperature() {
        
        LocalStorageManager.setTempretureUnit(unit: .fahrenheit)
        
        let temperatureData = weatherDetailsViewModel.getTemperature(data: UnitTestConstant.temperature)
        
        XCTAssertTrue(temperatureData == UnitTestConstant.temperatureResultFahrenheit)
        XCTAssertFalse(temperatureData == UnitTestConstant.temperatureResultCelsius)
    }

}
