//
//  JobsDashBoardTableViewCell.swift
//  inSooqApp
//
//  Created by mohammad ahmad on 20/05/2021.
//

import UIKit

class JobsDashBoardTableViewCell: UITableViewCell {
    @IBOutlet weak var shadowView: UIView!
    @IBOutlet weak var jobImage: UIImageView!
    @IBOutlet weak var getMoreViewsButton: UIButton!
    var swipeHintDistance:CGFloat = 20

    @IBOutlet weak var mainView: UIView!
    override func awakeFromNib() {
        super.awakeFromNib()
        objectCornerRadius(object: jobImage, cornerRadius: jobImage.height/2)
        objectCornerRadius(object: shadowView, cornerRadius: shadowView.height/2)
        shadowView.addShadowToView()

    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
 
    private func slideInFromRight() {
        UIView.animate(withDuration: 0.5, delay: 0.3, options: [.curveEaseOut], animations: {
            //if we add - :=> -self.swipeHintDistance well slideInFromRight
            ///but for now leave it slideInFromLeft x2 cuz we have no buttons left
            self.mainView.transform = CGAffineTransform(translationX: -self.swipeHintDistance/2, y: 0)
            self.mainView.layer.cornerRadius = 10
        }) { (success) in
            UIView.animate(withDuration: 0.2, delay: 0, options: [.curveLinear], animations: {
                self.mainView.transform = .identity
            }, completion: { (success) in
                // Slide from left if you have leading swipe actions
                self.slideInFromLeft()
            })
        }
    }
    func animateSwipeHint() {
        slideInFromRight()
    }

    private func slideInFromLeft() {
        UIView.animate(withDuration: 0.5, delay: 0, options: [.curveEaseOut], animations: {
            self.mainView.transform = CGAffineTransform(translationX: self.swipeHintDistance/3, y: 0)
        }) { (success) in
            UIView.animate(withDuration: 0.2, delay: 0, options: [.curveLinear], animations: {
                self.mainView.transform = .identity
            })
        }
    }

}
