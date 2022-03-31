//
//  ProfileModel.swift
//  inSooqApp
//
//  Created by Deya on 26/03/2022.
//

import Foundation

struct ProfileModel: Codable {
    
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
    let careerLevel:  String?
    let education:  String?
    let currentLocation:  String?
    let currentPosition:  String?
    let currentCompany:  String?
//    let cv:  null
    let coverNote:  String?
    let profilePicture:  String?
    let industry:  String?
    let city:  String?
    let hideInfromation:  Bool?
    let externalLogin:  Bool?
    let memberSince:  String?
//    let adList:  null
    
    
}

//{
//    "id": 320,
//    "firstName": "zazu",
//    "lastName": "zizzz",
//    "email": "aaaa@accc.com",
//    "mobileNumber": "0797228551",
//    "gender": null,
//    "dob": null,
//    "nationality": null,
//    "defaultLocation": null,
//    "defaultLanguage": null,
//    "careerLevel": null,
//    "education": null,
//    "currentLocation": null,
//    "currentPosition": null,
//    "currentCompany": null,
//    "cv": null,
//    "coverNote": null,
//    "profilePicture": "\\images\\userImage.png",
//    "industry": null,
//    "city": null,
//    "hideInfromation": true,
//    "externalLogin": false,
//    "memberSince": "2022-03-24T08:39:51.1362633",
//    "adList": null
//}


