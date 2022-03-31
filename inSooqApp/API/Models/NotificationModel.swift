//
//  NotificationModel.swift
//  inSooqApp
//
//  Created by Deya on 27/03/2022.
//

import Foundation

struct NotificationModel: Codable {
    
    let id: Int? //": 158,
    let date: String? //": "2021-12-05T01:28:19.3893472",
    let status: Int? //": 1,
    let imageUrl: String? //": "\\images\\plates\\Dubai-Private Car.png",
    let plateCode: String? //": "A",
    let number: Int? //": 0,
    let en_Emirate: String? //": "Dubai",
    let en_PlateType: String? //": "Private Car",
    let userId: Int? //": 78,
    let adId: Int? //": 475,
    let categoryId: Int? //": 17,
    let message: String? //": "You received a confirmed on your ad"
    
    let ad: AdModel?
    
    //    let user: Int? //": null,
    //    let agentId: Int? //": null,
    //    let agent: Int? //": null,
    //    let offer: Int? //": null,
    //    let offerId: Int? //": null,
    //    let jobApplication: Int? //": null,
    //    let jobApplicationId: Int? //": null,
    //    let category: Int? //": null,
    //    let code: Int? //": null,

}

struct AdModel: Codable {
    var id: Int? //": 475,
    var title: String? //": "test",
    var description: String? //": "test",
    var en_Location: String? //": "Dubai",
    var ar_Location: String? //": "دبي",
    var phoneNumber: String? //": "00962790960144",
    var lat: String? //": "31.9649506",
    var lng: String? //": "35.8839339",
    var status: Int? //": 1,
    var postDate: String? //": "2021-12-05T01:27:51.911957",
    var lastUpdatedDate: String? //": "2021-12-05T01:27:51.9119752",
    var categoryId: Int? //": 17,
//    var category: Int? //": null,
    var typeId: Int? //": 7,
//    var type: Int? //": null,
    var userId: Int? //": 50,
//    var user: Int? //": null,
//    var agentId: Int? //": null,
//    var agent: Int? //": null,
//    var pictures: [String]? //": [],
//    var favorites: Int? //": null,
//    var price: Int? //": null,
    var packageId: Int? //": 1,
//    var packages: Int? //": null,
    var packageExpDate: String? //": "2022-07-25T00:00:00",
    var packageStatus: Int? //": 1
}

//
//{
//    "id": 158,
//    "date": "2021-12-05T01:28:19.3893472",
//    "status": 1,
//    "imageUrl": "\\images\\plates\\Dubai-Private Car.png",
//    "plateCode": "A",
//    "number": 0,
//    "code": null,
//    "en_Emirate": "Dubai",
//    "en_PlateType": "Private Car",
//    "userId": 78,
//    "user": null,
//    "agentId": null,
//    "agent": null,
//    "offer": null,
//    "offerId": null,
//    "jobApplication": null,
//    "jobApplicationId": null,
//    "ad": {
//        "id": 475,
//        "title": "test",
//        "description": "test",
//        "en_Location": "Dubai",
//        "ar_Location": "دبي",
//        "phoneNumber": "00962790960144",
//        "lat": "31.9649506",
//        "lng": "35.8839339",
//        "status": 1,
//        "postDate": "2021-12-05T01:27:51.911957",
//        "lastUpdatedDate": "2021-12-05T01:27:51.9119752",
//        "categoryId": 17,
//        "category": null,
//        "typeId": 7,
//        "type": null,
//        "userId": 50,
//        "user": null,
//        "agentId": null,
//        "agent": null,
//        "pictures": [],
//        "favorites": null,
//        "price": null,
//        "packageId": 1,
//        "packages": null,
//        "packageExpDate": "2022-07-25T00:00:00",
//        "packageStatus": 1
//    },
//    "adId": 475,
//    "category": null,
//    "categoryId": 17,
//    "message": "You received a confirmed on your ad"
//}



