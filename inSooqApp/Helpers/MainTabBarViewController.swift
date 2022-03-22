//
//  MainTabBarViewController.swift
//  ios-utrac-shop
//
//  Created by Marwan Abd-Alhadi on 8/17/20.
//  Copyright © 2020 apple. All rights reserved.
//

import UIKit

class MainTabBarViewController: UITabBarController {
    
    var isBack : Bool = false
    var indexToScroll : Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tabBar.items!.first?.titlePositionAdjustment = UIOffset(horizontal: -10.0, vertical: 0.0)
        self.tabBar.items!.last?.titlePositionAdjustment = UIOffset(horizontal: 10.0, vertical: -0.0)
        self.tabBar.items![1].titlePositionAdjustment = UIOffset(horizontal: -25.0, vertical: 0.0)
        self.tabBar.items![2].titlePositionAdjustment = UIOffset(horizontal: 25.0, vertical: 0.0)
        
        let tabBar = self.tabBar
        
        let homeSelectImage: UIImage! = #imageLiteral(resourceName: "home_tab") //UIImage(named: "homeSelected")?.withRenderingMode(.alwaysOriginal)
        
        let chatSelectImage: UIImage! = #imageLiteral(resourceName: "chat_tab") //UIImage(named: "menuSelected")?.withRenderingMode(.alwaysOriginal)
        let notificationsSelectImage: UIImage! = #imageLiteral(resourceName: "favorite_tab") //UIImage(named: "notificationsSelected")?.withRenderingMode(.alwaysOriginal)
        let settingsSelectImage: UIImage! = #imageLiteral(resourceName: "list_tab") //UIImage(named: "settingsSelected")?.withRenderingMode(.alwaysOriginal)
            if let myTabbar = tabBar as? CenteredTabBar {
                myTabbar.centerButtonActionHandler = {
                    print("Center Button Tapped")
                    
                    let customAlert = self.storyboard?.instantiateViewController(withIdentifier: "AddViewController") as! AddViewController
                    customAlert.providesPresentationContextTransitionStyle = true
                    customAlert.definesPresentationContext = true
                    customAlert.modalPresentationStyle = UIModalPresentationStyle.overCurrentContext
                    customAlert.modalTransitionStyle = UIModalTransitionStyle.crossDissolve
                    self.present(customAlert, animated: true, completion: nil)
                    
                }
            }
        
        
        UIView.appearance().semanticContentAttribute = .forceLeftToRight
        
    }
    override func viewWillAppear(_ animated: Bool) {
        if(isBack){
            print("is back")
            if(indexToScroll == 0){
                self.selectedIndex = 0
             //   let vc = self.viewControllers![0] as! ShopHomeViewController
             //   vc.tabBar = self
             //   vc.getOrders()
            }else{
                self.selectedIndex = 1
               // let vc = self.viewControllers![1] as! MenuOrderViewController
               // vc.tabBar = self
               // vc.getMenuOrders()
            }
        }
    }

 
        
}

