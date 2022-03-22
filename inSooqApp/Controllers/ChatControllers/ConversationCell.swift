//
//  ConversationCell.swift
//  inSooqApp
//
//  Created by mohammad ahmad on 29/03/2021.
//

import UIKit

class ConversationCell: UITableViewCell {

    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var seenView: UIView!
    @IBOutlet weak var lastMessage: UILabel!
    @IBOutlet weak var chatTitle: UILabel!
    @IBOutlet weak var chatImage: UIImageView!
    @IBOutlet weak var mainView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        objectCornerRadius(object: mainView, cornerRadius: 10)
        mainView.addShadowToView()

        objectCornerRadius(object: seenView, cornerRadius: seenView.width/2)
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)


    }
    //Set Conversations Model
    func setConversations(){
        
    }
    
}
