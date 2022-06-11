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
    
    var catColor = UIColor.clear
    var shouldRenderColor = true
    
    func renderColors() {
        guard (shouldRenderColor == true) else { return }
        self.coloredView.backgroundColor = isSelected ? self.catColor : #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        self.categorylabel.textColor = isSelected ? UIColor.black : #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
    }
    
    override func prepareForReuse() {
        self.isSelected = false
        renderColors()
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        coloredView.layer.cornerRadius=coloredView.frame.height/2
        renderColors()
    }
    
    override var isSelected: Bool {
        didSet {
            print("isSelected",isSelected)
            renderColors()
        }
    }
    
    func setCategoriesData(data:CategoriesModel){
        self.coloredView.backgroundColor=data.categoyColor
        self.categorylabel.text=data.categoryName
        self.categoryIcon.image=data.categoryImage
    }
    
    
}
