//
//  CustomSectionHeader.swift
//  CustomSectionHeader
//
//  Created by Onur Tuna on 12.02.2019.
//  Copyright © 2019 onurtuna. All rights reserved.
//

import UIKit

class CustomSectionHeader: UITableViewHeaderFooterView {

    @IBOutlet weak var itemImage: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var viewAllButton: UIButton!
    
    func setCustomHeaders(image:UIImage?,title:String){
        if image==nil{
            self.itemImage.isHidden=true
            itemImage.widthAnchor.constraint(equalToConstant: 0).isActive=true
        }
        else{
            self.itemImage.image=image
        }
        self.titleLabel.text=title
        
    }
    func enableBtns(enable:Bool)
    {
        self.viewAllButton.isEnabled=enable
    }
    
}
//    func setUpHeaderView(data:HomeItemsModel){// ProductsFS ){
//        debugPrint("data.itemList.count")
//
//       // if Statics.appLanguage=="ar"{titleLabel.text=data.titleAr }
////        else{titleLabel.text=data.titleEn}
//        titleLabel.text="Data"
//
//
//
//
//        if(data.image != "")
//
//        { let imageUrlString = data.image
//
//            guard let imageUrl:URL = URL(string: Session.baseUrl+imageUrlString)
//            else{return}
//            itemImage.loadImge(withUrl: imageUrl)
//        }
//        else
//        {
//            itemImage.image = UIImage(systemName: "camera")}
//    }
