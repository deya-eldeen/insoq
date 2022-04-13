//
//  FormPreviewView.swift
//  inSooqApp
//
//  Created by Deya on 10/04/2022.
//

import UIKit

class FormPreviewView: UIView, FormElement {

    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    func commonInit() {
        self.backgroundColor = .darkGray
    }
    
}
