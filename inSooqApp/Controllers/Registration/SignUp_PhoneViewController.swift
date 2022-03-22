//
//  SignUp_PhoneViewController.swift
//  inSooqApp
//
//  Created by mohammad ahmad on 17/04/2021.
//

import UIKit
import Firebase
import Alamofire


class SignUp_PhoneViewController: UIViewController ,UITextFieldDelegate{
    private var listDate:[String]!
    override func viewDidLoad() {
        super.viewDidLoad()
        print("list",listDate!)
        setGradientBackground(view: view, colorTop: #colorLiteral(red: 0.5490196078, green: 0.3882352941, blue: 0.9058823529, alpha: 1), colorBottom: #colorLiteral(red: 0.3411764706, green: 0.2745098039, blue: 0.9882352941, alpha: 1))
    }

    
    @IBAction func back_Pressed(_ sender: Any) {
        forcePresentViewController(viewController: self, storyBoardId: "SigninMethodsViewController")

    }
    @IBAction func continue_Pressed(_ sender: Any) {
//            forcePresentViewController(viewController: self, storyBoardId: "OTPViewController")
        
//        SendVerificationCode(phone: listDate[1])
        
//        updateDeviceToken()
        
        SendVerificationCode(phone:"+962797027787")
    }
    
    
    public func getListData()->[String]{
        return listDate
    }
     
    public func setListData(listDate:[String]){
        self.listDate = listDate
    }
    
    
    
    func SendVerificationCode(phone:String){
        
        PhoneAuthProvider.provider()
          .verifyPhoneNumber(phone, uiDelegate: nil) { verificationID, error in
              if let error = error {
                  print("SendVerificationCode(phone:String)",error)
//                self.showMessagePrompt(error.localizedDescription)
                return
              }
              forcePresentViewController(viewController: self, storyBoardId: "SigninMethodsViewController")

          }
        
    }
    
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return true
    }
    
//    func updateDeviceToken() {
//        fetchDataFromWebServicePost(["mobileNumber" : "0797027787"]) { bool in
//            if bool {
//                forcePresentViewController(viewController: self, storyBoardId: "OTPViewController")
//
//            }
//        }
//        }
//    func fetchDataFromWebServicePost(_ parameters: Dictionary<String , String>, callBack:@escaping (Bool) -> Void) {
//
//        let url = "https://newapi.insouq.com/api/Accounts/ConfirmMobileNumber"
//
//
//        AF.request(url, method: .post, parameters: parameters, headers: ["Content-Type": "application/json"]).responseJSON { (response:DataResponse) in
//                print(response.request)  // original URL request
//                print(response.response) // URL responsexs
//                //                print(response.data)     // server data
//                print("Result",response.result)   // result of response serialization
//                print("parameters = \(parameters)")
//
//                switch response.result {
//                case .success(_):
//                    if response.response?.statusCode == 200 || response.response?.statusCode == 201 {
//                        callBack(true)
//                    }
//                    else  {
//                        callBack(false)
//
//                    }
//                case .failure(let error):
//                    debugPrint("getEvents error: \(error)")
//                    callBack(false)
//                }
//            }.responseString { response in
//
//        }
//    }
}
