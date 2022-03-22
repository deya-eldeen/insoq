//
//  AddOpeningJobsView.swift
//  inSooqApp
//
//  Created by mohammad ahmad on 26/04/2021.
//

import UIKit

class AddOpeningJobsView: UIView {
    @IBOutlet var contentView: UIView!
    
    
    func xibSetup() {
        Bundle.main.loadNibNamed("AddOpeningJobsView", owner: self, options: nil)
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


