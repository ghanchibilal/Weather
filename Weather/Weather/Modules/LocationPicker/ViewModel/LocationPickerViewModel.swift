//
//  LocationPickerViewModel.swift
//  Weather
//
//  Created by Bilal Ghanchi on 09/12/20.
//

import Foundation
import CoreLocation

/// `LocationPickerViewModel` structure for Location Picker.
struct LocationPickerViewModel {
    
    func getCurrentLocation(completionHandler: @escaping ((_ location: CLLocation)->Void)) {
        AppShare.locationManager.getCurrentLocation { (location, error) in
    
            guard let currentLocation = location else {
                return
            }
            completionHandler(currentLocation)
        }
    }
    
    func getLocationDetails(coordinate: CLLocationCoordinate2D, completionHandler: @escaping ((_ place: CLPlacemark)->Void)) {
        
        AppShare.locationManager.getDetailsFromLocation(coordinate: coordinate) { (place, error) in
            
            guard let placemaker = place, error == nil else {
                AppShare.commonFunc.showCommanAlert(message: error?.localizedDescription ?? GeneralString.strBlank)
                return
            }
            completionHandler(placemaker)
        }
    }
    
    func saveLocationData(coordinate: CLLocationCoordinate2D, cityName: String) {
        
        let locationModel = LocationModel(city: cityName, lat: coordinate.latitude, long: coordinate.longitude, time: AppShare.commonFunc.getTimestamp())
        LocalStorageManager.add(location: locationModel)
    }
}
