//
//  ViewControllersAssembly.swift
//  inSooqApp
//
//  Created by Abdullah AL-Soubani on 30/12/2021.
//

import Foundation
import UIKit

typealias Assembly = ViewControllersAssembly

enum ViewControllersAssembly {
    // MARK: - Static properties
    
    private(set) static var main: UIStoryboard = { UIStoryboard(name: "Main") }()
    private(set) static var alerts: UIStoryboard = { UIStoryboard(name: "Alerts")}()
    private(set) static var adding: UIStoryboard = { UIStoryboard(name: "Adding") }()
    private(set) static var forms: UIStoryboard = { UIStoryboard(name: "Forms") }()
    private(set) static var misc: UIStoryboard = { UIStoryboard(name: "Misc") }()

    
}

extension UIStoryboard {
    // MARK: - Init / Deinit

    convenience init(name: String) {
        self.init(name: name, bundle: .main)
    }

    // MARK: - Actions

    // swiftlint:disable force_cast
    func makeViewController<T: StoryboardIdentifiable>() -> T {
        return instantiateViewController(withIdentifier: T.storyboardIdentifier) as! T
    }

    func makeViewController(with storyboardIdentifier: String) -> UIViewController {
        return instantiateViewController(withIdentifier: storyboardIdentifier)
    }
    
    func makeViewNavigationController(with storyboardIdentifier: String) -> UINavigationController {
        return instantiateViewController(withIdentifier: storyboardIdentifier) as! UINavigationController

    }

    // swiftlint:enable force_cast
}

extension UIStoryboard {
    
    private static let main = { UIStoryboard(name: "Main", bundle: .main) }()
    
    enum Main {
        
        static var initialViewController: UINavigationController {
            UIStoryboard.main.instantiateInitialViewController() as! UINavigationController
        }
        
        static var popupSearchViewController: PopupSearchViewController {
            UIStoryboard.main.instantiateViewController(withIdentifier: "PopupSearchViewController") as! PopupSearchViewController
        }
    }
}
