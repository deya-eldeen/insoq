//
//  ContextRequests.swift
//  orood
//
//  Created by Deya AlDeen on 20/09/2021.
//

import Foundation
import Alamofire
import Defaults

extension ApiRequests {
    
    typealias LoginCompletionHandler = (DataResponse<LoginModel,AFError>)
    static func login(params: [String:Any], completion:@escaping (LoginCompletionHandler) -> Void) {
        NetworkService().simpleRequest(url: APIUrls.login(), method: .post, params: params) { (response: LoginCompletionHandler) in completion(response) }
    }
    
    typealias RegisterCompletionHandler = (DataResponse<RegisterModel,AFError>)
    static func register(params: [String:Any], completion:@escaping (RegisterCompletionHandler) -> Void) {
        NetworkService().simpleRequest(url: APIUrls.register(), method: .post, params: params) { (response: RegisterCompletionHandler) in completion(response) }
    }
    
    typealias ProfileCompletionHandler = (DataResponse<ProfileModel,AFError>)
    static func profileDetails(id: Int, completion:@escaping (ProfileCompletionHandler) -> Void) {
        NetworkService.shared.simpleRequest(url: APIUrls.profileDetails(id: id), method: .get) { (response: ProfileCompletionHandler) in completion(response) }
    }
    
    typealias EditProfileCompletionHandler = (DataResponse<FullEditProfileModel,AFError>)
    static func editProfile(CVFile: Data?, ProfilePictureFile: UIImage?, IndustryFile: Data?, params: [String: Any], completion:@escaping (EditProfileCompletionHandler) -> Void) {

        let headers = NetworkService().uploadRequestHeaders()
        let unixTS = Int(NSDate().timeIntervalSince1970)

        AF.upload(
            multipartFormData: { multipartFormData in
                
                for param in params {
                    let value = (param.value as AnyObject).data(using: String.Encoding.utf8.rawValue)!
                    multipartFormData.append(value, withName: param.key)
                }
                
                if let profilePictureFile = ProfilePictureFile {
                    multipartFormData.append(profilePictureFile.jpegData(compressionQuality: 0.5)!,
                        withName: "ProfilePictureFile",
                        fileName: "Profile_\(unixTS)_.jpeg",
                        mimeType: "image/jpeg"
                    )
                }

                if let cvFile = CVFile {
                    multipartFormData.append(cvFile,
                        withName: "CVFile",
                        fileName: "CV_\(unixTS).pdf",
                        mimeType:"application/pdf")
                }
                
                if let cvFile = CVFile {
                    multipartFormData.append(cvFile,
                        withName: "IndustryFile",
                        fileName: "File_\(unixTS).pdf",
                        mimeType:"application/pdf")
                }

            },
            to: APIUrls.editProfile(),
            method: .post ,
            headers: headers
        )
        .responseDecodable { (response: EditProfileCompletionHandler) in

                UIViewController().hideLoading()

                if(response.error != nil){completion(response)}

                print("edit_profile",response.data)

                print("🛠\n",response.request?.cURL() ?? "","\n")

                if let fullResponse = response.value {
                    let isSuccess = fullResponse.isSuccess ?? false
                    
                    if isSuccess == true {
                        completion(response)
                    } else {
                        NetworkService().showError(error: response.value?.message ?? "")
                    }
                    
                }
                else {
                    print("X1",response.error)
                    print("X2",response.error?.errorDescription)
                    print("X3",response.error?.localizedDescription)
                    //self.showError(error: response.error?.errorDescription ?? "")
                }

        }
    }
    
    
}
