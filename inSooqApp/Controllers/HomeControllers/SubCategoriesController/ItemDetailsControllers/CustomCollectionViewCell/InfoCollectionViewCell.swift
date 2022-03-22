//
//  InfoCollectionViewCell.swift
//  inSooqApp
//
//  Created by mohammad ahmad on 16/02/2021.
//

import UIKit

class InfoCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var mainView: UIView!
    
    @IBOutlet weak var iconImg: UIImageView!
    @IBOutlet weak var jobData: UILabel!
    @IBOutlet weak var icon: UILabel!
    @IBOutlet weak var data: UILabel!
   // @IBOutlet weak var title: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        icon.font=UIFont(name: "FontAwesome5Pro-Regular", size: 25)
       // addShadowView(object: mainView, cornerRadius: 5, color: #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1))
        objectCornerRadius(object: mainView, cornerRadius: 10)
        
    }
    func setInfoData(data:RowDataModel){
        self.icon.text=Statics.icons.house_icon
        self.data.text=data.data
        self.jobData.text=data.title
      //  self.title.text=data.title
    }

    func setJobInfo(data:RowDataModel){
        self.icon.text=Statics.icons.share_icon
        self.data.text=""
        self.jobData.text=data.data
      //  self.title.text=""
        
    }
    
    

    func setOpenningJob(data:RowDataModel){
        self.iconImg.image = data.icon
        self.data.text=""
        self.jobData.text = data.title + "     "  + data.data
      //  self.title.text=""
        
    }
}
