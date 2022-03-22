//
//  PlatesCollectionViewCell.swift
//  inSooqApp
//
//  Created by mohammad ahmad on 10/02/2021.
//

import UIKit

class PlatesCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var plateImage: UIImageView!
    @IBOutlet weak var mainView: UIView!
    
    @IBOutlet weak var platePriceLabel: UILabel!
    @IBOutlet weak var plateNumberLabel: UILabel!
    @IBOutlet weak var plateOrgineLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        mainView.layer.cornerRadius=10
        mainView.addShadowToView()
        plateOrgineLabel.layer.cornerRadius=5
        plateOrgineLabel.clipsToBounds=true
        
    }
    func setPlateData(data:NumbersModel){
        plateImage.image=data.plateImage
        platePriceLabel.text=data.platePrice
        plateNumberLabel.text=data.plateNumber
        plateOrgineLabel.text=" \(data.plateOrgineLabel) "
    }
}
