//
//  ItemDetailsCollectionViewCell.swift
//  inSooqApp
//
//  Created by mohammad ahmad on 08/06/2021.
//

import UIKit

class ItemDetailsCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var scrollViewHeightConstraint: NSLayoutConstraint!
    
    @IBOutlet weak var scrollview: UIScrollView!
    @IBOutlet weak var mainView: UIView!
    override func awakeFromNib() {
        super.awakeFromNib()

    }

    @IBAction func btnPresssed(_ sender: Any) {
        scrollViewHeightConstraint.constant+=100
        let bottomOffset = CGPoint(x: 0, y: scrollview.contentSize.height - scrollview.bounds.height + scrollview.contentInset.bottom)
        scrollview.setContentOffset(bottomOffset, animated: true)
    }
    func  setDetailsView(viewController:UIViewController){
    }

    func setViewColor(color:UIColor){
    mainView.backgroundColor=color
    }
}
