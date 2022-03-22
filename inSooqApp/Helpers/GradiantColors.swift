//
//  GradiantColors.swift
//  inSooqApp
//
//  Created by mohammad ahmad on 07/02/2021.
//

import Foundation
import UIKit
//API.alertFlag = !API.alertFlag
//setGradientBackground(colorTop:#colorLiteral(red: 0.9724436402, green: 0.972609818, blue: 0.9724331498, alpha: 1) , colorBottom:#colorLiteral(red: 0.6666666865, green: 0.6666666865, blue: 0.6666666865, alpha: 1) )

func setGradientBackground(view: UIView,colorTop: UIColor, colorBottom: UIColor){
    let gradientLayer = CAGradientLayer()
    gradientLayer.colors = [colorTop.cgColor, colorBottom.cgColor]
    gradientLayer.startPoint=CGPoint(x: 0, y: 0)
    gradientLayer.endPoint=CGPoint(x: 1, y: 1)
    gradientLayer.frame = view.bounds
    
    view.layer.insertSublayer(gradientLayer, at: 0)
}

