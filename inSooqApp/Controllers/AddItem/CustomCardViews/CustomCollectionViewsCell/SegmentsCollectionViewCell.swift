//
//  SegmentsCollectionViewCell.swift
//  inSooqApp
//
//  Created by mohammad ahmad on 14/04/2021.
//

import UIKit

class SegmentsCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var backview: UIView!
    @IBOutlet weak var segmentTitle: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        objectCornerRadius(object: backview, cornerRadius: backview.height/2)
    }
    override var isSelected: Bool {
        didSet {
            self.backview.backgroundColor = isSelected ? #colorLiteral(red: 0.3411764706, green: 0.2745098039, blue: 0.9882352941, alpha: 1) : #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
            self.segmentTitle.textColor = isSelected ? #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1) : #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
        }
    }
    func setTitle(title:String){
        self.segmentTitle.text = title
    }
}
