//
//  Alert.swift
//  inSooqApp
//
//  Created by Abdullah AL-Soubani on 30/12/2021.
//

import Foundation
import UIKit

extension ViewControllersAssembly {

    static func alertController(alertType: AlertType, completion: (() -> (Void))? ) -> UIViewController {
        let controller: AlertControler = alerts.makeViewController()
        controller.alertType = alertType
        controller.completion = completion
        return controller
    }
}
