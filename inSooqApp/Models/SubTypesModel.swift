//
//  SubTypesModel.swift
//  inSooqApp
//
//  Created by Alawadi on 01/03/2022.
//

import Foundation
struct SubTypesModel: Codable {
    let id: Int
    let arName, enName: String
    let subCategoryID: Int
    let subCategory: JSONNull?
    let status: Int

    enum CodingKeys: String, CodingKey {
        case id
        case arName = "ar_Name"
        case enName = "en_Name"
        case subCategoryID = "subCategoryId"
        case subCategory, status
    }
}
