//
//  FormFile.swift
//  inSooqApp
//
//  Created by Deya on 17/04/2022.
//

import UIKit

class FormFile: UIView, FormElement {
    
    @IBOutlet weak var fileNameLabel: UILabel!
    @IBOutlet weak var uploadButton: UIButton!

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
        let targetView = Bundle(for: FormFile.self).loadNibNamed(String(describing: FormFile.self), owner: nil, options: nil)![0] as! FormFile
        targetView.translatesAutoresizingMaskIntoConstraints = false
        return targetView
    }
    
}
