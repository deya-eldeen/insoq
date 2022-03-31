////
////  SocialAuth.swift
////  orood
////
////  Created by Deya on 10/01/2022.
////
//
//import Foundation
//import Firebase
//import Defaults
//
//import GoogleSignIn
//import FBSDKLoginKit
//
//
//class SocialAuth {
//    
//    var handle: AuthStateDidChangeListenerHandle?
//
//    init() {
//        
//        self.handle = Auth.auth().addStateDidChangeListener { auth, user in
//            
//            if let user = user {
//                self.printUser(user: user, prefix: "addStateDidChangeListener")
//            }
//            
//        }
//        
//    }
//    
//    var provider = OAuthProvider(providerID: "twitter.com")
//    var providerGoogle = OAuthProvider(providerID: "google.com")
//
//    func loginWithTwitter(vc: UIViewController) {
//        
//        print("loginWithTwitter")
//        provider.customParameters = ["lang": "en"]
//        
//        print("provider",provider)
//
//        provider.getCredentialWith(nil) { credential, error in
//    
//            if let credential = credential {
//                print("credential",credential)
//
//                Auth.auth().signIn(with: credential) { authResult, error in
//
//                    print(error)
//                    
//                    print("credential",credential)
//                    
//                    if let user = authResult?.user {
//                        self.requestSocialLogin(login_type: "twitter", fullname: user.displayName ?? "", firebaseID: user.uid)
//                    }
//                    
//                }
//            }
//        }
//        
//    }
//    
//    func loginWithFB(vc: UIViewController) {
//        
//
//        
//    }
//    
//    func loginWithGoogle(vc: UIViewController) {
//        print("loginWithGoogle")
//        providerGoogle.customParameters = ["lang": "en"]
//        
//        print("providerGoogle",providerGoogle)
//
//        providerGoogle.getCredentialWith(nil) { credential, error in
//    
//            if let credential = credential {
//                print("credential",credential)
//
//                Auth.auth().signIn(with: credential) { authResult, error in
//
//                    print(error)
//                    
//                    print("credential",credential)
//                    
//                    if let user = authResult?.user {
//                        self.requestSocialLogin(login_type: "google", fullname: user.displayName ?? "", firebaseID: user.uid)
//                    }
//                    
//                }
//            }
//        }
//        
//    }
//    
//}
//
//extension SocialAuth {
//    
//    func requestSocialLogin(login_type: String, fullname: String, firebaseID: String, email: String? = "") {
//        
//        let currentCityID = Defaults[.currentCity]?.id ?? 0
//        
//        let fcm_token = Defaults[.fcmToken]
//        
//        let params = [
//            "fcm_token":fcm_token,
//            "huawei_token":"",
//            "full_name":fullname,
//            "firebase_id":firebaseID,
//            "email":email,
//            "login_type":login_type,
//            "city_id": "\(currentCityID)"
//        ]
//        
//        print("requestSocialLogin",params)
//        
//        ApiRequests.socialLogin(params: params) { response in
//            print("response \(response) ")
//            
//            if let session = response.value?.data {
//                print("⭐️ didSaveSession",session)
//
//                Defaults[.session] = session
//                AppDelegate().navigationAfterLogin()
//            }
//            
//        }
//        
//    }
//    
//}
