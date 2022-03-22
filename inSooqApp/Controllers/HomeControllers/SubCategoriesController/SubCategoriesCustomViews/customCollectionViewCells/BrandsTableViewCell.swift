//
//  BrandsTableViewCell.swift
//  inSooqApp
//
//  Created by mohammad ahmad on 21/04/2021.
//

import UIKit

class BrandsTableViewCell: UITableViewCell {
    @IBOutlet weak var brand_icon: UIImageView!
    @IBOutlet weak var brand_Type: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    func setBrands(brand:BrandsModel){
        brand_icon.image=brand.brandImage
        brand_Type.text=brand.brandName
    }
    func setTypes(type:BrandType){
        brand_icon.image=type.typeImage
        brand_Type.text=type.typeName
    }
}
