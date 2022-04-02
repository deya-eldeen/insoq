//
//  ApiRequests+Advertisting.swift
//  inSooqApp
//
//  Created by Deya on 02/04/2022.
//

import Foundation
import Alamofire

extension ApiRequests {
    
    typealias AdvertisingBudgetCompletionHandler = (DataResponse<[AdvertisingBudget],AFError>)
    static func advertisingBudgetsList(completion:@escaping (AdvertisingBudgetCompletionHandler) -> Void) {
        NetworkService().simpleRequest(url: APIUrls.advertisingBudgets(), method: .get) { (response: AdvertisingBudgetCompletionHandler) in completion(response) }
    }
    
    typealias SubmitAdvertisingCompletionHandler = (DataResponse<AdvertisingModel,AFError>)
    static func submitAdvertisment(params: [String:Any], completion:@escaping (SubmitAdvertisingCompletionHandler) -> Void) {
        NetworkService().submitForm(url: APIUrls.submitAdvertisment(), params: params) { (response: SubmitAdvertisingCompletionHandler) in completion(response) }
    }
    
}
