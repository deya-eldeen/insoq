//
//  AddLocationCollectionViewCell.swift
//  inSooqApp
//
//  Created by mohammad ahmad on 22/02/2021.
//

import UIKit

class AddLocationCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var backView: UIView!
    @IBOutlet weak var addButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        objectCornerRadius(object: backView, cornerRadius: 20)
    }

}
