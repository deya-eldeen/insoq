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
    
    let typeId: Int?
    let categoryId: Int?
    let emirateId: Int?
    let operatorId: Int?
    
    let value:  String?

}

