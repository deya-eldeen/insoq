//
//  WebService.swift
//  inSooqApp
//
//  Created by Abdullah AL-Soubani on 30/12/2021.
//

import Foundation
import Foundation
import Alamofire
import SwiftUI

class WebService {
    
    static let shared = WebService()
    let networkManager = NetworkManager()
    
    // MARK: - register
    func register(
        firstName: String,
        lastName: String,
        mobileNumber: String,
        email: String,
        password: String,
        completion: @escaping(RegisterModel?,AppError?)->()
    )  {
        let parameters = ["firstName": firstName,
                          "lastName":lastName,
                          "mobileNumber": mobileNumber,
                          "email": email,
                          "password": password]
        networkManager.GenericRequest(urlString: EndPoint.Register.path, method: .post, params: parameters) { (response: RegisterModel?, error) in
            if error == nil {
                completion(response,nil)
                return
            }
            completion(nil,error)
        }
    }
    
    // MARK: - Login
    
    func Login(
        emailOrPhone: String,
        password: String,
        completion: @escaping(LoginModel?,AppError?)->()
    )  {
        let parameters = ["emailOrPhone": emailOrPhone,
                          "password": password]
        networkManager.GenericRequest(urlString: EndPoint.Login.path, method: .post, params: parameters) { (response: LoginModel?, error) in
            if error == nil {
                completion(response,nil)
                return
            }
            completion(nil,error)
        }
    }
    
    // MARK: - CategoriesGetByTypeId
    
    func CategoriesGetByTypeId(
        id: String,
        completion: @escaping([Category]?,AppError?)->()
    )  {
        networkManager.GenericRequestGet(urlString: EndPoint.CategoriesGetByTypeId(id: id).path, method: .get, params: nil) { (response: [Category]?, error) in
            if error == nil {
                completion(response,nil)
                return
            }
            completion(nil,error)
        }
        
    }
    func CategoriesADSGetByTypeId(
        id: String,
        completion: @escaping([AdsOfCategoryModel]?,AppError?)->()
    )  {
        networkManager.GenericRequestGet(urlString: EndPoint.CategoriesAdsGetByTypeId(id: id).path, method: .get, params: nil) { (response: [AdsOfCategoryModel]?, error) in
            if error == nil {
                
                completion(response,nil)
                return
            }
            debugPrint("error:\(error)")

            completion(nil,error)
        }
        
    }
    
    
    
    func getSubTypes(
        endPoint: String,
        completion: @escaping([SubTypesModel]?,AppError?)->()
    )  {
        networkManager.GenericRequestGet(urlString: endPoint, method: .get, params: nil) { (response: [SubTypesModel]?, error) in
            if error == nil {
                
                completion(response,nil)
                return
            }
            debugPrint("error:\(error)")

            completion(nil,error)
        }
        
    }
    func getSubCategories(
        endPoint: String,
        completion: @escaping([SubCategoriesModel]?,AppError?)->()
    )  {
        networkManager.GenericRequestGet(urlString: endPoint, method: .get, params: nil) { (response: [SubCategoriesModel]?, error) in
            if error == nil {
                
                completion(response,nil)
                return
            }
            debugPrint("error:\(error)")

            completion(nil,error)
        }
        
    }
    
    func getSubCategoriesByCatID(
        catID: String,
        completion: @escaping([SubCategoriesModel]?,AppError?)->()
    )  {
        networkManager.GenericRequestGet(urlString: EndPoint.GetSubCatByCatID(id: catID).path, method: .get, params: nil) { (response: [SubCategoriesModel]?, error) in
            if error == nil {
                
                completion(response,nil)
                return
            }
            debugPrint("error:\(error)")

            completion(nil,error)
        }
        
    }
    
    func GetAllCareerLevel(
        endPoint: String,
        completion: @escaping([CategoriesModelsNew]?,AppError?)->()
    )  {
        networkManager.GenericRequestGet(urlString: endPoint, method: .get, params: nil) { (response: [CategoriesModelsNew]?, error) in
            if error == nil {
                
                completion(response,nil)
                return
            }
            debugPrint("error:\(error)")

            completion(nil,error)
        }
        
    }
//    GET MOTOR FILTER
    func getMotorFilter(
        maker: String,
        model: String,
        categoryId: String,
        completion: @escaping([AdsOfCategoryModel]?,AppError?)->()
    )  {
        let parameters = ["fromPrice": "0",
                          "toPrice": "1000000",
                          "fromYear": "1900",
                          "toYear": "2030",
                          "fromKilometers": "",
                          "toKilometers": "",
                          "maker": maker,
                          "model": model,
                          "trim": "",
                          "location": "",
                          "categoryId": categoryId,
                          "sortBy": "1"
        ]
 
        networkManager.GenericRequestGet(urlString: EndPoint.FilterMotors.path, method: .post, params: parameters) { (response: [AdsOfCategoryModel]?, error) in
            if error == nil {
                
                completion(response,nil)
                return
            }
            debugPrint("error:\(error)")

            completion(nil,error)
        }
        
    }
    
    func getJobs(
        categoryId: String,
        careerLevel: String,
        employmentType: String,
        completion: @escaping([JobsModel]?,AppError?)->()
    )  {
        let parameters = ["jobType": "",
                          "careerLevel": careerLevel,
                          "location": "",
                          "categoryId": categoryId,
                          "workExperience": "",
                          "educationLevel": "",
                          "commitment": employmentType,
                          "postedIn": "",
                          "sortBy": "1"
        ]
 
        networkManager.GenericRequestGet(urlString: EndPoint.FilterJobs.path, method: .post, params: parameters) { (response: [JobsModel]?, error) in
            if error == nil {
                
                completion(response,nil)
                return
            }
            debugPrint("error:\(error)")

            completion(nil,error)
        }
        
    }
    
    
    func getServices(
        categoryId: Int,
        subCategoryID: Int,
        postedIN: Int,
        location: String,
        completion: @escaping([ServicesModel]?,AppError?)->()
    )  {
        let parameters = [
                          "subCategoryId": "\(subCategoryID)",
                          "location": location,
                          "categoryId": "\(categoryId)",
                          "postedIn": "\(postedIN)",
                          "sortBy": "1"
        ]
 
        networkManager.GenericRequestGet(urlString: EndPoint.FilterServices.path, method: .post, params: parameters) { (response: [ServicesModel]?, error) in
            if error == nil {
                
                completion(response,nil)
                return
            }
            debugPrint("error:\(error)")

            completion(nil,error)
        }
        
    }
    
    
    func getClassified(
        categoryId: Int,
        subCategoryID: Int,
        postedIN: Int,
        age: String,
        usage: String,
        brand: String,
        keyword: String,
        subTypeId: String,
        sortBy: Int,
        location: String,
        fromPrice: Int,
        toPrice: Int,
        completion: @escaping([ClassifiedModel]?,AppError?)->()
    )  {
        let parameters = [
                          "subCategoryId": "\(subCategoryID)",
                          "location": location,
                          "categoryId": "\(categoryId)",
                          "postedIn": "\(postedIN)",
                          "fromPrice": "\(fromPrice)",
                          "toPrice": "\(toPrice)",
                          "age": "\(age)",
                          "usage": "\(usage)",
                          "brand": "\(brand)",
                          "keyword": "\(keyword)",
                          "subTypeId": "\(subTypeId)",
                          "sortBy": "1"
        ]
 
        networkManager.GenericRequestGet(urlString: EndPoint.FilterClassifieds.path, method: .post, params: parameters) { (response: [ClassifiedModel]?, error) in
            if error == nil {
                
                completion(response,nil)
                return
            }
            debugPrint("error:\(error)")

            completion(nil,error)
        }
        
    }
    
    func getBusinesses(
        categoryId: Int,
        subCategoryID: Int,
        postedIN: Int,
        location: String,
        fromPrice: Int,
        toPrice: Int,
        completion: @escaping([BusinessModel]?,AppError?)->()
    )  {
        let parameters = [
                          "subCategoryId": "\(subCategoryID)",
                          "location": location,
                          "categoryId": "\(categoryId)",
                          "postedIn": "\(postedIN)",
                          "fromPrice": "\(fromPrice)",
                          "toPrice": "\(toPrice)",
                          "sortBy": "1"
        ]
 
        networkManager.GenericRequestGet(urlString: EndPoint.FilterBusiness.path, method: .post, params: parameters) { (response: [BusinessModel]?, error) in
            if error == nil {
                
                completion(response,nil)
                return
            }
            debugPrint("error:\(error)")

            completion(nil,error)
        }
        
    }
    
    
    // MARK: - GetAllMotorMakerModel
    
    func GetAllMotorMakerModel(
        completion: @escaping([GetAllMotorMakerModel]?,AppError?)->()
    )  {
        networkManager.GenericRequestGet(urlString: EndPoint.GetMotorMaker.path, method: .get, params: nil) { (response: [GetAllMotorMakerModel]?, error) in
            if error == nil {
                completion(response,nil)
                return
            }
            completion(nil,error)
        }
    }
    
    // MARK: - GetAllMotorModelByMaker
    
    func GetAllMotorModelByMaker(
        maker: String,
        completion: @escaping([GetAllMotorMakerModel]?,AppError?)->()
    )  {
        networkManager.GenericRequestGet(urlString: EndPoint.GetAllMotorModelByMaker(maker: maker).path, method: .get, params: nil) { (response: [GetAllMotorMakerModel]?, error) in
            if error == nil {
                completion(response,nil)
                return
            }
            completion(nil,error)
        }
    }
    
    // MARK: - GetMotorTrim
    
    func GetMotorTrim(
        completion: @escaping([GetAllMotorMakerModel]?,AppError?)->()
    )  {
        networkManager.GenericRequestGet(urlString: EndPoint.GetMotorTrim.path, method: .get, params: nil) { (response: [GetAllMotorMakerModel]?, error) in
            if error == nil {
                completion(response,nil)
                return
            }
            completion(nil,error)
        }
    }
    
    // MARK: - getBoatCat

    func getBoatCat(
        id: String,
        completion: @escaping([GetAllMotorMakerModel]?,AppError?)->()
    )  {
        networkManager.GenericRequestGet(urlString: EndPoint.boatCat(id: id).path, method: .get, params: nil) { (response: [GetAllMotorMakerModel]?, error) in
            if error == nil {
                completion(response,nil)
                return
            }
            completion(nil,error)
        }
    }
    
    // MARK: - getBoatSubCat

    func getBoatSubCat(
        id: String,
        completion: @escaping([GetAllMotorMakerModel]?,AppError?)->()
    )  {
        networkManager.GenericRequestGet(urlString: EndPoint.GetBySubCategoryId(id: id).path, method: .get, params: nil) { (response: [GetAllMotorMakerModel]?, error) in
            if error == nil {
                completion(response,nil)
                return
            }
            completion(nil,error)
        }
    }
    
    // MARK: - AddInitialMotor

    func AddInitialMotor(
        param: [String: Any],
        completion: @escaping(AddInitialMotorModel?,AppError?)->()
    )  {
        networkManager.GenericRequest(urlString: EndPoint.AddInitialMotor.path, method: .post, params: param) { (response: AddInitialMotorModel?, error) in
            if error == nil {
                completion(response,nil)
                return
            }
            completion(nil,error)
        }
    }
    
    func getAllSpacesDropDowns(serviceName: EndPoint, completion: @escaping([GetAllMotorMakerModel]?,AppError?)->() )  {
        networkManager.GenericRequestGet(urlString: serviceName.path, method: .get, params: nil) { (response: [GetAllMotorMakerModel]?, error) in
            if error == nil {
                completion(response,nil)
                return
            }
            completion(nil,error)
        }
    }
}
