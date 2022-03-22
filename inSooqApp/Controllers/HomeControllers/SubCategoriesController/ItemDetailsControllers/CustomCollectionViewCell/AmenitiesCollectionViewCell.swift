//
//  AmenitiesCollectionViewCell.swift
//  inSooqApp
//
//  Created by mohammad ahmad on 09/05/2021.
//

import UIKit

class AmenitiesCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var mainView: UIView!
    @IBOutlet weak var aminiteTitle: UILabel!
    @IBOutlet weak var ameniteImage: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        mainView.addBorders(borderWidth: 0.5, borderColor: #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1))
        objectCornerRadius(object: mainView, cornerRadius: 5)
    }

    func setAminiteData(image:UIImage,title:String){
        aminiteTitle.text=title
        ameniteImage.image=image
    }
}
