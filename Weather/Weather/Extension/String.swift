//
//  String.swift
//  Weather
//
//  Created by Bilal Ghanchi on 11/12/20.
//

import Foundation

extension String {
    
    var weatherImageUrl: String {
        return AppConst.currentEnvironment.imageUrl + "\(self).png"
    }
    
    var addPercentage: String {
        return "\(self)%"
    }
    
    var addPreasure: String {
        return "\(self) hPa"
    }
}
