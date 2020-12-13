//
//  AppConstant.swift
//  Weather
//
//  Created by Bilal Ghanchi on 09/12/20.
//

import Foundation
import UIKit

/// AppConst structure to store the current environment of the project.
struct AppConst {
    static var currentEnvironment: Environment {
        var config = Configuration()
        return config.environment
    }
    /// It's an object of `AppDelegate`.
    static let appDelegate = UIApplication.shared.delegate as? AppDelegate
    
    static let apiToken = "fae7190d7e6433ec3a45285ffcf55c86"
}


// MARK: Application Share Instances
/// AppShare structure which contains the list of share manager instances.
struct AppShare {
    /// locationManager is an instance of `LocationManager`
    static let locationManager           = LocationManager.shared
    
    /// viewControllerManager is an instance of `ViewControllerManager`
    static let viewControllerManager     = ViewControllerManager.shared
    
    /// imageLoadManager is an instance of `ImageLoadManager`
    static let imageLoadManager     = ImageLoadManager.shared
    
    /// commonFunc is an instance of `CommonFunction`
    static let commonFunc                = CommonFunction.shared
}
