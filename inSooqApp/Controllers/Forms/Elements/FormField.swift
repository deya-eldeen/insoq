//
//  FormField.swift
//  inSooqApp
//
//  Created by Deya on 10/04/2022.
//

import UIKit

class FormField: UITextField, FormElement {
    
    var id: FieldID?

    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
        self.commonInit()
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.commonInit()
    }
    
    func commonInit() {
        self.borderStyle = .roundedRect
        self.textColor = .gray
        self.backgroundColor = .white
        self.tintColor = .orange
        self.sizeToFit()
    }
    
}

enum FieldID {
    case title
    case year
    case price
    case phoneNumber
    case none
}
