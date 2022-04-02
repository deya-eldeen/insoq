//
//  NetworkService.swift
//  orood
//
//  Created by Deya AlDeen on 17/09/2021.
//

import Foundation
import Alamofire
import Defaults

struct Endpoint {
    var url: String = ""
    var method: HTTPMethod = .get
}


class NetworkService {
    
    static let shared = NetworkService()

    
    func showError(error:String){
        DispatchQueue.main.async {
            UIViewController().showAlert(title: "error", body: error)
        }
    }

    func uploadRequestHeaders() -> HTTPHeaders {
        var headers = HTTPHeaders()

        let token = Shared.shared.getToken() ?? ""
        
        let currentDeviceLanguageCode = Locale.current.languageCode ?? "en"
        headers.add(name: "Accept-Language", value: currentDeviceLanguageCode)
        headers.add(name: "Authorization", value: "Bearer \(token)")
        headers.add(name: "Content-Type", value: "multipart/form-data")
        
        return headers
    }
    
    func requestHeaders() -> HTTPHeaders {
        var headers = HTTPHeaders()

        let token = Shared.shared.getToken() ?? ""

        let currentDeviceLanguageCode = Locale.current.languageCode ?? "en"
        headers.add(name: "Accept-Language", value: currentDeviceLanguageCode)
        headers.add(name: "Authorization", value: "Bearer \(token)")
        headers.add(name: "Accept-Language", value: currentDeviceLanguageCode)
        
        return headers
    }
    
    func simpleRequest<T:Decodable>(url:String, method: HTTPMethod,params:Parameters? = .none, withLoading: Bool = false, completion:@escaping (DataResponse<T,AFError>) -> Void) {
        let headers = requestHeaders()
                
        DispatchQueue.main.async {
            if(withLoading == true) { UIViewController().showLoading() }
        }
                
        let escapedURL = url.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? ""
        
        AF.request(escapedURL, method: method,parameters: params, encoding: APIConfig.encoding, headers: headers).responseDecodable { (response: (DataResponse<T,AFError>)) in

            DispatchQueue.main.async {
                if(withLoading == true) { UIViewController().hideLoading() }
            }

            if(response.error != nil){completion(response)}
            
            print("🛠Req\n",response.request?.cURL() ?? "","\n")
            print("🛠Res\n",response.value,response.value)

            if let statusCode = response.response?.statusCode {
                
                if (statusCode >= 200  && statusCode <= 300) {
                    completion(response)
                }
                else if (statusCode >= 401  && statusCode <= 403) {
                    self.showError(error: "NOT AUTHORIZED")
                } else {
                    self.showError(error: response.error?.errorDescription ?? "")
                }
                
            }
            
        }
        
    }
    
    func submitForm<T:Decodable>(url: String, params: [String: Any], withLoading: Bool = false, method: HTTPMethod = .post, completion:@escaping ((DataResponse<T,AFError>)) -> Void) {

        let headers = NetworkService().uploadRequestHeaders()

        DispatchQueue.main.async {
            if(withLoading == true) { UIViewController().showLoading() }
        }
        
        AF.upload(
            multipartFormData: { multipartFormData in
                
                for (key, value) in params {
                    if let temp = value as? String {
                        multipartFormData.append(temp.data(using: .utf8)!, withName: key)
                    }
                    if let temp = value as? Int {
                        multipartFormData.append("\(temp)".data(using: .utf8)!, withName: key)
                    }
                    if let temp = value as? NSArray {
                        temp.forEach({ element in
                            let keyObj = key + "[]"
                            if let string = element as? String {
                                multipartFormData.append(string.data(using: .utf8)!, withName: keyObj)
                            } else
                                if let num = element as? Int {
                                    let value = "\(num)"
                                    multipartFormData.append(value.data(using: .utf8)!, withName: keyObj)
                            }
                        })
                    }
                }
                

            },
            to: url,
            method: method,
            headers: headers
        )
        .responseDecodable { (response: (DataResponse<T,AFError>)) in

                DispatchQueue.main.async {
                    if(withLoading == true) { UIViewController().hideLoading() }
                }

                if(response.error != nil){completion(response)}

                print("submitForm",response.data)

                print("🛠\n",response.request?.cURL() ?? "","\n")
                
                if let statusCode = response.response?.statusCode {
                    
                    if (statusCode >= 200  && statusCode <= 300) {
                        completion(response)
                    }
                    else if (statusCode >= 401  && statusCode <= 403) {
                        self.showError(error: "NOT AUTHORIZED")
                    } else {
                        self.showError(error: response.error?.errorDescription ?? "")
                    }
                    
                }

        }
    }
    
    func request<T>(url:String, method: HTTPMethod,params:Parameters? = .none, withLoading: Bool = true, completion:@escaping (DataResponse<BasicResponse<T>,AFError>) -> Void) {
        let headers = requestHeaders()
        
        if(withLoading == true) { UIViewController().showLoading() }
        
        let escapedURL = url.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? ""
        
        AF.request(escapedURL, method: method,parameters: params, encoding: APIConfig.encoding, headers: headers).responseDecodable { (response: (DataResponse<BasicResponse<T>,AFError>)) in
            if(withLoading == true) { UIViewController().hideLoading() }

            if(response.error != nil){completion(response)}
            
            print("🛠\n",response.request?.cURL() ?? "","\n")
            print("🛠\n",response.value,response.value?.response_status?.status)

            if let fullResponse = response.value {
                switch fullResponse.response_status?.status {
                case .success:
                    completion(response)
                case .failed, .none:
                    self.showError(error: response.value?.response_status?.message ?? "")
                case .some(.notAuthorized):
                    break
//                    AppDelegate().logOut()
                    //self.showError(error: "NOT AUTHORIZED")
                }
                
            } else {
                print("X1",response.error,response.error?.errorDescription,response.error?.localizedDescription)
                self.showError(error: response.error?.errorDescription ?? "")
            }
            
            
            
        }
        
    }
    
}
