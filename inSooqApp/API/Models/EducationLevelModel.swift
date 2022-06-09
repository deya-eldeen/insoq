//
//  EducationLevelModel.swift
//  inSooqApp
//
//  Created by Deya on 01/04/2022.
//

import Foundation

struct EducationLevelModel: Codable, Listable {
    
    let id:  Int?
    let ar_Text:  String?
    let en_Text:  String?
    
    var ar_Name: String?
    var en_Name: String?
    
    var value: String?

}
