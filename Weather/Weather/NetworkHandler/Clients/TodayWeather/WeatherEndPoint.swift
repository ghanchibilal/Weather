//
//  WeatherEndPoint.swift
//  Weather
//
//  Created by Bilal Ghanchi on 10/12/20.
//

import Foundation

struct WeatherEndPoint: Endpoint {
   
    typealias T = WeatherRequest
    
    var reqModel: WeatherRequest?
    
    init(requestModel: WeatherRequest?) {
        reqModel = requestModel
    }
   
    var httpMethods: RequestMethods {
        return .GET
    }
    
    var params: [String : Any] {
        return [:]
    }
    
    var url: String {
        return BaseUrl + "weather?" + getParameterUrl()
    }
    
    func getParameterUrl() -> String {
        guard let requestModel = reqModel else {
            return GeneralString.strBlank
        }
        
        return ["lat": requestModel.vLatitude as Any,
                "lon": requestModel.vLongitude as Any,
                "appid": requestModel.vApplicationId as Any].queryString
    }
}
