//
//  OrderSummaryTableViewCell.swift
//  inSooqApp
//
//  Created by mohammad ahmad on 25/02/2021.
//

import UIKit

class OrderSummaryTableViewCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    @IBOutlet weak var titleLable: UILabel!
    
    @IBOutlet weak var priceLabel: UILabel!
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    func setSummaryData(title : String,price:String){
        priceLabel.text=price
        titleLable.text=title
    }
}
