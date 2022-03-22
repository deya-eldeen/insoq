//
//  UIApplication+Extensions.swift
//  ACIsamsung
//
//  Created by mohammad ahmad on 23/01/2021.


import UIKit

extension UIApplication {
  class func changeRoot(with viewController: UIViewController) {
    guard let window = UIApplication.shared.keyWindow else {
      return
    }
    
    guard let rootViewController = window.rootViewController else {
      return
    }
    
    viewController.view.frame = rootViewController.view.frame
    viewController.view.layoutIfNeeded()
    
    UIView.transition(with: window, duration: 0.3, options: .transitionCrossDissolve, animations: {
      window.rootViewController = viewController
    }, completion: nil)
  }
}
/** usage
 let mainStoryboard = UIStoryboard(name: "Main", bundle: nil)
 let initialViewController = mainStoryboard.instantiateInitialViewController()!
 
 UIApplication.changeRoot(with: initialViewController)

 */

