//
//  WantedJobGridCollectionViewCell.swift
//  inSooqApp
//
//  Created by mohammad ahmad on 23/05/2021.
//

import UIKit

class WantedJobGridCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var favoriteButton: UIButton!
    @IBOutlet weak var jobTitle: UILabel!
    @IBOutlet weak var jobLocation: UILabel!
    @IBOutlet weak var jobPosition: UILabel!
    @IBOutlet weak var jobExperiance: UILabel!
    @IBOutlet weak var jobType: UILabel!
    @IBOutlet weak var jobDate: UILabel!
    var swipeHintDistance:CGFloat = 20
    var _isFavo:Bool=false
    @IBOutlet weak var mainView: UIView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        mainView.layer.cornerRadius=5
        mainView.addShadowToView()
        swipeHintDistance=mainView.frame.width/2

    }


    @IBAction func favo_Pressed(_ sender: Any)
    {
        if _isFavo{
            favoriteButton.setImage(UIImage(systemName: "heart.fill"), for: .normal)
            favoriteButton.tintColor=#colorLiteral(red: 1, green: 0.262745098, blue: 0.2235294118, alpha: 1)

        }else{
            favoriteButton.setImage(UIImage(systemName: "heart"), for: .normal)
            favoriteButton.tintColor=#colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)
        }
        _isFavo = !_isFavo
        
    }


    func setJobData(data:WantedJobModel){
        jobTitle.text=data.jobTitle
        jobLocation.text=data.jobLocation
        jobPosition.text=data.jobPositions
        jobType.text=data.jobType
        jobExperiance.text=data.jobExperiance
        jobDate.text=data.jobDate
    }
}
