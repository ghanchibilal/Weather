//
//  AppStoryboard.swift
//  Weather
//
//  Created by Bilal Ghanchi on 09/12/20.
//

import Foundation
import UIKit

/// Contains all types of Storyboard.
enum AppStoryboard: String {
    
    /// Used to identify the storyboard based on name.
    case main, location, utility
    
    // MARK: Variables
    /// An instance object of UIStoryboard.
    var instance: UIStoryboard {
        return UIStoryboard(name: self.rawValue.capitalized, bundle: Bundle.main)
    }
    
    // MARK: Methods
    /// It's used to initialize `UIViewController`.
    /// - Returns:
    /// - Returns generic value.
    func viewController<T: UIViewController>(viewControllerClass: T.Type) -> T {
        let storyboardId = (viewControllerClass as UIViewController.Type).storyboardID
        // swiftlint:disable:next force_cast
        return instance.instantiateViewController(withIdentifier: storyboardId) as! T
    }
    
    /// It's used to initialize `UIViewController`.
    /// - Returns:
    /// - Returns an object of `UIViewController`.
    func initialViewController() -> UIViewController? {
        return instance.instantiateInitialViewController()
    }
}
