//
//  CellPopupListItme.swift
//  inSooqApp
//
//  Created by AOUN on 1/7/22.
//

import UIKit

class CellPopupListItme: UITableViewCell {

    var onClick:(() ->Void)?
    @IBOutlet weak var lblName: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBAction func actionClick(_ sender: Any) {
        onClick?()
    }
}
