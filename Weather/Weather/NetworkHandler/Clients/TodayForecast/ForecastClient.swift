//
//  ForecastClient.swift
//  Weather
//
//  Created by Bilal Ghanchi on 11/12/20.
//

import Foundation

struct ForecastClient {
    func load<I: Endpoint>(endpoint: I, complition: @escaping (Result<ForecastResponse, NetworkError<String>>) -> ()) {
        
        if Thread.current.isRunningXCTest { // Unit Test 
            AppShare.commonFunc.getJSONResponseObject(endpoint: endpoint, fileName: .forecast, complition: complition)
        } else {
            APIClient.sharedObject.load(endpoint: endpoint, complition: complition)
        }
    }
}
