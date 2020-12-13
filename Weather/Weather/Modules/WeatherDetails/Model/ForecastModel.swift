//
//  ForecastModel.swift
//  Weather
//
//  Created by Bilal Ghanchi on 11/12/20.
//

import Foundation

struct ForecastRequest: BaseModel {
    
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

struct ForecastResponse: BaseModel {
    
    var cnt: Int?
    var message: Int?
    var cod: String?
    var city: City?
    var list: [WeatherResponse]?
    
    enum CodingKeys: String, CodingKey {
        case cnt = "cnt"
        case message = "message"
        case cod = "cod"
        case city = "city"
        case list = "list"
    }
}

struct City: BaseModel {
    
    var ids: Int?
    var population: Int?
    var country: String?
    var name: String?
    var coord: Coordinate?
    
    enum CodingKeys: String, CodingKey {
        case ids = "id"
        case population = "population"
        case country = "country"
        case name = "name"
        case coord = "coord"
    }
}
