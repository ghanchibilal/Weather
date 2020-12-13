//
//  ForecastCollectionViewCell.swift
//  Weather
//
//  Created by Bilal Ghanchi on 11/12/20.
//

import Foundation
import UIKit

class ForecastCollectionViewCell: UICollectionViewCell, ReusableView, NibLoadableView {
    
    @IBOutlet weak var forecastImg: UIImageView!
    @IBOutlet weak var lblInfo: UILabel!
    
    // MARK: Methods
    /// It's called when cell is initialized.
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func configureCell(weather: WeatherResponse) {

        let icon = weather.weatherType?.first?.icon ?? "50d"
        
        forecastImg.setImage(url: icon.weatherImageUrl, placeholderImage: WeatherImage.clearNight)
        
        let temprature = weather.main?.temp?.getTemperatureString()
        let time = weather.dts?.convertToDayTime(isDate: true)
        self.lblInfo.text = temprature.forceStrWrappe + GeneralString.strNewLine + time.forceStrWrappe
    }
    
}
