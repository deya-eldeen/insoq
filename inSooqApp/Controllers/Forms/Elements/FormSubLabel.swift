//
//  FormSubLabel.swift
//  inSooqApp
//
//  Created by Deya on 10/04/2022.
//

import UIKit

class FormSubLabel: UILabel, FormElement {
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
        self.commonInit()
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.commonInit()
    }
    
    func commonInit() {
        self.font = .systemFont(ofSize: 12)
        self.textColor = .systemGray5
        self.numberOfLines = 0
        self.sizeToFit()
    }
    
}
