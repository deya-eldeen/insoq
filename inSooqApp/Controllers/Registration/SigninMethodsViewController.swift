//
//  SigninMethodsViewController.swift
//  inSooqApp
//
//  Created by mohammad ahmad on 01/04/2021.
//

import UIKit
import LocalAuthentication

class SigninMethodsViewController: UIViewController {
    
    @IBOutlet weak var create_Button: UIButton!
    @IBOutlet weak var forgetPassword_Button: UIButton!
    @IBOutlet weak var emailTxt: UITextField!
    @IBOutlet weak var passwordTxt: UITextField!
    
    @IBOutlet weak var validateEmail_Icon: UIImageView!
    @IBOutlet weak var gmail_Button: UIButton!
    @IBOutlet weak var facebook_Button: UIButton!
    @IBOutlet weak var signin_Button: UIButton!
    @IBOutlet weak var lblTerms: UILabel!
    @IBOutlet weak var lblprivacy: UILabel!

    let text = "By Signing up I agree on Terms & Conditions &"
    let text2 = "Privacy Policy."


    override func viewDidLoad() {
        super.viewDidLoad()
        #if DEBUG
            emailTxt.text = "samarelias3@gmail.com"
            passwordTxt.text = "Samar@123"
        #endif
        
        setGradientBackground(view: view, colorTop: #colorLiteral(red: 0.5490196078, green: 0.3882352941, blue: 0.9058823529, alpha: 1), colorBottom: #colorLiteral(red: 0.3411764706, green: 0.2745098039, blue: 0.9882352941, alpha: 1))
    }
    
    override func viewWillAppear(_ animated: Bool) {
        setDesign()
        setTapGesture()
        //startAuthentication()

    }
    
    //MARK:-Private Methods-
    private func setTapGesture(){
        self.signin_Button.addTarget(self, action: #selector(self.signinAction), for: .touchUpInside)
        self.facebook_Button.addTarget(self, action: #selector(self.facebookAction), for: .touchUpInside)
        self.gmail_Button.addTarget(self, action: #selector(self.gmailAction), for: .touchUpInside)
        self.create_Button.addTarget(self, action: #selector(self.toSignupVC), for: .touchUpInside)
        self.forgetPassword_Button.addTarget(self, action: #selector(self.toForgetVC), for: .touchUpInside)
        //    self.agree_Button.addTarget(self, action: #selector(self.agreeAction), for: .touchUpInside)
    }
    @objc func toForgetVC(){
        forcePresentViewController(viewController: self, storyBoardId: "ForgetPasswordViewController")
    }
    @objc func toSignupVC(){
        forcePresentViewController(viewController: self, storyBoardId: "SignUpViewController")
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
        debugPrint("facebook_Button.frame.height",facebook_Button.frame.height)
        debugPrint("facebook_Button.frame.height",facebook_Button.frame.height/2)
        emailTxt.addTarget(self, action: #selector(self.joinChange), for: .editingChanged)
        objectCornerRadius(object: gmail_Button, cornerRadius: gmail_Button.frame.height/2)
        objectCornerRadius(object: facebook_Button, cornerRadius: facebook_Button.frame.height/2)
        objectCornerRadius(object: signin_Button, cornerRadius: signin_Button.frame.height/2)
       
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
    
///Functions
    func startAuthentication() {
        let contet = LAContext()
        let reason = "Biometric Authntication testing !!"
        var authError: NSError?
        if #available(iOS 8.0, macOS 10.12.1, *) {
            if contet.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &authError) {
                contet.localizedCancelTitle = "Cancel"
                contet.localizedFallbackTitle = ""
                contet.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: reason) { success, evaluateError in
                    DispatchQueue.main.async {
                        if success {
                            let alert = UIAlertController(title: "Success", message: "Successfully Authenticated", preferredStyle: .alert)
                            alert.addAction(UIAlertAction(title: "Ok", style: .cancel, handler: nil))
                            self.present(alert, animated: true, completion: nil)
                        } else {
                            // User did not authenticate successfully, look at error and take appropriate action
                            print(evaluateError?.localizedDescription)
                        }
                    }
                }
            } else {
                // Could not evaluate policy; look at authError and present an appropriate message to user
                print("Sorry!!.. Could not evaluate policy.\(authError?.localizedDescription)")
            }
        } else {
            print("This feature is not supported.")
        }
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
     //   validateData()
        if emailTxt.text == "" || passwordTxt.text == "" {
            self.showFailureAlert(title: "Please fill in all fields")
            return
        }
//        self.view.showLoading()
        
//        WebService.shared.Login(emailOrPhone: emailTxt.text! , password: passwordTxt.text!) { [weak self] response, error in
//            guard let self = self else { return }
//            self.view.hideLoading()
//
//            guard let response = response, error == nil else {
//                self.showFailureAlert(title: error?.localizedDescription)
//                return
//            }
//
//            User.profile = response
//            Shared.shared.saveIsLogin(login: true)
//            Shared.shared.saveToken(auth: User.profile?.token ?? "")
//            Shared.shared.saveUserId(id: User.profile?.userID ?? 0)
//            Shared.shared.saveUserPhoneNumber(phone: User.profile?.phoneNumber ?? "")
//
//            let controller = Assembly.menuController
//            self.present(controller, animated: true)
//
//        }
        
        let parameters = ["emailOrPhone": emailTxt.text ?? "", "password":  passwordTxt.text ?? ""]

        ApiRequests.login(params: parameters) { response in
            print("RR",response)
            
            User.profile = response.value
            Shared.shared.saveIsLogin(login: true)
            Shared.shared.saveToken(auth: User.profile?.token ?? "")
            Shared.shared.saveUserId(id: User.profile?.userID ?? 0)
            Shared.shared.saveUserPhoneNumber(phone: User.profile?.phoneNumber ?? "")

            let controller = Assembly.menuController
            self.present(controller, animated: true)
            
        }
        
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
        forcePresentViewController(viewController: self, storyBoardId: "Terms_PrivacyViewController")
    }
    ///preform segue
    @objc func termsAction(){
        Terms_PrivacyViewController.index=1
        forcePresentViewController(viewController: self, storyBoardId: "Terms_PrivacyViewController")
    }
    private func validateData(){
        
    }
    
}
