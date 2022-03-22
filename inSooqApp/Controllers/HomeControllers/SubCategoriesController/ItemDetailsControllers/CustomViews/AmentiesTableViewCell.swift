//
//  AmentiesTableViewCell.swift
//  inSooqApp
//
//  Created by mohammad ahmad on 15/02/2021.
//

import UIKit

class AmentiesTableViewCell: UITableViewCell {
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var info: UILabel!
    
    @IBOutlet weak var borderView2: UIView!
    @IBOutlet weak var borderview: UIView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        borderview.addBorders( borderColor: #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1))
        borderView2.addBorders( borderColor: #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1))
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
    func setAmentiesData(data: RowDataModel){
        self.title.text=data.title
        self.info.text=data.data
    
    }
}
