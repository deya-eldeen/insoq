//
//  PropertyView.swift
//  inSooqApp
//
//  Created by mohammad ahmad on 10/02/2021.
//

import UIKit

class PropertyView: UIView {
    ///check if type = apartment show(itemDescLabel)
    ///else show (itemSqFtLabel,itemWcLabel,ItemRoomsLabel)
    
    @IBOutlet weak var itemDescLabel: UILabel!
    @IBOutlet weak var itemSqFtLabel: UILabel!
    @IBOutlet weak var itemWcLabel: UILabel!
    @IBOutlet weak var ItemRoomsLabel: UILabel!
    @IBOutlet weak var itemPriceLabel: UILabel!
    @IBOutlet weak var itemLocationLabel: UILabel!
    @IBOutlet weak var itemNameLabel: UILabel!
    @IBOutlet var contentView: UIView!

    
    func setViewData(propertyObject:PropertyModel){
    
        itemDescLabel.text=propertyObject.itemDescLabel
        itemSqFtLabel.text=propertyObject.itemSqFtLabel
        itemWcLabel.text=propertyObject.itemWcLabel
        ItemRoomsLabel.text=propertyObject.ItemRoomsLabel
        itemPriceLabel.text=propertyObject.itemPriceLabel
        itemLocationLabel.text=propertyObject.itemLocationLabel
        itemNameLabel.text=propertyObject.itemNameLabel
       // itemTypeLabel.text=propertyObject.itemTypeLabel
    }
 
    func xibSetup() {
        
        Bundle.main.loadNibNamed("PropertyView", owner: self, options: nil)
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
    
}
