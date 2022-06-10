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
        
        if #available(iOS 13.0, *) {
            self.isModalInPresentation = true
        }
        
    }
    
    var myAdsVC: MyAdsViewController?
    var pricesVC: PricesViewController?

    func dismissThenPopToRoot() {
    
        let alertVC = UIAlertController(title: "Ad Posted Successfuly", message: "", preferredStyle: .alert)
        alertVC.addAction(.init(title: "OK", style: .default, handler: { _ in
            newHomeRoot(NavId: "HomeViewController")
        }))

        self.present(alertVC, animated: true)
        
//        switch self.paymentNavigationSource {
//        case .myAds:
//            self.dismiss(animated: true) {
//                self.myAdsVC?.dismiss(animated: true) {
//
//                }
//                //self.previousVC?.navigationController?.popToRootViewController(animated: true)
//            }
//        case .posting:
//            self.dismiss(animated: true) {
//                self.pricesVC?.dismiss(animated: true)
//                //self.previousVC?.navigationController?.popToRootViewController(animated: true)
//            }
//        case .none:
//            break
//        }

    }
    
}
