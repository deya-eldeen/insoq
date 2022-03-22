//
//  AlertType.swift
//  WaterFront
//
//  Created by Laith on 19/11/2021.
//  Copyright © 2021 Laith Abdo. All rights reserved.
//

import UIKit

enum AlertType {
    case success(message: String?)
    case failure(message: String?)
    
    var image: UIImage {
        switch self {
        case .success:
            return UIImage(named: "successAlert") ?? UIImage()
        case .failure:
            return UIImage(named: "failure_alert") ?? UIImage()
        }
    }
    
    var title: String? {
        switch self {
        case .success(let message), .failure(let message):
            return message
        }
    }
    
    var buttonTitle: String? {
        switch self {
        case .success, .failure:
            return "Dismiss"
        }
    }
}
