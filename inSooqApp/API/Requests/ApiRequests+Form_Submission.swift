//
//  ApiRequests+Form_Submission.swift
//  inSooqApp
//
//  Created by Deya on 19/04/2022.
//

import Foundation
import Alamofire
import Defaults

extension ApiRequests {
    

    static func submitForm(url: String, files: [(Data,String)], images: [(UIImage,String)], params: [String: Any], completion:@escaping (EditProfileCompletionHandler) -> Void) {

        let headers = NetworkService().uploadRequestHeaders()
        let unixTS = Int(NSDate().timeIntervalSince1970)

        print("headers__",headers)
        print("params",params)

        AF.upload(
            multipartFormData: { multipartFormData in
                for param in params {
                    let value = (param.value as AnyObject).data(using: String.Encoding.utf8.rawValue)!
                    multipartFormData.append(value, withName: param.key)
                }
//                for fileMeta in files {
//                    let file = fileMeta.0
//                    let fileName = fileMeta.1
//                    multipartFormData.append(file,
//                        withName: fileName,
//                        fileName: "File_\(unixTS).pdf",
//                        mimeType:"application/pdf")
//                }
                for imageMeta in images {
                    let image = imageMeta.0
                    let imageName = imageMeta.1
                    multipartFormData.append(image.jpegData(compressionQuality: 0.5)!,
                        withName: "Pictures",
                        fileName: imageName,
                        mimeType: "image/jpeg")
                }

            },
            to: url,
            method: .post,
            headers: headers
        )
        .responseDecodable { (response: EditProfileCompletionHandler) in

            UIViewController().hideLoading()
            print("submitForm",response.data)
            print("🛠\n",response.request?.cURL() ?? "","\n")
            
            if(response.error != nil){completion(response)}

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
    

    static func submitGenericForm(url: String, files: [(Data,String)], images: [(UIImage,String)], params: [String: Any], completion:@escaping (ListableCompletionHandler) -> Void) {

        let headers = NetworkService().uploadRequestHeaders()
        let unixTS = Int(NSDate().timeIntervalSince1970)

        print("headers__",headers)
        print("params",params)

        AF.upload(
            multipartFormData: { multipartFormData in
                for param in params {
                    let value = (param.value as AnyObject).data(using: String.Encoding.utf8.rawValue)!
                    multipartFormData.append(value, withName: param.key)
                }
//                for fileMeta in files {
//                    let file = fileMeta.0
//                    let fileName = fileMeta.1
//                    multipartFormData.append(file,
//                        withName: fileName,
//                        fileName: "File_\(unixTS).pdf",
//                        mimeType:"application/pdf")
//                }
//                for imageMeta in images {
//                    let image = imageMeta.0
//                    let imageName = imageMeta.1
//                    multipartFormData.append(image.jpegData(compressionQuality: 0.5)!,
//                        withName: "Pictures",
//                        fileName: imageName,
//                        mimeType: "image/jpeg")
//                }
            },
            to: url,
            method: .post,
            headers: headers
        )
        .responseDecodable { (response: ListableCompletionHandler) in

            UIViewController().hideLoading()
            print("submitForm",response.data)
            print("🛠\n",response.request?.cURL() ?? "","\n")
            
            if(response.error != nil){completion(response)}

            if let fullResponse = response.value {
                completion(response)
                
//                let isSuccess = fullResponse.isSuccess ?? false
//                if isSuccess == true {
//
//                } else {
//                    NetworkService().showError(error: response.value?.message ?? "")
//                }
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

