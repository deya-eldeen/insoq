//
//  PushNotification.swift
//  ACIsamsung
//
//  Created by mohammad ahmad on 23/01/2021.
//

import Foundation

class PushNotification {
    var registration_ids = [""]
    var flag : String = ""
    var title : String = ""
    var body : String = ""
    var pushType : String = "1"
    
}
struct sendToken: Codable {
    var token : String
    var flag : String
    var userId : String
}
