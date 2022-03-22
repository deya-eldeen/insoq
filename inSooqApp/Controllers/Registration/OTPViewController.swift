//
//  OTPViewController.swift
//  inSooqApp
//
//  Created by mohammad ahmad on 15/04/2021.
//

import UIKit
import OTPFieldView
import Firebase
import Alamofire

class OTPViewController: UIViewController,OTPFieldViewDelegate {

    @IBOutlet weak var otpTextFieldView: OTPFieldView!
    @IBOutlet weak var roundedView: UIView!
    private var list_data:[String]!

    
    public func getListData()->[String]{
        return list_data
    }
     
    public func setListData(listDate:[String]){
        self.list_data = listDate
    }
    
    
    private var code = ""
    
    func setCode(code:String){
        self.code = code
    }
    
    func getCode()->String{
        return code
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        print("list",list_data!)

        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        objectCornerRadius(object: roundedView, cornerRadius: roundedView.height/2)
        setupOtpView()
        otpTextFieldView.addShadowToView()
    }
    @IBAction func back_Pressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func continue_Pressed(_ sender: Any) {
//        newRoot(NavId: "MainNav")
    }
    //MARK:-Functions
    func setupOtpView(){
        otpTextFieldView.becomeFirstResponder()
        self.otpTextFieldView.fieldsCount = 6
        self.otpTextFieldView.fieldBorderWidth = 1
        self.otpTextFieldView.defaultBorderColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        self.otpTextFieldView.filledBorderColor = UIColor.green
        self.otpTextFieldView.cursorColor = #colorLiteral(red: 0.1437328833, green: 0.2071459947, blue: 1, alpha: 1)
        self.otpTextFieldView.displayType = .roundedCorner
        self.otpTextFieldView.fieldSize = 48
        self.otpTextFieldView.addShadowToView()
        self.otpTextFieldView.separatorSpace = 10
        self.otpTextFieldView.shouldAllowIntermediateEditing = false
        self.otpTextFieldView.delegate = self
        self.otpTextFieldView.initializeUI()
    }
    
    func hasEnteredAllOTP(hasEnteredAll hasEntered: Bool) -> Bool {
        print("Has entered all OTP? \(hasEntered)")
        return false
    }
    
    func shouldBecomeFirstResponderForOTP(otpTextFieldIndex index: Int) -> Bool {
        return true
    }
    
    func enteredOTP(otp otpString: String) {
        print("OTPString: \(otpString)")
        let code = otpString
        debugPrint("OTP",code)
        sendOTPCode(with: code)
    }
    
    func validation(verificationCode:String)->Bool{
        if isConnectToInterNet(){
            return true
        }else{
            return false
        }
    }
    
    private func sendOTPCode(with code:String){
//
//
         let verificationID = UserDefaults.standard.string(forKey: "authVerificationID")

//        MARK:-FIR Stuff-
//        MARK:-If Code is correct update Number to Server-
//        MARK:-If Code is Incorrect Show ActionAlert in MyProfileViewController-

                let credential = PhoneAuthProvider.provider().credential(withVerificationID: verificationID!, verificationCode: code)
//        /Send Code Request
        Auth.auth().signIn(with: credential){ [self]
                    (authResult, error) in
                    if error != nil
                    {
                        debugPrint(error!.localizedDescription as String)}
                    else{
                        debugPrint("code:- ",code)
                        debugPrint("authResult:- ",authResult?.credential)
                        debugPrint("error:- ",error?.localizedDescription)
                        debugPrint("credential:- ",authResult?.additionalUserInfo)
                        debugPrint("User UID : \(String(describing: authResult?.user.uid))" )
                        Statics.defaults.set(Auth.auth().currentUser!.uid, forKey: "userUID")
                        addUser()
                        }
                    //}
                }
//
    }

    
        func addUser() {
    
            requistAddUser(["firstName":list_data[0],"lastName": "ththth","mobileNumber":list_data[1],"email" : "qusaisala111h13@gmail.com","password":list_data[3]]) { [self] bool in
                if bool {
                    newRoot(NavId: "MainNav")
//                    pushtoViewController(viewController: self, storyBoardId: "ProfileData_SignupViewController", animate: true)

                }
            }
            }
    func requistAddUser(_ parameters: Dictionary<String , String>, callBack:@escaping (Bool) -> Void) {

        let url = "https://newapis.insouq.com/api/Users/Add"

        AF.request(url, method: .post, parameters: parameters, encoding: JSONEncoding.default)
            .responseJSON { response in
                print(response)
                switch response.result {
                case .success(_):
                    if response.response?.statusCode == 200 || response.response?.statusCode == 201 {
                        callBack(true)
                    }
                    else  {
                        callBack(false)

                    }
                case .failure(let error):
                    debugPrint("getEvents error: \(error)")
                    callBack(false)
                }
            }
       
    }
    
}
