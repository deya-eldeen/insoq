//
//  GoldPackageView.swift
//  inSooqApp
//
//  Created by mohammad ahmad on 14/04/2021.
//

import UIKit

class GoldPackageView: UIView {
    
    @IBOutlet var contentView: UIView!
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
