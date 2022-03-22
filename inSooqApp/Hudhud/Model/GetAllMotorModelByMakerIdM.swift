//
//  GetAllMotorModelByMakerIdM.swift
//  inSooqApp
//
//  Created by Mohammad Jawher on 20/03/2022.
//

import Foundation
import SwiftyJSON

class GetAllMotorModelByMakerIdM {
    var id : Any
    var ar_Text : Any
    var en_Text : Any
    var makerId : Any
    var maker : Any
    
    
    init(id:Any,ar_Text:Any,en_Text:Any,makerId:Any,maker:Any) {
        self.id = id
        self.ar_Text = ar_Text
        self.en_Text = en_Text
        self.makerId = makerId
        self.maker = maker
    }
    
}
