//
//  PaidPackageCell.swift
//  inSooqApp
//
//  Created by Deya on 21/05/2022.
//

import UIKit

class PaidPackageCell: UITableViewCell {

    static let id = "PaidPackageCell"
    
    @IBOutlet weak var packageNameLabel: UILabel!
    @IBOutlet weak var packagePriceLabel: UILabel!

    @IBOutlet weak var statusImageView: UIImageView!
    @IBOutlet weak var planIconView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        self.statusImageView.alpha = (selected) ? (1.0) : (0.5)
    }
    
    func renderCell(name: String, price: Double, imageUrl: String) {
        self.packageNameLabel.text = name
        self.packagePriceLabel.text = "\(price) AED"
        
        if let url = URL(string: imageUrl) {
            self.planIconView.kf.setImage(with: url)
        }
        
    }
    
    
}
