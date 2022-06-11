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
    
    var shouldRenderColor = false
    var catColor = UIColor.systemPink
    
    func renderColors() {
        guard (shouldRenderColor == true) else { return }
        print("renderColors_\(isSelected)_self.catColor_\(catColor)")
        self.subImage.tintColor = isSelected ? self.catColor : #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        self.subName.textColor = isSelected ? UIColor.black : #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.renderColors()
        // Initialization code
    }

    override func prepareForReuse() {
        self.isSelected = false
        self.renderColors()
    }
    
    override var isSelected: Bool {
        didSet {
            print("isSelected",isSelected)
            renderColors()
        }
    }
    
//    override func setSelected(_ selected: Bool, animated: Bool) {
//        super.setSelected(selected, animated: animated)
//        // Configure the view for the selected state
//    }
    
    func setSubCategoryData(subImage:UIImage , subName:String,numberOfItems:String){
        self.numberOfItems.text=numberOfItems
        self.subImage.image=subImage
        self.subName.text=subName
    }
    
    func setSubCategoryDataModel(model: Category) {
        
        self.numberOfItems.text = "Ads \(model.numberOfAds?.description ?? "")"
        
        let urlString = "\(model.firstImage?.replacingOccurrences(of: "\\", with: "/", options: .literal, range: nil) ?? "")"
        print("urlString__",urlString)
        
        subImage.kf.setImage(
            with: URL(string: urlString ),
            options: [
                .transition(ImageTransition.fade(0.1))
            ])
        self.subName.text = model.enName
    }
}
