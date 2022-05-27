//
//  FormField.swift
//  inSooqApp
//
//  Created by Deya on 10/04/2022.
//

import UIKit

class FormField: UITextField, FormElement {
    
    var id: FieldID?

    var textPadding = UIEdgeInsets(
        top: 10,
        left: 20,
        bottom: 10,
        right: 20
    )

    override func textRect(forBounds bounds: CGRect) -> CGRect {
        let rect = super.textRect(forBounds: bounds)
        return rect.inset(by: textPadding)
    }
    
    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        let rect = super.editingRect(forBounds: bounds)
        return rect.inset(by: textPadding)
    }
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
        self.commonInit()
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.commonInit()
    }
    
    func commonInit() {
        self.font = .boldSystemFont(ofSize: 16)
        self.borderStyle = .none
        self.textColor = .gray
        self.backgroundColor = .white
        self.tintColor = .orange
        self.sizeToFit()
        
        let heightConstraint = NSLayoutConstraint(item: self, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 40)
        self.addConstraint(heightConstraint)
        
    }
    
}

enum FieldID {
    case title
    case year
    case price
    case milage
    case phoneNumber
    case jobTitle
    case plateNumber
    case position
    case age
    case none
}
