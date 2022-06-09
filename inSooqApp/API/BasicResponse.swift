//  BasicResponse.swift
//  Created by deyaeldeen

import Foundation

struct NoReply: Decodable {}

struct BasicResponse<T>: Decodable where T: Decodable {
    
    var isSuccess: Bool?
    var id: Int?
    var adId: Int?
    
    var response_status: BasicResponseData?
    var data: T?
    
    var total_count : Int?
    var total_pages : Int?
    var is_grouped  : Int?

}

struct SimpleResponse: Codable {
    
    var isSuccess: Bool?

}

struct BasicResponseData: Codable {
    
    var isSuccess: Bool?

    private var statusCode: Int?
    var status: Status {
        if statusCode == 200 || statusCode == 201 {
            return .success
        }
        if statusCode == 401 {
            return .notAuthorized
        }
        return .failed
    }
    
    private var messageString: String?
    var message: String {
        if let messageString = messageString {
            return messageString
        } else {
            return "message_error_generic".localized
        }
    }
    
    private(set) var version:Int?

    enum CodingKeys: String, CodingKey {
        case statusCode = "code"
        case messageString = "internalMessage"
        case isSuccess = "isSuccess"
    }
    
    init() {
        self.statusCode = -1
        self.messageString = "init_error_generic".localized
    }
    
    enum Status {
        case success
        case notAuthorized
        case failed
    }
    
}
