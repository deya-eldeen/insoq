//
//  NetworkMonitor.swift
//  ACIsamsung
//
//  Created by mohammad ahmad on 1/12/21.
//

import Foundation
import Reachability

public func isConnectToInterNet()->Bool
    {
        var isConnected = false
        let reachability = try! Reachability()


        if reachability.connection == .wifi {
            isConnected =  true
        } else if reachability.connection == .cellular {
            isConnected =  true
        }
        else if reachability.connection == .unavailable {
            isConnected =  false
        }

        return isConnected
        //
    }

public func noInternetAlert(with conrtoller : UIViewController) {
    if !isConnectToInterNet() {
        let alert = UIAlertController(title: "Warning".localized, message: "No Internet Connection".localized, preferredStyle: .alert)
        let action = UIAlertAction(title: "Dismiss".localized, style: .default, handler: nil)
        alert.addAction(action)
        conrtoller.present(alert, animated: true, completion: nil)
    }

}
