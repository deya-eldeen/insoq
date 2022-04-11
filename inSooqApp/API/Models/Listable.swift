//
//  Listable.swift
//  inSooqApp
//
//  Created by Deya on 11/04/2022.
//

import Foundation

protocol Listable: Codable {
    var id: Int? { get }
    var ar_Text: String? { get }
    var en_Text: String? { get }
}
