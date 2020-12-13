//
//  LocationManager.swift
//  Weather
//
//  Created by Bilal Ghanchi on 09/12/20.
//

import Foundation
import CoreLocation

/// `LocationManager` is a class that is  used to handle  location.
class LocationManager: NSObject, CLLocationManagerDelegate {
    
    /// shared instance of the LocationManager class.
    static let shared = LocationManager()
    
    private var locationManager: CLLocationManager?
    
    typealias locationClosure = ((_ location: CLLocation?, _ error:  Error?)->Void)
    private var locationCompletionHandler:  locationClosure?
    
    // MARK: Variables
    /// It is used to intialize the LocationManager.
    private override init() {
        super.init()
        self.configureLocation()
    }
    
    // MARK: Methods
    /// It is used to configure location.
    private func configureLocation() {
        locationManager = CLLocationManager()
        locationManager?.delegate = self
        locationManager?.desiredAccuracy = kCLLocationAccuracyBest
        locationManager?.distanceFilter = 100
        locationManager?.requestWhenInUseAuthorization()
    }
    
    /// Responsible for get current location
    func getCurrentLocation(completionHandler: @escaping locationClosure) {
        self.configureLocation()
        self.locationCompletionHandler = completionHandler
    }
    
    func getDetailsFromLocation(coordinate: CLLocationCoordinate2D, completionHandler: @escaping ((_ place: CLPlacemark?, _ error:  Error?)->Void)) {
        CLGeocoder().reverseGeocodeLocation(CLLocation(latitude: coordinate.latitude,
            longitude: coordinate.longitude)) { (placemarks, error) in
            
            guard let firstPlace = placemarks?.first, error == nil else {
                completionHandler(nil, error)
                return
            }
            completionHandler(firstPlace, nil)
        }
    }
    
    // MARK: - CLLocationManager Delegates
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        self.locationCompletionHandler?(locations.last, nil)
        self.locationManager?.stopUpdatingLocation()
    }
    
    // After user tap on 'Allow' or 'Disallow' on the dialog
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        if status == .authorizedWhenInUse || status == .authorizedAlways {
            manager.requestLocation()
            manager.startUpdatingLocation()
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("Error in Location")
        print(error.localizedDescription)
        self.locationCompletionHandler?(nil, error)
    }
}
