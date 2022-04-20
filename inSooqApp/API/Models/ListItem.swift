//
//  ListItem.swift
//  inSooqApp
//
//  Created by Deya on 13/04/2022.
//

import Foundation

struct ListItem: Codable, Listable {
    
    let id:  Int?
    
    let ar_Text:  String?
    let en_Text:  String?
    
    var ar_Name: String?
    var en_Name: String?
    
    var typeId: Int?
    var categoryId: Int?
    var emirateId: Int?
    var operatorId: Int?
    
    var value:  String?

}

