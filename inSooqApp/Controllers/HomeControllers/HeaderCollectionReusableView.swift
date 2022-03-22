//
//  HeaderCollectionReusableView.swift
//  inSooqApp
//
//  Created by mohammad ahmad on 07/02/2021.
//

import UIKit

class HeaderCollectionReusableView: UICollectionReusableView {
    @IBOutlet weak var headerLabel: UILabel!
    
    func setHeader (headerName: String){
        
        self.headerLabel.text = headerName
    }
}
