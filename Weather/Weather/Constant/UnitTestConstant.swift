//
//  UnitTestConstant.swift
//  Weather
//
//  Created by Bilal Ghanchi on 12/12/20.
//

import Foundation
import CoreLocation


struct UnitTestConstant {
    
    static let location: CLLocationCoordinate2D = CLLocationCoordinate2D(latitude: 23.07269127, longitude: 72.56162222)
    static let cityName: String = "Ahmedabad"
    
    static let windSpeed: Double = 1.5
    static let windSpeedResult: String = "5.4 KPH"
    
    static let humidity: Double = 83.0
    static let humidityResult: String = "83.0%"
    
    static let pressure: Double = 1012.0
    static let pressureResult: String = "1012.0 hPa"
    
    static let temperature: Double = 300.15
    static let temperatureResultCelsius: String = "27.0°C"
    static let temperatureResultFahrenheit: String = "80.6°F"
    
    static let timestamp: Double = 1607737013.0
    static let dateTimeResult: String = "Dec 12, 2020 at 4:36 AM"
    static let timeResult: String = "4:36 AM"
}

enum StubbedResponsesFile: String {
    case weather = "WeatherResponse"
    case forecast = "ForecastResponse"
}
