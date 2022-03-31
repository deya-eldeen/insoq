//
//  CustomNavigation.swift
//  orood
//
//  Created by Deya AlDeen on 15/07/2021.
//

import UIKit

protocol NavigationBarCustomizable {
    var navStyle: CustomNavigation.NavStyle { get  }
}

class CustomNavigation: UINavigationController, UINavigationControllerDelegate {
    
    enum NavStyle {
        case translucent
        case red
    }
    
    private var tintColor: UIColor?
    private var barTintColor: UIColor?
    private var isTranslucent: Bool?
    private var backgroundColor: UIColor?
    
    var navStyle = NavStyle.translucent {
        didSet {
            self.setNavStyle()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.delegate = self
    }
    
    deinit {
        print("Custom Navigation Deinitted")
    }
    
    func setNavStyle() {
        
        switch navStyle {
        case .translucent:
            if #available(iOS 13.0, *) {
                let navbarApperance = UINavigationBarAppearance()
                navbarApperance.largeTitleTextAttributes =  [.foregroundColor: UIColor.black]
                navbarApperance.titleTextAttributes = [.foregroundColor: UIColor.black]
                navbarApperance.configureWithTransparentBackground()
                navigationBar.tintColor = .black
                navigationBar.scrollEdgeAppearance = navbarApperance
                navigationBar.standardAppearance = navbarApperance
            }else{
                navigationBar.tintColor = .black
                navigationBar.titleTextAttributes = [.foregroundColor: UIColor.black]
                if #available(iOS 11.0, *) {
                    navigationBar.largeTitleTextAttributes = [.foregroundColor: UIColor.black]
                    navigationBar.setBackgroundImage(nil, for: .default)
                }
            }
            
            navigationBar.backgroundColor = AppColors.light_gray
            navigationBar.setBackgroundImage(UIImage(), for: .default)
            navigationBar.barTintColor = .clear
            navigationBar.isTranslucent = true
        case .red:
            if #available(iOS 13.0, *) {
                let navbarApperance = UINavigationBarAppearance()
                navbarApperance.largeTitleTextAttributes =  [.foregroundColor: UIColor.white]
                navbarApperance.titleTextAttributes = [.foregroundColor: UIColor.white]
                navbarApperance.configureWithTransparentBackground()
                navigationBar.tintColor = .white
                navigationBar.scrollEdgeAppearance = navbarApperance
                navigationBar.standardAppearance = navbarApperance
            }else{
                navigationBar.tintColor = .white
                navigationBar.titleTextAttributes = [.foregroundColor: UIColor.white]
                if #available(iOS 11.0, *) {
                    navigationBar.largeTitleTextAttributes = [.foregroundColor: UIColor.white]
                    navigationBar.setBackgroundImage(nil, for: .default)
                }
            }
            
            navigationBar.backgroundColor = AppColors.theme_red
            navigationBar.setBackgroundImage(UIImage(), for: .default)
            navigationBar.barTintColor = .clear
            navigationBar.isTranslucent = true
        }

    }
            
    func navigationController(_ navigationController: UINavigationController, willShow viewController: UIViewController, animated: Bool) {
        
        if let v = viewController as? NavigationBarCustomizable {
            self.navStyle = v.navStyle
        }
        
        transitionCoordinator?.notifyWhenInteractionChanges({ (context) in
            if context.isCancelled {
                if let fromVC = context.viewController(forKey: UITransitionContextViewControllerKey.from) as? NavigationBarCustomizable {
                    self.navStyle = fromVC.navStyle
                }
            }
        })
        
        viewController.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
    }
    
    func navigationController(_ navigationController: UINavigationController, didShow viewController: UIViewController, animated: Bool) {
        
        if let v = viewController as? NavigationBarCustomizable {
            self.navStyle = v.navStyle
        }
        
    }
    
}
