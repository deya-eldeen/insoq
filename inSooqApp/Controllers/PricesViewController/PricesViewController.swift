//
//  PricesViewController.swift
//  inSooqApp
//
//  Created by Deya on 15/04/2022.
//

import UIKit

class PricesViewController: UIViewController {
    
    var previousVC: UIViewController?
    
    @IBAction func didTapContinue() {
        
        self.dismiss(animated: true) {
            self.previousVC?.navigationController?.popToRootViewController(animated: true)
        }
        
    }
    
}
