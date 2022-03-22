//
//  notificationsTableViewCell.swift
//  inSooqApp
//
//  Created by mohammad ahmad on 10/02/2021.
//

import UIKit

class notificationsTableViewCell: UITableViewCell {
    @IBOutlet weak var notificationImage: UIImageView!
    
    @IBOutlet weak var notificationTitle: UILabel!
    @IBOutlet weak var mainView: UIView!
    @IBOutlet weak var notificationTime: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        mainView.addShadowToView()
        notificationImage.layer.cornerRadius=5
        notificationImage.addShadowToView()

    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}
