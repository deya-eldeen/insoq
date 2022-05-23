//
//  PackageModel.swift
//  inSooqApp
//
//  Created by Deya on 09/05/2022.
//

import Foundation

struct PackageModel: Codable {
  
    var id: Int?
    var numberOfDays: Int?
    var price: Double?
    var status: Int?
    var categoryId: Int?
    var packColor: String?
    
    var isSelected: Bool? = false
    
}
