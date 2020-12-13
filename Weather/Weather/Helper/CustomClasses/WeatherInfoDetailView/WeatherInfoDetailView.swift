//
//  WeatherInfoDetailView.swift
//  Weather
//
//  Created by Bilal Ghanchi on 11/12/20.
//

import Foundation
import UIKit

@IBDesignable
class WeatherInfoDetailView: UIView {

    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var weatherInfoImg: UIImageView!
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblWeatherInfo: UILabel!
    
    
    @IBInspectable var title: String? {
        didSet {
            lblTitle.text = title
        }
    }
    
    /// The String to display the Button image.
    @IBInspectable var image: UIImage? {
        didSet {
            weatherInfoImg.image = image
        }
    }
    
    // MARK: UIView Initialization
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    /// It's an initializer method
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
      
    }
    
    /// It's an initializer method
    private func commonInit() {
        let bundle = Bundle.init(for: type(of: self))
        bundle.loadNibNamed(CustomViewIdentifier.WeatherInfoDetailView, owner: self, options: nil)
        addSubview(containerView)
        containerView.frame = self.bounds
        containerView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
    }
    
    func setWeatherData(info: String?) {
        self.lblWeatherInfo.text = info
    }
}
