//
//  Configuration.swift
//  Weather
//
//  Created by Bilal Ghanchi on 09/12/20.
//

import Foundation

/// Configuration structure to store an environment value of the project.
struct Configuration {
    
    static let configurationString: String =  "Configuration"
    
    /// It's used to get current environment of the project.
    lazy var environment: Environment = {
        if let configuration = Bundle.main.object(forInfoDictionaryKey: Configuration.configurationString) as? String {
            if configuration.range(of: Environment.development.rawValue) != nil {
                return Environment.development
            } else if configuration.range(of: Environment.qa.rawValue) != nil {
                return Environment.qa
            } else {
                return Environment.production
            }
        }
        return Environment.development
    }()
}
