//
//  SilderImagesCollectionViewCell.swift
//  inSooqApp
//
//  Created by mohammad ahmad on 10/02/2021.
//

import UIKit

class SilderImagesCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var sliderImage: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    func setSlider(image:UIImage){
        sliderImage.image=image
    }

    
    func setSlider(pics: [PictureModel] , index: Int){
        if let imgUrl = pics[safe: index]?.imageURL{
            var imgUrlString = imgUrl
            if imgUrlString.contains("\\")
            {
                imgUrlString = imgUrlString.replacingOccurrences(of: "\\", with: "/")
                imgUrlString = imgUrlString.replacingOccurrences(of: " ", with: "%20")
            }
            if let url = URL(string: imgUrlString){
                sliderImage.kf.setImage(with: url)
            }
        }
    }
}
