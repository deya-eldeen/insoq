//
//  PaymentViewController.swift
//  inSooqApp
//
//  Created by Deya on 23/05/2022.
//

import UIKit

enum PaymentNavigationSource {
    case posting
    case myAds
    case none
}

class PaymentViewController: UIViewController {
    
    var paymentNavigationSource = PaymentNavigationSource.myAds
    
    @IBAction func didTapPay() {
        dismissThenPopToRoot()
    }
    
    override func viewDidLoad() {
        
    }
    
    var myAdsVC: MyAdsViewController?
    var pricesVC: PricesViewController?

    func dismissThenPopToRoot() {
    
        switch self.paymentNavigationSource {
        case .myAds:
            self.dismiss(animated: true) {
                self.myAdsVC?.dismiss(animated: true) {
                    
                }
                //self.previousVC?.navigationController?.popToRootViewController(animated: true)
            }
        case .posting:
            self.dismiss(animated: true) {
                self.pricesVC?.dismiss(animated: true)
                //self.previousVC?.navigationController?.popToRootViewController(animated: true)
            }
        case .none:
            break
        }

    }
    
}
