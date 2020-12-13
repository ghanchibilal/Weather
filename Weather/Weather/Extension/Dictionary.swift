//
//  Dictionary.swift
//  Weather
//
//  Created by Bilal Ghanchi on 10/12/20.
//

import Foundation

extension Dictionary {
    
    var queryString: String {
        var output: String = ""
        for (key,value) in self {
            output +=  "\(key)=\(value)&"
        }
        output = String(output.dropLast())
        return output
    }
}
