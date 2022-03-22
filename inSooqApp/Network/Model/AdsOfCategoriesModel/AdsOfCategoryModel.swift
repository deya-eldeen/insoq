//
//  AdsOfCategoryModel.swift
//  inSooqApp
//
//  Created by AOUN on 1/15/22.
//

import Foundation

//extension IntOrString{
//
//
//}
enum IntOrString:Codable{
    
    
    case double(Double)
    case integer(Int)
    case string(String)
    
    
    
    var stringValue:String {
        get {
            switch self {
            case .double(let double):
                return String(double)
            case .integer(let int):
                return String(int)
            case .string(let string):
                return string
            }
        }
    }
    var integerValue:Int {
        get {
            switch self {
            case .double(let double):
                return Int(double)
            case .integer(let int):
                return int
            case .string(let string):
                return 0
            }
        }
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if let x = try? container.decode(String.self) {

            self = .string(x)
            return
        }
        if let x = try? container.decode(Int.self) {
            self = .integer(x)
            return
        }
       
        if let x = try? container.decode(Double.self) {
            self = .double(x)
            return
        }
        
        throw DecodingError.typeMismatch(IntOrString.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for IntOrString"))
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        switch self {
        case .double(let x):
            debugPrint("decoder encode x integer\(x)")

            try container.encode(x)
        case .integer(let x):
            debugPrint("decoder encode x integer\(x)")

            try container.encode(x)
        case .string(let x):
            debugPrint("decoder encode x string\(x)")

            try container.encode(x)
        }
    }
}
public struct PictureModel:Codable{
    var id:Int? = 0
    var imageURL:String? = ""
    var mainPicture:Bool? = false
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case imageURL = "imageURL"
        case mainPicture = "mainPicture"
 }
    
}
public struct AdsOfCategoryModel: Codable {
    
    var id:IntOrString? = nil
    var chates:IntOrString? = nil
    var views:IntOrString? = nil
    var title:IntOrString? = nil
    var description:IntOrString? = nil
    var en_Location:IntOrString? = nil
    var ar_Location:IntOrString? = nil
    var lat:IntOrString? = nil
    var lng:IntOrString? = nil
    var status:IntOrString? = nil
    var postDate:IntOrString? = nil
    var categoryId:IntOrString? = nil
    var categoryEnName:IntOrString? = nil
    var categoryArName:IntOrString? = nil
    var subCategoryId:IntOrString? = nil
    var subCategoryEn_Name:IntOrString? = nil
    var subCategoryAr_Name:IntOrString? = nil
    var otherSubCategory:IntOrString? = nil
    var subTypeId:IntOrString? = nil
    var subTypeEn_Name:IntOrString? = nil
    var subTypeAr_Name:IntOrString? = nil
    var otherSubType:IntOrString? = nil
    var typeId:IntOrString? = nil
    var userId:IntOrString? = nil
    var agentId:IntOrString? = nil
    var pictures:[PictureModel]? = nil
    ///
    var en_Maker:IntOrString? = nil
            var ar_Maker:IntOrString? = nil
            var en_Model:IntOrString? = nil
            var ar_Model:IntOrString? = nil
            var en_Trim:IntOrString? = nil
            var ar_Trim:IntOrString? = nil
            var en_Color:IntOrString? = nil
            var ar_Color:IntOrString? = nil
            var kilometers:IntOrString? = nil
            var year:IntOrString? = nil
            var en_Doors:IntOrString? = nil
            var ar_Doors:IntOrString? = nil
            var warranty:Bool?  = nil
            var en_Transmission:IntOrString? = nil
            var ar_Transmission:IntOrString? = nil
            var en_RegionalSpecs:IntOrString? = nil
            var ar_RegionalSpecs:IntOrString? = nil
            var en_BodyType:IntOrString? = nil
            var ar_BodyType:IntOrString? = nil
            var en_FuelType:IntOrString? = nil
            var ar_FuelType:IntOrString? = nil
            var en_NoOfCylinders:IntOrString? = nil
            var ar_NoOfCylinders:IntOrString? = nil
            var en_Horsepower:IntOrString? = nil
            var ar_Horsepower:IntOrString? = nil
            var en_Condition:IntOrString? = nil
            var ar_Condition:IntOrString? = nil
            var en_MechanicalCondition:IntOrString? = nil
            var ar_MechanicalCondition:IntOrString? = nil
            var price:Double? = nil
            var en_Capacity:IntOrString? = nil
            var ar_Capacity:IntOrString? = nil
            var en_EngineSize:IntOrString? = nil
            var ar_EngineSize:IntOrString? = nil
            var en_Age:IntOrString? = nil
            var ar_Age:IntOrString? = nil
            var en_Usage:IntOrString? = nil
            var ar_Usage:IntOrString? = nil
            var en_Length:IntOrString? = nil
            var ar_Length:IntOrString? = nil
            var en_Wheels:IntOrString? = nil
            var ar_Wheels:IntOrString? = nil
            var en_SellerType:IntOrString? = nil
            var ar_SellerType:IntOrString? = nil
            var en_FinalDriveSystem:IntOrString? = nil
            var ar_FinalDriveSystem:IntOrString? = nil
            var en_SteeringSide:IntOrString? = nil
            var ar_SteeringSide:IntOrString? = nil
            var en_PartName:IntOrString? = nil
            var ar_PartName:IntOrString? = nil
            var nameOfPart:IntOrString? = nil
            var userImage:IntOrString? = nil
            var phoneNumber:IntOrString? = nil
            var isFavorite:Bool? = nil


    enum CodingKeys: String, CodingKey {
        case id = "id"
        case chates = "chates"
        case views = "views"
        case title = "title"
        case description = "description"
        case en_Location = "en_Location"
        case ar_Location = "ar_Location"
        case lat = "lat"
        case lng = "lng"
        case status = "status"
        case postDate = "postDate"
        case categoryId = "categoryId"
        case categoryEnName = "categoryEnName"
        case categoryArName = "categoryArName"
        case subCategoryId = "subCategoryId"
        case subCategoryEn_Name = "subCategoryEn_Name"
        case subCategoryAr_Name = "subCategoryAr_Name"
        case otherSubCategory = "otherSubCategory"
        case subTypeId = "subTypeId"
        case subTypeEn_Name = "subTypeEn_Name"
        case subTypeAr_Name = "subTypeAr_Name"
        case otherSubType = "otherSubType"
        case typeId = "typeId"
        case userId = "userId"
        case agentId = "agentId"
        case pictures = "pictures"
        ///
        case en_Maker = "en_Maker"
                case ar_Maker = "ar_Maker"
                case en_Model = "en_Model"
                case ar_Model = "ar_Model"
                case en_Trim = "en_Trim"
                case ar_Trim = "ar_Trim"
                case en_Color = "en_Color"
                case ar_Color = "ar_Color"
                case kilometers = "kilometers"
                case year = "year"
                case en_Doors = "en_Doors"
                case ar_Doors = "ar_Doors"
                case warranty = "warranty"
                case en_Transmission = "en_Transmission"
                case ar_Transmission = "ar_Transmission"
                case en_RegionalSpecs = "en_RegionalSpecs"
                case ar_RegionalSpecs = "ar_RegionalSpecs"
                case en_BodyType = "en_BodyType"
                case ar_BodyType = "ar_BodyType"
                case en_FuelType = "en_FuelType"
                case ar_FuelType = "ar_FuelType"
                case en_NoOfCylinders = "en_NoOfCylinders"
                case ar_NoOfCylinders = "ar_NoOfCylinders"
                case en_Horsepower = "en_Horsepower"
                case ar_Horsepower = "ar_Horsepower"
                case en_Condition = "en_Condition"
                case ar_Condition = "ar_Condition"
                case en_MechanicalCondition = "en_MechanicalCondition"
                case ar_MechanicalCondition = "ar_MechanicalCondition"
                case price = "price"
                case en_Capacity = "en_Capacity"
                case ar_Capacity = "ar_Capacity"
                case en_EngineSize = "en_EngineSize"
                case ar_EngineSize = "ar_EngineSize"
                case en_Age = "en_Age"
                case ar_Age = "ar_Age"
                case en_Usage = "en_Usage"
                case ar_Usage = "ar_Usage"
                case en_Length = "en_Length"
                case ar_Length = "ar_Length"
                case en_Wheels = "en_Wheels"
                case ar_Wheels = "ar_Wheels"
                case en_SellerType = "en_SellerType"
                case ar_SellerType = "ar_SellerType"
                case en_FinalDriveSystem = "en_FinalDriveSystem"
                case ar_FinalDriveSystem = "ar_FinalDriveSystem"
                case en_SteeringSide = "en_SteeringSide"
                case ar_SteeringSide = "ar_SteeringSide"
                case en_PartName = "en_PartName"
                case ar_PartName = "ar_PartName"
                case nameOfPart = "nameOfPart"
                case userImage = "userImage"
                case phoneNumber = "phoneNumber"
                case isFavorite = "isFavorite"
    }

     
}

