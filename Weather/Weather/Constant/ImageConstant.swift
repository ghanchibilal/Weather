//
//  ImageConstant.swift
//  Weather
//
//  Created by Bilal Ghanchi on 08/12/20.
//

import Foundation
import UIKit

struct GeneralImage {
    static let placeholderImg: UIImage? =         UIImage(imageLiteralResourceName: "Placeholder")
}

struct NavigationImage {
    static let titleImg: UIImage? =         UIImage(imageLiteralResourceName: "NavTitleImg")
    static let btnBack: UIImage? =          UIImage(imageLiteralResourceName: "NavBackImg")
    static let btnAdd: UIImage? =           UIImage(imageLiteralResourceName: "NavAddNewImg")
    static let btnHelp: UIImage? =          UIImage(imageLiteralResourceName: "NavHelpImg")
    static let btnDone: UIImage? =          UIImage(imageLiteralResourceName: "NavDoneImg")
    static let btnSettings: UIImage =       UIImage(imageLiteralResourceName: "NavSettingsImg")
}

struct WeatherImage {
    static let clearNight: UIImage? =          UIImage(imageLiteralResourceName: "WeatherClearNight")
    static let cloudyDay: UIImage? =           UIImage(imageLiteralResourceName: "WeatherCloudDay")
    static let cloudyNight: UIImage? =         UIImage(imageLiteralResourceName: "WeatherCloudNight")
    static let cloudy: UIImage? =              UIImage(imageLiteralResourceName: "WeatherCloudy")
    static let drop: UIImage? =                UIImage(imageLiteralResourceName: "WeatherDrop")
    static let rain: UIImage? =                UIImage(imageLiteralResourceName: "WeatherRain")
    static let snow: UIImage? =                UIImage(imageLiteralResourceName: "WeatherSnow")
    static let strom: UIImage? =               UIImage(imageLiteralResourceName: "WeatherStorm")
    static let sunny: UIImage? =               UIImage(imageLiteralResourceName: "WeatherSunny")
    static let sunrise: UIImage? =             UIImage(imageLiteralResourceName: "WeatherSunrise")
    static let sunset: UIImage? =              UIImage(imageLiteralResourceName: "WeatherSunset")
    static let thermometer: UIImage? =         UIImage(imageLiteralResourceName: "WeatherThermometer")
    static let wind: UIImage? =                UIImage(imageLiteralResourceName: "WeatherWind")
}
