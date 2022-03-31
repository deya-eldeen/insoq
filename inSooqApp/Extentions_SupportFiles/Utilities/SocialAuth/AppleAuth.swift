////
////  AppleAuth.swift
////  orood
////
////  Created by Deya on 09/03/2022.
////
//
//import Foundation
//import AuthenticationServices
//import Defaults
//
//extension SigninVC: ASAuthorizationControllerPresentationContextProviding {
//    
//    @available(iOS 13.0, *)
//    func presentationAnchor(for controller: ASAuthorizationController) -> ASPresentationAnchor {
//        return self.view.window!
//    }
//
//}
//
//extension SigninVC: ASAuthorizationControllerDelegate {
//    
//    @available(iOS 13.0, *)
//    // MARK: - ASAuthorizationControllerDelegate
//    func authorizationController(controller: ASAuthorizationController, didCompleteWithAuthorization authorization: ASAuthorization) {
//        
//        print("authorization",authorization)
//        if let appleIDCredential = authorization.credential as? ASAuthorizationAppleIDCredential {
//            guard let appleIDToken = appleIDCredential.identityToken else {
//                print("Unable to fetch identity token")
//                return
//            }
//            
//            guard let idTokenString = String(data: appleIDToken, encoding: .utf8) else {
//                print("Unable to serialize token string from data: \(appleIDToken.debugDescription)")
//                return
//            }
//                    
//            let userIdentifier = appleIDCredential.user
//            let fullName = appleIDCredential.fullName
//            let email = appleIDCredential.email
//            let token = appleIDCredential.identityToken
//            
//            let fullNameString = "\(fullName?.givenName ?? "") \(fullName?.familyName ?? "") "
//            
//            if (Defaults[.appleSignInID] == nil) {
//                Defaults[.appleSignInID] = userIdentifier
//            }
//            
//            if (Defaults[.appleSignInFullName] == nil) {
//                Defaults[.appleSignInFullName] = fullNameString
//            }
//            
//            if (Defaults[.appleSignInEmail] == nil) {
//                Defaults[.appleSignInEmail] = email
//            }
//            
//            socialAuth?.requestSocialLogin(
//                login_type: "apple",
//                fullname: Defaults[.appleSignInFullName] ?? "",
//                firebaseID: Defaults[.appleSignInID] ?? "",
//                email: Defaults[.appleSignInEmail] ?? ""
//            )
//            
//        }
//    }
//
//    
//    @available(iOS 13.0, *)
//    func authorizationController(controller: ASAuthorizationController, didCompleteWithError error: Error) {
//        
//        // Handle error.
//        guard let error = error as? ASAuthorizationError else {
//            return
//        }
//
//        switch error.code {
//        case .canceled:
//            print("authorizationController Canceled")
//        case .unknown:
//            print("authorizationController Unknown")
//        case .invalidResponse:
//            print("authorizationController Invalid Respone")
//        case .notHandled:
//            print("authorizationController Not handled")
//        case .failed:
//            print("authorizationController Failed")
//        case .notInteractive:
//            print("authorizationController NotInteractive")
//        @unknown default:
//            print("authorizationController Default")
//        }
//        
//    }
//    
//}
//
//extension SigninVC {
//    
//    @objc private func handleSignInWithApple() {
//        
//        if #available(iOS 13.0, *) {
//            let authorizationAppleIDProvider = ASAuthorizationAppleIDProvider()
//            let request = authorizationAppleIDProvider.createRequest()
//            request.requestedScopes = [.email, .fullName]
//
//            let authorizationController = ASAuthorizationController(authorizationRequests: [request])
//            authorizationController.presentationContextProvider = self
//            authorizationController.delegate = self
//            authorizationController.performRequests()
//        } else {
//            // Fallback on earlier versions
//        }
//
//        
//    }
//    
//    @available(iOS 13.0, *)
//    func prepareSignInWithAppleButton() -> ASAuthorizationAppleIDButton {
//        
//        let signInWithAppleButton = ASAuthorizationAppleIDButton()
//        signInWithAppleButton.addTarget(self, action: #selector(handleSignInWithApple), for: .touchUpInside)
//        return signInWithAppleButton
//        
//    }
//    
//}
