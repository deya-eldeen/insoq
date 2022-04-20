//  Created by deyaeldeen

import Foundation
import Alamofire

class APIConfig {

    static let baseImageURL = "http://apinew.insouq.com"
    static let baseURL = "http://apinew.insouq.com/api/"

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

    
    //regional_specs
    static func motorRegionalSpecs() -> String {
        return "DropDowns/GetAllMotorRegionalSpecs".fullUrl()
    }
        
    //location
    static func getAllLocations() -> String {
        return "DropDowns/GetAllLocation".fullUrl()
    }

    //color
    static func colors() -> String {
        return "DropDowns/GetAllColor".fullUrl()
    }
        
    //number_of_doors
    static func numberOfDoors() -> String {
        return "DropDowns/GetAllDoor".fullUrl()
    }
    
    //transmission
    static func transmission() -> String {
        return "DropDowns/GetAllTransmission".fullUrl()
    }
        
    //body_type
    static func bodyType() -> String {
        return "DropDowns/GetAllBodyType".fullUrl()
    }
        
    //fuel_type
    static func fuelType() -> String {
        return "DropDowns/GetAllFuelType".fullUrl()
    }
        
    //cylinders_type
    static func cylindersType() -> String {
        return "DropDowns/GetAllNoOfCylinders".fullUrl()
    }
        
    //steering_side
    static func steeringSide() -> String {
        return "DropDowns/GetAllSteeringSide".fullUrl()
    }
        
    //horse_power
    static func horsePower(categoryId: Int) -> String {
        return "DropDowns/GetAllHorsepower?categoryId=\(categoryId)".fullUrl()
    }
    
    //category
    static func subcategories(categoryId: Int) -> String {
        return "SubCategory/GetByCategoryId?categoryId=\(categoryId)".fullUrl()
    }
        
    //subcategory
    static func subtypes(subCategoryId: Int) -> String {
        return "SubType/GetBySubCategoryId?subCategoryId=\(subCategoryId)".fullUrl()
    }
    
    //age
    static func age(categoryId: Int) -> String {
        return "DropDowns/GetAllAge?categoryId=\(categoryId)".fullUrl()
    }
    
    //usage
    static func usage(categoryId: Int) -> String {
        return "DropDowns/GetAllUsage?categoryId=\(categoryId)".fullUrl()
    }
    
    //condition
    static func conditions(categoryId: Int) -> String {
        return "DropDowns/GetAllCondition?categoryId=\(categoryId)".fullUrl()
    }
    
    //length
    static func lengths() -> String {
        return "DropDowns/GetAllLength".fullUrl()
    }

    //capacity
    static func capacities() -> String {
        return "DropDowns/GetAllCapacity".fullUrl()
    }
        
    //seller type
    static func sellerTypes() -> String {
        return "DropDowns/GetAllSellerType".fullUrl()
    }
    
    //machinary
    static func machinery() -> String {
         //?????????
        return "".fullUrl()
    }
    
    //part_category
//    static func subcategories() {
//        //{{baseUrl}}/api/SubCategory/GetByCategoryId?categoryId=7
//    }
//    part_make
//        {{baseUrl}}/api/SubType/GetBySubCategoryId?subCategoryId=84
    
    //name_of_part
    static func parts(subTypeId: Int) -> String {
        return "DropDowns/GetAllParts?subTypeId=\(subTypeId)".fullUrl()
    }
        
    //job_type
    static func jobTypes() -> String {
        return "DropDowns/GetAllJobType".fullUrl()
    }
        
    //monthly_salary
    static func monthlySalary() -> String {
        return "DropDowns/GetAllMonthlySalary".fullUrl()
    }
    
    //professional_level
//    static func careerLevels() -> String {
//        return "DropDowns/GetAllCareerLevel".fullUrl()
//    }
        
    //visa
    static func visaStatuses() -> String {
        return "DropDowns/GetAllVisaStatus".fullUrl()
    }
        
    //notice
    static func noticePeriods() -> String {
        return "DropDowns/GetAllNoticePeriod".fullUrl()
    }
        
    //education
//    static func educationLevels() -> String {
//        //{{baseUrl}}/api/DropDowns/GetAllEducationLevel
//    }
        
    //work_experience
    static func workExperiences() -> String {
        return "DropDowns/GetAllWorkExperience".fullUrl()
    }
        
    //commitment
    static func commitments() -> String {
        return "DropDowns/GetAllCommitment".fullUrl()
    }
    
    //emirate
    static func emirates() -> String {
        return "DropDowns/GetAllEmirate".fullUrl()
    }

    //plateCodes
    static func plateCodes() -> String {
        return "DropDowns/GetAllPlateCode".fullUrl()
    }
    
    //plateTypes
    static func plateTypes(emirate: String) -> String {
        return "DropDowns/GetAllPlateTypeByEmirate?emirate=\(emirate)".fullUrl()
    }

    //mobileNumberCode
    static func numberCodes(operatorName: String) -> String {
        return "DropDowns/GetAllMobileNumberCodeByOperator?operatorName=\(operatorName)".fullUrl()
    }
    
    //numberPlans
    static func numberPlans() -> String {
        return "DropDowns/GetAllNumberPlans".fullUrl()
    }
    
    //operators
    static func operators() -> String {
        return "DropDowns/GetAllOperator".fullUrl()
    }
    
//    //brand
//        {{baseUrl}}/api/SubCategory/GetByCategoryId?categoryId=19
    
//    //model
//        {{baseUrl}}/api/SubType/GetBySubCategoryId?subCategoryId=15
    
    //version
    static func mobileVersions() -> String {
        return "DropDowns/GetAllMobileVersion".fullUrl()
    }
        
    //ram
    static func ram() -> String {
        return "DropDowns/GetAllMobileRAM".fullUrl()
    }
        
    //storage
    static func storage() -> String {
        return "DropDowns/GetAllMobileStarage".fullUrl()
    }
    
    //ageByTypeID
    static func age(typeId: Int) -> String {
        return "DropDowns/GetAllAgeByTypeId?typeId=\(typeId)".fullUrl()
    }
    
    //usage
    static func usage(typeId: Int) -> String {
        return "DropDowns/GetAllUsageByTypeId?typeId=\(typeId)".fullUrl()
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
