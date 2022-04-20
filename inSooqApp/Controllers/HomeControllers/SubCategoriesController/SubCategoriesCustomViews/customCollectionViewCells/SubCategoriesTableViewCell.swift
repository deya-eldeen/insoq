//
//  SubCategoriesTableViewCell.swift
//  inSooqApp
//
//  Created by mohammad ahmad on 08/02/2021.
//

import UIKit
import Kingfisher

class SubCategoriesTableViewCell: UITableViewCell {
    @IBOutlet weak var subImage: UIImageView!
    @IBOutlet weak var subName: UILabel!
    @IBOutlet weak var numberOfItems: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func setSubCategoryData(subImage:UIImage , subName:String,numberOfItems:String){
        self.numberOfItems.text=numberOfItems
        self.subImage.image=subImage
        self.subName.text=subName
    }
    

    
    func setSubCategoryDataModel(model: Category){
        self.numberOfItems.text = "Ads \(model.numberOfAds?.description ?? "")"
        subImage.kf.setImage(
            with: URL(string: "http://apinew.insouq.com\(model.firstImage?.replacingOccurrences(of: "\\", with: "/", options: .literal, range: nil) ?? "")" ),
            options: [
                .transition(ImageTransition.fade(0.1))
            ])
        self.subName.text = model.enName
    }
}
