//
//  ViewOnCarCollectionViewCell.swift
//  inSooqApp
//
//  Created by mohammad ahmad on 16/06/2021.
//

import UIKit
import SDWebImage

class ViewOnCarCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var itemImage: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
//        objectCornerRadiusShadow(with: itemImage)
    }

    func setImagesData(data : UIImage)
    {
        itemImage.image=data

    }

//    func setImageToUpdate(data : ImagesFS){
//        if data.flag
//        { let imageUrlString = data.imageFS
//
//          //  guard let imageUrl:URL = /URL(string:WebSe+imageUrlString)
//            else{return}
//            itemImage.sd_setImage(with: imageUrl, placeholderImage: #imageLiteral(resourceName: "logo_light"))
//        }else {
//            itemImage.image = data.imageFP
//        }
//
//
//    }

}
