//
//  ViewControllerManager.swift
//  Weather
//
//  Created by Bilal Ghanchi on 09/12/20.
//

import Foundation
import UIKit

/// ViewControllerManager is used to get View controller object throughout the application.
class ViewControllerManager {
    
    /// shared instance of the ViewControllerManager class.
    static let shared = ViewControllerManager()
    
    // MARK: Variables
    /// It is used to intialize
    private init() {
    }
    
    /// It's used to get top view controller from the navigation stack.
    ///- Parameters:
    ///     - controller: It's an `UIViewController` object.
    ///- Returns:
    ///     - Returns a `UIViewController` object.
    func topViewController(controller: UIViewController? = UIApplication.shared.keyWindow?.rootViewController) -> UIViewController? {
        if let navigationController = controller as? UINavigationController {
            return topViewController(controller: navigationController.visibleViewController)
        }
        if let tabController = controller as? UITabBarController {
            if let selected = tabController.selectedViewController {
                return topViewController(controller: selected)
            }
        }
        if let presented = controller?.presentedViewController {
            return topViewController(controller: presented)
        }
        return controller
    }
    
    /// It's used to get top navigation controller from the navigation stack.
    ///- Returns:
    ///     - Returns a `UINavigationController` object.
    func topNavigationController() -> UINavigationController? {
        return self.topViewController()?.navigationController
    }
    
    /// Responsible for pop viewcontroller from navigation controller
    func backToNavigation(with animation: Bool = true) {
       self.topNavigationController()?.popViewController(animated: animation)
    }
    
    /// Responsible for pop to Root  navigation controller
    func backToRootNavigation(with animation: Bool = true) {
        self.topNavigationController()?.popToRootViewController(animated: animation)
    }
    
    func pushVC(viewController: UIViewController, animated: Bool = true) {
        self.topNavigationController()?.pushViewController(viewController, animated: animated)
    }
    
    func presentVC(viewController: UIViewController, afterDelay: Double = 0.0, animated: Bool = true
                   , completion:(() -> Void)?) {
        DispatchQueue.main.asyncAfter(deadline: .now() + afterDelay) {
            self.topViewController()?.present(viewController, animated: animated, completion: completion)
        }
    }
    
    func dissmisVC(animated: Bool = true, afterDelay: Double = 0.0, completion:(() -> Void)?) {
        DispatchQueue.main.asyncAfter(deadline: .now() + afterDelay) {
            self.topViewController()?.dismiss(animated: animated, completion: completion)
        }
    }
}
