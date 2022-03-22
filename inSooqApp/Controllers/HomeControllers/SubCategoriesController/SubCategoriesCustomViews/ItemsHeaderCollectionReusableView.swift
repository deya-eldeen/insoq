//
//  ItemsHeaderCollectionReusableView.swift
//  inSooqApp
//
//  Created by mohammad ahmad on 18/05/2021.
//

import UIKit

class ItemsHeaderCollectionReusableView: UICollectionReusableView {
    @IBOutlet weak var headerLabel: UILabel!
    
    func setHeader (headerName: String){
        self.headerLabel.text = headerName
        
    }

}
