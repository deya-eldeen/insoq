//
//  ViewonCarImage.swift
//  inSooqApp
//
//  Created by mohammad ahmad on 16/06/2021.
//

import UIKit

class ViewonCarImage: UIView {
    
    @IBOutlet weak var carImage: UIImageView!
    @IBOutlet weak var plateImage: UIImageView!
    @IBOutlet var contentView: UIView!
    
    func xibSetup() {

        Bundle.main.loadNibNamed("ViewonCarImage", owner: self, options: nil)
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
