//
//  UIImage.swift
//  Weather
//
//  Created by Bilal Ghanchi on 08/12/20.
//

import Foundation
import UIKit

// It's an extension of `UIImage`.
extension UIImage {
    
    func scaleTo(_ newSize: CGSize) -> UIImage {
        UIGraphicsBeginImageContextWithOptions(newSize, false, 0.0)
        self.draw(in: CGRect(x: 0, y: 0, width: newSize.width, height: newSize.height))
        let newImage: UIImage? = UIGraphicsGetImageFromCurrentImageContext()?.withRenderingMode(.alwaysTemplate)
        UIGraphicsEndImageContext()
        return newImage ?? self
    }
}
