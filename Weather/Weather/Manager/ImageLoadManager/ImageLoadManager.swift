//
//  ImageLoadManager.swift
//  Weather
//
//  Created by Bilal Ghanchi on 11/12/20.
//

import Foundation
import UIKit

class ImageLoadManager {

    static let shared = ImageLoadManager()
    var imageCache:NSCache<NSString, UIImage>
    
    private init() {
        self.imageCache = NSCache()
    }
    
    func getImage(forUrl url:String) -> UIImage? {
        return self.imageCache.object(forKey: url as NSString)
    }
    
    func setImage(image:UIImage,forKey url:String) -> Void {
        self.imageCache.setObject(image, forKey: url as NSString)
    }
}

class ImageDownloader {

    func downloadAndCacheImage(url:String, onSuccess:@escaping (_ image:UIImage?, _ url: String) -> Void, onFailure:@escaping (_ error:Error?) -> Void) -> Void {
        
        let finalUrl = URL(string: url )
        
        if let image = AppShare.imageLoadManager.getImage(forUrl: url){
            onSuccess(image, url)
        }else{
            URLSession.shared.dataTask(with: finalUrl!, completionHandler: { (data, response, error) in
                
                if error != nil {
                    print(error!)
                    onFailure(error)
                }else{
                    if let image = UIImage(data: data!){
                        AppShare.imageLoadManager.setImage(image: image, forKey: url)
                        onSuccess(image, url)
                    }else{
                        onFailure(NSError(domain: "", code: 100, userInfo: ["reason":"Unable to download image"]))
                    }

                }
                
            }).resume()
        }
       
    }
}
