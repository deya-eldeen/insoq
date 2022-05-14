//
//  FormContinueButton.swift
//  inSooqApp
//
//  Created by Deya on 10/04/2022.
//

import UIKit

class FormContinueButton: UIButton, FormElement {
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
        self.commonInit()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.commonInit()
    }
    
    func commonInit() {
        self.backgroundColor = UIColor.init(hex: 0xFFB01C)
        
        print("BUTTON_HEIGHT",self.frame.height)
        self.layer.cornerRadius = 18.0
        self.layer.masksToBounds = true
        
        self.setTitleColor(.white, for: .normal)
        self.translatesAutoresizingMaskIntoConstraints = false
    }
    
}

