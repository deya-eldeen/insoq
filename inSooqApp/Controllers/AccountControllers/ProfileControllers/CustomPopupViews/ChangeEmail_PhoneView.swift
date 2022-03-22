//
//  ChangeEmail_PhoneView.swift
//  inSooqApp
//
//  Created by mohammad ahmad on 20/04/2021.
//

import UIKit

class ChangeEmail_PhoneView: UIView {
    @IBOutlet weak var cancelButton: UIButton!
    
    @IBOutlet weak var phoneTxt
        : UILabel!
    @IBOutlet weak var contentView: UIView!
    
    @IBOutlet weak var sendCodeButton: UIButton!
    
    var vc:UIViewController?
    func setVC(viewController:UIViewController)
    {
        
        self.vc = viewController
        if ((viewController.isKind(of: MyProfileViewController.self)) )
        {
            debugPrint("vc:-",viewController)
            setDesign()
            enableBtns(enable: true)
        }
        
    }
    func setDesign(){
        objectShadow(object: phoneTxt, cornerRadius: 5)
    }

    func enableBtns(enable:Bool)
    {
        self.sendCodeButton.isEnabled=enable
        self.cancelButton.isEnabled=enable
        
    }
    func xibSetup() {
        
        Bundle.main.loadNibNamed("ChangeEmail_PhoneView", owner: self, options: nil)
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
