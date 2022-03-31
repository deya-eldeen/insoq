//
//  StyledButton.swift
//  orood
//
//  Created by Deya AlDeen on 16/07/2021.
//

import UIKit

class StyledButtonSolid: UIButton {
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        layer.cornerRadius = (frame.height) / 2.0
        backgroundColor = AppColors.theme_red_button
//        titleLabel?.font = Constants.RobotFonts.bold12
        setTitleColor(AppColors.theme_white, for: .normal)
        setTitleColor(AppColors.theme_white, for: .highlighted)
        clipsToBounds = false
    }

}

class StyledButtonTransperant: UIButton {
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        layer.cornerRadius = (frame.height) / 2
        backgroundColor = .clear
        layer.borderWidth = 1.5
        layer.borderColor = AppColors.theme_white.cgColor
//        titleLabel?.font = Constants.RobotFonts.bold16
        setTitleColor(AppColors.theme_white, for: .normal)
        setTitleColor(AppColors.theme_white, for: .highlighted)
        clipsToBounds = false
    }
    
    override open var isHighlighted: Bool {
        didSet {
            backgroundColor = isHighlighted ? AppColors.theme_red_button_highlighted : .clear
        }
    }

}
