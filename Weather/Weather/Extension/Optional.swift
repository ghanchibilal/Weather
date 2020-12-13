//
//  Optional.swift
//  Weather
//
//  Created by Bilal Ghanchi on 09/12/20.
//

import Foundation

/// This extension is responsible for checking variouse functionlity on optionals
extension Optional where Wrapped == String {
    var forceStrWrappe: String {
        return self ?? GeneralString.strBlank
    }
}

extension Optional where Wrapped == Double {
    /// It is used for force unwrapped
    var forceWrappe: Double {
          return self ?? 0.0
      }
}
