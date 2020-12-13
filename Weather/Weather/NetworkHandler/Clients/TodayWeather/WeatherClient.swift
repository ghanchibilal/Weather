//
//  WeatherClient.swift
//  Weather
//
//  Created by Bilal Ghanchi on 10/12/20.
//

import Foundation

struct WeatherClient {
    func load<I:Endpoint>(endpoint: I, complition: @escaping (Result<WeatherResponse, NetworkError<String>>) -> ()) {
        
        if Thread.current.isRunningXCTest { // Unit Test 
            AppShare.commonFunc.getJSONResponseObject(endpoint: endpoint, fileName: .weather, complition: complition)
        } else {
            APIClient.sharedObject.load(endpoint: endpoint, complition: complition)
        }
    }
    
    
}
