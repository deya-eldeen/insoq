//
//  ApiRequests+Submission.swift
//  inSooqApp
//
//  Created by Deya on 27/04/2022.
//

import Foundation
import Alamofire

extension ApiRequests {

    // Motor Initial (NORMAL)
    static func submitMotor(params: [String:Any], completion:@escaping (NoDataCompletionHandler) -> Void) {
        NetworkService().submitForm(url: APIUrls.submitMotorInitial(), params: params) { (response: NoDataCompletionHandler) in completion(response) }
    }
    
    // Motor full (FORM)

    
    // Job Initial (Normal)
    static func submitJob(params: [String:Any], completion:@escaping (NoDataCompletionHandler) -> Void) {
        NetworkService().submitForm(url: APIUrls.submitJobInitial(), params: params) { (response: NoDataCompletionHandler) in completion(response) }
    }
    
    // Job Full (Normal)

    
    
    
    
    
    static func submitNumber(params: [String:Any], completion:@escaping (NoDataCompletionHandler) -> Void) {
        NetworkService().simpleRequest(url: APIUrls.submitNumbers(), method: .post, params: params) { (response: NoDataCompletionHandler) in completion(response) }
    }
    
    
    
    
    
    
    // Electronics (FORM)

    
    
    
    
    
    
    
    // Classified (NORMAL)
    static func submitClassified(params: [String:Any], completion:@escaping (NoDataCompletionHandler) -> Void) {
        NetworkService().submitForm(url: APIUrls.submitClassifiedInitial(), params: params) { (response: NoDataCompletionHandler) in completion(response) }
    }
    
    // Classified (FORM)

    
    
    
    
    
    
    // Services (FORM)

    
    
    
    
    
    // Business (FORM)

    
    
    
    
    
    
}

