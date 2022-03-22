//
//  LoginModel.swift
//  inSooqApp
//
//  Created by Abdullah AL-Soubani on 30/12/2021.
//

import Foundation

// MARK: - LoginModel

public struct LoginModel: Codable {
    public let token: String?
    public let userID, status: Int?
    public let phoneNumber, email: String?
    public let isSuccess: Bool?
    public let message: String?

    enum CodingKeys: String, CodingKey {
        case token
        case userID = "userId"
        case status, phoneNumber, email, isSuccess, message
    }

    public init(token: String?, userID: Int?, status: Int?, phoneNumber: String?, email: String?, isSuccess: Bool?, message: String?) {
        self.token = token
        self.userID = userID
        self.status = status
        self.phoneNumber = phoneNumber
        self.email = email
        self.isSuccess = isSuccess
        self.message = message
    }
}
