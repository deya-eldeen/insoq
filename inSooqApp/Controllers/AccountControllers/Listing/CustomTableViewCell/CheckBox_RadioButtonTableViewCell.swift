//
//  CheckBox_RadioButtonTableViewCell.swift
//  inSooqApp
//
//  Created by mohammad ahmad on 23/02/2021.
//

import UIKit
struct OptionsModel{
    var title:String
    var price:String
    var type:Int
    var image: UIImage?
    // 1:CheckBox,0:RadioButton//2:RadioButton ShowPriceLabel
}
class CheckBox_RadioButtonTableViewCell: UITableViewCell {
    @IBOutlet weak var selectedButton: UIButton!
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var priceView: UIView!
    @IBOutlet weak var price: UILabel!
    
    @IBOutlet weak var flagImageView: UIImageView!

    override func awakeFromNib() {
        super.awakeFromNib()
        priceView.isHidden=true
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func setOptions(data: OptionsModel) {
        
        self.title.text = data.title
        self.flagImageView.image = data.image
        
        switch data.type {
        case 1:
            selectedButton.addBorders(borderWidth: 0.5, borderColor: #colorLiteral(red: 0.3647058904, green: 0.06666667014, blue: 0.9686274529, alpha: 1))
            objectCornerRadius(object: selectedButton, cornerRadius: selectedButton.frame.width/2)
        case 2:
            selectedButton.addBorders(borderWidth: 0.5, borderColor: #colorLiteral(red: 0.3647058904, green: 0.06666667014, blue: 0.9686274529, alpha: 1))
            objectCornerRadius(object: selectedButton, cornerRadius: selectedButton.frame.width/2)
            priceView.isHidden=false
        default:
            debugPrint("Check Box")
        }
    }

    func setCheckOptions(data: OptionsModel){
        selectedButton.addBorders(borderWidth: 0.5, borderColor: #colorLiteral(red: 0.3647058904, green: 0.06666667014, blue: 0.9686274529, alpha: 1))
        objectCornerRadius(object: selectedButton, cornerRadius: 3)
        if data.type == 2 {
            selectedButton.addBorders(borderWidth: 0.5, borderColor: #colorLiteral(red: 0.3647058904, green: 0.06666667014, blue: 0.9686274529, alpha: 1))
        }
    }
    func setNotificationFillterOptions(data: String){
        selectedButton.addBorders(borderWidth: 0.5, borderColor: #colorLiteral(red: 0.3647058904, green: 0.06666667014, blue: 0.9686274529, alpha: 1))
        objectCornerRadius(object: selectedButton, cornerRadius: 3)
        title.text=data
        price.isHidden=true
        priceView.isHidden=true
    }


}
