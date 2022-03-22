//
//  GridPlatesCollectionViewCell.swift
//  inSooqApp
//
//  Created by mohammad ahmad on 23/05/2021.
//

import UIKit

class GridPlatesCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var plateImage: UIImageView!
    @IBOutlet weak var mainView: UIView!
    @IBOutlet weak var favoriteButton: UIButton!
    @IBOutlet weak var plateLocationLabel: UILabel!
    @IBOutlet weak var platePriceLabel: UILabel!
    @IBOutlet weak var plateNumberLabel: UILabel!
    @IBOutlet weak var datelbl: UILabel!
    var _isFavo:Bool=false
    
    override func awakeFromNib() {
        super.awakeFromNib()
        mainView.layer.cornerRadius=5
        mainView.addShadowToView()
        plateImage.clipsToBounds=true
        
        //plateImage.roundCorner(corners: [.topLeft,.bottomLeft], radius: 5)

        
    }
    
    @IBAction func favo_Pressed(_ sender: Any)
    {
        if _isFavo{
            favoriteButton.setImage(UIImage(systemName: "heart.fill"), for: .normal)
            favoriteButton.tintColor=#colorLiteral(red: 1, green: 0.262745098, blue: 0.2235294118, alpha: 1)

        }else{
            favoriteButton.setImage(UIImage(systemName: "heart"), for: .normal)
            favoriteButton.tintColor=#colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)
        }
        _isFavo = !_isFavo
        
    }


    func setPlateData(data:NumbersModel){
        platePriceLabel.text=data.platePrice
        plateNumberLabel.text=data.plateNumber
        datelbl.text=data.plateDate
        plateLocationLabel.text=data.plateLocation
        plateImage.image=data.plateImage

    }
}
