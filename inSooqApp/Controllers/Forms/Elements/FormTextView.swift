//
//  FormTextView.swift
//  inSooqApp
//
//  Created by Deya on 12/04/2022.
//

import UIKit

class FormTextView: UITextView, FormElement {
    
    override init(frame: CGRect, textContainer: NSTextContainer?) {
        super.init(frame: frame, textContainer: textContainer)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    func commonInit() {
        self.textColor = .gray
        self.backgroundColor = .white
        self.tintColor = .systemBlue
        self.sizeToFit()
    }
    
    func setPlaceHolder(_ placeholder: String) {
        self.placeholder = placeholder
    }
    
}
