//
//  AdvertisingBudget.swift
//  inSooqApp
//
//  Created by Deya on 02/04/2022.
//

import Foundation

struct AdvertisingBudget: Codable, Listable {
    var value: String?
    
    
    let id:  Int?
    let ar_Text:  String?
    let en_Text:  String?
    
    var ar_Name: String?
    var en_Name: String?
}
