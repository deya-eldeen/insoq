//
//  MotorCardView.swift
//  inSooqApp
//
//  Created by mohammad ahmad on 24/02/2021.
//

import UIKit

class MotorCardView: UIView {


    @IBOutlet weak var itemImage: UIImageView!
    @IBOutlet weak var itemDate: UILabel!
    @IBOutlet weak var itemPriceLabel: UILabel!
    @IBOutlet weak var itemYear: UILabel!
    @IBOutlet weak var itemKM: UILabel!
    @IBOutlet weak var itemLocationLabel: UILabel!
    @IBOutlet weak var itemNameLabel: UILabel!
    @IBOutlet var contentView: UIView!
    
    func setViewData(motorsObject:MotorsModel){
        itemImage.image=motorsObject.itemImage
        itemPriceLabel.text=motorsObject.itemPriceLabel
        itemYear.text=motorsObject.itemYear
        itemKM.text=motorsObject.itemKM
        itemDate.text=motorsObject.itemDate
        itemLocationLabel.text=motorsObject.itemLocationLabel
        itemNameLabel.text=motorsObject.itemNameLabel
    }
 
    func xibSetup() {
        
        Bundle.main.loadNibNamed("MotorCardView", owner: self, options: nil)
        contentView.frame = bounds
        contentView.autoresizingMask =
            [.flexibleWidth, .flexibleHeight]
        addSubview(contentView)
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
        xibSetup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        xibSetup()
        
    }
    

}


