//
//  ForgetPasswordViewController.swift
//  inSooqApp
//
//  Created by mohammad ahmad on 15/04/2021.
//

import UIKit
import Alamofire
class ForgetPasswordViewController: UIViewController {

  
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setGradientBackground(view: view, colorTop: #colorLiteral(red: 0.5490196078, green: 0.3882352941, blue: 0.9058823529, alpha: 1), colorBottom: #colorLiteral(red: 0.3411764706, green: 0.2745098039, blue: 0.9882352941, alpha: 1))
    }

    @IBAction func back_Pressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func continue_Pressed(_ sender: Any) {
        forgotPassword()
    }
    
    
    
        func forgotPassword() {
            requistForgotPasswordUrl(["email" : "qusaisalah13@gmail.com"]) { bool in
                if bool {
                    self.performSegue(withIdentifier: "toOTPSegue", sender: nil)
    
                }
            }
            }
        func requistForgotPasswordUrl(_ parameters: Dictionary<String , String>, callBack:@escaping (Bool) -> Void) {
    
            let url = "http://apinew.insouq.com/api/Accounts/ForgotPassword"
    
    
            AF.request(url, method: .post, parameters: parameters, headers: ["Content-Type": "application/json"]).responseJSON { (response:DataResponse) in
                    print(response.request)  // original URL request
                    print(response.response) // URL response
                    //                print(response.data)     // server data
                    print("Result",response.result)   // result of response serialization
                    print("parameters = \(parameters)")
    
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
                }.responseString { response in
    
            }
        }
  
}
