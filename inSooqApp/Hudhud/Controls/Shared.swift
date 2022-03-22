//
//  Shared.swift
//  inSooqApp
//
//  Created by Mohammad Jawher on 18/03/2022.
//

import Foundation
import UIKit

final class Shared {
    static let shared = Shared()
    
    
    func saveIsLogin(login:Bool)
    {
        let def = UserDefaults.standard
        def.setValue(login, forKey: "isLogin")
        def.synchronize()
    }
    func getIsLogin()-> Bool?{
        let def = UserDefaults.standard
        return def.object(forKey: "isLogin" ) as? Bool
    }
    func saveUserId(id:Int)
    {
        let def = UserDefaults.standard
        def.setValue(id, forKey: "UserId")
        def.synchronize()
    }
    func getUserId()-> Int?{
        let def = UserDefaults.standard
        return def.object(forKey: "UserId" ) as? Int
    }
    func saveToken(auth:String)
    {
        let def = UserDefaults.standard
        def.setValue(auth, forKey: "user_token")
        def.synchronize()
    }
    func getToken()-> String?{
        let def = UserDefaults.standard
        return def.object(forKey: "user_token" ) as? String
    }
    func saveUserPhoneNumber(phone:String)
    {
        let def = UserDefaults.standard
        def.setValue(phone, forKey: "UserPhoneNumber")
        def.synchronize()
    }
    func getUserPhoneNumber()-> String?{
        let def = UserDefaults.standard
        return def.object(forKey: "UserPhoneNumber") as? String
    }
    func saveUserEmail(name:String)
    {
        let def = UserDefaults.standard
        def.setValue(name, forKey: "user_email")
        def.synchronize()
    }
    func getUserEmail()-> String?{
        let def = UserDefaults.standard
        return def.object(forKey: "user_email") as? String
    }
    
    
    
    
    func saveUserAddress(address:String)
    {
        let def = UserDefaults.standard
        def.setValue(address, forKey: "user_address")
        def.synchronize()
    }
    func getUserAddress()-> String?{
        let def = UserDefaults.standard
        return def.object(forKey: "user_address") as? String
    }
    func saveUserCity(city:String)
    {
        let def = UserDefaults.standard
        def.setValue(city, forKey: "user_city")
        def.synchronize()
    }
    func getUserCity()-> String?{
        let def = UserDefaults.standard
        return def.object(forKey: "user_city") as? String
    }
    
    
//    "userId" : 289,
//    "status" : 1,
//    "isSuccess" : true,
//    "message" : null,
//    "email" : null,
//    "token" : "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJJZCI6IjI4OSIsImVtYWlsIjoic2FsYWhfM3dhZGk5MUB5YWhvby5jb20iLCJzdWIiOiJzYWxhaF8zd2FkaTkxQHlhaG9vLmNvbSIsImp0aSI6ImIzZjYzZjRlLTI5OTItNGNmNS1iNDRkLTU2OTc2NWNiZTMxNyIsIm5iZiI6MTY0NzU1ODYxMCwiZXhwIjoxNjQ4MTYzNDEwLCJpYXQiOjE2NDc1NTg2MTB9.kv8YREggbfh5ffyP5Rrr7YnHo1uVfj10jh19-zZZiIw",
//    "phoneNumber" : null

    
    
    
    
    
    
    var category = 0
    var categoryIndex = 0
    
    var categoryId = 0
    var subCategoryId = 0
    var EmirateId = 0
    var makerId = 0
    
    
    
}
