//
//  SliderCollectionViewCell.swift
//  inSooqApp
//
//  Created by mohammad ahmad on 15/04/2021.
//

import UIKit

class SliderCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var slidetTitle: UILabel!
   
    func setData(title:String){
        self.slidetTitle.text=title
    }
}

