//
//  ItemImagesCollectionViewCell.swift
//  inSooqApp
//
//  Created by mohammad ahmad on 19/04/2021.
//

import UIKit

class ItemImagesCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var itemImage: UIImageView!
    @IBOutlet weak var deleteButton: UIButton!
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
//            itemImage.sd_setImage(with: imageUrl, placeholderImage: #imageLiteral(resourceName: "logo"))
//           // addedImage.loadImge(withUrl: imageUrl)
//        }else {
//            itemImage.image = data.imageFP
//        }
//
//
//    }
    func setTempImage(data : UIImageView)
    {
        itemImage.image=data.image
    
        
    }

}

