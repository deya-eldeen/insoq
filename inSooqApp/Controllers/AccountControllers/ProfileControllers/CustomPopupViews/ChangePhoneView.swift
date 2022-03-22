//
//  ChangePhoneView.swift
//  inSooqApp
//
//  Created by mohammad ahmad on 30/03/2021.
//

import UIKit

class ChangePhoneView: UIView {
    @IBOutlet weak var cancelButton: UIButton!
    
    @IBOutlet weak var phoneTxt
        : UITextField!
    @IBOutlet weak var contentView: UIView!
    @IBOutlet weak var countryCodeButton: UIButton!
    
    @IBOutlet weak var changePhoneButton: UIButton!
    
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
        objectShadow(object: phoneTxt, cornerRadius: 5)
        countryCodeButton.addBorders(borderColor: #colorLiteral(red: 0.7332749623, green: 0.7332749623, blue: 0.7332749623, alpha: 1))
        objectShadow(object: countryCodeButton, cornerRadius: 5)
        objectCornerRadius(object: changePhoneButton, cornerRadius: changePhoneButton.height/2)
    }

    func enableBtns(enable:Bool)
    {
        self.changePhoneButton.isEnabled=enable
        self.cancelButton.isEnabled=enable
        
    }
    func xibSetup() {
        
        Bundle.main.loadNibNamed("ChangePhoneView", owner: self, options: nil)
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
    
    @IBAction func changePhone_pressed(_ sender: Any) {
        if let code:String = countryCodeButton.titleLabel?.text
           , let phone:String = phoneTxt.text
        {
            let safePhone = code+phone
        MyProfileViewController._NewPhone=safePhone
            debugPrint("inCustom View",safePhone)
        }
    }
}
