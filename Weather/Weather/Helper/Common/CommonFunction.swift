//
//  commonFunction.swift
//  Weather
//
//  Created by Bilal Ghanchi on 09/12/20.
//

import Foundation
import UIKit

struct CommonFunction {
    
    static let shared = CommonFunction()
    
    private init() {
    }
    
    func showCommanAlert(title: String = GeneralString.strAlert, message: String) {
        AppShare.viewControllerManager.topViewController()?.showMessageAlert(title: title, message: message, btnTitleOne: GeneralString.strOK, complition: {_ in
        })
    }
    
    func getWeatherImage(type: String?) -> UIImage? {
        if let weatherImage = WeatherTypes(rawValue: type ?? GeneralString.strBlank)?.icon  {
            return weatherImage
        } else {
            return WeatherImage.cloudyDay
        }
    }
    
    
    func getJSONResponseObject<T: Codable, U: Endpoint>(endpoint: U, fileName: StubbedResponsesFile, complition: @escaping (Result<T, NetworkError<String>>)->()) {
        
        if let url = Bundle.main.url(forResource: fileName.rawValue, withExtension: "json") {
            do {
                let data = try Data(contentsOf: url)
                let decoder = JSONDecoder()
                let jsonData = try decoder.decode(T.self, from: data) as T
                complition(.success(jsonData))
            } catch {
                print("error:\(error)")
                complition(.failure(.custom(error.localizedDescription)))
            }
        }
    }
    
    func getTemperature(data: Double) -> String {
        let celsius = (data - 273.15).rounded(toPlaces: 1)
        switch LocalStorageManager.getTempretureUnit() {
        case .celsius:
            return celsius.upOneDecimalFormat + LocalStorageManager.getTempretureUnit().unit
            
        case .fahrenheit:
            let fahrenheit =  (celsius * 1.8) + 32
            return fahrenheit.upOneDecimalFormat + LocalStorageManager.getTempretureUnit().unit
        }
    }
    
    func getTimestamp() -> String {
        let timestamp = NSDate().timeIntervalSince1970
        return timestamp.toString
    }
}
