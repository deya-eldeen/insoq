//
//  FormPhotoPicker.swift
//  inSooqApp
//
//  Created by Deya on 10/04/2022.
//

import UIKit

class FormPhotoPicker: UIView, FormElement {
    
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
        let picker = Bundle(for: FormPhotoPicker.self).loadNibNamed(String(describing: FormPhotoPicker.self), owner: nil, options: nil)![0] as! FormPhotoPicker
        
        picker.translatesAutoresizingMaskIntoConstraints = false
        
        return picker
    }
}

