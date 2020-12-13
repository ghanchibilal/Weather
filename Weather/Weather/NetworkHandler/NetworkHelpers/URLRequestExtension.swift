//
//  URLRequestExtension.swift
//  Weather
//
//  Created by Bilal Ghanchi on 09/12/20.
//

import Foundation
import UIKit

extension URLRequest {
    init<U:Endpoint>(endpoint: U) throws {
        guard let url = URL(string: endpoint.url) else {
            throw NetworkError.custom("Invalid URL")
        }
        self.init(url:url)
        setValue("application/json", forHTTPHeaderField: "Content-Type")
        httpMethod = endpoint.httpMethods.rawValue
        
        if endpoint.header.count > 0  {
            allHTTPHeaderFields = endpoint.header
        }
        
        switch endpoint.httpMethods {
        case .POST, .PUT:
            httpBody = try! JSONSerialization.data(withJSONObject: endpoint.params, options: .prettyPrinted)
        default : break
        }
    }
    
    init<U:Endpoint>(multipart endpoint:U) throws {
        guard let url = URL(string: endpoint.url) else {
            throw NetworkError.custom("Invalid URL")
        }
        self.init(url:url)
        setValue("application/json", forHTTPHeaderField: "Content-Type")
        httpMethod = endpoint.httpMethods.rawValue
        allHTTPHeaderFields = endpoint.header
        
        let boundary = UUID().uuidString
        setValue("multipart/form-data; boundary=\(boundary)", forHTTPHeaderField: "Content-Type")
        
        switch endpoint.httpMethods {
        case .POST, .PUT:
            httpBody = try! JSONSerialization.data(withJSONObject: endpoint.params, options: .prettyPrinted)
        default :
            break
        }
    }
}
