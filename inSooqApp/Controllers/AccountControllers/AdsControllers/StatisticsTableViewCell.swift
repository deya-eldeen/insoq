//
//  StatisticsTableViewCell.swift
//  inSooqApp
//
//  Created by mohammad ahmad on 06/04/2021.
//

import UIKit
struct StatisticsModel {
    var icon:String?
    var title:String?
    var body:String?
    var value:String?
}
class StatisticsTableViewCell: UITableViewCell {
    @IBOutlet weak var valueLabel: UILabel!
    
    @IBOutlet weak var bodyLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var iconLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        labelFont(object: iconLabel, style: "Regular", size: 25)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
     func setStatisticsData(data:StatisticsModel){
        iconLabel.text=data.icon
        titleLabel.text=data.title
        bodyLabel.text=data.body
        valueLabel.text=data.value
    }

}
