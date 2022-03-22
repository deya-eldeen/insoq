//
//  ChatsTableViewHeader.swift
//  inSooqApp
//
//  Created by mohammad ahmad on 19/05/2021.
//

import UIKit

class ChatsTableViewHeader: UITableViewHeaderFooterView {
    @IBOutlet weak var sectionTitle: UILabel!
    
    func setCustomHeaders(sectionTitle:String){
        self.sectionTitle.text=sectionTitle
        
    }

}
