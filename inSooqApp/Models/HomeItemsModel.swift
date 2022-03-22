//
//  HomeItemsModel.swift
//  inSooqApp
//
//  Created by mohammad ahmad on 07/02/2021.
//

import Foundation
import UIKit


class CategoriesItemsModel: NSObject{
    var subCategoryList : [ItemsModel]
    var categoryName : String
    var categoryId : String
    var categoryImage = UIImage()
    init (categoryName : String , categoryId : String,subCategoryList:[ItemsModel] ){
        self.categoryId=categoryId
        self.categoryName=categoryName
        self.subCategoryList=subCategoryList
    }

}
class ItemsModel : NSObject{
    var itemName = ""
    var itemId = ""
    var image = #imageLiteral(resourceName: "car3.jpeg")
    init (itemName : String , itemId : String ){
        self.itemId=itemId
        self.itemName=itemName
    }
}

