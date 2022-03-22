//
//  UIView+Extensions.swift
//  ACIsamsung
//
//  Created by mohammad ahmad on 23/01/2021.
//

import UIKit

extension UIView {
  @IBInspectable
  var cornerRadius: CGFloat {
    get {
      return layer.cornerRadius
    }
    set {
      layer.cornerRadius = newValue
      layer.masksToBounds = newValue > 0
    }
  }
  
  @IBInspectable
  var borderWidth: CGFloat {
    get {
      return layer.borderWidth
    }
    set {
      layer.borderWidth = newValue
    }
  }
  
  @IBInspectable
  var borderColor: UIColor? {
    get {
      let color = UIColor(cgColor: layer.borderColor!)
      return color
    }
    set {
      layer.borderColor = newValue?.cgColor
    }
  }
}

extension UIView {
    
    func showLoading() {
        let blurView = UIView(frame: CGRect(x: 0, y: 0, width: self.frame.size.width, height: self.frame.size.height))
        blurView.backgroundColor = UIColor.black.withAlphaComponent(0.0)
        blurView.tag = 555
        let indicator = UIActivityIndicatorView(frame: CGRect(x: 0, y: 0, width: 50, height: 50))
        indicator.center = blurView.center
        indicator.style = .whiteLarge
        indicator.color = .blue
        indicator.hidesWhenStopped = true
        blurView.addSubview(indicator)
        addSubview(blurView)
        indicator.startAnimating()
    }
    
    func hideLoading() {
        if let blurView = self.viewWithTag(555) {
            blurView.removeFromSuperview()
        }
    }
}


import UIKit

// MARK: - Alerts

extension UIViewController {
    
    func showSuccessAlert(title: String?) {
        let controller = Assembly.alertController(alertType: .success(message: title), completion: nil)
        self.present(controller, animated: true, completion: nil)
    }
    
    func showSuccessAlert(title: String?, completion: (() -> (Void))?) {
        let controller = Assembly.alertController(alertType: .success(message: title), completion: completion)
        self.present(controller, animated: true, completion: nil)
    }
    
    func showFailureAlert(title: String?) {
        let controller = Assembly.alertController(alertType: .failure(message: title), completion: nil)
        self.present(controller, animated: true, completion: nil)
    }
    
    func showFailureAlert(title: String?, completion: (() -> (Void))?) {
        let controller = Assembly.alertController(alertType: .failure(message: title), completion: completion)
        self.present(controller, animated: true, completion: nil)
    }
}
