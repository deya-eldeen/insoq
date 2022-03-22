//
//  RowCollecctionUsedCarCell.swift
//  inSooqApp
//
//  Created by AOUN on 1/18/22.
//

import UIKit

class RowCollecctionUsedCarCell: UICollectionViewCell {
    @IBOutlet weak var favoriteButton: UIButton!
    @IBOutlet weak var imgItem: UIImageView!
    @IBOutlet weak var mainView: UIView!
    
    @IBOutlet weak var itemDate: UILabel!
    @IBOutlet weak var itemPriceLabel: UILabel!
    @IBOutlet weak var itemYear: UILabel!
    @IBOutlet weak var itemKM: UILabel!
    @IBOutlet weak var itemLocationLabel: UILabel!
    @IBOutlet weak var itemNameLabel: UILabel!
    
    var _isFavo:Bool=true

    override func awakeFromNib() {
        super.awakeFromNib()
        //Design
        mainView.addShadowToView()
    }
    @IBAction func favo_Pressed(_ sender: Any) {
        if _isFavo{
            favoriteButton.setImage(UIImage(systemName: "heart.fill"), for: .normal)
            favoriteButton.tintColor=#colorLiteral(red: 1, green: 0.262745098, blue: 0.2235294118, alpha: 1)

        }else{
            favoriteButton.setImage(UIImage(systemName: "heart"), for: .normal)
            favoriteButton.tintColor=#colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)
        }
        _isFavo = !_isFavo
        
    }

    func setViewData(motorsObject:MotorsModel , imgs: [String]){
        itemPriceLabel.text=motorsObject.itemPriceLabel
        itemYear.text=motorsObject.itemYear
        itemKM.text=motorsObject.itemKM
        itemDate.text=motorsObject.itemDate
        itemLocationLabel.text=motorsObject.itemLocationLabel
        itemNameLabel.text=motorsObject.itemNameLabel
        if (!imgs.isEmpty){
            if let url = URL(string: imgs[0]){
                imgItem.kf.setImage(with: url)
            }
        }
 
    }
 

}
