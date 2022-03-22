//
//  GetAllCategoriesModel.swift
//  inSooqApp
//
//  Created by Abdullah AL-Soubani on 31/12/2021.
//

import Foundation

// MARK: - GetAllCategoriesModelElement
public struct GetAllCategoriesModelElement: Codable {
    public let id: Int?
    public let arName, enName: String?
    public let categories: [Category]?

    enum CodingKeys: String, CodingKey {
        case id
        case arName = "ar_Name"
        case enName = "en_Name"
        case categories
    }

    public init(id: Int?, arName: String?, enName: String?, categories: [Category]?) {
        self.id = id
        self.arName = arName
        self.enName = enName
        self.categories = categories
    }
}

// MARK: - Category
public struct Category: Codable {
    public let id: Int?
    public let arName, enName: String?
    public let firstImage, secondImage: String?
    public let numberOfAds, typeID: Int?
    public let types: String?
    public let status: Int?

    enum CodingKeys: String, CodingKey {
        case id
        case arName = "ar_Name"
        case enName = "en_Name"
        case firstImage, secondImage, numberOfAds
        case typeID = "typeId"
        case types, status
    }

    public init(id: Int?, arName: String?, enName: String?, firstImage: String?, secondImage: String?, numberOfAds: Int?, typeID: Int?, types: String?, status: Int?) {
        self.id = id
        self.arName = arName
        self.enName = enName
        self.firstImage = firstImage
        self.secondImage = secondImage
        self.numberOfAds = numberOfAds
        self.typeID = typeID
        self.types = types
        self.status = status
    }
}
