//
//  ApiRequests+Notification.swift
//  inSooqApp
//
//  Created by Deya on 27/03/2022.
//

import Foundation
import Alamofire

extension ApiRequests {
    
    typealias NotificationsCompletionHandler = (DataResponse<[NotificationModel],AFError>)
    static func notifications(completion:@escaping (NotificationsCompletionHandler) -> Void) {
        NetworkService().simpleRequest(url: APIUrls.notifications(), method: .get) { (response: NotificationsCompletionHandler) in completion(response) }
    }
    
    static func deleteNotification(params: [String:Any], completion:@escaping (SimpleompletionHandler) -> Void) {
        NetworkService().simpleRequest(url: APIUrls.deleteNotification(), method: .post, params: params) { (response: SimpleompletionHandler) in completion(response) }
    }
    
}
