//
//  BaseModel.swift
//  Weather
//
//  Created by Bilal Ghanchi on 10/12/20.
//

import Foundation

protocol BaseModel: Codable {}

struct ErrorModel {
    var statusCode:String?
    var errorMessage:String?
    
    var dStatus:Int! {
        if let value = statusCode {
            return Int(value)
        } else {
            return 0
        }
    }
    
    var dMessage:String! {
        if let value = errorMessage {
            return value
        } else {
            return ""
        }
    }
}

