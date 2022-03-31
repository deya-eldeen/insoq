//
//  Kingfisher.swift
//  orood
//
//  Created by Deya AlDeen on 18/09/2021.
//

import UIKit
import Kingfisher

extension UIImageView {
    
    func setImageAsThumb(url:String) {
        let formattedURL = url.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? ""
        let scale = UIScreen.main.scale
        let resizingProcessor = ResizingImageProcessor(referenceSize: CGSize(width: 80.0 * scale, height: 80.0 * scale))
        //self.kf.indicatorType = .activity
        self.kf.setImage(with: URL(string: formattedURL), placeholder: nil, options: [.processor(resizingProcessor)])
    }
    
    func setImage(url:String) {
        let formattedURL = url.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? ""
        let scale = UIScreen.main.scale
        let resizingProcessor = ResizingImageProcessor(referenceSize: CGSize(width: 130.0 * scale, height: 130.0 * scale))
        //self.kf.indicatorType = .activity
        //,.transition(.fade(0.2))
        self.kf.setImage(with: URL(string: formattedURL), placeholder: nil, options: [.processor(resizingProcessor)])
    }
    
    func setImageAsTemplate(url:String){
        let formattedURL = url.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? ""
        self.kf.setImage(with: URL(string: formattedURL), placeholder: nil, options: nil)
    }
    
}

extension UIImage {


    func aspectFittedToHeight(_ newHeight: CGFloat) -> UIImage {
        
        var newHeightClamped = newHeight
        if(newHeightClamped > 256) { newHeightClamped = 256 }

        let scale = newHeightClamped / self.size.height
        let newWidth = self.size.width * scale

        let newSize = CGSize(width: newWidth, height: newHeightClamped)
        let renderer = UIGraphicsImageRenderer(size: newSize)

        return renderer.image { _ in
            self.draw(in: CGRect(origin: .zero, size: newSize))
        }
        
    }
    
    func quartered() -> UIImage {
        self.aspectFittedToHeight((self.size.height ) * 0.25 )
    }
    
    func halfed() -> UIImage {
        self.aspectFittedToHeight((self.size.height ) * 0.714 )
    }
    
    
}
