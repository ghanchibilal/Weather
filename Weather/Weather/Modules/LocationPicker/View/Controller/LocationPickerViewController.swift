//
//  LocationPickerViewController.swift
//  Weather
//
//  Created by Bilal Ghanchi on 09/12/20.
//

import Foundation
import UIKit
import MapKit

protocol LocationPickerDelegate: class {
    func locationPickerDidAddLocations()
}

/// `LocationPickerViewController` is used to  Pickup location into Mapview
class LocationPickerViewController: BaseViewController {
    
    @IBOutlet weak var mapView: MKMapView!
    
    // MARK: Variables
    let objLocationPickerViewModel = LocationPickerViewModel()
    let annotation = MKPointAnnotation()
    weak var delegate: LocationPickerDelegate?
    
    // MARK: View Controller Life Cycle
    /// It's parent class `UIViewController` methods that will be override here.
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configureView()
    }
    
    /// It's parent class `UIViewController` methods that will be override here.
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    /// It's parent class `UIViewController` methods that will be override here.
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.configureMap()
    }
    
    private func configureView() {
        self.navigationbarConfiguration()
        self.setTapGesture()
    }
    
    private func navigationbarConfiguration() {
        self.setNavigationTitle(titleType: .text, titleName: ScreenTitle.locationPicker)
        self.setNavigationLeftItem(type: .back)
    }
    
    override func rightMenuPressed() {
        // Save Location Data
        self.objLocationPickerViewModel.saveLocationData(coordinate: self.annotation.coordinate, cityName: annotation.title.forceStrWrappe)
        AppShare.viewControllerManager.dissmisVC(completion: {
            self.delegate?.locationPickerDidAddLocations()
        })
    }
    
    override func leftMenuPressed() {
        AppShare.viewControllerManager.dissmisVC(completion: nil)
    }
    
    private func configureMap() {
        self.objLocationPickerViewModel.getCurrentLocation { (location) in
            self.setUpMap(location: location)
        }
        
    }
}

/// Extension of `LocationPickerViewController` to manage Map Configuration.
extension LocationPickerViewController {
    
    fileprivate func setUpMap(location: CLLocation) {
        let span =  MKCoordinateSpan(latitudeDelta: 0.02, longitudeDelta: 0.02)
        let region = MKCoordinateRegion(center: location.coordinate, span: span)
        self.mapView.setRegion(region, animated: true)
    }
    
    fileprivate func setTapGesture() {
        let touchGesture = UILongPressGestureRecognizer(target: self, action: #selector(touchedOnMap(gestureRecognizer:)))
        touchGesture.minimumPressDuration = 0.5
        self.mapView.addGestureRecognizer(touchGesture)
    }
    
    @objc func touchedOnMap(gestureRecognizer: UILongPressGestureRecognizer) {
        
        if gestureRecognizer.state == .began {
            self.mapView.removeAnnotations(self.mapView.annotations)
            let touchPoint = gestureRecognizer.location(in: mapView)
            let coordinates = mapView.convert(touchPoint, toCoordinateFrom: mapView)
            self.getDetailsFromLocation(selectedCoordinate: coordinates)
        }
    }
    
    private func getDetailsFromLocation(selectedCoordinate: CLLocationCoordinate2D) {
        
        func addAnnotationOnMap(place: CLPlacemark) {
            annotation.coordinate = selectedCoordinate
            annotation.title = place.locality ?? "N/A"
            mapView.addAnnotation(annotation)
        }
        
        
        self.objLocationPickerViewModel.getLocationDetails(coordinate: selectedCoordinate) { (placeData) in
            self.annotation.coordinate = selectedCoordinate
            
            addAnnotationOnMap(place: placeData)
            self.setNavigationRightItem(type: .done)
        }
    }
}
