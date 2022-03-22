//
//  AlertControler.swift
//  WaterFront
//
//  Created by Abdullah AL-Soubani on 19/11/2021.
//  Copyright © 2021 Laith Abdo. All rights reserved.
//

import Foundation
import UIKit

class AlertControler: UIViewController {
    
    // MARK: Outlets

    @IBOutlet weak var button: UIButton!
    @IBOutlet private weak var alertDesc: UILabel!
    @IBOutlet private weak var imageView: UIImageView!
    
    // MARK: Properties
    var alertType: AlertType!
    var completion: (() -> (Void))?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        alertDesc.text = alertType.title
        imageView.image = alertType.image
        button.setTitle(alertType.buttonTitle, for: .normal)
    }
    @IBAction func closeButtonDidTabbed(_ sender: Any) {
    }
    
    // MARK: Action

    @IBAction func actionButton(_ sender: Any) {
        dismiss(animated: true)
        completion?()
    }
}
