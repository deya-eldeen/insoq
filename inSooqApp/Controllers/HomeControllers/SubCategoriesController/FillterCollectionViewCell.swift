//
//  FillterCollectionViewCell.swift
//  inSooqApp
//
//  Created by mohammad ahmad on 09/02/2021.
//

import UIKit

class FillterCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var viewToColor: UIView!
    @IBOutlet weak var fillterLabel: UILabel!
    @IBOutlet weak var cancelButton: UIButton!
    
    override  func awakeFromNib() {
        contentView.layer.cornerRadius=contentView.height/2
    }
    func setFillterLabel(title:String){
        fillterLabel.text=title
    }
}
