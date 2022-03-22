//
//  SignUpViewController.swift
//  inSooqApp
//
//  Created by mohammad ahmad on 31/03/2021.
//

import UIKit
import Alamofire
import Firebase

class SignUpViewController: UIViewController {
    @IBOutlet weak var nameTxt: UITextField!
    @IBOutlet weak var passwordTxt: UITextField!
    @IBOutlet weak var emailTxt: UITextField!
    @IBOutlet weak var phoneTxt: UITextField!
    
    @IBOutlet weak var validateEmail_Icon: UIImageView!
    @IBOutlet weak var agree_Button: UIButton!
    @IBOutlet weak var gmail_Button: UIButton!
    @IBOutlet weak var facebook_Button: UIButton!
    @IBOutlet weak var signin_Button: UIButton!
    @IBOutlet weak var lblTerms: UILabel!
    @IBOutlet weak var lblprivacy: UILabel!
    
    private var _agreed:Bool=true
    let text = "By Signing up I agree on Terms & Conditions &"
    let text2 = "Privacy Policy."

    override func viewDidLoad() {
        super.viewDidLoad()

        setGradientBackground(view: view, colorTop: #colorLiteral(red: 0.5490196078, green: 0.3882352941, blue: 0.9058823529, alpha: 1), colorBottom: #colorLiteral(red: 0.3411764706, green: 0.2745098039, blue: 0.9882352941, alpha: 1))
    }
    
    override func viewWillAppear(_ animated: Bool) {
        setDesign()
        setTapGesture()
        
    }
    
    //MARK:-Private Methods-
    private func setTapGesture(){
        self.signin_Button.addTarget(self, action: #selector(self.signinAction), for: .touchUpInside)
        self.facebook_Button.addTarget(self, action: #selector(self.facebookAction), for: .touchUpInside)
        self.gmail_Button.addTarget(self, action: #selector(self.gmailAction), for: .touchUpInside)
    //    self.agree_Button.addTarget(self, action: #selector(self.agreeAction), for: .touchUpInside)
    }
    
    
    @objc func joinChange(){
        if EmailCheck(emailStr: emailTxt.text ?? "nil")
        {
            debugPrint("text",emailTxt.text)
            validateEmail_Icon.image=#imageLiteral(resourceName: "valid_icon")
        }else{
            debugPrint("image",emailTxt.text)

            validateEmail_Icon.image=#imageLiteral(resourceName: "invalid_icon")
        }

    }
   private func setDesign(){
   // emailTxt.delegate=self
    debugPrint("facebook_Button.frame.height",facebook_Button.height)
    debugPrint("facebook_Button.frame.height",facebook_Button.height/2)
    emailTxt.addTarget(self, action: #selector(self.joinChange), for: .editingChanged)
    objectCornerRadius(object: gmail_Button, cornerRadius: gmail_Button.height/2)
    objectCornerRadius(object: facebook_Button, cornerRadius: facebook_Button.height/2)
    objectCornerRadius(object: signin_Button, cornerRadius: signin_Button.height/2)
    buttonFont(object: agree_Button,size: 20, style: "Regular")
    agree_Button.setTitle(Statics.icons.checkSquare_icon, for: .normal)
  
    lblTerms.text = text
    lblprivacy.text = text2
    self.lblTerms.textColor =  #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
    self.lblTerms.textColor =  #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
    let underlineAttriString = NSMutableAttributedString(string: text)
    let underlineAttriString2 = NSMutableAttributedString(string: text2)
    let range1 = (text as NSString).range(of: "Terms & Conditions")
    let range2 = (text2 as NSString).range(of: "Privacy Policy.")
  
    underlineAttriString.addAttribute(NSAttributedString.Key.underlineStyle, value: NSUnderlineStyle.single.rawValue, range: range1)
    underlineAttriString.addAttribute(NSAttributedString.Key.font, value: UIFont(name: "Arial", size: 12), range: range1)
    underlineAttriString.addAttribute(NSAttributedString.Key.foregroundColor, value: UIColor.white, range: range1)
  
    underlineAttriString2.addAttribute(NSAttributedString.Key.underlineStyle, value: NSUnderlineStyle.single.rawValue, range: range2)
    underlineAttriString2.addAttribute(NSAttributedString.Key.font, value: UIFont(name: "Arial", size: 12), range: range2)
    underlineAttriString2.addAttribute(NSAttributedString.Key.foregroundColor, value: UIColor.white, range: range2)
    lblprivacy.attributedText = underlineAttriString2
    lblprivacy.isUserInteractionEnabled = true
    lblprivacy.addGestureRecognizer(UITapGestureRecognizer(target:self, action: #selector(tapLabel2(gesture:))))
    

    lblTerms.attributedText = underlineAttriString
    lblTerms.isUserInteractionEnabled = true
    lblTerms.addGestureRecognizer(UITapGestureRecognizer(target:self, action: #selector(tapLabel(gesture:))))

   }
    
//MARK:-Actions
    
  @objc  func tapLabel2(gesture: UITapGestureRecognizer) {
       // comment for now
       let privacyRange = (text2 as NSString).range(of: "Privacy Policy")
    if gesture.didTapAttributedTextInLabel(label: lblprivacy, inRange: privacyRange)
       {
        privacyAction()
           print("Tapped privacy")
       }
    else {
           print("Tapped none")
       }
    }
    
  @objc  func tapLabel(gesture: UITapGestureRecognizer) {
       let termsRange = (text as NSString).range(of: "Terms & Conditions")

       if gesture.didTapAttributedTextInLabel(label: lblTerms, inRange: termsRange) {
           print("Tapped terms")
            termsAction()
       }
    else {
           print("Tapped none")
       }
    }
    @objc func signinAction(){
        validateData()
    }
    ///apply facebook bulk
    @objc func facebookAction(){
        
    }
    ///apply gmail bulk
    @objc func gmailAction(){

        
    }
    ///preform segue
    @objc func privacyAction(){
        Terms_PrivacyViewController.index=0
        Terms_PrivacyViewController._hideBottomView=true
       forcePresentViewController(viewController: self, storyBoardId: "Terms_PrivacyViewController")
    }
    ///preform segue
    @objc func termsAction(){
        Terms_PrivacyViewController.index=1
        Terms_PrivacyViewController._hideBottomView=true
        forcePresentViewController(viewController: self, storyBoardId: "Terms_PrivacyViewController")
    }

    private func validateData(){
        SendVerificationCode(phone: phoneTxt.text ?? "")
    }

}
extension SignUpViewController:UITextFieldDelegate{
    func textFieldDidBeginEditing(_ textField: UITextField) {
        if EmailCheck(emailStr: emailTxt.text ?? "nil")
        {
            debugPrint("text",textField.text)
            validateEmail_Icon.image = #imageLiteral(resourceName: "checked_checkbox")
        }else{
            debugPrint("image",textField.text)

            validateEmail_Icon.image=nil
        }
    }
    
    
    func SendVerificationCode(phone:String){
        self.view.showLoading()
        PhoneAuthProvider.provider()
            .verifyPhoneNumber(phone, uiDelegate: nil) { [self] verificationID, error in
                self.view.hideLoading()
              if let error = error {
                  print("error",error)
                  self.showFailureAlert(title: error.localizedDescription)
                return
              }
                self.view.showLoading()

                WebService.shared.register(
                    firstName: nameTxt.text ?? "",
                    lastName: "eeeeee",
                    mobileNumber: phoneTxt.text ?? "",
                   email: emailTxt.text ?? "",
                   password: passwordTxt.text ?? ""
                ) { [weak self] response, error in
                    self?.view.hideLoading()
                    guard let self = self else { return }
                    guard let response = response, error == nil else {
                        self.showFailureAlert(title: error?.localizedDescription)
                        return
                    }
                    self.showSuccessAlert(title: response.message) {
                        print("TODO")
                    }
                }
          }
        
    }
    
}
