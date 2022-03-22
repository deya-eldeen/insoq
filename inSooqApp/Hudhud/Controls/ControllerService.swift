//
//  ControllerService.swift
//  inSooqApp
//
//  Created by Mohammad Jawher on 18/03/2022.
//

import Foundation
import Alamofire
import SwiftyJSON
import UIKit

class ControllerService {
    static var instance = ControllerService()
    
    func GetAllCareerLevelApi(complition: @escaping(_ value: [GetAllCareerLevelM],_ value:String,_ value:Bool)-> Void){
        var dataList : [GetAllCareerLevelM] = []
        AF.request(GetAllCareerLevelUrl, method: .get, parameters: nil, encoding: JSONEncoding.default, headers: nil).responseJSON { (response) in
            let statusCode = response.response?.statusCode
            if statusCode == 200 || statusCode == 422 {
                switch response.result {
                case .success(let value):
                    let dic = value as! [[String:Any]]
                    if statusCode == 200{
                        for i in dic{
                            let id = i["id"] as? Int ?? 0
                            let ar_Text = i["ar_Text"] as? String ?? ""
                            let en_Text = i["en_Text"] as? String ?? ""
                            let obj = GetAllCareerLevelM(id: id, ar_Text: ar_Text, en_Text: en_Text)
                            dataList.append(obj)
                            complition(dataList,"", true)
                        }
                    }else{
                        complition(dataList,"somthing wronge", false)
                    }
                case .failure(let error):
                    print(error)
                }
            }
        }
     }
    func GetAllEmploymentTypeApi(complition: @escaping(_ value: [GetAllEmploymentTypeM],_ value:String,_ value:Bool)-> Void){
        var dataList : [GetAllEmploymentTypeM] = []
        AF.request(GetAllEmploymentTypeUrl, method: .get, parameters: nil, encoding: JSONEncoding.default, headers: nil).responseJSON { (response) in
            let statusCode = response.response?.statusCode
            if statusCode == 200 || statusCode == 422 {
                switch response.result {
                case .success(let value):
                    let dic = value as! [[String:Any]]
                    if statusCode == 200{
                        for i in dic{
                            let id = i["id"] as? Int ?? 0
                            let ar_Text = i["ar_Text"] as? String ?? ""
                            let en_Text = i["en_Text"] as? String ?? ""
                            let obj = GetAllEmploymentTypeM(id: id, ar_Text: ar_Text, en_Text: en_Text)
                            dataList.append(obj)
                            complition(dataList,"", true)
                        }
                    }else{
                        complition(dataList,"somthing wronge", false)
                    }
                case .failure(let error):
                    print(error)
                }
            }
        }
     }
    func GetAllEmirateApi(complition: @escaping(_ value: [GetAllEmirateM],_ value:String,_ value:Bool)-> Void){
        var dataList : [GetAllEmirateM] = []
        AF.request(GetAllEmirateUrl, method: .get, parameters: nil, encoding: JSONEncoding.default, headers: nil).responseJSON { (response) in
            let statusCode = response.response?.statusCode
            if statusCode == 200 || statusCode == 422 {
                switch response.result {
                case .success(let value):
                    let dic = value as! [[String:Any]]
                    if statusCode == 200{
                        for i in dic{
                            let id = i["id"] as? Int ?? 0
                            let ar_Text = i["ar_Text"] as? String ?? ""
                            let en_Text = i["en_Text"] as? String ?? ""
                            let obj = GetAllEmirateM(id: id, ar_Text: ar_Text, en_Text: en_Text)
                            dataList.append(obj)
                            complition(dataList,"", true)
                        }
                    }else{
                        complition(dataList,"somthing wronge", false)
                    }
                case .failure(let error):
                    print(error)
                }
            }
        }
     }
    func GetAllPlateTypeApi(complition: @escaping(_ value: [GetAllPlateTypeM],_ value:String,_ value:Bool)-> Void){
        var dataList : [GetAllPlateTypeM] = []
        AF.request("\(GetAllPlateTypeByEmirateIdUrl)\(Shared.shared.EmirateId)", method: .get, parameters: nil, encoding: JSONEncoding.default, headers: nil).responseJSON { (response) in
            print("\(GetAllPlateTypeByEmirateIdUrl)\(Shared.shared.EmirateId)")
            let statusCode = response.response?.statusCode
            if statusCode == 200 || statusCode == 422 {
                switch response.result {
                case .success(let value):
                    let dic = value as! [[String:Any]]
                    if statusCode == 200{
                        for i in dic{
                            let id = i["id"] as? Int ?? 0
                            let ar_Text = i["ar_Text"] as? String ?? ""
                            let en_Text = i["en_Text"] as? String ?? ""
                            let emirateId = i["emirateId"] as? Int ?? 0
                            let emirate = i["emirate"] as? String ?? ""
                            let obj = GetAllPlateTypeM(id: id, ar_Text: ar_Text, en_Text: en_Text, emirateId: emirateId, emirate: emirate)
                            dataList.append(obj)
                            complition(dataList,"", true)
                        }
                    }else{
                        complition(dataList,"somthing wronge", false)
                    }
                case .failure(let error):
                    print(error)
                }
            }
        }
     }
    func GetAllOperatorApi(complition: @escaping(_ value: [GetAllOperatorM],_ value:String,_ value:Bool)-> Void){
        var dataList : [GetAllOperatorM] = []
        AF.request(GetAllOperatorUrl, method: .get, parameters: nil, encoding: JSONEncoding.default, headers: nil).responseJSON { (response) in
            let statusCode = response.response?.statusCode
            if statusCode == 200 || statusCode == 422 {
                switch response.result {
                case .success(let value):
                    let dic = value as! [[String:Any]]
                    if statusCode == 200{
                        for i in dic{
                            let id = i["id"] as? Int ?? 0
                            let ar_Text = i["ar_Text"] as? String ?? ""
                            let en_Text = i["en_Text"] as? String ?? ""
                            let obj = GetAllOperatorM(id: id, ar_Text: ar_Text, en_Text: en_Text)
                            dataList.append(obj)
                            complition(dataList,"", true)
                        }
                    }else{
                        complition(dataList,"somthing wronge", false)
                    }
                case .failure(let error):
                    print(error)
                }
            }
        }
     }
    
    
    func GetSubCategoryApi(complition: @escaping(_ value: [SubCategoryM],_ value:String,_ value:Bool)-> Void){
        var dataList : [SubCategoryM] = []
        AF.request("\(GetByCategoryIdUrl)\(Shared.shared.categoryId)", method: .get, parameters: nil, encoding: JSONEncoding.default, headers: nil).responseJSON { (response) in
            print("\(GetByCategoryIdUrl)\(Shared.shared.categoryId)")
            let statusCode = response.response?.statusCode
            if statusCode == 200 || statusCode == 422 {
                switch response.result {
                case .success(let value):
                    let dic = value as! [[String:Any]]
                    if statusCode == 200{
                        for i in dic{
                            let id = i["id"] as? Int ?? 0
                            let ar_Name = i["ar_Name"] as? String ?? ""
                            let en_Name = i["en_Name"] as? String ?? ""
                            
                            let categoryId = i["categoryId"] as? Int ?? 0
                            let category = i["category"] as? String ?? ""
                            let status = i["status"] as? Int ?? 0

                            let obj = SubCategoryM(id: id, ar_Name: ar_Name, en_Name: en_Name, categoryId: categoryId, category: category, status: status)
                            dataList.append(obj)
                            complition(dataList,"", true)
                        }
                    }else{
                        complition(dataList,"somthing wronge", false)
                    }
                case .failure(let error):
                    print(error)
                }
            }
        }
     }
    func GetSubTypeApi(complition: @escaping(_ value: [SubTypeM],_ value:String,_ value:Bool)-> Void){
        var dataList : [SubTypeM] = []
        AF.request("\(GetBySubCategoryIdUrl)\(Shared.shared.subCategoryId)", method: .get, parameters: nil, encoding: JSONEncoding.default, headers: nil).responseJSON { (response) in
            print("\(GetBySubCategoryIdUrl)\(Shared.shared.subCategoryId)")
            let statusCode = response.response?.statusCode
            if statusCode == 200 || statusCode == 422 {
                switch response.result {
                case .success(let value):
                    let dic = value as! [[String:Any]]
                    if statusCode == 200{
                        for i in dic{
                            let id = i["id"] as? Int ?? 0
                            let ar_Name = i["ar_Name"] as? String ?? ""
                            let en_Name = i["en_Name"] as? String ?? ""
                            
                            let categoryId = i["categoryId"] as? Int ?? 0
                            let category = i["category"] as? String ?? ""
                            let status = i["status"] as? Int ?? 0

                            let obj = SubTypeM(id: id, ar_Name: ar_Name, en_Name: en_Name, categoryId: categoryId, category: category, status: status)
                            dataList.append(obj)
                            complition(dataList,"", true)
                        }
                    }else{
                        complition(dataList,"somthing wronge", false)
                    }
                case .failure(let error):
                    print(error)
                }
            }
        }
     }
    func GetAllMotorMakerApi(complition: @escaping(_ value: [GetAllMotorMakerM],_ value:String,_ value:Bool)-> Void){
        var dataList : [GetAllMotorMakerM] = []
        AF.request(GetAllMotorMakerUrl, method: .get, parameters: nil, encoding: JSONEncoding.default, headers: nil).responseJSON { (response) in
            let statusCode = response.response?.statusCode
            if statusCode == 200 || statusCode == 422 {
                switch response.result {
                case .success(let value):
                    let dic = value as! [[String:Any]]
                    if statusCode == 200{
                        for i in dic{
                            let id = i["id"] as? Int ?? 0
                            let ar_Text = i["ar_Text"] as? String ?? ""
                            let en_Text = i["en_Text"] as? String ?? ""
                            let obj = GetAllMotorMakerM(id: id, ar_Text: ar_Text, en_Text: en_Text)
                            dataList.append(obj)
                            complition(dataList,"", true)
                        }
                    }else{
                        complition(dataList,"somthing wronge", false)
                    }
                case .failure(let error):
                    print(error)
                }
            }
        }
     }
    func GetAllMotorModelByMakerIdApi(complition: @escaping(_ value: [GetAllMotorModelByMakerIdM],_ value:String,_ value:Bool)-> Void){
        var dataList : [GetAllMotorModelByMakerIdM] = []
        AF.request("\(GetAllMotorModelByMakerIdUrl)\(Shared.shared.makerId)", method: .get, parameters: nil, encoding: JSONEncoding.default, headers: nil).responseJSON { (response) in
            print("\(GetAllMotorModelByMakerIdUrl)\(Shared.shared.makerId)")
            let statusCode = response.response?.statusCode
            if statusCode == 200 || statusCode == 422 {
                switch response.result {
                case .success(let value):
                    let dic = value as! [[String:Any]]
                    if statusCode == 200{
                        for i in dic{
                            let id = i["id"] as? Int ?? 0
                            let ar_Text = i["ar_Text"] as? String ?? ""
                            let en_Text = i["en_Text"] as? String ?? ""
                            let makerId = i["makerId"] as? Int ?? 0
                            let maker = i["maker"] as? String ?? ""
                            let obj = GetAllMotorModelByMakerIdM(id: id, ar_Text: ar_Text, en_Text: en_Text, makerId: makerId, maker: maker)
                            dataList.append(obj)
                            complition(dataList,"", true)
                        }
                    }else{
                        complition(dataList,"somthing wronge", false)
                    }
                case .failure(let error):
                    print(error)
                }
            }
        }
     }
    
    
    
}
