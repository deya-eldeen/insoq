//
//  JobsModel.swift
//  inSooqApp
//
//  Created by Alawadi on 21/02/2022.
//

import Foundation
// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let welcome = try? newJSONDecoder().decode(Welcome.self, from: jsonData)

import Foundation

// MARK: - Welcome
struct JobsModel: Codable {
    let id, chates: Int
    let adPicturesss: String?
    let views: Int
    let title, welcomeDescription, enLocation, arLocation: String
    let lat, lng: String
    let status: Int
    let postDate: String
    let categoryID: Int
    let categoryArName, categoryEnName: String
    let typeID, userID: Int
    let agentID: String?
    let arJobType, enJobType: String
    let otherJobType: String?
    let phoneNumber: String
    let cv, enGender, arGender, enNationality: String?
    let arNationality, enCurrentLocation, arCurrentLocation, enEducationLevel: String?
    let arEducationLevel, currentPosition, enWorkExperience, arWorkExperience: String?
    let enCommitment, arCommitment, enNoticePeriod, arNoticePeriod: String?
    let arVisaStatus, enVisaStatus: String?
    let enCareerLevel, arCareerLevel: String
    let expectedMonthlySalary: String?
    let arEmploymentType, enEmploymentType, enMinWorkExperience, arMinWorkExperience: String?
    let enMinEducationLevel, arMinEducationLevel, companyName, userImage: String?
    let jobTitle: String?
    let pictures: [Picture]
    let isFavorite: Bool

    enum CodingKeys: String, CodingKey {
        case id, chates, adPicturesss, views, title
        case welcomeDescription = "description"
        case enLocation = "en_Location"
        case arLocation = "ar_Location"
        case lat, lng, status, postDate
        case categoryID = "categoryId"
        case categoryArName, categoryEnName
        case typeID = "typeId"
        case userID = "userId"
        case agentID = "agentId"
        case arJobType = "ar_JobType"
        case enJobType = "en_JobType"
        case otherJobType, phoneNumber, cv
        case enGender = "en_Gender"
        case arGender = "ar_Gender"
        case enNationality = "en_Nationality"
        case arNationality = "ar_Nationality"
        case enCurrentLocation = "en_CurrentLocation"
        case arCurrentLocation = "ar_CurrentLocation"
        case enEducationLevel = "en_EducationLevel"
        case arEducationLevel = "ar_EducationLevel"
        case currentPosition
        case enWorkExperience = "en_WorkExperience"
        case arWorkExperience = "ar_WorkExperience"
        case enCommitment = "en_Commitment"
        case arCommitment = "ar_Commitment"
        case enNoticePeriod = "en_NoticePeriod"
        case arNoticePeriod = "ar_NoticePeriod"
        case arVisaStatus = "ar_VisaStatus"
        case enVisaStatus = "en_VisaStatus"
        case enCareerLevel = "en_CareerLevel"
        case arCareerLevel = "ar_CareerLevel"
        case expectedMonthlySalary
        case arEmploymentType = "ar_EmploymentType"
        case enEmploymentType = "en_EmploymentType"
        case enMinWorkExperience = "en_MinWorkExperience"
        case arMinWorkExperience = "ar_MinWorkExperience"
        case enMinEducationLevel = "en_MinEducationLevel"
        case arMinEducationLevel = "ar_MinEducationLevel"
        case companyName, userImage, jobTitle, pictures, isFavorite
    }
}

// MARK: - Picture
struct Picture: Codable {
    let id: Int
    let imageURL: String
    let mainPicture: Bool
}

// MARK: - Encode/decode helpers

class JSONNull: Codable, Hashable {

    public static func == (lhs: JSONNull, rhs: JSONNull) -> Bool {
        return true
    }

    public var hashValue: Int {
        return 0
    }

    public init() {}

    public required init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if !container.decodeNil() {
            throw DecodingError.typeMismatch(JSONNull.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for JSONNull"))
        }
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encodeNil()
    }
}
