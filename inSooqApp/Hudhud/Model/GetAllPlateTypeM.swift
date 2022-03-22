//
//  GetAllPlateTypeM.swift
//  inSooqApp
//
//  Created by Mohammad Jawher on 18/03/2022.
//

import Foundation
import SwiftyJSON

class GetAllPlateTypeM {
    var id : Any
    var ar_Text : Any
    var en_Text : Any
    var emirateId : Any
    var emirate : Any
    
    
    init(id:Any,ar_Text:Any,en_Text:Any,emirateId:Any,emirate:Any) {
        self.id = id
        self.ar_Text = ar_Text
        self.en_Text = en_Text
        self.emirateId = emirateId
        self.emirate = emirate
    }
    
}
