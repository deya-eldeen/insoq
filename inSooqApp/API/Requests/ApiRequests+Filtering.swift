//
//  ApiRequests+Filtering.swift
//  inSooqApp
//
//  Created by Deya on 10/05/2022.
//

import Foundation
import Alamofire

extension ApiRequests {
    
    // Filters
    
    static func filterBusiness(params: [String:Any], completion:@escaping (NoDataCompletionHandler) -> Void) {
        NetworkService().simpleRequest(url: APIUrls.filterBusiness(), method: .post, params: params) { (response: NoDataCompletionHandler) in completion(response) }
    }
    static func filterClassified(params: [String:Any], completion:@escaping (NoDataCompletionHandler) -> Void) {
        NetworkService().simpleRequest(url: APIUrls.filterClassified(), method: .post, params: params) { (response: NoDataCompletionHandler) in completion(response) }
    }
    static func filterElectronics(params: [String:Any], completion:@escaping (NoDataCompletionHandler) -> Void) {
        NetworkService().simpleRequest(url: APIUrls.filterElectronics(), method: .post, params: params) { (response: NoDataCompletionHandler) in completion(response) }
    }
    static func filterJobs(params: [String:Any], completion:@escaping (NoDataCompletionHandler) -> Void) {
        NetworkService().simpleRequest(url: APIUrls.filterJobs(), method: .post, params: params) { (response: NoDataCompletionHandler) in completion(response) }
    }
    static func filterMotors(params: [String:Any], completion:@escaping (NoDataCompletionHandler) -> Void) {
        NetworkService().simpleRequest(url: APIUrls.filterMotors(), method: .post, params: params) { (response: NoDataCompletionHandler) in completion(response) }
    }
    static func filterNumbers(params: [String:Any], completion:@escaping (NoDataCompletionHandler) -> Void) {
        NetworkService().simpleRequest(url: APIUrls.filterNumbers(), method: .post, params: params) { (response: NoDataCompletionHandler) in completion(response) }
    }
    static func filterServices(params: [String:Any], completion:@escaping (NoDataCompletionHandler) -> Void) {
        NetworkService().simpleRequest(url: APIUrls.filterServices(), method: .post, params: params) { (response: NoDataCompletionHandler) in completion(response) }
    }

}


