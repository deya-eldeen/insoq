//
//  NumbersView.swift
//  inSooqApp
//
//  Created by mohammad ahmad on 10/02/2021.
//

import UIKit

class NumbersView: UIView {
    
    @IBOutlet weak var plateLocationLabel: UILabel!
    @IBOutlet weak var platePriceLabel: UILabel!
    @IBOutlet weak var plateNumberLabel: UILabel!
    @IBOutlet weak var plateOrgineLabel: UILabel!
    @IBOutlet var contentView: UIView!
    
    
    func setViewData(numbersObject:NumbersModel){
    
        platePriceLabel.text=numbersObject.platePrice
        plateNumberLabel.text=numbersObject.plateNumber
        plateOrgineLabel.text=numbersObject.plateOrgineLabel
        plateLocationLabel.text=numbersObject.plateLocation
    }
    
    func xibSetup() {
        
        Bundle.main.loadNibNamed("NumbersView", owner: self, options: nil)
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


