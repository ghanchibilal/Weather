//
//  LocationModel.swift
//  Weather
//
//  Created by Bilal Ghanchi on 09/12/20.
//

import Foundation

class LocationModel: Codable {
    let cityName: String
    let latitude: Double
    let longitude: Double
    var isRefrehing: Bool = false
    var timestamp: String
    
    init(city: String, lat: Double, long: Double, time: String) {
        self.cityName = city
        self.latitude = lat
        self.longitude = long
        self.timestamp = time
    }
}
