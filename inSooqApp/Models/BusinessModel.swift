//
//  BusinessModel.swift
//  inSooqApp
//
//  Created by Alawadi on 27/02/2022.

import Foundation

struct BusinessModel: Codable {
    let chates, packageID: Int
    let adPicturesss: String?
    let views, id: Int
    let title: String
    let price: Double
    let welcomeDescription, enLocation, arLocation, lat: String
    let lng: String
    let status: Int
    let postDate: String
    let categoryID: Int
    let categoryArName, categoryEnName: String
    let otherCategoryName: String?
    let subCategoryID: Int
    let subCategoryArName, subCategoryEnName: String
    let otherSubCategoryName: String?
    let typeID, userID: Int
    let agentID: String?
    let pictures: [PictureModel]
    let userImage, phoneNumber: String
    let isFavorite: Bool

    enum CodingKeys: String, CodingKey {
        case chates
        case packageID = "packageId"
        case adPicturesss, views, id, title, price
        case welcomeDescription = "description"
        case enLocation = "en_Location"
        case arLocation = "ar_Location"
        case lat, lng, status, postDate
        case categoryID = "categoryId"
        case categoryArName, categoryEnName, otherCategoryName
        case subCategoryID = "subCategoryId"
        case subCategoryArName, subCategoryEnName, otherSubCategoryName
        case typeID = "typeId"
        case userID = "userId"
        case agentID = "agentId"
        case pictures, userImage, phoneNumber, isFavorite
    }
}

//
// To parse values from Alamofire responses:
//
//   Alamofire.request(url).responsePicture { response in
//     if let picture = response.result.value {
//       ...
//     }
//   }


// MARK: - Helper functions for creating encoders and decoders

func newJSONDecoder() -> JSONDecoder {
    let decoder = JSONDecoder()
    if #available(iOS 10.0, OSX 10.12, tvOS 10.0, watchOS 3.0, *) {
        decoder.dateDecodingStrategy = .iso8601
    }
    return decoder
}

func newJSONEncoder() -> JSONEncoder {
    let encoder = JSONEncoder()
    if #available(iOS 10.0, OSX 10.12, tvOS 10.0, watchOS 3.0, *) {
        encoder.dateEncodingStrategy = .iso8601
    }
    return encoder
}
