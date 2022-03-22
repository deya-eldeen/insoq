//
//  ClassifiedModel.swift
//  inSooqApp
//
//  Created by Alawadi on 01/03/2022.
//

import Foundation


// MARK: - Welcome
struct ClassifiedModel: Codable {
    let chates: Int
    let adPicturesss: String?
    let views, id, packageID: Int
    let title: String
    let price: Int
    let enAge, arAge, enUsage, arUsage: String
    let enBrand, arBrand, enCondition, arCondition: String
    let welcomeDescription, enLocation, arLocation, lat: String
    let lng: String
    let status: Int
    let postDate: String
    let categoryID: Int
    let categoryArName, categoryEnName: String
    let typeID, userID: Int
    let agentID: String?
    let pictures: [PictureModel]
    let subCategoryID: Int
    let subCategoryArName, subCategoryEnName, otherSubCategory: String?
    let subTypeID: Int
    let subTypeArName, subTypeEnName: String
    let otherSubType: String?
    let userImage, phoneNumber: String
    let isFavorite: Bool

    enum CodingKeys: String, CodingKey {
        case chates, adPicturesss, views, id
        case packageID = "packageId"
        case title, price
        case enAge = "en_Age"
        case arAge = "ar_Age"
        case enUsage = "en_Usage"
        case arUsage = "ar_Usage"
        case enBrand = "en_Brand"
        case arBrand = "ar_Brand"
        case enCondition = "en_Condition"
        case arCondition = "ar_Condition"
        case welcomeDescription = "description"
        case enLocation = "en_Location"
        case arLocation = "ar_Location"
        case lat, lng, status, postDate
        case categoryID = "categoryId"
        case categoryArName, categoryEnName
        case typeID = "typeId"
        case userID = "userId"
        case agentID = "agentId"
        case pictures
        case subCategoryID = "subCategoryId"
        case subCategoryArName = "subCategoryAr_Name"
        case subCategoryEnName = "subCategoryEn_Name"
        case otherSubCategory
        case subTypeID = "subTypeId"
        case subTypeArName = "subTypeAr_Name"
        case subTypeEnName = "subTypeEn_Name"
        case otherSubType, userImage, phoneNumber, isFavorite
    }
}
