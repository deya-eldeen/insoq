//
//  WantedJobsCollectionViewCell.swift
//  inSooqApp
//
//  Created by mohammad ahmad on 08/04/2021.
//

import UIKit

class WantedJobsCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var jobTitle: UILabel!
    @IBOutlet weak var jobLocation: UILabel!
    @IBOutlet weak var jobExperiance: UILabel!
    @IBOutlet weak var jobType: UILabel!
    @IBOutlet weak var jobDate: UILabel!
    
    @IBOutlet weak var mainView: UIView!
    override func awakeFromNib() {
        super.awakeFromNib()
       // jobImage.layer.cornerRadius=30
        mainView.layer.cornerRadius=10
        mainView.addShadowToView()
    }
    func setJobData(data:WantedJobModel){

        jobTitle.text=data.jobTitle
        jobLocation.text=data.jobLocation
        jobExperiance.text=data.jobExperiance
        jobType.text=data.jobType
    }
   
}
