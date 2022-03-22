//
//  SavedSearchesTableViewCell.swift
//  inSooqApp
//
//  Created by mohammad ahmad on 06/04/2021.
//

import UIKit

class SavedSearchesTableViewCell: UITableViewCell {
    @IBOutlet weak var roundedView: UIView!
    @IBOutlet weak var mainView: UIView!
    @IBOutlet weak var sliderButton: UIButton!
    @IBOutlet weak var goButton: UIButton!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        objectCornerRadius(object: mainView, cornerRadius: 10)
        objectCornerRadius(object: goButton, cornerRadius: 5)
        mainView.addShadowToView(shadowRadius: 2)
        objectCornerRadius(object: roundedView, cornerRadius: roundedView.width/2)
        roundedView.addShadowToView(shadowRadius: 2)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
