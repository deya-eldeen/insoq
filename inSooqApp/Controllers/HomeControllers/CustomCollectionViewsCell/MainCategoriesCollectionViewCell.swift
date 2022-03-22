//
//  MainCategoriesCollectionViewCell.swift
//  inSooqApp
//
//  Created by mohammad ahmad on 23/02/2021.
//

import UIKit

class MainCategoriesCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var mainView: UIView!
    
    @IBOutlet weak var categoryIcon: UILabel!
    @IBOutlet weak var categoryTitle: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        objectCornerRadius(object: mainView, cornerRadius: mainView.frame.height/2)
    }

    //For now use Cateegory ID to set Icon.. Edit Later
    func setCategoyData(data:CategoriesModel){
        categoryIcon.font=UIFont(name: "FontAwesome5Pro-Regular", size: 30)
        categoryIcon.textColor=#colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
        categoryIcon.backgroundColor =  data.categoyColor
        categoryIcon.text=data.categoyID
        categoryTitle.text=data.categoryName
        

    }

}
