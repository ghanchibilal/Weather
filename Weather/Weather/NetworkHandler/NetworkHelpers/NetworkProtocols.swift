//
//  NetworkProtocols.swift
//  Weather
//
//  Created by Bilal Ghanchi on 09/12/20.
//

import Foundation

protocol Endpoint {
    
    associatedtype T
    
    var url: String {get}
    var httpMethods: RequestMethods {get}
    var params: [String: Any] {get}
    var header: [String: String] {get}
    var reqModel:T? {get set}
    
    init(requestModel:T?)
}

extension Endpoint {
    var header: [String: String] {
        return [:]
    }
    
    var BaseUrl: String {
        return AppConst.currentEnvironment.apiUrl
    }
}
