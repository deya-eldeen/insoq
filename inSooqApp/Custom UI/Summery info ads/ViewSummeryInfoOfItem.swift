//
//  ViewSummeryInfoOfItem.swift
//  inSooqApp
//
//  Created by AOUN on 1/7/22.
//

import UIKit

class ViewSummeryInfoOfItem: UIView {
    let nibName = "ViewSummeryInfoOfItem"
      var contentView: UIView?
    //
    @IBOutlet weak var imgVItem: UIImageView!
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var lblLocation: UILabel!
    @IBOutlet weak var lblMileage: UILabel!
    @IBOutlet weak var lblCarYear: UILabel!
    @IBOutlet weak var lblPrice: UILabel!
    @IBOutlet weak var lblTimeDays: UILabel!
    @IBOutlet weak var imgFavorite: UIImageView!
    
    @IBAction func favoriteAction(_ sender: Any) {
    }
    
    required init?(coder aDecoder: NSCoder) {
         super.init(coder: aDecoder)

         guard let view = loadViewFromNib() else { return }
         view.frame = self.bounds
         self.addSubview(view)
         contentView = view
     }

     func loadViewFromNib() -> UIView? {
         let bundle = Bundle(for: type(of: self))
         let nib = UINib(nibName: nibName, bundle: bundle)
         return nib.instantiate(withOwner: self, options: nil).first as? UIView
     }
    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
