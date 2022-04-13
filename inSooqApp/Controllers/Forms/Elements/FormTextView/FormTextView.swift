//
//  FormTextView.swift
//  inSooqApp
//
//  Created by Deya on 12/04/2022.
//

import UIKit


class FormTextView: UIView, FormElement {
    
    @IBOutlet weak var textView: UITextView!
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    func commonInit() {
        self.textView.textColor = .gray
        self.textView.backgroundColor = .white
        self.textView.tintColor = .systemBlue
        self.textView.sizeToFit()
    }
    
    
    func render() -> UIView {
        let targetView = Bundle(for: FormTextView.self).loadNibNamed(String(describing: FormTextView.self), owner: nil, options: nil)![0] as! FormTextView
        targetView.translatesAutoresizingMaskIntoConstraints = false
        return targetView
    }
    
}

