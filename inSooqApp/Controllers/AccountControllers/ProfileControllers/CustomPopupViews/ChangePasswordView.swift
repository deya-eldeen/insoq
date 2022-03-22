//
//  ChangePasswordView.swift
//  inSooqApp
//
//  Created by mohammad ahmad on 30/03/2021.
//

import UIKit

class ChangePasswordView: UIView {

    @IBOutlet weak var confirmPassTxt: UITextField!
    @IBOutlet weak var passTxt: UITextField!
    @IBOutlet weak var oldPassTxt: UITextField!
    @IBOutlet weak var contentView: UIView!
    @IBOutlet weak var changePassButton: UIButton!
    
    
    var vc:UIViewController?
    func setVC(viewController:UIViewController)
    {
        
        self.vc = viewController
        if ((viewController.isKind(of: MyProfileViewController.self)) )
        {
            debugPrint("vc:-",viewController)
            setDesign()
            enableBtns(enable: true)
          ///  setupDataViews()
            ///add dunction to Calculate initiial Views height

        }
        
    }
    func setDesign(){
        objectShadow(object: oldPassTxt, cornerRadius: 5)
        objectShadow(object: passTxt, cornerRadius: 5)
        objectShadow(object: confirmPassTxt, cornerRadius: 5)
        objectCornerRadius(object: changePassButton, cornerRadius: changePassButton.height/2)
    }

    func enableBtns(enable:Bool)
    {
        self.changePassButton.isEnabled=enable
        
    }
    func xibSetup() {
        
        Bundle.main.loadNibNamed("ChangePasswordView", owner: self, options: nil)
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
    @IBAction func changePassword_Pressed(_ sender: Any) {
        if (oldPassTxt.text != passTxt.text) && (passTxt.text == confirmPassTxt.text){
            debugPrint("New Password:- ", passTxt.text)
          //  updatePasswordToServer()
        }else{
            //showActionAlert(with: self.vc, title: "Warning", body: <#T##String#>, actionTitle: <#T##String#>)
        }
    }
    
    
}
