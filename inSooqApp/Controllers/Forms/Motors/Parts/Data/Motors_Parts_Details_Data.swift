//
//  Motors_Machinery_Parts_Details_Data.swift
//  inSooqApp
//
//  Created by Deya on 11/04/2022.
//

import UIKit

extension Motors_Parts_Details_VC {
    
    func formElements() -> [UIView] {
        
        let header = UIView()
        header.frame.size = .init(width: 0, height: 40)
        
        let adPreview = FormPreviewView().render()

        return [
            header,
            adPreview
        ]
        
    }
    
}
