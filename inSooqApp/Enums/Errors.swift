//
//  Errors.swift
//  WaterFront
//
//  Created by Abdullah AL-Soubani 29/11/2021.
//  Copyright © 2021 Laith Abdo. All rights reserved.
//
import Foundation

enum AppError: Error {
    case undefined
    case statusCode
    case decodingError(message: String? = nil)
    case noInternet
    
    var localizedDescription: String {
        switch self {
        case .undefined:
          return NSLocalizedString("Something went wrong, please try again", comment: "Error")
        case .statusCode:
            return NSLocalizedString("Check connection and try again", comment: "Error")
        case .decodingError(let message):
            return NSLocalizedString(message ?? "Something went wrong, please try again", comment: "Error")
        case .noInternet:
            return NSLocalizedString("No Internet Connection", comment: "Error")
        }
      }
}
