////
////  SocialAuthFunctions.swift
////  orood
////
////  Created by Deya on 10/01/2022.
////
//
//import Foundation
//import Firebase
//
//extension SocialAuth {
//    
//    func currentUser() {
//        
//        if Auth.auth().currentUser != nil {
//            
//            // User is signed in.
//            // ...
//            
//        } else {
//            
//            // No user is signed in.
//            // ...
//        }
//        
//    }
//    
//    
//    func printUser(user: User, prefix: String)  {
//        
//        print("-----------------------------------------------")
//        print("🟩\(prefix) providerID: ", user.providerID)
//        print("🟩\(prefix) uid: ", user.uid)
//        print("🟩\(prefix) displayName: ", user.displayName ?? "")
//        print("🟩\(prefix) photoURL: ", user.photoURL ?? "")
//        print("🟩\(prefix) email: ", user.email ?? "")
//        print("🟩\(prefix) phoneNumber: ", user.phoneNumber ?? "")
//        print("🟩\(prefix) providerData: ", user.providerData)
//        print("🟩\(prefix) providerData: ", user.providerData)
//        
//        print("-----------------------------------------------")
//        
//    }
//    
//    func updateUser() {
//        
//        let changeRequest = Auth.auth().currentUser?.createProfileChangeRequest()
//        changeRequest?.displayName = "?"
//        changeRequest?.commitChanges { error in
//            // ...
//        }
//        
//    }
//    
//    func updateUserEmail() {
//        
////        Auth.auth().currentUser?.updateEmail(to: email) { error in
////            // ...
////        }
//        
//    }
//    
//    func sendEmailVerification() {
//        
//        // It is also possible to pass state via a continue URL to redirect back to the app when sending a verification email.
//        // https://firebase.google.com/docs/auth/ios/passing-state-in-email-actions
//        
//        Auth.auth().currentUser?.sendEmailVerification { error in
//            // ...
//        }
//        
//    }
//    
//    func setUserPassword() {
//        
////        Auth.auth().currentUser?.updatePassword(to: psw) { error in
////            // ...
////        }
//        
//    }
//    
//    func sendPasswordReset() {
////        Auth.auth().sendPasswordReset(withEmail: email) { error in
////            // ...
////        }
//    }
//    
//    func deleteUser() {
//        
//        let user = Auth.auth().currentUser
//        
//        user?.delete { error in
//            if let error = error {
//                // An error happened.
//            } else {
//                // Account deleted.
//            }
//        }
//        
//    }
//    
//    func reauthenticateUser() {
//        
//        //Some security-sensitive actions—such as deleting an account, setting a primary email address, and changing a password—require that the user has recently signed in.
//        
//            let user = Auth.auth().currentUser
//            var credential: AuthCredential
//    
//            // Prompt the user to re-provide their sign-in credentials
//    
////            user?.reauthenticate(with: credential) { error in
////              if let error = error {
////                // An error happened.
////              } else {
////                // User re-authenticated.
////              }
////            }
//        
//    }
//    
//    func sendAuthenticationLinkToEmail() {
//        
//        // https://firebase.google.com/docs/auth/ios/email-link-auth
//        
//    }
//    
//}
