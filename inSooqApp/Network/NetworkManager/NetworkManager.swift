//
//  NetworkManager.swift
//  inSooqApp
//
//  Created by Abdullah AL-Soubani on 30/12/2021.
//


import Foundation
import Alamofire
import UIKit
import SwiftyJSON

class NetworkManager: NSObject {
    
    func GenericRequest<T: Decodable>(urlString: String, method: HTTPMethod ,params: [String: Any]? , completion: @escaping(T?,AppError?)->()) {
        if !Connectivity.isConnectedToInternet {
            debugPrint("Status: No Internet Connection")
            completion(nil,.noInternet)
            return
        }
        let token = User.profile?.token ?? ""
        let url :URL = URL(string: urlString)!
        var request = URLRequest(url: url)
        request.httpMethod = method == .get ? "GET" : "POST"
        request.setValue("application/json; charset=utf-8", forHTTPHeaderField: "Content-Type")
        request.setValue("application/json; charset=utf-8", forHTTPHeaderField: "Accept")
        request.httpBody = try? JSONSerialization.data(withJSONObject: params ?? [])
        request.allHTTPHeaderFields = ["Authorization": "Bearer "+token]
        
        //Now use this URLRequest with Alamofire to make request
        AF.request(request).responseJSON { response in
            debugPrint("Parameters :", "\t", String(describing: params))
            debugPrint("Method :", "\t", method)
            debugPrint("Path :", "\t", urlString)
            debugPrint("Response :", "\t", String(describing: response.result))
            switch response.result {
            case .success:
                if let data = response.data, let statusCode = response.response?.statusCode {
                    do {
                        let jsonModel = try JSON(data: data)
                        if (statusCode >= 200  && statusCode <= 300) {
                            if let json = response.data {
                                do {
                                    let object = try JSONDecoder().decode(T.self, from: json)
                                    completion(object,nil)
                                } catch {
                                    completion(nil, .decodingError(message: jsonModel["message"].string))
                                    print(String(describing: error))
                                }
                            }
                            return
                        }
                        completion(nil, .decodingError(message: jsonModel["message"].string))
                    } catch {
                        completion(nil, .undefined)
                        print(error.localizedDescription)
                    }
                }
            case .failure:
                completion(nil,.statusCode)
                break
            }
        }
    }
    
    func GenericRequestGet<T: Decodable>(urlString: String, method: HTTPMethod ,params: [String: Any]? , completion: @escaping(T?,AppError?)->()) {
        
        if !Connectivity.isConnectedToInternet {
            debugPrint("Status: No Internet Connection")

            completion(nil,.noInternet)
            return
        }
        
        guard let url = URL(string: urlString) else { return }
        var request = URLRequest(url: url)
        request.httpMethod = method == .get ? "GET" : "POST"
        request.setValue("application/json; charset=utf-8", forHTTPHeaderField: "Content-Type")
        request.setValue("application/json; charset=utf-8", forHTTPHeaderField: "Accept")
        request.httpBody = try? JSONSerialization.data(withJSONObject: params ?? [])
        
        //Now use this URLRequest with Alamofire to make request
        var parameter  = [String: Any]()
        if params != nil{
            parameter = params!
        }
        
        
        
        AF.request(url, method: method == .get ? .get : .post, parameters: parameter , headers: nil , interceptor: nil)
            .validate(statusCode: 200..<300)
            .responseJSON { response in
                
                if response.response?.statusCode == 200 {
                    guard let data = response.data else { return}
                    
                    do {
                        let decoder = JSONDecoder()
                        let dataObj  = try decoder.decode(T.self, from: data)
                        completion(dataObj,nil)
                    }
                    catch (let error) {
                        debugPrint("error:\(error)")

                        completion(nil, .undefined)
                    }
                }
                else if response.response?.statusCode == 403 {
                    completion(nil, .undefined)
                    debugPrint("response.response:\(response.response)")

                }
                else {
                    debugPrint("response.response:\(response.response)")

                    completion(nil, .undefined)
                    
                }
            }
    }
}

class Connectivity {
    
    class var isConnectedToInternet: Bool {
        return NetworkReachabilityManager()!.isReachable
    }
}
