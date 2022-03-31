//
//  ApiRequests.swift
//  orood
//
//  Created by Deya AlDeen on 20/09/2021.
//

import Foundation
import Alamofire


class ApiRequests {

    typealias NoDataCompletionHandler = (DataResponse<BasicResponse<NoReply>,AFError>)
    typealias BoolCompletionHandler = (DataResponse<BasicResponse<Bool>,AFError>)
    typealias SimpleompletionHandler = (DataResponse<SimpleResponse,AFError>)

}

extension ApiRequests {
    
    typealias NationalitiesCompletionHandler = (DataResponse<[NationalityModel],AFError>)
    static func nationalities(params: [String:Any], completion:@escaping (NationalitiesCompletionHandler) -> Void) {
        NetworkService().simpleRequest(url: APIUrls.nationalities(), method: .get) { (response: NationalitiesCompletionHandler) in completion(response) }
    }
    
}
