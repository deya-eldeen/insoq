//
//  AdvertisingModel.swift
//  inSooqApp
//
//  Created by Deya on 02/04/2022.
//

import Foundation

struct AdvertisingModel: Codable {
    
    var isSuccess: Bool? //": true,
    var message: String? //": "Success",
//    var username: Bool? //": null,
//    var userLastName: Bool? //": null,
//    var packDetails: Bool? //": null,
//    var invoceNumber: Bool? //": null,
    var invoiceAmount: Double? //": 0.0,
    var invoiceTime: String? //": "0001-01-01T00:00:00",
    var paymentId: Int? //": 0,
//    var code: Bool? //": null,
    var adId: Int? //": 0,
    var adType: Int? //": 0,
    var userId: Int? //": 0,
//    var userEmail: Bool? //": null
    
}
