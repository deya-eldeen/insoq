//
//  ItemDataModel.swift
//  inSooqApp
//
//  Created by mohammad ahmad on 09/06/2021.
//

import Foundation

class ItemsDataModel : NSObject, NSCoding {

    var id : String = ""
    var item_no : String = ""
    var subcategoryId:String = ""
    var titleAr : String = ""
    var titleEn : String = ""
    var descriptionAr:String = ""
    var descriptionEn:String = ""
    var price:String = ""
    var categoryAr:String = ""
    var categoryEn:String = ""
    var subcategoryAr:String = ""
    var subcategoryEn:String = ""
    var image : String = ""
    var status : String = ""
    
    var image_item = [ItemImages]()
    
    init (id: String ,item_no:String? ,subcategoryId:String,titleAr : String?,titleEn : String,descriptionAr:String? , descriptionEn:String?,price:String,categoryAr:String?,categoryEn:String?,subcategoryAr:String?,subcategoryEn:String?,status : String?, image : String?,images:[ItemImages]){
        self.id = id
        self.item_no=item_no ?? ""
        self.subcategoryId=subcategoryId
        self.titleAr = titleAr ?? ""
        self.titleEn = titleEn
        self.descriptionAr=descriptionAr ?? ""
        self.descriptionEn=descriptionEn ?? ""
        self.price=price
        self.categoryAr=categoryAr ?? ""
        self.categoryEn=categoryEn ?? ""

        self.subcategoryAr=subcategoryAr ?? ""
        self.subcategoryEn=subcategoryEn ?? ""
        self.status = status ?? ""
        self.image = image ?? ""
        self.image_item=images
    }
    func encode(with coder: NSCoder) {
        coder.encode(self.id, forKey: "id")
        coder.encode(self.item_no, forKey: "item_no")
        coder.encode(self.subcategoryId, forKey: "subcategoryId")
        coder.encode(self.titleAr, forKey: "titleAr")
        coder.encode(self.titleEn, forKey: "titleEn")
        coder.encode(self.descriptionAr, forKey: "descriptionAr")
        coder.encode(self.descriptionEn, forKey: "descriptionEn")
        coder.encode(self.price, forKey: "price")
        coder.encode(self.categoryAr, forKey: "categoryAr")
        coder.encode(self.categoryEn, forKey: "categoryEn")
        coder.encode(self.subcategoryAr, forKey: "subcategoryAr")
        coder.encode(self.subcategoryEn, forKey: "subcategoryEn")
        coder.encode(self.status, forKey: "status")
        coder.encode(self.image, forKey: "image")
        coder.encode(self.image_item, forKey: "image_item")

    }

    required init?(coder: NSCoder) {
        self.id = coder.decodeObject(forKey: "id")as? String ?? "-0"
        self.item_no = coder.decodeObject(forKey: "item_no")as? String ?? "-0"
        self.subcategoryId = coder.decodeObject(forKey: "subcategoryId")as? String ?? "-0"
        self.titleAr = coder.decodeObject(forKey: "titleEn")as? String ?? "-0"
        self.titleEn = coder.decodeObject(forKey: "id")as? String ?? "-0"
        self.descriptionAr = coder.decodeObject(forKey: "descriptionAr")as? String ?? "-0"
        self.descriptionEn = coder.decodeObject(forKey: "descriptionEn")as? String ?? "-0"
        self.price = coder.decodeObject(forKey: "price")as? String ?? "-0"
        self.categoryAr = coder.decodeObject(forKey: "categoryAr")as? String ?? "-0"
        self.categoryEn = coder.decodeObject(forKey: "categoryEn")as? String ?? "-0"
        self.subcategoryAr = coder.decodeObject(forKey: "subcategoryAr")as? String ?? "-0"
        self.subcategoryEn = coder.decodeObject(forKey: "subcategoryEn")as? String ?? "-0"
        self.status = coder.decodeObject(forKey: "status")as? String ?? "-0"
        self.image = coder.decodeObject(forKey: "image")as? String ?? "-0"
        self.image_item=(coder.decodeObject(forKey: "image_item")as? [ItemImages])!
    }
    
}

class ItemImages: NSObject, NSCoding {
    var id : String = ""
    var itemsId : String = ""
    var image : String = ""
    var status : String = ""

    init (id: String ,itemsId : String,status : String, image : String){
        self.id = id
        self.itemsId = itemsId
        self.status = status
        self.image = image
    }
    func encode(with coder: NSCoder) {
        coder.encode(self.id, forKey: "id")
        coder.encode(self.itemsId, forKey: "itemsId")
        coder.encode(self.status, forKey: "status")
        coder.encode(self.image, forKey: "image")

    }
    required init?(coder: NSCoder) {
        self.id = coder.decodeObject(forKey: "id")as? String ?? "-0"
        self.itemsId = coder.decodeObject(forKey: "itemsId")as? String ?? "itemsId-0"
        self.status = coder.decodeObject(forKey: "status")as? String ?? "status-0"
        self.image = coder.decodeObject(forKey: "image")as? String ?? "image-0"
    }
}
