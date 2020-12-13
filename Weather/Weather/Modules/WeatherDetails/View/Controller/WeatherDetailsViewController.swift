//
//  WeatherDetailsViewController.swift
//  Weather
//
//  Created by Bilal Ghanchi on 10/12/20.
//

import Foundation
import UIKit


/// `WeatherDetailsViewController` is used to  show full details of the weather of city
class WeatherDetailsViewController: BaseViewController {
    
    @IBOutlet weak var lblWeatherTempreture: UILabel!
    @IBOutlet weak var lblWeatherStatus: UILabel!
    @IBOutlet weak var weatherImg: UIImageView!
    @IBOutlet weak var weatherDataCollectionView: UICollectionView!
    @IBOutlet weak var windView: WeatherInfoDetailView!
    @IBOutlet weak var humidityView: WeatherInfoDetailView!
    @IBOutlet weak var temperatureView: WeatherInfoDetailView!
    @IBOutlet weak var sunriseView: WeatherInfoDetailView!
    @IBOutlet weak var sunsetView: WeatherInfoDetailView!
    @IBOutlet weak var pressureView: WeatherInfoDetailView!
    
    // MARK: Variables
    var objWeatherDetailsViewModel = WeatherDetailsViewModel()
    var weatherData: WeatherResponse?
    
    // MARK: View Controller Life Cycle
    /// It's parent class `UIViewController` methods that will be override here.
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configureView()
    }
    
    private func configureView() {
        self.navigationbarConfiguration()
        self.registerCell()
        self.setWeatherUI()
        self.getForecastData()
    }
    
    private func navigationbarConfiguration() {
        self.setNavigationLeftItem(type: .back)
        self.setNavigationRightItem(type: .settings)
    }
    
    override func leftMenuPressed() {
        AppShare.viewControllerManager.backToNavigation()
    }
    
    override func rightMenuPressed() {
        self.showSettingView()
    }
    
    private func registerCell() {
        self.weatherDataCollectionView.register(ForecastCollectionViewCell.self)
    }
    
    private func reloadCollectionView() {
        self.weatherDataCollectionView.reloadData()
    }
    
    /// Set Weather Details UI
    private func setWeatherUI() {
        
        guard let data = self.weatherData else { return }
        
        self.setNavigationTitle(titleType: .text, titleName: data.cityName.forceStrWrappe)
        self.lblWeatherTempreture.text = data.main?.temp?.getTemperatureString()
        self.lblWeatherStatus.text = data.weatherType?.first?.main?.capitalized
        
        self.weatherImg.image = AppShare.commonFunc.getWeatherImage(type: data.weatherType?.first?.description.forceStrWrappe)
        
        self.windView.setWeatherData(info: self.objWeatherDetailsViewModel.getWindSpeed(data: data.wind?.speed))
        self.humidityView.setWeatherData(info: self.objWeatherDetailsViewModel.getHumidity(data: data.main?.humidity))
        
        self.sunriseView.setWeatherData(info: self.objWeatherDetailsViewModel.getDateTime(data: data.sys?.sunrise))
        self.sunsetView.setWeatherData(info: self.objWeatherDetailsViewModel.getDateTime(data: data.sys?.sunset))
        
        self.pressureView.setWeatherData(info: self.objWeatherDetailsViewModel.getPressure(data: data.main?.pressure))
       
        let minTemp = self.objWeatherDetailsViewModel.getTemperature(data: data.main?.tempMin)
        let maxTemp = self.objWeatherDetailsViewModel.getTemperature(data: data.main?.tempMax)
        let fullTemInfo = self.objWeatherDetailsViewModel.getFullTemperature(minTemp: minTemp.forceStrWrappe, maxTemp: maxTemp.forceStrWrappe)
        self.temperatureView.setWeatherData(info: fullTemInfo)
    }
    
    /// API Call For Getting Forecast Data
    private func getForecastData() {
        
        guard let latitude = self.weatherData?.coordinate?.latitude, let longitude = self.weatherData?.coordinate?.longitude else { return }
        
        self.objWeatherDetailsViewModel.getForecastInfoAPI(latitude: latitude, longitude: longitude) { (result: Result<ForecastResponse, NetworkError<String>>) in
            guard let weatherResult = result.value else { return }
            self.objWeatherDetailsViewModel.forecastDataResponse = weatherResult
            self.reloadCollectionView()
        }
    }
    
    /// Show Setting View
    private func showSettingView() {
        let settingVC = SettingsViewController.instantiateFrom(appStoryboard: .utility)
        settingVC.modalPresentationStyle = .overCurrentContext
        settingVC.delegate = self
        AppShare.viewControllerManager.presentVC(viewController: settingVC, animated: true, completion: {
            UIView.animate(withDuration: 0.2, delay: 0.0, options:[], animations: {
                settingVC.containerView.backgroundColor = UIColor.black.withAlphaComponent(0.35)
            }, completion:nil)
        })
    }
}

/// It's an extension of `WeatherDetailsViewController` for handle SettingsViewControllerDelegate
extension WeatherDetailsViewController: SettingsViewControllerDelegate {
    
    func updateTemperatureUnit() {
        self.setWeatherUI()
        self.reloadCollectionView()
    }
}
