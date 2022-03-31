//
//  Defaults.swift
//  orood
//
//  Created by Deya AlDeen on 17/07/2021.
//

import Foundation
import Defaults

extension Defaults.Keys {
    
    // User Session
    static let session = Key<LoginModel?>("session", default: nil)
//    static let currentCity = Key<City?>("currentCity", default: nil)
//    static let currentCountry = Key<Country?>("currentCountry", default: nil)
    static let currentLanguage = Key<String>("currentLanguage", default: "en")

    static let fcmToken = Key<String>("fcmToken", default: "")

    static let appleSignInID = Key<String?>("appleSignInID", default: nil)
    static let appleSignInFullName = Key<String?>("appleSignInFullName", default: nil)
    static let appleSignInEmail = Key<String?>("appleSignInEmail", default: nil)

}
