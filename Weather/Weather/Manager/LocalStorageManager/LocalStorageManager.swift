//
//  LocalStorageManager.swift
//  Weather
//
//  Created by Bilal Ghanchi on 09/12/20.
//

import Foundation

struct LocalStorageKeys {
    static let storeLocations                  = "storeLocations"
    static let tempretureUnit                  = "tempretureUnit"
}

class LocalStorageManager {
    
    class func add(location: LocationModel) {
        
        if var locationArray = self.getLocations() {
            locationArray.append(location)
            self.updateLocations(locations: locationArray)
        } else {
            self.updateLocations(locations: [location])
        }
    }
    
    class func updateLocations(locations: [LocationModel]?) {
        guard let locationArray = locations else { return }
        UserDefaults.standard.encode(for: locationArray, using: LocalStorageKeys.storeLocations)
    }
    
    class func getLocations() -> [LocationModel]? {
        return UserDefaults.standard.decode(for: [LocationModel].self, using: LocalStorageKeys.storeLocations)
    }
    
    class func removeAllData() {
        UserDefaults.standard.removeObject(forKey: LocalStorageKeys.storeLocations)
    }
    
    class func setTempretureUnit(unit: TempretureUnit) {
        UserDefaults.standard.set(unit.rawValue, forKey: LocalStorageKeys.tempretureUnit)
    }
    
    class func getTempretureUnit() -> TempretureUnit {
        guard  let unit = UserDefaults.standard.value(forKey: LocalStorageKeys.tempretureUnit) as? String else {
            return  TempretureUnit.celsius
        }
        return TempretureUnit(rawValue: unit) ?? TempretureUnit.celsius
    }
}
