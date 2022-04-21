//
//  ApiRequests+Motors.swift
//  inSooqApp
//
//  Created by Deya on 19/04/2022.
//

import Foundation
import Alamofire

extension ApiRequests {
    
    static func motorRegionalSpecs(completion:@escaping (ListableCompletionHandler) -> Void) {
        NetworkService().simpleRequest(url: APIUrls.motorRegionalSpecs(), method: .get) { (response: ListableCompletionHandler) in completion(response) }
    }
    
//    static func locations(completion:@escaping (ListableCompletionHandler) -> Void) {
//        NetworkService().simpleRequest(url: APIUrls.locations(), method: .get) { (response: ListableCompletionHandler) in completion(response) }
//    }
    
    static func colors(completion:@escaping (ListableCompletionHandler) -> Void) {
        NetworkService().simpleRequest(url: APIUrls.colors(), method: .get) { (response: ListableCompletionHandler) in completion(response) }
    }
    
    static func doors(completion:@escaping (ListableCompletionHandler) -> Void) {
        NetworkService().simpleRequest(url: APIUrls.GetAllDoor(), method: .get) { (response: ListableCompletionHandler) in completion(response) }
    }
    
    static func transmissions(completion:@escaping (ListableCompletionHandler) -> Void) {
        NetworkService().simpleRequest(url: APIUrls.transmission(), method: .get) { (response: ListableCompletionHandler) in completion(response) }
    }
    
    static func bodyType(completion:@escaping (ListableCompletionHandler) -> Void) {
        NetworkService().simpleRequest(url: APIUrls.bodyType(), method: .get) { (response: ListableCompletionHandler) in completion(response) }
    }
    
    static func fuelType(completion:@escaping (ListableCompletionHandler) -> Void) {
        NetworkService().simpleRequest(url: APIUrls.fuelType(), method: .get) { (response: ListableCompletionHandler) in completion(response) }
    }
    
    static func noOfCylinders(completion:@escaping (ListableCompletionHandler) -> Void) {
        NetworkService().simpleRequest(url: APIUrls.GetAllNoOfCylinders(), method: .get) { (response: ListableCompletionHandler) in completion(response) }
    }
    
    static func steeringSide(completion:@escaping (ListableCompletionHandler) -> Void) {
        NetworkService().simpleRequest(url: APIUrls.steeringSide(), method: .get) { (response: ListableCompletionHandler) in completion(response) }
    }
    
    static func horsePower(categoryId: Int, completion:@escaping (ListableCompletionHandler) -> Void) {
        NetworkService().simpleRequest(url: APIUrls.horsePower(categoryId: categoryId), method: .get) { (response: ListableCompletionHandler) in completion(response) }
    }
    
    
    
    static func subcategories(categoryId: Int, completion:@escaping (ListableCompletionHandler) -> Void) {
        NetworkService().simpleRequest(url: APIUrls.subcategories(categoryId: categoryId), method: .get) { (response: ListableCompletionHandler) in completion(response) }
    }
    
    static func subtypes(subCategoryId: Int, completion:@escaping (ListableCompletionHandler) -> Void) {
        NetworkService().simpleRequest(url: APIUrls.subtypes(subCategoryId: subCategoryId), method: .get) { (response: ListableCompletionHandler) in completion(response) }
    }
    
    
    
    static func ageByCatID(categoryId: Int, completion:@escaping (ListableCompletionHandler) -> Void) {
        NetworkService().simpleRequest(url: APIUrls.age(categoryId: categoryId), method: .get) { (response: ListableCompletionHandler) in completion(response) }
    }
    
    static func usage(categoryId: Int, completion:@escaping (ListableCompletionHandler) -> Void) {
        NetworkService().simpleRequest(url: APIUrls.usage(categoryId: categoryId), method: .get) { (response: ListableCompletionHandler) in completion(response) }
    }
    
    static func conditions(categoryId: Int, completion:@escaping (ListableCompletionHandler) -> Void) {
        NetworkService().simpleRequest(url: APIUrls.conditions(categoryId: categoryId), method: .get) { (response: ListableCompletionHandler) in completion(response) }
    }
    
    static func lengths(categoryId: Int, completion:@escaping (ListableCompletionHandler) -> Void) {
        NetworkService().simpleRequest(url: APIUrls.lengths(), method: .get) { (response: ListableCompletionHandler) in completion(response) }
    }
    
    static func capacities(completion:@escaping (ListableCompletionHandler) -> Void) {
        NetworkService().simpleRequest(url: APIUrls.capacities(), method: .get) { (response: ListableCompletionHandler) in completion(response) }
    }
    
    static func sellerTypes(completion:@escaping (ListableCompletionHandler) -> Void) {
        NetworkService().simpleRequest(url: APIUrls.sellerTypes(), method: .get) { (response: ListableCompletionHandler) in completion(response) }
    }
    
    static func parts(subTypeId: Int, completion:@escaping (ListableCompletionHandler) -> Void) {
        NetworkService().simpleRequest(url: APIUrls.parts(subTypeId: subTypeId), method: .get) { (response: ListableCompletionHandler) in completion(response) }
    }
    
    static func engineSize(completion:@escaping (ListableCompletionHandler) -> Void) {
        NetworkService().simpleRequest(url: APIUrls.engineSize(), method: .get) { (response: ListableCompletionHandler) in completion(response) }
    }
    
    static func wheels(completion:@escaping (ListableCompletionHandler) -> Void) {
        NetworkService().simpleRequest(url: APIUrls.wheels(), method: .get) { (response: ListableCompletionHandler) in completion(response) }
    }
    
    static func driveSystem(completion:@escaping (ListableCompletionHandler) -> Void) {
        NetworkService().simpleRequest(url: APIUrls.driveSystem(), method: .get) { (response: ListableCompletionHandler) in completion(response) }
    }
    
    static func jobTypes(completion:@escaping (ListableCompletionHandler) -> Void) {
        NetworkService().simpleRequest(url: APIUrls.jobTypes(), method: .get) { (response: ListableCompletionHandler) in completion(response) }
    }
    
    static func monthlySalary(completion:@escaping (ListableCompletionHandler) -> Void) {
        NetworkService().simpleRequest(url: APIUrls.monthlySalary(), method: .get) { (response: ListableCompletionHandler) in completion(response) }
    }
    
//    static func careerLevels(completion:@escaping (ListableCompletionHandler) -> Void) {
//        NetworkService().simpleRequest(url: APIUrls.careerLevels(), method: .get) { (response: ListableCompletionHandler) in completion(response) }
//    }
    
    static func visaStatuses(completion:@escaping (ListableCompletionHandler) -> Void) {
        NetworkService().simpleRequest(url: APIUrls.visaStatuses(), method: .get) { (response: ListableCompletionHandler) in completion(response) }
    }
    
    static func noticePeriods(completion:@escaping (ListableCompletionHandler) -> Void) {
        NetworkService().simpleRequest(url: APIUrls.noticePeriods(), method: .get) { (response: ListableCompletionHandler) in completion(response) }
    }
    
    static func workExperiences(completion:@escaping (ListableCompletionHandler) -> Void) {
        NetworkService().simpleRequest(url: APIUrls.workExperiences(), method: .get) { (response: ListableCompletionHandler) in completion(response) }
    }
    
    static func commitments(completion:@escaping (ListableCompletionHandler) -> Void) {
        NetworkService().simpleRequest(url: APIUrls.commitments(), method: .get) { (response: ListableCompletionHandler) in completion(response) }
    }
    
    
    
    static func emirates(completion:@escaping (ListableCompletionHandler) -> Void) {
        NetworkService().simpleRequest(url: APIUrls.emirates(), method: .get) { (response: ListableCompletionHandler) in completion(response) }
    }
    
    static func plateCodes(completion:@escaping (ListableCompletionHandler) -> Void) {
        NetworkService().simpleRequest(url: APIUrls.plateCodes(), method: .get) { (response: ListableCompletionHandler) in completion(response) }
    }
    
    static func plateTypes(emirate: String, completion:@escaping (ListableCompletionHandler) -> Void) {
        NetworkService().simpleRequest(url: APIUrls.plateTypes(emirate: emirate), method: .get) { (response: ListableCompletionHandler) in completion(response) }
    }
    
    
    
    
    static func numberCodes(operatorName: String, completion:@escaping (ListableCompletionHandler) -> Void) {
        NetworkService().simpleRequest(url: APIUrls.numberCodes(operatorName: operatorName), method: .get) { (response: ListableCompletionHandler) in completion(response) }
    }
    
    static func numberPlans(emirate: String, completion:@escaping (ListableCompletionHandler) -> Void) {
        NetworkService().simpleRequest(url: APIUrls.numberPlans(), method: .get) { (response: ListableCompletionHandler) in completion(response) }
    }
    
    static func operators(emirate: String, completion:@escaping (ListableCompletionHandler) -> Void) {
        NetworkService().simpleRequest(url: APIUrls.operators(), method: .get) { (response: ListableCompletionHandler) in completion(response) }
    }
    
    static func mobileVersions(emirate: String, completion:@escaping (ListableCompletionHandler) -> Void) {
        NetworkService().simpleRequest(url: APIUrls.mobileVersions(), method: .get) { (response: ListableCompletionHandler) in completion(response) }
    }

    static func ram(emirate: String, completion:@escaping (ListableCompletionHandler) -> Void) {
        NetworkService().simpleRequest(url: APIUrls.ram(), method: .get) { (response: ListableCompletionHandler) in completion(response) }
    }
    
    static func storage(emirate: String, completion:@escaping (ListableCompletionHandler) -> Void) {
        NetworkService().simpleRequest(url: APIUrls.storage(), method: .get) { (response: ListableCompletionHandler) in completion(response) }
    }
    
    static func age(typeId: Int, completion:@escaping (ListableCompletionHandler) -> Void) {
        NetworkService().simpleRequest(url: APIUrls.age(typeId: typeId), method: .get) { (response: ListableCompletionHandler) in completion(response) }
    }
    
    static func usage(typeId: Int, completion:@escaping (ListableCompletionHandler) -> Void) {
        NetworkService().simpleRequest(url: APIUrls.usage(typeId: typeId), method: .get) { (response: ListableCompletionHandler) in completion(response) }
    }
    
}

//return "DropDowns/GetAllMotorRegionalSpecs".fullUrl()
//return "DropDowns/GetAllLocation".fullUrl()
//return "DropDowns/GetAllColor".fullUrl()
//return "DropDowns/GetAllDoor".fullUrl()
//return "DropDowns/GetAllTransmission".fullUrl()
//return "DropDowns/GetAllBodyType".fullUrl()
//return "DropDowns/GetAllFuelType".fullUrl()
//return "DropDowns/GetAllNoOfCylinders".fullUrl()
//return "DropDowns/GetAllSteeringSide".fullUrl()
//return "DropDowns/GetAllHorsepower?categoryId=\(categoryId)".fullUrl()

//return "SubCategory/GetByCategoryId?categoryId=\(categoryId)".fullUrl()
//return "SubType/GetBySubCategoryId?subCategoryId=\(subCategoryId)".fullUrl()

//return "DropDowns/GetAllAge?categoryId=\(categoryId)".fullUrl()
//return "DropDowns/GetAllUsage?categoryId=\(categoryId)".fullUrl()
//return "DropDowns/GetAllCondition?categoryId=\(categoryId)".fullUrl()
//return "DropDowns/GetAllLength".fullUrl()
//return "DropDowns/GetAllCapacity".fullUrl()
//return "DropDowns/GetAllSellerType".fullUrl()
//return "".fullUrl()
//return "DropDowns/GetAllParts?subTypeId=\(subTypeId)".fullUrl()

//return "DropDowns/GetAllJobType".fullUrl()
//return "DropDowns/GetAllMonthlySalary".fullUrl()
//return "DropDowns/GetAllCareerLevel".fullUrl()
//return "DropDowns/GetAllVisaStatus".fullUrl()
//return "DropDowns/GetAllNoticePeriod".fullUrl()
//return "DropDowns/GetAllWorkExperience".fullUrl()
//return "DropDowns/GetAllCommitment".fullUrl()

//return "DropDowns/GetAllEmirate".fullUrl()
//return "DropDowns/GetAllPlateCode".fullUrl()
//return "DropDowns/GetAllPlateTypeByEmirate?emirate=\(emirate)".fullUrl()

//return "DropDowns/GetAllMobileNumberCodeByOperator?operatorName=\(operatorName)".fullUrl()
//return "DropDowns/GetAllNumberPlans".fullUrl()
//return "DropDowns/GetAllOperator".fullUrl()
//return "DropDowns/GetAllMobileVersion".fullUrl()
//return "DropDowns/GetAllMobileRAM".fullUrl()
//return "DropDowns/GetAllMobileStarage".fullUrl()
//return "DropDowns/GetAllAgeByTypeId?typeId=\(typeId)".fullUrl()
//return "DropDowns/GetAllUsageByTypeId?typeId=\(typeId)".fullUrl()
