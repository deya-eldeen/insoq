//
//  DesignFonts.swift
//  ACIsamsung
//
//  Created by mohammad ahmad on 1/11/21.
//

import Foundation
import UIKit
public func buttonFont(object : UIButton ,size: CGFloat ,style: String)
{
    object.titleLabel?.font = UIFont(name: "FontAwesome5Pro-\(style)", size: size)
        debugPrint("FontAwesome5Pro-\(style)")
}
public func textFieldFont(object : UITextField,style:String ,size: CGFloat)
{
        object.font = UIFont(name: "FontAwesome5Pro-\(style)", size: size)
    debugPrint("FontAwesome5Pro-\(style)")
}
public func labelFont(object : UILabel,style:String ,size: CGFloat)
{
    object.font = UIFont(name: "FontAwesome5Pro-\(style)", size: size)
    debugPrint("FontAwesome5Pro-\(style)")

}
public func textViewFont(object : UITextView,style:String ,size: CGFloat)
{
    object.font = UIFont(name: "FontAwesome5Pro-\(style)", size: size)
    debugPrint("FontAwesome5Pro-\(style)")

}
public struct FontStyle{
    var solid:String="Solid"
    var regular:String="Regular"
    var light:String="Light"
}

