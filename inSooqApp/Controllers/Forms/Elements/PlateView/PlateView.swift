//
//  PlateView.swift
//  inSooqApp
//
//  Created by Deya on 13/04/2022.
//

import UIKit

class PlateView: UIView, FormElement {
    
    @IBOutlet weak var lowerNumber: UILabel!
    @IBOutlet weak var upperNumber: UILabel!

    @IBOutlet weak var upperImageView: UIImageView!
    @IBOutlet weak var lowerImageView: UIImageView!

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
        let targetView = Bundle(for: PlateView.self).loadNibNamed(String(describing: PlateView.self), owner: nil, options: nil)![0] as! PlateView
        targetView.translatesAutoresizingMaskIntoConstraints = false
        return targetView
    }
    
}

