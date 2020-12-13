//
//  NetworkEnums.swift
//  Weather
//
//  Created by Bilal Ghanchi on 09/12/20.
//

import Foundation

enum RequestMethods: String {
    case POST
    case PUT
    case GET
    case DELETE
}

enum NetworkError<CustomError>:Error {
    case NoInternet
    case badReqeuest
    case invalidParams
    case authentication
    case outdated
    case invalidURL
    case invalidRequestParams
    case custom(CustomError)
}

struct CustomError: Error, Decodable {
    var message: String
}

enum Result<T, NetworkError> {
    case success(T)
    case failure(NetworkError)
}

extension Result {
    init(value: T?, or error: NetworkError) {
        guard let value = value else {
            self = .failure(error)
            return
        }
        
        self = .success(value)
    }
    
    var value: T? {
        guard case let .success(value) = self else { return nil }
        return value
    }
    
    var error: NetworkError? {
        guard case let .failure(error) = self else { return nil }
        return error
    }
}

enum ResponseStatus<NetworkError> {
    case success
    case failure(NetworkError)
}

