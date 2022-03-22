//
//  ProfileTableViewCell.swift
//  inSooqApp
//
//  Created by mohammad ahmad on 04/04/2021.
//

import UIKit

class ProfileTableViewCell: UITableViewCell {

    @IBOutlet weak var iconLabel: UILabel!
    @IBOutlet weak var titleButton: UIButton!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)


    }


    func setData(){
        iconLabel.text
        
    }
}
