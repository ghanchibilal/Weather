//
//  Environment.swift
//  Weather
//
//  Created by Bilal Ghanchi on 09/12/20.
//

import Foundation

enum Environment: String {
    
    case development = "Dev"
    case qa = "QA"
    case production = "Production"
    
    /// Used to store API URL based on the selected environment.
    var apiUrl: String {
        switch self {
        case .development: return "https://api.openweathermap.org/data/2.5/"
        case .qa: return "https://api.openweathermap.org/data/2.5/"
        case .production:  return "https://api.openweathermap.org/data/2.5/"
        }
    }
    
    /// Used to store API URL based on the selected environment.
    var imageUrl: String {
        switch self {
        case .development: return "https://openweathermap.org/img/w/"
        case .qa: return "https://openweathermap.org/img/w/"
        case .production:  return "https://openweathermap.org/img/w/"
        }
    }
}
