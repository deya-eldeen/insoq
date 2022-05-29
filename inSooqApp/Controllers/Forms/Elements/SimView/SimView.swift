//
//  SimView.swift
//  inSooqApp
//
//  Created by Deya on 13/04/2022.
//

import UIKit

class SimView: UIView, FormElement {
    
    @IBOutlet weak var numberLabel: UILabel!
    
    @IBOutlet weak var adImage: UIImageView!

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
        let targetView = Bundle(for: SimView.self).loadNibNamed(String(describing: SimView.self), owner: nil, options: nil)![0] as! SimView
        targetView.translatesAutoresizingMaskIntoConstraints = false
        return targetView
    }
    
}

