//
//  ApiRequests+Models.swift
//  inSooqApp
//
//  Created by Deya on 09/04/2022.
//

import Foundation
import Alamofire

extension ApiRequests {
    
    typealias MotorMakersCompletionHandler = (DataResponse<[MotorMaker],AFError>)
    static func motorMakers(completion:@escaping (MotorMakersCompletionHandler) -> Void) {
        NetworkService().simpleRequest(url: APIUrls.motorMakers(), method: .get) { (response: MotorMakersCompletionHandler) in completion(response) }
    }
    
    typealias MotorModelsCompletionHandler = (DataResponse<[MotorModel],AFError>)
    static func motorModels(makerId: Int, completion:@escaping (MotorModelsCompletionHandler) -> Void) {
        NetworkService().simpleRequest(url: APIUrls.motorModels(makerId: makerId), method: .get) { (response: MotorModelsCompletionHandler) in completion(response) }
    }
    
    typealias MotorTrimsCompletionHandler = (DataResponse<[MotorTrim],AFError>)
    static func motorTrims(modelNameAr: String, modelNameEn: String, completion:@escaping (MotorTrimsCompletionHandler) -> Void) {
        NetworkService().simpleRequest(url: APIUrls.motorTrims(modelNameAr: modelNameAr, modelNameEn: modelNameEn), method: .get) { (response: MotorTrimsCompletionHandler) in completion(response) }
    }
    
}
