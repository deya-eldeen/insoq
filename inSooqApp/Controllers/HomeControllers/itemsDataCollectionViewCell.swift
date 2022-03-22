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
        itemImage.layer.cornerRadius=10
        shadowView.addShadowToView()
        self.itemDescption.text = ""
//        itemImage.image = imageDefaultOrError

    }
    func setItemData(image:UIImage,name:String,price:String){
        self.itemImage.image=image
        self.itemName.text=name
        self.itemPrice.text=price
    }
    func setModel(model:AdsOfCategoryModel, categoryID:String){

        let imageURl = model.pictures?.filter{
            $0.mainPicture == true
        }
        
        if imageURl?.count ?? 0 > 0 {
            var imgUrlString:String = imageURl?[0].imageURL ?? ""
          
            if imgUrlString.contains("\\")
            {
                imgUrlString = imgUrlString.replacingOccurrences(of: "\\", with: "/")
                imgUrlString = imgUrlString.replacingOccurrences(of: " ", with: "%20")
            }

            debugPrint("imgUrlString:\(imgUrlString)")
            itemImage.kf.setImage(with: URL(string:imgUrlString ), placeholder: imageDefaultOrError, options:  [
                .transition(ImageTransition.fade(0.1))
            ], progressBlock: nil, completionHandler: {[weak self] result in
           
                switch result{
            case .success(let value):
                   break
               case .failure(let error):
                    self?.itemImage.image = self?.imageDefaultOrError

               }
                
            })
        itemImage.kf.setImage(
            
            with: URL(string:imgUrlString ),
            options: [
                .transition(ImageTransition.fade(0.1))
            ])
        }
        let title = model.title?.stringValue ?? ""
        let location = model.title?.stringValue ?? ""

    
        let en_Maker = model.en_Maker?.stringValue ?? ""
        let en_Model = model.en_Model?.stringValue ?? ""
        let kilometers = model.kilometers?.stringValue ?? ""
        let year = model.year?.stringValue ?? ""
        
        if categoryID == "1"{
        self.itemName.text = en_Maker + ", " + en_Model
        self.itemDescption.text = kilometers + "KM - " + year
        }
        else {
            self.itemName.text = title
            self.itemDescption.text = location
        }
        if model.price ?? 0  > 0 {
        self.itemPrice.text =  String(model.price ?? 0)
        }
    }
}

