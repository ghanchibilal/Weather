//
//  HomeViewControllerExtension.swift
//  Weather
//
//  Created by Bilal Ghanchi on 09/12/20.
//

import Foundation
import UIKit

/// Extension of `HomeViewController` to manage tableview deletate and datasource methods.
extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    
    // MARK: UITableViewDataSource
    /// Asks the data source to return the number of sections in the table view.
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    /// Tells the data source to return the number of rows in a given section of a table view.
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.objHomeViewModel.locationArray?.count ?? 0
    }
    
    /// Asks the data source for a cell to insert in a particular location of the table view.
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CityWeatherTblCell.NibName, for: indexPath) as? CityWeatherTblCell else {
            return UITableViewCell()
        }
        cell.configureCell(model: self.objHomeViewModel.locationArray?[indexPath.row])
        return cell
    }
    
    // MARK: UITableViewDataSource
    /// Tells the delegate that the specified row is now selected.
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        guard let cell = tableView.cellForRow(at: indexPath) as? CityWeatherTblCell else {
            return
        }
        
        guard let weatherData = cell.weatherData, weatherData.coordinate != nil else {
            return
        }
        self.gotoWeatherDetails(model: weatherData)
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            self.objHomeViewModel.removeLocation(index: indexPath.row)
            tableView.beginUpdates()
            tableView.deleteRows(at: [indexPath], with: .automatic)
            tableView.endUpdates()
            self.handleNoDataView()
        }
    }
    
    private func gotoWeatherDetails(model: WeatherResponse?) {
        let weatherDetailsVC = WeatherDetailsViewController.instantiateFrom(appStoryboard: .main)
        weatherDetailsVC.weatherData = model
        AppShare.viewControllerManager.pushVC(viewController: weatherDetailsVC)
    }
    
    @objc func refresh(_ sender: AnyObject) {
        self.objHomeViewModel.locationArray?.forEach({ $0.isRefrehing = false })
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
            self.reloadTableView()
        }
    }
}
