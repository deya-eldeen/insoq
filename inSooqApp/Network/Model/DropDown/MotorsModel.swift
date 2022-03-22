//
//  MotorsModel.swift
//  inSooqApp
//
//  Created by Abdullah AL-Soubani on 31/12/2021.
//

import Foundation

public struct GetAllMotorMakerModel: Codable {
    public let id: Int?
    public let arText, enText: String?
    public let modelId: Int?
    public let categoryId: Int?
    public let arName: String?
    public let enName: String?

    enum CodingKeys: String, CodingKey {
        case id
        case arText = "ar_Text"
        case enText = "en_Text"
        case modelId
        case categoryId
        case arName = "ar_Name"
        case enName = "en_Name"
    }

    public init(id: Int?, arText: String?, enText: String?, modelId: Int, categoryId: Int, arName: String, enName: String) {
        self.id = id
        self.arText = arText
        self.enText = enText
        self.modelId = modelId
        self.categoryId = categoryId
        self.arName = arName
        self.enName = enName
    }
}


// MARK: - AddInitialMotorModel

public struct AddInitialMotorModel: Codable {
    public let id: Int?
    public let isSuccess: Bool?
    public let message: String?

    public init(id: Int?, isSuccess: Bool?, message: String?) {
        self.id = id
        self.isSuccess = isSuccess
        self.message = message
    }
}
