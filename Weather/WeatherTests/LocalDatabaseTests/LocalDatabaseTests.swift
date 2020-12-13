//
//  LocalDatabaseTests.swift
//  WeatherTests
//
//  Created by Bilal Ghanchi on 12/12/20.
//

import XCTest
@testable import Weather

class LocalDatabaseTests: XCTestCase {

    var homeViewModel: HomeViewModel!
    var locationPickerViewModel: LocationPickerViewModel!
    
    override func setUp() {
        self.homeViewModel = HomeViewModel()
        self.locationPickerViewModel = LocationPickerViewModel()
    }
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    override func tearDown() {
        LocalStorageManager.removeAllData()
    }
    
    private func saveData() {
        
        locationPickerViewModel.saveLocationData(coordinate: UnitTestConstant.location, cityName: UnitTestConstant.cityName)
    }

    func testSaveToLocalDatabase() {
        self.saveData()
        homeViewModel.updateLocationArray()
        
        let checkDataIsAvailable = homeViewModel.islocationData
        
        XCTAssertTrue(checkDataIsAvailable)
    }
    
    func testFeatchToLocalDatabase() {
        self.saveData()
        let data = homeViewModel.getLocationFromDB()
        
        XCTAssertNotNil(data)
    }
    
    func testRemoveToLocalDatabase() {
        self.saveData()
        homeViewModel.updateLocationArray()
        
        let currentArray = homeViewModel.getLocationFromDB().count
        
        homeViewModel.removeLocation(index: 0)
        let updateArray = homeViewModel.getLocationFromDB().count
        
        XCTAssertTrue(currentArray != updateArray)
    }

}
