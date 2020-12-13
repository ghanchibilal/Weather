//
//  HomeViewController.swift
//  Weather
//
//  Created by Bilal Ghanchi on 08/12/20.
//

import Foundation
import UIKit


/// `HomeViewController` is used to  show list of Store City with weather information into application
class HomeViewController: BaseViewController {
    
    @IBOutlet weak var tblCityWeather: UITableView!
    @IBOutlet weak var noDataView: NoDataView!
    
    var refreshControl = UIRefreshControl()
    
    // MARK: Variables
    var objHomeViewModel = HomeViewModel()
    
    // MARK: View Controller Life Cycle
    /// It's parent class `UIViewController` methods that will be override here.
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configureView()
    }
    
    /// It's parent class `UIViewController` methods that will be override here.
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.reloadTableView()
    }
    
    private func configureView() {
        self.registerCell()
        self.navigationbarConfiguration()
        self.addRefreshControl()
        self.setWeatherData()
    }
    
    private func registerCell() {
        self.noDataView.delegate = self
        self.tblCityWeather.register(CityWeatherTblCell.self)
    }
    
    func reloadTableView() {
        self.tblCityWeather.reloadData()
        self.refreshControl.endRefreshing()
        self.handleNoDataView()
    }
    
    private func navigationbarConfiguration() {
        self.setNavigationTitle(titleType: .image)
        self.setNavigationLeftItem(type: .help)
        self.setNavigationRightItem(type: .add)
    }
    
    override func rightMenuPressed() {
        self.gotoLocationPicker()
    }
    
    override func leftMenuPressed() {
        self.gotoHelp()
    }
    
    private func addRefreshControl() {
        self.refreshControl.attributedTitle = NSAttributedString(string: GeneralString.strPullToRefresh)
        self.refreshControl.addTarget(self, action: #selector(self.refresh(_:)), for: .valueChanged)
        tblCityWeather.addSubview(self.refreshControl)
    }
    
    private func setWeatherData() {
        self.objHomeViewModel.updateLocationArray()
        self.reloadTableView()
    }
    
    private func gotoLocationPicker() {
        let locationVC = LocationPickerViewController.instantiateFrom(appStoryboard: .location)
        let locationNavigation = UINavigationController(rootViewController: locationVC)
        locationVC.delegate = self
        AppShare.viewControllerManager.presentVC(viewController: locationNavigation, completion: nil)
    }
    
    private func gotoHelp() {
        let helpVC = HelpViewController.instantiateFrom(appStoryboard: .utility)
        let helpNavigation = UINavigationController(rootViewController: helpVC)
        AppShare.viewControllerManager.presentVC(viewController: helpNavigation, completion: nil)
    }
    
    func handleNoDataView() {
        self.noDataView.isHidden = self.objHomeViewModel.islocationData
    }
}

/// It's an extension of `HomeViewController` for handle LocationPickerDelegate
extension HomeViewController: LocationPickerDelegate {
    
    func locationPickerDidAddLocations() {
        self.setWeatherData()
    }
}

/// It's an extension of `HomeViewController` for handle NoDataViewDelegate
extension HomeViewController: NoDataViewDelegate {
    
    func buttonAction(sender: UIButton) {
        self.gotoLocationPicker()
    }
}
