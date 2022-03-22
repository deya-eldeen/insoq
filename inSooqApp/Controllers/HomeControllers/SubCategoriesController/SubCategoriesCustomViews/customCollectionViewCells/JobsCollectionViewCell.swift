//
//  JobsCollectionViewCell.swift
//  inSooqApp
//
//  Created by mohammad ahmad on 10/02/2021.
//

import UIKit

class JobsCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var jobImage: UIImageView!
    @IBOutlet weak var jobTitle: UILabel!
    @IBOutlet weak var companyName: UILabel!
    @IBOutlet weak var jobSalary: UILabel!
    @IBOutlet weak var jobType: UILabel!
    @IBOutlet weak var shadowView: UIView!
    
    @IBOutlet weak var mainView: UIView!
    override func awakeFromNib() {
        super.awakeFromNib()
       // jobImage.layer.cornerRadius=30
        mainView.layer.cornerRadius=10
        mainView.addShadowToView()
       // jobImage.addShadowToView()
        objectShadow(object: jobImage, cornerRadius: jobImage.height/2)
        objectShadow(object: shadowView, cornerRadius: jobImage.height/2)

    }
    func setJobData(data:JobModel){
        debugPrint("jobImage.frame",jobImage.frame.height,jobImage.frame.width)

        jobImage.image=#imageLiteral(resourceName: "car2.jpeg")//data.jobImage
        jobTitle.text=data.jobTitle
        companyName.text=data.companyName
        jobSalary.text=data.jobSalary
        jobType.text=data.jobType
    }
   
}
