//
//  notificationsTableViewCell.swift
//  inSooqApp
//
//  Created by mohammad ahmad on 10/02/2021.
//

import UIKit

protocol NotificationTableViewCellDelegate {
    func deleteAd(id: Int)
}

class notificationsTableViewCell: UITableViewCell {
    
    @IBOutlet weak var notificationImage: UIImageView!
    
    @IBOutlet weak var notificationTitle: UILabel!
    @IBOutlet weak var mainView: UIView!
    @IBOutlet weak var notificationTime: UILabel!
    
    var adID = 0
    
    var delegate: NotificationTableViewCellDelegate?
    
    @IBAction func didTapDelete() {
        delegate?.deleteAd(id: self.adID)
    }
    
    override func prepareForReuse() {
        notificationImage.sd_cancelCurrentImageLoad()
        notificationImage.image = nil
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        mainView.addShadowToView()
        notificationImage.layer.cornerRadius=5
        notificationImage.addShadowToView()

    }

    func renderCell(item: NotificationModel) {
        self.adID = item.id ?? 0
        
        notificationTitle.text = item.message
        notificationTime.text = item.date
        notificationImage.setImage(url: item.imageUrl?.fullImageUrl() ?? "")
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}
