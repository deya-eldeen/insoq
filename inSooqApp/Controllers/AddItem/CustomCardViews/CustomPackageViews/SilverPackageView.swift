//
//  SilverPackageView.swift
//  inSooqApp
//
//  Created by mohammad ahmad on 14/04/2021.
//

import UIKit

class SilverPackageView: UIView {
    @IBOutlet weak var vPrice: UILabel!
    @IBOutlet weak var vTitle: UILabel!
    
    @IBOutlet var contentView: UIView!
    func setViewData(vTitle:String , vPrice:String){
        self.vTitle.text=vTitle
        self.vPrice.text="AED"+vPrice
    }
    func xibSetup() {
        
        Bundle.main.loadNibNamed("SilverPackageView", owner: self, options: nil)
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


