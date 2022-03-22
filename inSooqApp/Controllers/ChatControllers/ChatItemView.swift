//
//  chatItemView.swift
//  inSooqApp
//
//  Created by mohammad ahmad on 30/03/2021.
//

import UIKit
//MARK:-ExampleModel-
struct ItemModel{
    var itemImage:String
    var itemName:String
    var itemDate:String
    var itemPrice:String
    //var contactInfo:UserDataModel
}

class ChatItemView: UIView {
    @IBOutlet weak var itemImage: UIImageView!
    @IBOutlet var contentView: UIView!
    @IBOutlet weak var itemName: UILabel!
    @IBOutlet weak var itemPrice: UILabel!
    @IBOutlet weak var viewAddButton: UIButton!
    @IBOutlet weak var postDate: UILabel!
    
    func xibSetup() {
        Bundle.main.loadNibNamed("ChatItemView", owner: self, options: nil)
        contentView.frame = bounds
        contentView.autoresizingMask =
            [.flexibleWidth, .flexibleHeight]
        addSubview(contentView)
        
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
        xibSetup()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        xibSetup()
        
    }

    func setItemView(data:ItemModel){
        
        
    }
    
    
}
