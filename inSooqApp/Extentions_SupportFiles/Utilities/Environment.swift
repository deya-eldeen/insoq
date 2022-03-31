//
//  Environment.swift
//  orood
//
//  Created by Deya AlDeen on 15/07/2021.
//

import Foundation

public enum Environment {
    private static let infoDictionary: [String: Any] = {
        guard let dict = Bundle.main.infoDictionary else {
            fatalError("Plist file not found")
        }
        return dict
    }()
    
    // MARK: - URLs
    
    static let rootURL: URL = {
        guard let rootURLstring = Environment.infoDictionary["ROOT_URL"] as? String else {
            fatalError("CRM_ROOT_URL not set in plist for this environment")
        }
        guard let url = URL(string: rootURLstring) else {
            fatalError("Root URL is invalid")
        }
        return url
    }()
    
    static let googleMapsKey: String = {
        guard let key = Environment.infoDictionary["GOOGLE_MAPS_KEY"] as? String else {
            fatalError("googleMapsKey not set in plist for this environment")
        }
        return key
    }()
    
    
    static let firebaseAppConfigFileName: String = {
        guard let key = Environment.infoDictionary["FIR_CONFIG_NAME"] as? String else {
            fatalError("Firebase config file URL not set in plist for this environment")
        }
        return key
    }()
    
    
    // MARK: - Links
    
    static let privacyPolicy: String = {
           guard let key = Environment.infoDictionary["PRIVACY_POLICY"] as? String else {
               fatalError("PRIVACY_POLICY not set in plist for this environment")
           }
           return key
    }()
    
    // MARK: - Config

    static let allowPrint: String = {
        guard let key = Environment.infoDictionary["ALLOW_PRINT"] as? String else {
            fatalError("AllowPrint not set in plist for this environment")
        }
        return key
    }()
    
}
