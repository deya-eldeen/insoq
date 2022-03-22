//
//  AdsCollectionViewCell.swift
//  inSooqApp
//
//  Created by mohammad ahmad on 07/02/2021.
//

import UIKit

class AdsCollectionViewCell: UICollectionViewCell {
    
    override func layoutSubviews() {
       }
   @IBOutlet weak var adsImage: UIImageView!
   
    @IBOutlet weak var explorButton: UIButton!
    @IBOutlet weak var titleLbl: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        explorButton.layer.cornerRadius=explorButton.frame.height/2
        adsImage.layer.cornerRadius=5
        explorButton.backgroundColor=#colorLiteral(red: 0.4470588235, green: 0.3333333333, blue: 0.9450980392, alpha: 1)
        
    }

    func setAdsData(image:UIImage){
        adsImage.image=image
    }
    
//      func setAdsData( data : AdsData){
//
//       switch API.lang {
//       case "ar":
//           titleLbl.text = data.titleAr
//           decLbl.text = data.descriptionAr
//           break
//       case "ru":
//           titleLbl.text = data.titleRu
//           decLbl.text = data.descriptionRu
//
//       default:
//           titleLbl.text = data.titleEn
//           decLbl.text = data.descriptionEn
//
//       }
//       if(data.image != "")
//       { let imageUrlString = data.image
//
//           guard let imageUrl:URL = URL(string: Session.baseUrl+imageUrlString)
//               else{return}
//           adsImage.loadImge(withUrl: imageUrl)
//       }
//       else
//       {
//           adsImage.image = #imageLiteral(resourceName: "noImage")
//       }
//       }

}
