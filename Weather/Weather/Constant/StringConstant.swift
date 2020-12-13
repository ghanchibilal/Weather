//
//  StringConstant.swift
//  Weather
//
//  Created by Bilal Ghanchi on 09/12/20.
//

import Foundation

/// Generalize String structure to define all system string
struct GeneralString {
    static let strAlert                         = "Alert!"
    static let strOK                            = "OK"
    static let strBlank                         = ""
    static let strNewLine                       = "\n"
    static let strPullToRefresh                 = "Pull to refresh"
}

/// CustomViewIdentifier structure to store the identifier for UI controls.
struct CustomViewIdentifier {
    static let RoundedView =            "RoundedView"
    static let NoDataView  =            "NoDataView"
    static let WeatherInfoDetailView =  "WeatherInfoDetailView"
}

/// ParameterString structure to store API Parameter
struct ParameterString {
    static let latitude =                  "lat"
    static let longitude =                 "lon"
    static let applicationId =             "appid"
}

/// CustomViewIdentifier structure to store View Controller Title
struct ScreenTitle {
    static let locationPicker =             "Pick Your Location"
    static let help =                       "Help"
}
