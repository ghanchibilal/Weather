//
//  WeatherDetailsViewModel.swift
//  Weather
//
//  Created by Bilal Ghanchi on 10/12/20.
//

import Foundation

/// `WeatherDetailsViewModel` structure for Weather Details View Model.
struct WeatherDetailsViewModel {
        
    var forecastDataResponse: ForecastResponse?
    
    func getWindSpeed(data: Double?) -> String? {
        return data.forceWrappe.toKphString()
    }
    
    func getHumidity(data: Double?) -> String? {
        return data.forceWrappe.toString.addPercentage
    }
    
    func getPressure(data: Double?) -> String? {
        return data.forceWrappe.rounded(toPlaces: 1).toString.addPreasure
    }
    
    func getTemperature(data: Double?) -> String? {
        return (data ?? 273.15).getTemperatureString()
    }
    
    func getFullTemperature(minTemp: String, maxTemp: String) -> String? {
        return "Min:\(minTemp)" + GeneralString.strNewLine + "Max:\(maxTemp)"
    }
    
    func getDateTime(data: Double?, isDate: Bool = false) -> String? {
        return data?.convertToDayTime(isDate: isDate)
    }
    
    func getForecastInfoAPI(latitude: Double?, longitude: Double?, completionHandler: @escaping (Result<ForecastResponse, NetworkError<String>>) -> ()) {
        
        let endPoint = ForecastEndPoint(requestModel: ForecastRequest(latitude: latitude, longitude: longitude))
        
        ForecastClient().load(endpoint: endPoint, complition: completionHandler)
    }
}
