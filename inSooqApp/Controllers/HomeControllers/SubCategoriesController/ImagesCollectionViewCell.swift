//
//  ImagesCollectionViewCell.swift
//  inSooqApp
//
//  Created by mohammad ahmad on 09/02/2021.
//

import UIKit

class ImagesCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var imageview: UIImageView!
    override  func awakeFromNib() {
        contentView.backgroundColor=#colorLiteral(red: 0.1215686277, green: 0.01176470611, blue: 0.4235294163, alpha: 1)
        imageview.roundCorner(corners: [.topLeft,.bottomLeft], radius: 5)
        
    }
    func setImages(image:UIImage)
    {
        imageview.image=image
    }
    
}
