//
//  commonEnum.swift
//  Weather
//
//  Created by Bilal Ghanchi on 08/12/20.
//

import Foundation
import UIKit

//// Used to identify button type to set appropriate title in Navigation Title
enum NavigationTitleContentType {
    case image
    case text
}

/// Used to get Navigation Button Image
enum NavigationButton {
    case back, add, help, done, settings
    
    /// Used to set image for button
    var buttonImg: UIImage? {
        switch self {
        case .add: return self.renderWithScale(buttonImg: NavigationImage.btnAdd)
        case .help: return self.renderWithScale(buttonImg: NavigationImage.btnHelp)
        case .back: return self.renderWithScale(buttonImg: NavigationImage.btnBack)
        case .done: return self.renderWithScale(buttonImg: NavigationImage.btnDone)
        case .settings: return self.renderWithScale(buttonImg: NavigationImage.btnSettings)
        }
    }
    
    func renderWithScale(buttonImg: UIImage?) -> UIImage? {
        return buttonImg?.withRenderingMode(.alwaysTemplate).scaleTo(CGSize(width: 30, height: 30))
    }
}

enum WeatherTypes: String {
    
    case clearSky = "clear sky"
    case fewClouds = "few clouds"
    case scatteredClouds = "scattered clouds"
    case brokenClouds = "broken clouds"
    case showerRain = "shower rain"
    case rain = "rain"
    case thunderstorm = "thunderstorm"
    case snow = "snow"
    case mist = "mist"
    case haze = "haze"
    
    var icon: UIImage? {
        switch self {
        case .clearSky: return WeatherImage.sunny
        case .fewClouds: return WeatherImage.cloudyDay
        case .scatteredClouds: return WeatherImage.cloudyNight
        case .brokenClouds: return WeatherImage.cloudy
        case .showerRain, .rain: return WeatherImage.rain
        case .thunderstorm: return WeatherImage.strom
        case .snow: return WeatherImage.snow
        case .mist: return WeatherImage.cloudyDay
        case .haze: return WeatherImage.wind
        }
    }
}

//// Used to identify Tempreture Unit Type
enum TempretureUnit: String {
    case celsius = "celsius"
    case fahrenheit = "fahrenheit"
    
    var index: Int {
        switch self {
        case .celsius: return 0
        case .fahrenheit: return 1
        }
    }
    
    var unit: String {
        switch self {
        case .celsius: return "°C"
        case .fahrenheit: return "°F"
        }
    }
}
