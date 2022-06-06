//
//  EditProfileModel.swift
//  inSooqApp
//
//  Created by Deya on 26/03/2022.
//

import Foundation

struct EditProfileModel: Codable {
    
    let id:  Int?
    let firstName:  String?
    let lastName:  String?
    let email:  String?
    let mobileNumber:  String?
    let gender:  String?
    let dob:  String?
    let nationality:  String?
    let defaultLocation:  String?
    let defaultLanguage:  String?
//    let careerLevel:  String?
//    let education:  String?
//    let currentLocation:  String?
//    let currentPosition:  String?
//    let currentCompany:  String?
//    let cv:  null
//    let coverNote:  String?
    let profilePicture:  String?
//    let industry:  null
//    let city:  null
    let hideInfromation:  Bool?
    let externalLogin:  Bool?
    let memberSince:  String?
//    let adList:  null
    
}

struct FullEditProfileModel: Codable {
    var user: EditProfileModel?
    var isSuccess: Bool?
    var message: String?
    var adId: Int?
}


//{
//    "user": {
//        "gender": "veniam aute quis dolor",
//        "dob": "1994-04-20T00:00:00",
//        "nationality": "nisi ex aute adipisicing",
//        "defaultLocation": "fugiat quis enim",
//        "defaultLanguage": "amet",
//        "careerLevel": "Ut esse",
//        "education": "irure elit",
//        "currentLocation": "sit exercitation",
//        "currentPosition": "sint",
//        "currentCompany": "et est Duis dolor",
//        "cv": null,
//        "coverNote": "ipsum Lorem in",
//        "profilePicture": "\\images\\userImage.png",
//        "industry": null,
//        "city": null,
//        "hideInfromation": true,
//        "externalLogin": false,
//        "memberSince": "2022-02-19T11:42:57.9131723",
//        "adList": null
//    },
//    "isSuccess": true,
//    "message": null
//}
