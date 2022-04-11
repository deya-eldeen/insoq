//
//  FormLabel.swift
//  inSooqApp
//
//  Created by Deya on 10/04/2022.
//

import UIKit

class FormLabel: UILabel, FormElement {
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
        self.commonInit()
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.commonInit()
    }
    
    func commonInit() {
        self.font = .boldSystemFont(ofSize: 15)
        self.textColor = .black
        self.numberOfLines = 0
        self.sizeToFit()
    }
    
}

