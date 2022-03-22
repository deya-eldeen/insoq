//
//  ChangeEmailView.swift
//  inSooqApp
//
//  Created by mohammad ahmad on 05/04/2021.
//

import UIKit

class ChangeEmailView: UIView {

    @IBOutlet weak var cancelButton: UIButton!
    @IBOutlet weak var verifyButton: UIButton!
    
    @IBOutlet weak var emailTxt: UITextField!
    
    @IBOutlet var contentView: UIView!
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
        objectCornerRadius(object: verifyButton, cornerRadius: verifyButton.height/2)
        objectShadow(object: emailTxt, cornerRadius: 5)
    }
    
    func enableBtns(enable:Bool)
    {
        self.verifyButton.isEnabled=enable
        self.cancelButton.isEnabled=enable
        
    }
    
    func xibSetup() {
        
        Bundle.main.loadNibNamed("ChangeEmailView", owner: self, options: nil)
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
