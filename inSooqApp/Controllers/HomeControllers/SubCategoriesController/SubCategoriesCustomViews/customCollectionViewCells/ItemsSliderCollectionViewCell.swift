//
//  ItemsSliderCollectionViewCell.swift
//  inSooqApp
//
//  Created by mohammad ahmad on 14/02/2021.
//

import UIKit

class ItemsSliderCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var itemImage: UIImageView!
    @IBOutlet weak var itemName: UILabel!
    @IBOutlet weak var itemPrice: UILabel!

    
    override  func awakeFromNib() {
        itemImage.layer.cornerRadius=10
    }
    func setItemData(image:UIImage,name:String,price:String){
        self.itemImage.image=image
        self.itemName.text=name
        self.itemPrice.text=price
    }
}

