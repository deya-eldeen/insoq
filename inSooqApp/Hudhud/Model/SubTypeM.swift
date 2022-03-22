//
//  SubTypeM.swift
//  inSooqApp
//
//  Created by Mohammad Jawher on 20/03/2022.
//

import Foundation
import SwiftyJSON

class SubTypeM {
    var id : Any
    var ar_Name : Any
    var en_Name : Any
    var categoryId : Any
    var category : Any
    var status : Any
    
    init(id:Any,ar_Name:Any,en_Name:Any,
         categoryId:Any,category:Any,status:Any) {
        self.id = id
        self.ar_Name = ar_Name
        self.en_Name = en_Name
        self.categoryId = categoryId
        self.category = category
        self.status = status
    }
}
