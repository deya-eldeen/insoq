//
//  SpacerView.swift
//  inSooqApp
//
//  Created by Deya on 13/04/2022.
//

import UIKit

class SpacerView: UIView, FormElement {
    
    @IBOutlet weak var adTitleLabel: UILabel!
    @IBOutlet weak var adLocationLabel: UILabel!
    
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
        let targetView = Bundle(for: SpacerView.self).loadNibNamed(String(describing: SpacerView.self), owner: nil, options: nil)![0] as! SpacerView
        targetView.translatesAutoresizingMaskIntoConstraints = false
        return targetView
    }
    
}

