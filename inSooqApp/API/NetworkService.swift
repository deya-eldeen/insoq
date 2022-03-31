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
    
    func simpleRequest<T:Decodable>(url:String, method: HTTPMethod,params:Parameters? = .none, withLoading: Bool = true, completion:@escaping (DataResponse<T,AFError>) -> Void) {
        let headers = requestHeaders()
        
        print("AA_1")
        
        DispatchQueue.main.async {
            if(withLoading == true) { UIViewController().showLoading() }
        }
        
        print("AA_2")
        
        let escapedURL = url.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? ""
        
        print("AA_3")
        AF.request(escapedURL, method: method,parameters: params, encoding: APIConfig.encoding, headers: headers).responseDecodable { (response: (DataResponse<T,AFError>)) in
            print("AA_4")
            DispatchQueue.main.async {
                if(withLoading == true) { UIViewController().hideLoading() }
            }
            print("AA_5")
            if(response.error != nil){completion(response)}
            print("AA_6")
            
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
