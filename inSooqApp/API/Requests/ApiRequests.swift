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
    static func nationalities(completion:@escaping (NationalitiesCompletionHandler) -> Void) {
        NetworkService.shared.simpleRequest(url: APIUrls.nationalities(), method: .get) { (response: NationalitiesCompletionHandler) in completion(response) }
    }
    
    typealias LocationsCompletionHandler = (DataResponse<[LocationModel],AFError>)
    static func locations(completion:@escaping (LocationsCompletionHandler) -> Void) {
        NetworkService.shared.simpleRequest(url: APIUrls.locations(), method: .get) { (response: LocationsCompletionHandler) in completion(response) }
    }
    
    typealias EducationLevelsCompletionHandler = (DataResponse<[EducationLevelModel],AFError>)
    static func educationLevels(completion:@escaping (EducationLevelsCompletionHandler) -> Void) {
        NetworkService.shared.simpleRequest(url: APIUrls.educationLevels(), method: .get) { (response: EducationLevelsCompletionHandler) in completion(response) }
    }
    
    typealias CareerLevelsCompletionHandler = (DataResponse<[CareerLevelModel],AFError>)
    static func careerLevels(completion:@escaping (CareerLevelsCompletionHandler) -> Void) {
        NetworkService.shared.simpleRequest(url: APIUrls.careerLevels(), method: .get) { (response: CareerLevelsCompletionHandler) in completion(response) }
    }
    
}
