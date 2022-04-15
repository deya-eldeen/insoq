//
//  FormPreviewView.swift
//  inSooqApp
//
//  Created by Deya on 13/04/2022.
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
    
    func render() -> UIView {
        let targetView = Bundle(for: FormPreviewView.self).loadNibNamed(String(describing: FormPreviewView.self), owner: nil, options: nil)![0] as! FormPreviewView
        targetView.translatesAutoresizingMaskIntoConstraints = false
        return targetView
    }
    
}

