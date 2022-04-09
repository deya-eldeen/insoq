//  Created by deyaeldeen

import Foundation
import Alamofire

class APIConfig {

    static let baseImageURL = "https://newapis.insouq.com"
    static let baseURL = "https://newapis.insouq.com/api/"

    static let encoding = JSONEncoding.default
    static let stringencoding = JSONEncoding.default
    static let encoding2 = URLEncoding.queryString
    
}

struct APIUrls {

    static func register() -> String {
        return "User/Add".fullUrl()
    }
    
    static func login() -> String {
        return "Accounts/login".fullUrl()
    }

    static func categoriesAdsGetByTypeId(id: Int) -> String {
        return "Ads/GetLatestAds?typeId=\(id)".fullUrl()
    }
    
    static func categoriesGetByTypeId(id: Int) -> String {
        return "Categories/GetByTypeId?id=\(id)".fullUrl()
    }
    
    static func GetMotorMaker(id: Int) -> String {
        return "DropDowns/GetAllMotorMaker".fullUrl()
    }
    
    static func GetAllMotorModelByMaker(maker: String) -> String {
        return "DropDowns/GetAllMotorModelByMaker?maker=\(maker)-".fullUrl()
    }
    
    static func GetMotorTrim(id: Int) -> String {
        return "DropDowns/GetAllMotorTrim".fullUrl()
    }
    
    static func boatCat(id: Int) -> String {
        return "SubCategory/GetByCategoryId?categoryId=\(id)".fullUrl()
    }
    
    static func GetBySubCategoryId(id: Int) -> String {
        return "SubType/GetBySubCategoryId?subCategoryId=\(id)".fullUrl()
    }
    
    static func AddInitialMotor() -> String {
        return "MotorAds/AddInitialMotor".fullUrl()
    }
    
    static func GetAllColor() -> String {
        return "DropDowns/GetAllColor".fullUrl()
    }
    
    static func GetAllBodyType() -> String {
        return "DropDowns/GetAllBodyType".fullUrl()
    }
    
    static func GetAllDoor() -> String {
        return "DropDowns/GetAllDoor".fullUrl()
    }
    
    static func GetAllFuelType() -> String {
        return "DropDowns/GetAllFuelType".fullUrl()
    }
    
    static func GetAllMotorRegionalSpecs() -> String {
        return "DropDowns/GetAllMotorRegionalSpecs".fullUrl()
    }
    
    static func GetAllTransmission() -> String {
        return "DropDowns/GetAllTransmission".fullUrl()
    }
    
    static func GetAllNoOfCylinders() -> String {
        return "DropDowns/GetAllNoOfCylinders".fullUrl()
    }
    
    static func GetSteeringSide() -> String {
        return "DropDowns/GetAllSteeringSide".fullUrl()
    }
    
    static func GetHorsepower() -> String {
        return "DropDowns/GetAllHorsepower?categoryId=6".fullUrl()
    }
    
    static func GetYourLocation() -> String {
        return "DropDowns/GetAllLocation".fullUrl()
    }

    static func MotorAdsAdd() -> String {
        return "MotorAds/Add".fullUrl()
    }

    static func FilterMotors() -> String {
        return "MotorAds/FilterMotors".fullUrl()
    }

    static func GetAllCareerLevel() -> String {
        return "DropDowns/GetAllCareerLevel".fullUrl()
    }

    static func GetAllEmploymentType() -> String {
        return "DropDowns/GetAllEmploymentType".fullUrl()
    }
    
    static func FilterJobs() -> String {
        return "JobAds/FilterJobs".fullUrl()
    }
    
    static func FilterServices() -> String {
        return "ServiceAds/FilterServices".fullUrl()
    }
    
    static func FilterBusiness() -> String {
        return "BussinesAds/FilterBusiness".fullUrl()
    }
    
    static func GetSubCatByCatID(id: Int) -> String {
        return "SubCategory/GetByCategoryId?categoryId=\(id)".fullUrl()
    }
    
    static func GetSubTypeBySubCat(id: Int) -> String {
        return "SubType/GetBySubCategoryId?subCategoryId=\(id)".fullUrl()
    }
    
    static func FilterClassifieds() -> String {
        return "ClassifiedAds/FilterClassifieds".fullUrl()
    }
    
    
    // New Implementation
    
    static func profileDetails(id: Int) -> String {
        return "User/GetById?id=\(id)".fullUrl()
    }
    
    static func editProfile() -> String {
        return "User/UpdateProfile".fullUrl()
    }
    
    static func nationalities() -> String {
        return "DropDowns/GetAllNationality".fullUrl()
    }
    
    static func locations() -> String {
        return "DropDowns/GetAllLocation".fullUrl()
    }
    
    static func educationLevels() -> String {
        return "DropDowns/GetAllEducationLevel".fullUrl()
    }
    
    static func careerLevels() -> String {
        return "DropDowns/GetAllCareerLevel".fullUrl()
    }
    
    static func notifications() -> String {
        return "Notifications/GetNotifications".fullUrl()
    }
    
    static func deleteNotification() -> String {
        return "Notifications/DeleteNotification".fullUrl()
    }
    
    // advertising
    static func advertisingBudgets() -> String {
        return "StaticData/GetAdvertisingBudget".fullUrl()
    }
    
    static func submitAdvertisment() -> String {
        return "StaticData/TransAdvertising".fullUrl()
    }
    
    // Motors
    static func motorMakers() -> String {
        return "DropDowns/GetAllMotorMaker".fullUrl()
    }
    
    static func motorModels(makerId: Int) -> String {
        return "DropDowns/GetAllMotorModelByMakerId?makerId=\(makerId)".fullUrl()
    }
    
    static func motorTrims(modelNameAr: String, modelNameEn: String) -> String {
        return "DropDowns/GetAllMotorTrimByModel?model=\(modelNameAr)-\(modelNameEn)".fullUrl()
    }

    
}

extension String {
    
    func fullUrl() -> String {
        let url = "\(APIConfig.baseURL)\(self)"
        return url
    }
    
    func fullImageUrl() -> String {
        return APIConfig.baseImageURL + ( self.replace(string: "\\", replacement: "/").replace(string: APIConfig.baseImageURL, replacement: "") )
    }
    
}
