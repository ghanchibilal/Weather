//
//  UIImageView.swift
//  Weather
//
//  Created by Bilal Ghanchi on 11/12/20.
//

import Foundation
import UIKit

extension UIImageView {
    
    private static var urlDataStore = [String:String]()
    
    func setImage(url: String, placeholderImage: UIImage? = GeneralImage.placeholderImg) {
        let tmpAddress = String(format: "%p", unsafeBitCast(self, to: Int.self))
        UIImageView.urlDataStore[tmpAddress] = url
        
        if let image = placeholderImage {
            self.image = image
        } else{
            self.backgroundColor = .gray
        }
        
        ImageDownloader().downloadAndCacheImage(url: url, onSuccess: { (image, url) in
            DispatchQueue.main.async {
            if UIImageView.urlDataStore[tmpAddress] == url {
                        self.image = image
                        self.backgroundColor = .clear
                    }
            }
        }) { error in
        }
    }
}
