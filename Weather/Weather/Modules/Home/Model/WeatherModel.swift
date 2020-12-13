//
//  WeatherModel.swift
//  Weather
//
//  Created by Bilal Ghanchi on 10/12/20.
//

import Foundation

struct WeatherRequest: BaseModel {
    
    var latitude: Double?
    var longitude: Double?
    
    var vLatitude: Double {
        return latitude.forceWrappe
    }
    
    var vLongitude: Double {
        return longitude.forceWrappe
    }
    
    var vApplicationId: String {
        return AppConst.apiToken
    }
}


struct WeatherResponse: BaseModel {
    
    var coordinate: Coordinate?
    var weatherType: [Weather]?
    var base: String?
    var main: WeatherMain?
    var visibility: Double?
    var wind: Wind?
    var clouds: Clouds?
    var dts: Double?
    var sys: WeatherSys?
    var ids: Int?
    var name: String?
    var cod: Int?
    var cityName: String?
    
    enum CodingKeys: String, CodingKey {
        case coordinate = "coord"
        case weatherType = "weather"
        case base = "base"
        case main = "main"
        case visibility = "visibility"
        case wind = "wind"
        case clouds = "clouds"
        case dts = "dt"
        case sys = "sys"
        case ids = "id"
        case name = "name"
        case cod = "cod"
    }
}


struct Coordinate: BaseModel {
    
    var latitude: Double?
    var longitude: Double?
    
    enum CodingKeys: String, CodingKey {
        case latitude = "lat"
        case longitude = "lon"
    }
}

struct Weather: BaseModel {
    
    var ids: Int?
    var main: String?
    var description: String?
    var icon: String?
    
    enum CodingKeys: String, CodingKey {
        case ids = "id"
        case main = "main"
        case description = "description"
        case icon = "icon"
    }
}

struct WeatherMain: BaseModel {
    
    var temp: Double?
    var pressure: Double?
    var humidity: Double?
    var tempMin: Double?
    var tempMax: Double?
    var seaLevel: Double?
    var groupLevel: Double?
    var tempKF: Double?
    
    enum CodingKeys: String, CodingKey {
        case temp = "temp"
        case pressure = "pressure"
        case humidity = "humidity"
        case tempMin = "temp_min"
        case tempMax = "temp_max"
        case seaLevel = "sea_level"
        case groupLevel = "grnd_level"
        case tempKF = "temp_kf"
    }
}

struct Wind: BaseModel {
    
    var speed: Double?
    var deg: Double?
    
    enum CodingKeys: String, CodingKey {
        case speed = "speed"
        case deg = "deg"
    }
}

struct Clouds: BaseModel {
    
    var all: Double?
    
    enum CodingKeys: String, CodingKey {
        case all = "all"
    }
}

struct WeatherSys: BaseModel {
    
    var type: Double?
    var ids: Double?
    var message: Double?
    var country: String?
    var sunrise: Double?
    var sunset: Double?
    var pod: String?
    
    enum CodingKeys: String, CodingKey {
        case type = "type"
        case ids = "id"
        case message = "message"
        case country = "country"
        case sunrise = "sunrise"
        case sunset = "sunset"
        case pod = "pod"
    }
}
