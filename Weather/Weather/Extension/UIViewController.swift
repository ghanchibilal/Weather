//
//  UIViewController.swift
//  Weather
//
//  Created by Bilal Ghanchi on 09/12/20.
//

import Foundation
import UIKit

/// It is an extension of UIViewController class.
extension UIViewController {
    
    // MARK: Variables
    /// storyboardID is used to identify the storyboard from the bundle.
    class var storyboardID: String {
        return "\(self)"
    }
    
    // MARK: Methods
    /// Get instance of any UIViewController type
    ///
    /// - Parameters:
    ///     - appStoryboard: Input storyboard containing that UIViewController
    static func instantiateFrom(appStoryboard: AppStoryboard) -> Self {
        return appStoryboard.viewController(viewControllerClass: self)
    }

    /// Show Alertview
    ///
    /// - Parameters:
    ///     - title: input Title for alertview controller
    ///     - message: input message for alertview controller
    ///     - btnTitleOne: input first title for button
    ///     - btnTitleTwo: input second title for button
    ///     - complition: to get the callback and perform changes accordingly
    func showMessageAlert(title: String, message: String, btnTitleOne: String, btnTitleTwo: String? = nil, isDestructive: Bool =  false, complition: @escaping (Bool) -> Void) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        /// set first button of alertview
        let firstBtn = UIAlertAction(title: btnTitleOne, style: isDestructive ? .destructive : .cancel) { _ in
            complition(true)
        }
        alertController.addAction(firstBtn)
        guard let secondBtnTitle = btnTitleTwo else {
            self.present(alertController, animated: true, completion: nil)
            return
        }
        /// set second button of alertview
        let secondBtn = UIAlertAction(title: secondBtnTitle, style: isDestructive ? .cancel : .default) { _ in
            complition(false)
        }
        alertController.addAction(secondBtn)
        guard self.presentedViewController == nil else { return }
        self.present(alertController, animated: true, completion: nil)
    }
}
