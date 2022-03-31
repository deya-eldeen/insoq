//
//  Extentions.swift
//  ACIsamsung
//
//  Created by mohammad ahmad on 1/11/21.
//

import Foundation
import UIKit


extension String {
    func replace(string:String, replacement:String) -> String {
        return self.replacingOccurrences(of: string, with: replacement, options: NSString.CompareOptions.literal, range: nil)
    }
    
    func removeWhitespace() -> String {
        return self.replace(string: " ", replacement: "")
    }
}
extension UIView {
    class func fromNib<T: UIView>() -> T {
        return Bundle(for: T.self).loadNibNamed(String(describing: T.self), owner: nil, options: nil)![0] as! T
    }
}
extension UIImageView
{

    func loadImge(withUrl url: URL)
    {
           DispatchQueue.global().async
            { [weak self] in

               if let imageData = try? Data(contentsOf: url)
               {
                if let image = UIImage(data: imageData)
                   {
                    DispatchQueue.main.async
                        {self?.image = image}
                   }
               }
           }
       }
//    func circularImage(_ radius: CGFloat) -> UIImage? {
//        var imageView = UIImageView()
//        if self.size.width > self.size.height {
//            imageView.frame =  CGRect(x: 0, y: 0, width: self.size.width, height: self.size.width)
//            imageView.image = self
//            imageView.contentMode = .scaleAspectFit
//        } else { imageView = UIImageView(image: self) }
//        var layer: CALayer = CALayer()
//
//        layer = imageView.layer
//        layer.masksToBounds = true
//        layer.cornerRadius = radius
//        UIGraphicsBeginImageContext(imageView.bounds.size)
//        layer.render(in: UIGraphicsGetCurrentContext()!)
//        let roundedImage = UIGraphicsGetImageFromCurrentImageContext()
//        UIGraphicsEndImageContext()
//
//        return roundedImage
//    }

}
//MARK:- return ture if view backgroung c olor is dark, false if not
///to determine what image to use: object.Color = view.backgroundColor?.isDarkColor == true ? .white : .black
extension UIColor
{
    var isDarkColor: Bool {
        var r, g, b, a: CGFloat
        (r, g, b, a) = (0, 0, 0, 0)
        self.getRed(&r, green: &g, blue: &b, alpha: &a)
        let lum = 0.2126 * r + 0.7152 * g + 0.0722 * b
        return  lum < 0.50
    }
}

extension UIView {

    public var width: CGFloat {
        return frame.size.width
    }

    public var height: CGFloat {
        return frame.size.height
    }

    public var top: CGFloat {
        return frame.origin.y
    }

    public var bottom: CGFloat {
        return frame.size.height + frame.origin.y
    }

    public var left: CGFloat {
        return frame.origin.x
    }

    public var right: CGFloat {
        return frame.size.width + frame.origin.x
    }

}

extension Notification.Name {
    /// Notificaiton  when user logs in
   // static let didLogInNotification = Notification.Name("didLogInNotification")
    static let NewChatMessage = Notification.Name("NewChatMessage")
    static let pushNotificationReceived = Notification.Name("pushNotificationReceived")
}

extension String{
//    var localized: String { return NSLocalizedString(self, comment: "")}
    //MARK: calculate label height
    func height(withConstrainedWidth width: CGFloat, font: UIFont) -> CGFloat {
        let constraintRect = CGSize(width: width, height: .greatestFiniteMagnitude)
        let boundingBox = self.boundingRect(with: constraintRect, options: .usesLineFragmentOrigin, attributes: [NSAttributedString.Key.font: font], context: nil)
    
        return ceil(boundingBox.height)
    }

    func width(withConstrainedHeight height: CGFloat, font: UIFont) -> CGFloat {
        let constraintRect = CGSize(width: .greatestFiniteMagnitude, height: height)
        let boundingBox = self.boundingRect(with: constraintRect, options: .usesLineFragmentOrigin, attributes: [NSAttributedString.Key.font: font], context: nil)

        return ceil(boundingBox.width)
    }

}



class TextField: UITextField {

    let padding = UIEdgeInsets(top: 0, left: 7, bottom: 0, right: 7)

    override open func textRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }

    override open func placeholderRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }

    override open func editingRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }
}
extension UITextField{
    @IBInspectable var placeHolderColor: UIColor? {
        get {
            return self.placeHolderColor
        }
        set {
            self.attributedPlaceholder = NSAttributedString(string:self.placeholder != nil ? self.placeholder! : "", attributes:[NSAttributedString.Key.foregroundColor : newValue!])
        }
    }
}
public func showAlertDeprecated(controller: UIViewController, message: String ,seconds: Double)
{
    let alert = UIAlertController(title: nil, message: message, preferredStyle: .alert)
    alert.view.backgroundColor = UIColor.gray
    alert.view.alpha = 0.5
    alert.view.layer.cornerRadius = 15
    
    controller.present(alert, animated: true)
    DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + seconds){
        alert.dismiss(animated: true)
    }
    
}
public func showActionAlert(with conrtoller : UIViewController,title:String,body:String,actionTitle:String) {
   // if !isConnectToInterNet() {
        let alert = UIAlertController(title: title.localized, message: body.localized, preferredStyle: .alert)
        let action = UIAlertAction(title: actionTitle.localized, style: .default, handler: nil)
        alert.addAction(action)
        conrtoller.present(alert, animated: true, completion: nil)
    //}
    
}


private var __maxLengths = [UITextField: Int]()
extension UITextField {
    @IBInspectable var maxLength: Int {
        get {
            guard let l = __maxLengths[self] else {
               return 150 // (global default-limit. or just, Int.max)
            }
            return l
        }
        set {
            __maxLengths[self] = newValue
            addTarget(self, action: #selector(fix), for: .editingChanged)
        }
    }
    @objc func fix(textField: UITextField) {
        if let t = textField.text{
            textField.text = String(t.prefix(maxLength))
            
        }
    }


}

//MARK: - UIView Extension
extension UIView{
    func addBorders(borderWidth: CGFloat = 0.5, borderColor: CGColor ){
        self.layer.borderWidth = borderWidth
        self.layer.borderColor = borderColor
    }
    
    func addShadowToView(shadowRadius: CGFloat = 2) {
        self.layer.shadowColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
        self.layer.shadowOffset = CGSize(width: -1, height: 2)
        self.layer.shadowRadius = shadowRadius
        self.layer.shadowOpacity = 0.3
    }
    func roundCorner(corners: UIRectCorner, radius: CGFloat) {
            let path = UIBezierPath(roundedRect: bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
            let mask = CAShapeLayer()
            mask.path = path.cgPath
            layer.mask = mask
        }
func animateViewHeight (controller:UIViewController
                        ,height:CGFloat
                        ,heightConstraint:NSLayoutConstraint) {
        UIView.animate(withDuration: 0.5, animations: {
             heightConstraint.constant=height
            controller.view.layoutIfNeeded()
        })
    }

}

///Images of Label --> Editing title in tableview swipe...
extension UIImage {

    /// This method creates an image of a view
    convenience init?(view: UIView) {

        // Based on https://stackoverflow.com/a/41288197/1118398
        let renderer = UIGraphicsImageRenderer(bounds: view.bounds)
        let image = renderer.image { rendererContext in
            view.layer.render(in: rendererContext.cgContext)
        }

        if let cgImage = image.cgImage {
            self.init(cgImage: cgImage, scale: UIScreen.main.scale, orientation: .up)
        } else {
            return nil
        }
    }
}

extension UITapGestureRecognizer {

    func didTapAttributedTextInLabel(label: UILabel, inRange targetRange: NSRange) -> Bool {
        // Create instances of NSLayoutManager, NSTextContainer and NSTextStorage
        let layoutManager = NSLayoutManager()
        let textContainer = NSTextContainer(size: CGSize.zero)
        let textStorage = NSTextStorage(attributedString: label.attributedText!)

        // Configure layoutManager and textStorage
        layoutManager.addTextContainer(textContainer)
        textStorage.addLayoutManager(layoutManager)

        // Configure textContainer
        textContainer.lineFragmentPadding = 0.0
        textContainer.lineBreakMode = label.lineBreakMode
        textContainer.maximumNumberOfLines = label.numberOfLines
        let labelSize = label.bounds.size
        textContainer.size = labelSize

        // Find the tapped character location and compare it to the specified range
        let locationOfTouchInLabel = self.location(in: label)
        let textBoundingBox = layoutManager.usedRect(for: textContainer)
        //let textContainerOffset = CGPointMake((labelSize.width - textBoundingBox.size.width) * 0.5 - textBoundingBox.origin.x,
                                              //(labelSize.height - textBoundingBox.size.height) * 0.5 - textBoundingBox.origin.y);
        let textContainerOffset = CGPoint(x: (labelSize.width - textBoundingBox.size.width) * 0.5 - textBoundingBox.origin.x, y: (labelSize.height - textBoundingBox.size.height) * 0.5 - textBoundingBox.origin.y)

        //let locationOfTouchInTextContainer = CGPointMake(locationOfTouchInLabel.x - textContainerOffset.x,
                                                        // locationOfTouchInLabel.y - textContainerOffset.y);
        let locationOfTouchInTextContainer = CGPoint(x: locationOfTouchInLabel.x - textContainerOffset.x, y: locationOfTouchInLabel.y - textContainerOffset.y)
        let indexOfCharacter = layoutManager.characterIndex(for: locationOfTouchInTextContainer, in: textContainer, fractionOfDistanceBetweenInsertionPoints: nil)
        return NSLocationInRange(indexOfCharacter, targetRange)
    }

}
extension UIScrollView {
    func scrollToTop() {
        let desiredOffset = CGPoint(x: 0, y: -contentInset.top)
        setContentOffset(desiredOffset, animated: true)
   }
}

extension UIApplication {
    var statusBarView: UIView? {
        if responds(to: Selector(("statusBar"))) {
            return value(forKey: "statusBar") as? UIView
        }
        return nil
    }
    
}

extension UIColor {
    convenience init(hex: Int) {
        let components = (
            R: CGFloat((hex >> 16) & 0xff) / 255,
            G: CGFloat((hex >> 08) & 0xff) / 255,
            B: CGFloat((hex >> 00) & 0xff) / 255
        )
        self.init(red: components.R, green: components.G, blue: components.B, alpha: 1)
    }
}
