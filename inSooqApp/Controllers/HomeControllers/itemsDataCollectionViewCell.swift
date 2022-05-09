//
//  itemsDataCollectionViewCell.swift
//  inSooqApp
//
//  Created by mohammad ahmad on 07/02/2021.
//

import UIKit
import Kingfisher

class itemsDataCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var shadowView: UIView!
    @IBOutlet weak var itemImage: UIImageView!
    
    @IBOutlet weak var itemName: UILabel!
    @IBOutlet weak var itemDescption: UILabel!
    @IBOutlet weak var itemPrice: UILabel!
    
    private let imageDefaultOrError = UIImage(named: "default_image")
    
    override  func awakeFromNib() {
        
        self.contentView.backgroundColor = .white
        itemImage.layer.cornerRadius = 10
        shadowView.addShadowToView()
        self.itemDescption.text = ""
        //itemImage.image = imageDefaultOrError
        
    }
    
    func setItemData(image:UIImage,name:String,price:String){
        self.itemImage.image = image
        self.itemName.text = name
        self.itemPrice.text = price
    }
    
    func setModel(model:AdsOfCategoryModel, categoryID:String){

        let imageURl = model.pictures?.filter{
            $0.mainPicture == true
        }
        
        if imageURl?.count ?? 0 > 0 {
            
            var imgUrlString:String = imageURl?[0].imageURL ?? ""
          
            if imgUrlString.contains("\\") {
                imgUrlString = imgUrlString.replacingOccurrences(of: "\\", with: "/")
                imgUrlString = imgUrlString.replacingOccurrences(of: " ", with: "%20")
            }

            debugPrint("imgUrlString:\(imgUrlString)")
            
            itemImage.kf.setImage(with: URL(string:imgUrlString ), placeholder: imageDefaultOrError, options:  [
                .transition(ImageTransition.fade(0.1))
            ], progressBlock: nil, completionHandler: {[weak self] result in
                switch result {
                case .success(let value):
                    break
                case .failure(let error):
                    self?.itemImage.image = self?.imageDefaultOrError
                }
            })
            
            itemImage.kf.setImage (
                with: URL(string:imgUrlString),
                options: [
                    .transition(ImageTransition.fade(0.1))
                ]
            )
            
        }
        
        let title = model.title?.stringValue ?? ""
        let location = model.en_Location?.stringValue ?? ""

    

        let kilometers = model.kilometers?.stringValue ?? ""
        let year = model.year?.stringValue ?? ""
        
        let category = AdMainType(rawValue: Int(categoryID) ?? 0)
        
        switch category {
        case .motor:
            
            let en_Maker = model.en_Maker?.stringValue ?? model.title?.stringValue ?? ""
            let en_Model = model.en_Model?.stringValue ?? model.subCategoryEn_Name?.stringValue ?? ""
            
            self.itemName.text = en_Maker + ", " + en_Model
            self.itemDescption.text = kilometers + "KM - " + year
            
        case .job:
            self.itemName.text = title
            self.itemDescption.text = location
        case .numbers:
            self.itemName.text = title
            self.itemDescption.text = location
        case .electronics:
            self.itemName.text = title
            self.itemDescption.text = location
        case .classified:
            self.itemName.text = title
            self.itemDescption.text = location
        case .services:
            self.itemName.text = title
            self.itemDescption.text = location
        case .business:
            self.itemName.text = title
            self.itemDescption.text = location
        case .none:
            self.itemName.text = title
            self.itemDescption.text = location
        case .some(.none):
            print("")
        }
        
        if model.price ?? 0  > 0 {
            self.itemPrice.text = model.price?.formattedPrice()
        }
        
    }
}

