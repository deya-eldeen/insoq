//
//  FIRAuthCodeView.swift
//  inSooqApp
//
//  Created by mohammad ahmad on 05/04/2021.
//

import UIKit
import  OTPFieldView

class FIRAuthCodeView: UIView{  // ,OTPFieldViewDelegate{
    @IBOutlet weak var contentView: UIView!
    @IBOutlet weak var cancelButton: UIButton!
    @IBOutlet weak var verifyButton: UIButton!
    @IBOutlet weak var resendButton: UIButton!
  //  @IBOutlet weak var otpTextFieldView: OTPFieldView!
    let timer=Timer()
    
    var vc:UIViewController?
    func setVC(viewController:UIViewController)
    {
        self.vc = viewController
        if ((viewController.isKind(of: MyProfileViewController.self)) )
        {
            debugPrint("vc:-",viewController)
            setDesign()
            enableBtns(enable: true)
           // setupOtpView()
        }
    }
    
    func setDesign(){
        objectCornerRadius(object: verifyButton, cornerRadius: verifyButton.height/2)
    }
    
    func enableBtns(enable:Bool)
    {
        self.resendButton.isEnabled=enable
        self.verifyButton.isEnabled=enable
        self.cancelButton.isEnabled=enable
        
    }
    
    func xibSetup() {
        
        Bundle.main.loadNibNamed("FIRAuthCodeView", owner: self, options: nil)
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
    @IBAction func resendCode(_ sender: Any) {
    }
    
    //MARK:-Functions
//    func setupOtpView(){
//        otpTextFieldView.becomeFirstResponder()
//        self.otpTextFieldView.fieldsCount = 6
//        self.otpTextFieldView.fieldBorderWidth = 2
//        self.otpTextFieldView.defaultBorderColor = #colorLiteral(red: 0.3333333433, green: 0.3333333433, blue: 0.3333333433, alpha: 1)
//        self.otpTextFieldView.filledBorderColor = UIColor.green
//        self.otpTextFieldView.cursorColor = #colorLiteral(red: 0.1437328833, green: 0.2071459947, blue: 1, alpha: 1)
//        self.otpTextFieldView.displayType = .underlinedBottom
//        self.otpTextFieldView.fieldSize = 35
//
//        self.otpTextFieldView.separatorSpace = 15
//        self.otpTextFieldView.shouldAllowIntermediateEditing = false
//        self.otpTextFieldView.delegate = self
//        self.otpTextFieldView.initializeUI()
//    }
    
//    func hasEnteredAllOTP(hasEnteredAll hasEntered: Bool) -> Bool {
//        print("Has entered all OTP? \(hasEntered)")
//        return false
//    }
//
//    func shouldBecomeFirstResponderForOTP(otpTextFieldIndex index: Int) -> Bool {
//        return true
//    }
    
//    func enteredOTP(otp otpString: String) {
//        print("OTPString: \(otpString)")
//        let code = otpString
//        debugPrint("OTP",code)
//        sendOTPCode(with: code)
//    }
//
    func validation(verificationCode:String)->Bool{
        if isConnectToInterNet(){
            return true
        }else{
            return false
        }
    }
    private func sendOTPCode(with code:String){
        // let verificationID = UserDefaults.standard.string(forKey: "authVerificationID")
        
        //MARK:-FIR Stuff-
        //MARK:-If Code is correct update Number to Server-
        //MARK:-If Code is Incorrect Show ActionAlert in MyProfileViewController-
        
        //        let credential = PhoneAuthProvider.provider().credential(withVerificationID: verificationID!, verificationCode: code)
        ///Send Code Request
        //        Auth.auth().signIn(with: credential){
        //            (authResult, error) in
        //            if error != nil
        //            {
        //                debugPrint(error!.localizedDescription as String)}
        //            else{
        //                debugPrint("authResult:- ",authResult?.credential)
        //                debugPrint("error:- ",error?.localizedDescription)
        //                debugPrint("credential:- ",authResult?.additionalUserInfo)
        //                debugPrint("User UID : \(String(describing: authResult?.user.uid))" )
        //                Statics.defaults.set(Auth.auth().currentUser!.uid, forKey: "userUID")
        //                pushtoViewController(viewController: self, storyBoardId: "ProfileData_SignupViewController", animate: true)
        //                }
        //            //}
        //        }
        
    }
    
}
