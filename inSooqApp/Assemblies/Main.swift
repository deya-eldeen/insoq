//
//  Main.swift
//  inSooqApp
//
//  Created by Abdullah AL-Soubani on 30/12/2021.
//

import Foundation
import UIKit

extension ViewControllersAssembly {

    static func HomeViewController() -> UIViewController {
        let controller: HomeViewController = main.makeViewController()
        return controller
    }
    
  
    
    static var menuController: UIViewController {
        let controller: UINavigationController = main.makeViewNavigationController(with: "MainNav")
        return controller
    }
    
    static var addViewController: UIViewController {
        let controller: AddViewController = main.makeViewController()
        return controller.containedInNavigation()
    }

    static func Add_TitleViewController(type: MotorGategorys, model: Category) -> UIViewController {
        let controller: Add_TitleViewController = main.makeViewController()
        controller.type = type
        controller.selectedCategory = model
        return controller
    }
    
    static func add_CategoryViewController(model: CategoriesModel) -> UIViewController {
        let controller: Add_CategoryViewController = main.makeViewController()
        controller.modelOfCategory = model
        return controller
    }
    
    static func add_FullSpecesViewController(allModel: AllSelectedModel, addedUsesCarItemsID:Int, response: AddInitialMotorModel) -> UIViewController {
        let controller: Add_FullSpecesViewController = main.makeViewController()
        controller.addedUsesCarItemsID = addedUsesCarItemsID
        controller.allModel = allModel
        return controller
    }
}

extension UIViewController {
    func containedInNavigation() -> UIViewController {
        let nav = UINavigationController(rootViewController: self)
        nav.navigationBar.barTintColor = .white
        nav.navigationBar.backgroundColor = .white
        nav.modalPresentationStyle = .overFullScreen
        return nav
    }
}
