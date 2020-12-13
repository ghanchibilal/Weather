//
//  HelpViewController.swift
//  Weather
//
//  Created by Bilal Ghanchi on 12/12/20.
//

import Foundation
import WebKit


class HelpViewController: BaseViewController {

    @IBOutlet weak var webView: WKWebView!
    
    var objHelpViewModel = HelpViewModel()
    
    // MARK: View Controller Life Cycle
    /// It's parent class `UIViewController` methods that will be override here.
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configureView()
    }
    
    /// It's parent class `UIViewController` methods that will be override here.
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    /// It Responsible for Configure View
    private func configureView() {
        self.configureData()
    }
    
    /// Responsible for configure Data
    private func configureData() {
        self.navigationbarConfiguration()
        self.loadHtmlFile()
    }
    
    private func navigationbarConfiguration() {
        self.setNavigationTitle(titleType: .text, titleName: ScreenTitle.help)
        self.setNavigationLeftItem(type: .back)
    }
    
    override func leftMenuPressed() {
        AppShare.viewControllerManager.dissmisVC(completion: nil)
    }
    
    private func loadHtmlFile() {
        if let indexURL = self.objHelpViewModel.getHelpURL() {
            self.webView.loadFileURL(indexURL,
                                     allowingReadAccessTo: indexURL)
        }
    }
  
}
