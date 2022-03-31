//
//  CardView.swift
//  orood
//
//  Created by Deya AlDeen on 20/07/2021.
//

import UIKit

@IBDesignable class CardView: UIView {
//    var cornerRadius : CGFloat = 6
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    func setup(){
        backgroundColor = .white
        addShadow()
        layer.cornerRadius = 6
        layer.masksToBounds = true
    }
}

extension UIView {
    func addShadow(opacity: Float = 0.4, color: UIColor = UIColor(hex: 0x384E7C).withAlphaComponent(0.6), radius: CGFloat = 4, offset: CGSize = CGSize(width: 2, height: 2)){
        layer.shadowOffset = offset
        layer.shadowOpacity = opacity
        layer.shadowColor = color.cgColor
        layer.shadowRadius = radius
        layer.masksToBounds = false
    }
}
