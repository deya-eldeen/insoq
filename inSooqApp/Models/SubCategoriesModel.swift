//
//  SubCategoriesModel.swift
//  inSooqApp
//
//  Created by Alawadi on 01/03/2022.
//

import Foundation
struct SubCategoriesModel: Codable {
    let id: Int
    let arName, enName: String
    let categoryID: Int
    let category: String?
    let status: Int

    enum CodingKeys: String, CodingKey {
        case id
        case arName = "ar_Name"
        case enName = "en_Name"
        case categoryID = "categoryId"
        case category, status
    }
}
