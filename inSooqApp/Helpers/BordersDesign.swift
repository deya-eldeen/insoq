//
//  BordersDesign.swift
//  inSooqApp
//
//  Created by mohammad ahmad on 14/02/2021.
//


import Foundation
import UIKit

public func bottomBorder(object : AnyObject)
{
    let bottomLine = CALayer()
    bottomLine.frame = CGRect(x: 0.0, y: object.frame.height - 1, width: object.frame.width-5, height: 1.0)
    bottomLine.backgroundColor = #colorLiteral(red: 0.6666666865, green: 0.6666666865, blue: 0.6666666865, alpha: 1)
    if let object = object as? UITextField{
        object.borderStyle = .none
    }
    CATransaction.begin()
    CATransaction.setDisableActions(true)
    object.layer.addSublayer(bottomLine)
    CATransaction.commit()
}

public func addLeftBorder(object : AnyObject,xPoint:CGFloat,yPoint:CGFloat)
{
    let bottomLine = CALayer()
    bottomLine.frame = CGRect(x: xPoint , y: yPoint, width: 1.0, height: object.frame.size.height)
    bottomLine.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
    if let object = object as? UITextField{
        object.borderStyle = .none
    }
    object.layer.addSublayer(bottomLine)
}
//func addLeftBorder( object : AnyObject) {
//    let border = CALayer()
//    border.backgroundColor = #colorLiteral(red: 0.6666666865, green: 0.6666666865, blue: 0.6666666865, alpha: 1)
//    border.frame = CGRect(x: 0, y: 0, width: 1.0, height: object.frame.size.height)
//
//    object.layer?.addSublayer(border)
//}

//func addRightBorder( object : AnyObject) {
//    let border = CALayer()
//    border.backgroundColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
//    border.frame = CGRect(x: object.frame.size.width , y: 0, width: 1.0, height: object.frame.size.height)
//    object.layer?.addSublayer(border)
//}


public func removeObjectBottomBorder(with object : AnyObject){

    let bottomLine = CALayer()
    bottomLine.frame = CGRect(x: 0.0, y: object.frame.height - 1, width: object.frame.width, height: 1.0)
    bottomLine.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
    if let object = object as? UITextField{
        object.borderStyle = .none
    }
    object.layer.addSublayer(bottomLine)
}
public func topBorder(object : AnyObject,addedValue:CGFloat)
{
    let bottomLine = CALayer()
    bottomLine.frame = CGRect(x: 0.0, y: 0.0, width: object.frame.width*addedValue, height: 1.0)
    bottomLine.backgroundColor = #colorLiteral(red: 0.6666666865, green: 0.6666666865, blue: 0.6666666865, alpha: 1)
    if let object = object as? UITextField{
        object.borderStyle = .none
    }
    object.layer.addSublayer(bottomLine)
}

public func textLine(object : AnyObject)
{
    let bottomLine = CALayer()
    bottomLine.frame = CGRect(x: 0.0, y: object.frame.height-4, width: object.frame.width, height: 1.0)
    bottomLine.backgroundColor = #colorLiteral(red: 0.6666666865, green: 0.6666666865, blue: 0.6666666865, alpha: 1)
    if let object = object as? UITextField{
        object.borderStyle = .none
    }
    object.layer.addSublayer(bottomLine)
}


public func objectCornerRadius(object  :AnyObject,cornerRadius:CGFloat)
{
    object.layer?.cornerRadius=cornerRadius
}

public func objectShadow(object  :AnyObject,cornerRadius:CGFloat)
{
    object.layer?.cornerRadius=cornerRadius
    object.layer.shadowColor = #colorLiteral(red: 0.1921568627, green: 0.2117647059, blue: 0.5137254902, alpha: 1)
    object.layer.shadowRadius = 2
    object.layer.shadowOffset = CGSize(width: 0, height: 0)
    object.layer.shadowOpacity = 0.1
    object.layer.rasterizationScale = UIScreen.main.scale
    object.layer.shouldRasterize = true

}

public func removeBottomBorder(with button : UIButton){

    let lineView = UIView(frame: CGRect(x: 0, y:button.frame.size.height, width: button.frame.size.width, height: 2))
    lineView.backgroundColor=#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)

    button.addSubview(lineView)
}
public func objectCornerRadiusShadow(with object : AnyObject){
    object.layer.cornerRadius = 5
    object.layer.shadowColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
    object.layer.shadowRadius = 1
    object.layer.shadowOffset = CGSize(width: 0, height: 0)
    object.layer.shadowOpacity = 0.4
}
//public func objectCornerRadius(with object : AnyObject,cornerRadius:CGFloat){
//    object.layer.cornerRadius = cornerRadius
//    object.layer?.borderColor = UIColor(named: "Placeholder")?.cgColor
//    object.layer?.borderWidth = 1
//}

public func textFieldPlaceHolder(with textField : UITextField,placeHolder:String){
    textField.layer.borderWidth = 2
    textField.layer.borderColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
    textField.textColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
    textField.attributedPlaceholder = NSAttributedString(string: placeHolder.localized,
                                                        attributes: [.foregroundColor: UIColor(named: "PlaceHolder")!])
    
}
public func addShadowView(object: AnyObject,cornerRadius: CGFloat,color: UIColor){
    object.layer.cornerRadius=cornerRadius
    object.layer.shadowColor = color.cgColor
    object.layer.shadowRadius = 2
    object.layer.shadowOffset = CGSize(width: 0, height: 0)
    object.layer.shadowOpacity = 0.5
    object.layer.rasterizationScale = UIScreen.main.scale
    object.layer.shouldRasterize = true

}

public func removeShadowView(object: AnyObject){
    //object.layer.cornerRadius=cornerRadius
    object.layer.shadowColor = .none
    object.layer.shadowRadius = 2
    object.layer.shadowOffset = CGSize(width: 0, height: 0)
    object.layer.shadowOpacity = 0.5
    object.layer.rasterizationScale = UIScreen.main.scale
    object.layer.shouldRasterize = true

}
public func flipButtonImageRTL(button : UIButton){
    button.setImage(#imageLiteral(resourceName: "back-arrow"), for: .normal)
    button.imageView?.image?.imageFlippedForRightToLeftLayoutDirection()
}
public func flipButtonImageLTR(button : UIButton){
    button.setImage(#imageLiteral(resourceName: "back-arrow"), for: .normal)
}

func setGradientBackground(for view: UIView ,colorTop: UIColor, colormiddel: UIColor,colorBottom: UIColor){
    let gradientLayer = CAGradientLayer()
    gradientLayer.colors = [colorTop.cgColor, colormiddel.cgColor,colorBottom.cgColor]
    gradientLayer.frame = view.bounds
    
    view.layer.insertSublayer(gradientLayer, at: 0)
}
