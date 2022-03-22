//
//  ServicesModel.swift
//  inSooqApp
//
//  Created by Alawadi on 26/02/2022.
//

import Foundation
// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let welcome = try? newJSONDecoder().decode(Welcome.self, from: jsonData)

struct ServicesModel: Codable {
    let chates, packageID: Int
    let adPicturesss: String?
    let views, id: Int
    let title, welcomeDescription, enLocation, arLocation: String
    let lat, lng: String
    let status: Int
    let postDate: String
    let categoryID: Int
    let categoryArName, categoryEnName: String
    let typeID, userID: Int
    let agentID: String?
    let serviceTypeID: Int
    let serviceTypeEnName, serviceTypeArName: String
    let otherServiceType: String?
    let userImage: String
    let phoneNumber, carLiftFrom, carLiftTo: String?
    let pictures: [Picture]
    let isFavorite: Bool

    enum CodingKeys: String, CodingKey {
        case chates
        case packageID = "packageId"
        case adPicturesss, views, id, title
        case welcomeDescription = "description"
        case enLocation = "en_Location"
        case arLocation = "ar_Location"
        case lat, lng, status, postDate
        case categoryID = "categoryId"
        case categoryArName, categoryEnName
        case typeID = "typeId"
        case userID = "userId"
        case agentID = "agentId"
        case serviceTypeID = "serviceTypeId"
        case serviceTypeEnName = "serviceTypeEn_Name"
        case serviceTypeArName = "serviceTypeAr_Name"
        case otherServiceType, userImage, phoneNumber, carLiftFrom, carLiftTo, pictures, isFavorite
    }
}


