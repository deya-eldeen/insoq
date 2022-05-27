//
//  FreePackageCell.swift
//  inSooqApp
//
//  Created by Deya on 21/05/2022.
//

import UIKit

class FreePackageCell: UITableViewCell {

    static let id = "FreePackageCell"
    
    @IBOutlet weak var statusImageView: UIImageView!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        self.statusImageView.alpha = (selected) ? (1.0) : (0.5)
        
        // Configure the view for the selected state
    }
    
}
