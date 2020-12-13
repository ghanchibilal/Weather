//
//  HelpViewModel.swift
//  Weather
//
//  Created by Bilal Ghanchi on 12/12/20.
//

import Foundation

struct HelpViewModel {
        
    func getHelpURL() -> URL? {
        return Bundle.main.url(forResource: "HowToUse",
                                              withExtension: "html")
    }
}
