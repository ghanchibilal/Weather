//
//  ForecastEndPoint.swift
//  Weather
//
//  Created by Bilal Ghanchi on 11/12/20.
//

import Foundation

struct ForecastEndPoint: Endpoint {
   
    typealias T = ForecastRequest
    
    var reqModel: ForecastRequest?
    
    init(requestModel: ForecastRequest?) {
        reqModel = requestModel
    }
   
    var httpMethods: RequestMethods {
        return .GET
    }
    
    var params: [String : Any] {
        return [:]
    }
    
    var url: String {
        return BaseUrl + "forecast?" + getParameterUrl()
    }
    
    private func getParameterUrl() -> String {
        guard let requestModel = reqModel else {
            return GeneralString.strBlank
        }
        
        return ["lat": requestModel.vLatitude as Any,
                "lon": requestModel.vLongitude as Any,
                "appid": requestModel.vApplicationId as Any].queryString
    }
}
