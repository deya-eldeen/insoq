//
//  CategoriesCollectionViewCell.swift
//  inSooqApp
//
//  Created by mohammad ahmad on 07/02/2021.
//

import UIKit

class CategoriesCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var coloredView: UIView!
    @IBOutlet weak var categorylabel: UILabel!
    @IBOutlet weak var categoryIcon: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        coloredView.layer.cornerRadius=coloredView.frame.height/2
        
    }
//    override var isSelected: Bool {
//        didSet {
//            self.coloredView.backgroundColor = isSelected ? #colorLiteral(red: 0.3411764706, green: 0.2745098039, blue: 0.9882352941, alpha: 1) : #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
//            self.categorylabel.textColor = isSelected ? #colorLiteral(red: 0.3411764706, green: 0.2745098039, blue: 0.9882352941, alpha: 1) : #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
//        }
//    }
    func setCategoriesData(data:CategoriesModel){
        self.coloredView.backgroundColor=data.categoyColor
        self.categorylabel.text=data.categoryName
        self.categoryIcon.image=data.categoryImage
    }
}
