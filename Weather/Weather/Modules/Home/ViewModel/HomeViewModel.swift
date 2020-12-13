//
//  HomeViewModel.swift
//  Weather
//
//  Created by Bilal Ghanchi on 09/12/20.
//

import Foundation
import CoreLocation

/// `HomeViewModel` structure for HomeView.
struct HomeViewModel {
    
    var locationArray: [LocationModel]?
    
    var islocationData: Bool {
        return self.locationArray?.count ?? 0 > 0 ? true : false
    }
    
    mutating func updateLocationArray() {
        self.locationArray = self.getLocationFromDB()
    }
    
    mutating func removeLocation(index: Int) {
        self.locationArray?.remove(at: index)
        LocalStorageManager.updateLocations(locations: self.locationArray)
    }
    
    func getLocationFromDB() -> [LocationModel] {
        return (LocalStorageManager.getLocations() ?? []).sorted { $0.timestamp > $1.timestamp }
    }
    
    func getWeatherInfoAPI(latitude: Double?, longitude: Double?, completionHandler: @escaping (Result<WeatherResponse, NetworkError<String>>) -> ()) {
        
        let endPoint = WeatherEndPoint(requestModel: WeatherRequest(latitude: latitude, longitude: longitude))
        
        WeatherClient().load(endpoint: endPoint, complition: completionHandler)
    }
}
