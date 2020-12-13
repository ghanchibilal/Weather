//
//  BaseViewController.swift
//  Weather
//
//  Created by Bilal Ghanchi on 8/12/20.
//

import Foundation
import UIKit

// `BaseViewController` is a class that acts as superclass of all UIViewController.
class BaseViewController: UIViewController {
    // MARK: Variables
    
    
    // MARK: View Controller Life Cycle
    /// It's parent class `UIViewController` methods that will be override here.
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setBaseViewConfiguration()
    }
    /// It's parent class `UIViewController` methods that will be override here.
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.setNeedsStatusBarAppearanceUpdate()
    }
    /// It's parent class `UIViewController` methods that will be override here.
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
    }
    /// It's parent class `UIViewController` methods that will be override here.
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.setNeedsStatusBarAppearanceUpdate()
    }
    /// It's parent class `UIViewController` methods that will be override here.
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
 
    /// It's used to handle status bar style throughout the application.
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    /// Set Initial Baseview Configuration
    func setBaseViewConfiguration() {
        self.navigationController?.navigationBar.barTintColor = GeneralColor.themeColor
        self.navigationController?.navigationBar.backgroundColor = GeneralColor.themeColor
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        self.view.backgroundColor = .white
    }
    
    // MARK: IBActions
    /// Action perform when user tap on left bar button.
    @objc func leftMenuPressed() {
        assert(true, "Need to be override")
    }
    
    /// Action perform when user tap on right bar button.
    @objc func rightMenuPressed() {
        assert(true, "Need to be override")
    }
}


extension BaseViewController {
    
    /// It's used to set the navigation bar Title or Image.
    func setNavigationTitle(titleType: NavigationTitleContentType, titleName: String? = nil) {
        switch titleType {
        case .image:
            let titleImg = NavigationImage.titleImg?.scaleTo(CGSize(width: 50, height: 50))
            let titleImgView = UIImageView(image: titleImg)
            titleImgView.contentMode = .scaleAspectFill
            titleImgView.tintColor = .white
            navigationItem.titleView = titleImgView
            
        default:
            self.navigationItem.title = titleName
        }
       
    }
    
    /// It's used to set the custom button in left navigation item.
    func setNavigationLeftItem(type: NavigationButton) {
        let customLeftButton = UIButton(type: .custom)
        customLeftButton.setImage(type.buttonImg, for: .normal)
        customLeftButton.addTarget(self, action: #selector(BaseViewController.leftMenuPressed), for: .touchUpInside)
        customLeftButton.tintColor = .white
        let leftBarButton = UIBarButtonItem(customView: customLeftButton)
        self.navigationItem.leftBarButtonItem = leftBarButton
    }
    
    /// It's used to set the custom button in right navigation item.
    func setNavigationRightItem(type: NavigationButton) {
        let customRightButton = UIButton(type: .custom)
        customRightButton.setImage(type.buttonImg, for: .normal)
        customRightButton.addTarget(self, action: #selector(BaseViewController.rightMenuPressed), for: .touchUpInside)
        customRightButton.tintColor = .white
        let rightBarButton = UIBarButtonItem(customView: customRightButton)
        self.navigationItem.rightBarButtonItem = rightBarButton
    }
}
