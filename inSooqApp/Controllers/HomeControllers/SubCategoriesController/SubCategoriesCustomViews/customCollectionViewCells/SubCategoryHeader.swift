//
//  SubCategoryHeader.swift
//  inSooqApp
//
//  Created by mohammad ahmad on 08/02/2021.
//

import UIKit

class SubCategoryHeader: UITableViewHeaderFooterView {
    
    @IBOutlet weak var cancelButton: UIButton!
    @IBOutlet weak var categoryname: UILabel!
    @IBOutlet weak var categoryImage: UIImageView!
    @IBOutlet weak var viewToColor: UIView!
    
    func setCustomHeaders(image:UIImage,title:String,backgroundColor:String){
        self.categoryImage.image=image
        self.categoryname.text=title
        self.viewToColor.backgroundColor=UIColor(named: backgroundColor)
        
    }
    func enableBtns(enable:Bool)
    {
        self.cancelButton.isEnabled=enable
    }

}

   
