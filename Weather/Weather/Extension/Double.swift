//
//  Double.swift
//  Weather
//
//  Created by Bilal Ghanchi on 10/12/20.
//

import Foundation

extension Double {
    
    var toString: String {
        return "\(self)"
    }
    
    var upOneDecimalFormat: String {
        return String(format: "%.1f", self)
    }
    
    func getTemperatureString() -> String {
        return AppShare.commonFunc.getTemperature(data: self)
    }
    
    func rounded(toPlaces places: Int) -> Double {
        let divisor = pow(10.0, Double(places))
        return (self * divisor).rounded() / divisor
    }
    
    func toKphString() -> String {
        let formula = (self * 3.6).rounded(toPlaces: 1)
        return "\(formula) KPH"
    }
    
    func convertToDayTime(isDate: Bool = false) -> String {
        let date = Date(timeIntervalSince1970: self)
        let dateFormatter = DateFormatter()
        dateFormatter.calendar = .current
        dateFormatter.timeZone = TimeZone.current
        dateFormatter.dateStyle = isDate ? .medium : .none
        dateFormatter.timeStyle = .short
        return dateFormatter.string(from: date)
    }
}
