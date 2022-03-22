//
//  MotorsSpecificationCollectionViewCell.swift
//  inSooqApp
//
//  Created by mohammad ahmad on 11/02/2021.
//

import UIKit
struct RowDataModel {
    var icon:UIImage
    var textIcon:FontAwesomeIcons!
    var title:String
    var data:String
}
class MotorsSpecificationCollectionViewCell: UITableViewCell {
    @IBOutlet weak var rowTitle: UILabel!
    @IBOutlet weak var rowIcon: UILabel!
    @IBOutlet weak var rowData: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()

        rowIcon.font=UIFont(name: "FontAwesome5Pro-Regular", size: 15)
    }
    func setRowData(data: RowDataModel){
        rowIcon.text=Statics.icons.heart_icon
        rowData.text=data.data
        rowTitle.text=data.title
    }
    func setServicesRowData(data: RowDataModel){
        rowIcon.text=""
        rowData.text=""
        rowTitle.text=data.title
    }
}
