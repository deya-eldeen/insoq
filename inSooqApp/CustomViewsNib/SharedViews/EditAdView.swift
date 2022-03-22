//
//  EditAdView.swift
//  inSooqApp
//
//  Created by mohammad ahmad on 17/04/2021.
//

import UIKit

class EditAdView: UIView {


    @IBOutlet weak var continueButton: UIButton!
    @IBOutlet weak var resonsTableView: UITableView!
    
    @IBOutlet var contentView: UIView!
    var vc:UIViewController?
    func setVC(viewController:UIViewController)
    {
        
    }
    @IBAction func continue_Pressed(_ sender: Any) {
        guard let vc = self.vc else { return }
        showAlert(controller: vc, message: "EditAdView...", seconds: 1)
    }
    
    func xibSetup() {
        
        Bundle.main.loadNibNamed("EditAdView", owner: self, options: nil)
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
