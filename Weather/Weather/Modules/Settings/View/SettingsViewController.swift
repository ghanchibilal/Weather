//
//  SettingsViewController.swift
//  Weather
//
//  Created by Bilal Ghanchi on 12/12/20.
//

import Foundation
import UIKit

protocol SettingsViewControllerDelegate: class {
    func updateTemperatureUnit()
}

class SettingsViewController: BaseViewController {
    
    // MARK: Variables
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var btnClose: UIButton!
    @IBOutlet weak var floatingView: UIView!
    @IBOutlet weak var touchView: UIView!
    @IBOutlet weak var tempretureUnit: UISegmentedControl!
    
    weak var delegate: SettingsViewControllerDelegate?
    
    // MARK: View Controller Life Cycle
    /// It's parent class `UIViewController` methods that will be override here.
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configureView()
    }
    
    private func configureView() {
        self.view.backgroundColor = .clear
        self.addTapGesture()
        self.tempretureUnit.selectedSegmentIndex = LocalStorageManager.getTempretureUnit().index
    }
    
    // MARK: Action Events
    @IBAction func buttonClick(_ sender: UIButton) {
        switch sender {
        case btnClose: closeAction()
        default: return
        }
    }
    
    @IBAction func temperatureUnitChange(_ sender: Any) {
        switch tempretureUnit.selectedSegmentIndex {
        case 0:
            LocalStorageManager.setTempretureUnit(unit: .celsius)
        case 1:
            LocalStorageManager.setTempretureUnit(unit: .fahrenheit)
        default: break
        }
        self.delegate?.updateTemperatureUnit()
    }
    
    private func addTapGesture() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(self.handleTap(_:)))
        self.touchView.addGestureRecognizer(tap)
    }
    
    private func closeAction() {
        self.containerView.backgroundColor = .clear
        AppShare.viewControllerManager.dissmisVC(animated: true,completion: nil)
    }
    
    @objc private func handleTap(_ sender: UITapGestureRecognizer?) {
        self.closeAction()
    }
}
