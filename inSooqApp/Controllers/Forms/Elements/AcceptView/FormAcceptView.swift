//
//  FormAcceptView.swift
//  inSooqApp
//
//  Created by Deya on 13/04/2022.
//

import UIKit

class FormAcceptView: UIView, FormElement {
    
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
        let targetView = Bundle(for: FormAcceptView.self).loadNibNamed(String(describing: FormAcceptView.self), owner: nil, options: nil)![0] as! FormAcceptView
        targetView.translatesAutoresizingMaskIntoConstraints = false
        return targetView
    }
    
}
