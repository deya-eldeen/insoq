//
//  locationCollectionViewCell.swift
//  inSooqApp
//
//  Created by mohammad ahmad on 22/02/2021.
//

import UIKit

class locationCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var cancelButton: UIButton!
    
    @IBOutlet weak var backview: UIView!
    @IBOutlet weak var locationTitl: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        self.backview.layer.cornerRadius=20
    }


    func setlocations(title:String){
        self.locationTitl.text=title
    }

}
