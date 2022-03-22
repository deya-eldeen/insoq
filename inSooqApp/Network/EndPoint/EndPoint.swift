//
//  EndPoint.swift
//  inSooqApp
//
//  Created by Abdullah AL-Soubani on 30/12/2021.
//

import Foundation
import SwiftUI

enum EndPoint {
    
    case Register
    case Login
    case CategoriesGetByTypeId(id: String)
    case CategoriesAdsGetByTypeId(id: String)
    case GetMotorMaker
    case GetAllMotorModelByMaker(maker: String)
    case GetMotorTrim
    case boatCat(id: String)
    case GetBySubCategoryId(id: String)
    case AddInitialMotor
    //All_Spaces
    case GetAllColor
    case GetAllBodyType
    case GetAllDoor
    case GetAllFuelType
    case GetAllMotorRegionalSpecs
    case GetAllTransmission
    case GetAllNoOfCylinders
    case GetSteeringSide
    case GetHorsepower
    case GetYourLocation
    case GetAllCareerLevel
    case GetAllEmploymentType
    case FilterMotors
    case FilterJobs
    case MotorAdsAdd
    case FilterServices
    case FilterBusiness
    case FilterClassifieds
    case GetSubCatByCatID(id: String)
    case GetSubTypeBySubCat(id: String)
}

extension EndPoint {
    
    var path: String {
        let baseURL = "https://newapis.insouq.com/api/"
        switch self {
        case .CategoriesAdsGetByTypeId(let id):  return "\(baseURL)Ads/GetLatestAds?typeId=\(id)"
        case .Register: return "\(baseURL)Users/Add"
        case .Login: return "\(baseURL)Accounts/login"
        case .CategoriesGetByTypeId(let id): return "\(baseURL)Categories/GetByTypeId?id=\(id)"
        case .GetMotorMaker: return "\(baseURL)DropDowns/GetAllMotorMaker"
        case .GetAllMotorModelByMaker(let maker): return "\(baseURL)DropDowns/GetAllMotorModelByMaker?maker=\(maker)-"
        case .GetMotorTrim: return "\(baseURL)DropDowns/GetAllMotorTrim"
        case .boatCat(id: let id): return "\(baseURL)SubCategory/GetByCategoryId?categoryId=\(id)"
        case .GetBySubCategoryId(id: let id): return "\(baseURL)SubType/GetBySubCategoryId?subCategoryId=\(id)"
        case .AddInitialMotor: return "\(baseURL)MotorAds/AddInitialMotor"
            //All_Spaces
        case .GetAllColor: return "\(baseURL)DropDowns/GetAllColor"
        case .GetAllBodyType: return "\(baseURL)DropDowns/GetAllBodyType"
        case .GetAllDoor: return "\(baseURL)DropDowns/GetAllDoor"
        case .GetAllFuelType: return "\(baseURL)DropDowns/GetAllFuelType"
        case .GetAllMotorRegionalSpecs: return "\(baseURL)DropDowns/GetAllMotorRegionalSpecs"
        case .GetAllTransmission: return "\(baseURL)DropDowns/GetAllTransmission"
        case .GetAllNoOfCylinders: return "\(baseURL)DropDowns/GetAllNoOfCylinders"
        case .GetSteeringSide: return "\(baseURL)DropDowns/GetAllSteeringSide"
        case .GetHorsepower: return "\(baseURL)DropDowns/GetAllHorsepower?categoryId=6"
        case .GetYourLocation: return "\(baseURL)DropDowns/GetAllLocation"

        case .MotorAdsAdd: return "\(baseURL)MotorAds/Add"
        case .FilterMotors: return "\(baseURL)MotorAds/FilterMotors"
        case .GetAllCareerLevel: return "\(baseURL)DropDowns/GetAllCareerLevel"
        case .GetAllEmploymentType: return "\(baseURL)DropDowns/GetAllEmploymentType"
            
        case .FilterJobs: return "\(baseURL)JobAds/FilterJobs"
        case .FilterServices: return "\(baseURL)ServiceAds/FilterServices"
        case .FilterBusiness: return "\(baseURL)BussinesAds/FilterBusiness"
        case .GetSubCatByCatID(let id): return "\(baseURL)SubCategory/GetByCategoryId?categoryId=\(id)"
        case .GetSubTypeBySubCat (let id): return "\(baseURL)SubType/GetBySubCategoryId?subCategoryId=\(id)"
        case .FilterClassifieds: return "\(baseURL)ClassifiedAds/FilterClassifieds"
        }
    }
}
