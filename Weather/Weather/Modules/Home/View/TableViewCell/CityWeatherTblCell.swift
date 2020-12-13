//
//  CityWeatherTblCell.swift
//  Weather
//
//  Created by Bilal Ghanchi on 09/12/20.
//

import Foundation
import UIKit

/// `CityWeatherTblCell` is a class that is used to display list of City with Weather
class CityWeatherTblCell: UITableViewCell, ReusableView, NibLoadableView {
    
    // MARK: Variables
    @IBOutlet weak var lblCity: UILabel!
    @IBOutlet weak var lblWatherType: UILabel!
    @IBOutlet weak var lblTemperature: UILabel!
    @IBOutlet weak var weatherTypeImageView: UIImageView!
    
    var weatherData: WeatherResponse?
    var objHomeViewModel = HomeViewModel()
    
    // MARK: Methods
    /// It's called when cell is initialized.
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func configureCell(model: LocationModel?) {
        self.setCellData(locationData: model)
    }
    
    private func setCellData(locationData: LocationModel?) {
        self.lblCity.text = locationData?.cityName
        self.getWatherData(location: locationData)
    }
    
    private func getWatherData(location: LocationModel?) {
        
        guard self.weatherData == nil || location?.isRefrehing == false else {
            self.setWeatherData()
            return
        }
        
        self.objHomeViewModel.getWeatherInfoAPI(latitude: location?.latitude, longitude: location?.longitude) { (result: Result<WeatherResponse, NetworkError<String>>) in
            guard let weatherResult = result.value else { return }
            location?.isRefrehing = true
            self.weatherData = weatherResult
            self.weatherData?.cityName = self.lblCity.text
            self.setWeatherData()
        }
    }
    
    private func setWeatherData() {
        guard let weather = self.weatherData else { return }
        self.lblTemperature.text = weather.main?.temp?.getTemperatureString()
        self.lblWatherType.text = weather.weatherType?.first?.main?.capitalized

        self.weatherTypeImageView.image = AppShare.commonFunc.getWeatherImage(type: weather.weatherType?.first?.description.forceStrWrappe)
    }
}
