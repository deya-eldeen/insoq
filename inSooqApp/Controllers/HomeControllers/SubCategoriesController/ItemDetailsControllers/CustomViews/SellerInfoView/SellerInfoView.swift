//
//  SellerInfoView.swift
//  inSooqApp
//
//  Created by mohammad ahmad on 09/05/2021.
//

import UIKit

class SellerInfoView: UIView {
    
    @IBOutlet weak var memberSince: UILabel!
    @IBOutlet weak var userImage: UIImageView!
    @IBOutlet var contentView: UIView!
    @IBOutlet weak var userName: UILabel!
    
    func xibSetup() {

        Bundle.main.loadNibNamed("SellerInfoView", owner: self, options: nil)
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
    func setViewData(){

    }
    
}
