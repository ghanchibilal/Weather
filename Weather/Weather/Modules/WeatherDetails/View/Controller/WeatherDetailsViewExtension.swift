//
//  WeatherDetailsViewExtension.swift
//  Weather
//
//  Created by Bilal Ghanchi on 11/12/20.
//

import Foundation
import UIKit

/// It's an extension of `WeatherDetailsViewController` for handle UICollectionView DataSource
extension WeatherDetailsViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    /// Asks your data source object for the number of sections in the collection view.
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    /// Asks your data source object for the number of items in the specified section.
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.objWeatherDetailsViewModel.forecastDataResponse?.list?.count ?? 0
    }
    
    /// Asks your data source object for the cell that corresponds to the specified item in the collection view.
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
       guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ForecastCollectionViewCell.reuseIdentifier, for: indexPath) as? ForecastCollectionViewCell else {
            return UICollectionViewCell()
        }
        
        guard let objWeather =  self.objWeatherDetailsViewModel.forecastDataResponse?.list?[indexPath.row] else {
            return UICollectionViewCell()
        }
        cell.configureCell(weather: objWeather)
        return cell
    }
    
    /// Tells the delegate that the item at the specified index path was selected.
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
    }
}

/// It's an extension of `WeatherDetailsViewController` for handle UICollectionViewDelegateFlowLayout
extension WeatherDetailsViewController:  UICollectionViewDelegateFlowLayout {
    // Asks the delegate for the size of the specified item’s cell.
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let height = collectionView.frame.size.height
        return CGSize(width: height * 0.75, height: height)
    }
}
