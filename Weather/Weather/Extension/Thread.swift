//
//  Thread.swift
//  Weather
//
//  Created by Bilal Ghanchi on 12/12/20.
//

import Foundation

extension Thread {
    
  var isRunningXCTest: Bool {
    for key in self.threadDictionary.allKeys {
      guard let keyAsString = key as? String else {
        continue
      }
    
      if keyAsString.split(separator: ".").contains("xctest") {
        return true
      }
    }
    return false
  }
}
