//
//  SubCategoriesModels.swift
//  inSooqApp
//
//  Created by mohammad ahmad on 10/02/2021.
//

import Foundation
import UIKit

struct MotorsModel{
    var itemDate:String
    var itemPriceLabel:String
    var itemYear:String
    var itemKM:String
    var itemLocationLabel:String
    var itemNameLabel:String
    var itemImage = #imageLiteral(resourceName: "motorPlaceHolder")
    var isFavorite:Bool
    var itemImages:[UIImage]
 }

struct PropertyModel {
    var itemDescLabel:String
    var itemSqFtLabel:String
    var itemWcLabel:String
    var ItemRoomsLabel: String
    var itemPriceLabel: String
    var itemLocationLabel: String
    var itemNameLabel: String
    var itemTypeLabel: String
    var isFavorite:Bool
    var itemDate:String
    var itemImages:[UIImage]
    
}

struct NumbersModel {
    var plateOrgineLabel: String
    var plateNumber: String
    var plateLocation: String
    var platePrice: String
    var plateImage:UIImage
    var isFavorite:Bool
    var plateDate:String

}
struct JobModel {
    var jobImage:UIImage
    var jobTitle:String
    var companyName:String
    var jobType:String
    var jobSalary:String
    var jobDate:String
    var isFavorite:Bool
    
}
struct WantedJobModel {
    var jobTitle:String
    var jobLocation:String
    var jobPositions:String
    var jobType:String
    var jobExperiance:String
    var jobDate:String
    var isFavorite:Bool

}

//struct ServicesModel {
//    var serviceTitle:String
//    var serviceLocation:String
//    var servicePrice:String
//    var serviceImages:[UIImage]
//    var isFavorite:Bool
//
//}
//
//struct BusinessModel {
//    var businessTitle:String
//    var businessLocation:String
//    var businessPrice:String
//    var businessImages:[UIImage]
//    var isFavorite:Bool
//
//}
