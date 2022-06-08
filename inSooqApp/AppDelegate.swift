//
//  AppDelegate.swift
//  inSooqApp
//
//  Created by mohammad ahmad on 07/02/2021.
//

import UIKit
import DropDown
import Firebase
import FirebaseAuth
import FirebaseMessaging
import AlamofireNetworkActivityLogger
import GoogleMaps

import IQKeyboardManagerSwift
@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    let gcmMessageIDKey = "gcm.message_id"
    let window = UIApplication.shared.keyWindow

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        debugPrint("appe is in forground")
        
        GMSServices.provideAPIKey("AIzaSyAu-Ffw2Upr-EncJHdUqgNtR-O5FUKHcgI")
        
        setupLogging()
        setupNavigation()
        Messaging.messaging().delegate = self
        if #available(iOS 10.0, *) {
            // For iOS 10 display notification (sent via APNS)
            UNUserNotificationCenter.current().delegate = self
            
            let authOptions: UNAuthorizationOptions = [.alert,.sound]
            UNUserNotificationCenter.current().requestAuthorization(
                options: authOptions,
                completionHandler: {_, _ in })
        } else {
            let settings: UIUserNotificationSettings =
                UIUserNotificationSettings(types: [.alert,.sound], categories: nil)
            application.registerUserNotificationSettings(settings)
        }
        
        application.registerForRemoteNotifications()
        
        // [END register_for_notifications]
      //  MOLH.shared.activate(true)
        //  getVersion()
        // debugPrint("AppnsObject",nsObject)
        

        // Override point for customization after application launch.
        DropDown.startListeningToKeyboard()

        IQKeyboardManager.shared.enable = true
        FirebaseApp.configure()

        
        // Sets navigationBar's background to a blank/empty image
        UINavigationBar.appearance().setBackgroundImage(UIImage(), for: .default)

        // Sets shadow (line below the bar) to a blank image
        UINavigationBar.appearance().shadowImage = UIImage()
        UINavigationBar.appearance().isTranslucent = true
        
//        let postfix = "-"
//        let fullParams =
//                try! ElectronicsSubmission(
//                    Age: "0_1 months\(postfix)",
//                    Color: "Black\(postfix)",
//                    Description: "",
//                    Lat: "32.572339",
//                    Lng: "35.730077",
//                    Location: "Abu Dhabi\(postfix)",
//                    Price: "111111",
//                    Title: "23123123",
//                    Usage: "Daily use since purchase\(postfix)",
//                    Warranty: "1",
//                    MainPhoto: "B424F4F7-FF61-4772-9360-4B021B2BF7FC.jpeg",
//                    SubCategoryId: "15",
//                    OtherSubCategory: "",
//                    SubTypeId: "0",
//                    OtherSubType: "",
//                    PhoneNumber: "0797228550",
//                    Version: "INT\(postfix)",
//                    Ram: "12 GB\(postfix)",
//                    Storage: "1 TB\(postfix)",
//                    Id: "0",
//                    AdId: "0",
//                    CategoryId: "19"
//                ).asDictionary()
//
//        let url = APIUrls.submitElectronics()
//
//        let imageID = "default_image"
//        let sampleImage = UIImage(named: imageID)!
//
//        ApiRequests.submitForm(url: url, files: [], images: [(sampleImage,imageID)], params: fullParams) { formResponse in
//            print("_____________________submitForm",formResponse)
//            //self.navigate()
//        }
//

        
        return true
    }
    // [START receive_message]
    func application(_ application: UIApplication, didReceiveRemoteNotification userInfo: [AnyHashable: Any]) {
        // If you are receiving a notification message while your app is in the background,
        // this callback will not be fired till the user taps on the notification launching the application.
        // TODO: Handle data of notification
        // With swizzling disabled you must let Messaging know about the message, for Analytics
        // Messaging.messaging().appDidReceiveMessage(userInfo)
        // debugPrint message ID.
        let firebaseAuth = Auth.auth()

           if (firebaseAuth.canHandleNotification(userInfo)){
               print(userInfo)
               return
           }
        if let messageID = userInfo[gcmMessageIDKey] {
            debugPrint("Message ID: \(messageID)")
        }
        
        debugPrint(userInfo)
    }
    
    func application(_ application: UIApplication, didReceiveRemoteNotification userInfo: [AnyHashable : Any], fetchCompletionHandler completionHandler: @escaping (UIBackgroundFetchResult) -> Void) {
        let firebaseAuth = Auth.auth()

        if (firebaseAuth.canHandleNotification(userInfo)){
            print(userInfo)
            return
        }
    }
    // [END receive_message]
    
    // This function is added here only for debugging purposes, and can be removed if swizzling is enabled.
    // If swizzling is disabled then this function must be implemented so that the APNs token can be paired to
    // the FCM registration token.
    func application(_ application: UIApplication, didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data) {
        // Pass device token to auth.
        let firebaseAuth = Auth.auth()

        //At development time we use .sandbox
        firebaseAuth.setAPNSToken(deviceToken, type: AuthAPNSTokenType.sandbox)

        //At time of production it will be set to .prod
    }
    func application(_ application: UIApplication, didFailToRegisterForRemoteNotificationsWithError error: Error) {
        debugPrint("Unable to register for remote notifications: \(error.localizedDescription)")
    }

   
    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }
    func applicationWillResignActive(_ application: UIApplication) {
        debugPrint("appe is in applicationWillResignActive")

    }
    func applicationDidEnterBackground(_ application: UIApplication) {
        debugPrint("appe is in background")
    }
//Called when the user exit application -> applicationWillTerminate
    func applicationWillTerminate(_ application: UIApplication) {
        let state=application.applicationState
        switch state {
        case .background:
            debugPrint("appe is in background",application.applicationState.rawValue)
            break
        case .active:
            debugPrint("appe is in active",application.applicationState.rawValue)
        case .inactive:
            debugPrint("appe is in inactive",application.applicationState.rawValue)

        default:
            debugPrint("appe is in applicationWillTerminate",application.applicationState.rawValue)

            break
        }
    }
}


@available(iOS 10, *)
extension AppDelegate : UNUserNotificationCenterDelegate {
    
    // Receive displayed notifications for iOS 10 devices.
    func userNotificationCenter(_ center: UNUserNotificationCenter,
                                willPresent data: UNNotification,
                                withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        
        let userInfo = data.request.content.userInfo
        
        let title = data.request.content.title
        let body = data.request.content.body
        
        if let messageID = userInfo[gcmMessageIDKey] {
            debugPrint("willPresent Message ID: \(messageID)")
        }
        
        debugPrint(userInfo.description)
        debugPrint("title = \(title)\n")
        debugPrint("body = \(body)\n")
        debugPrint("current language" ,Locale.current.languageCode )
        
        ///Change this to your preferred presentation option
        let pushNotification = PushNotification()
        pushNotification.title = title
        pushNotification.body = body
        ///note in ---> bottom of this file
        if let flag = userInfo["aDictonary"] as? [String:Any]{
            pushNotification.flag=flag["test"] as! String
            debugPrint("pushNotification.flag",pushNotification.flag)
        }
        
        var info : [AnyHashable : Any] = [:]
        info["push_notification"] = pushNotification
        debugPrint("push_notification",userInfo["userData"])
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "pushNotificationReceived") , object: self, userInfo: info)
        //  debugPrint("Statics.selectedItem:===",Statics.selectedItem)
        completionHandler([[.alert,.sound]])
    }
    
    func userNotificationCenter(_ center: UNUserNotificationCenter,
                                didReceive response: UNNotificationResponse,
                                withCompletionHandler completionHandler: @escaping () -> Void) {
        let userInfo = response.notification.request.content.userInfo
        if let messageID = userInfo[gcmMessageIDKey] {
            debugPrint("willPresent didReceive Message ID: \(messageID)")
        }
        
        
        // With swizzling disabled you must let Messaging know about the message, for Analytics
        // Messaging.messaging().appDidReceiveMessage(userInfo)
        // debugPrint full message.
        // Do whatever you want when the user tapped on a notification
        // If you are waiting for a specific value from the notification
        // (e.g., associated with key "valueKey"),
        // you can capture it as follows then do the navigation:
        //MARK: if we recieve more than push notification type use below (if else)
        //    if let targetValue = userInfo["target"] as? String, targetValue == "valueKey"
        //    {
        //    }
        //    coordinateToSomeVC()
        
        debugPrint("userInfo",userInfo)
        
        completionHandler()
    }
}

extension AppDelegate : MessagingDelegate {
    // [START refresh_token]
    func messaging(_ messaging: Messaging, didReceiveRegistrationToken fcmToken: String?) {
        debugPrint("Firebase registration token: ",fcmToken as Any)
        UserDefaults.standard.setValue(fcmToken, forKey: "deviceToken")
        let dataDict:[String: String] = ["token": fcmToken!]
        if Auth.auth().currentUser?.uid != nil{
            debugPrint("dataDict\(dataDict)")
            
            NotificationCenter.default.post(name: Notification.Name("FCMToken"), object: nil, userInfo: dataDict)
            // TODO: If necessary send token to application server.
            // Note: This callback is fired at each app startup and whenever a new token is generated.
        }
        // [END refresh_token]
    }
    
    func setupNavigation() {
        // Back button
        let backArrowImage = UIImage(systemName: "chevron.backward")
        UINavigationBar.appearance().backIndicatorTransitionMaskImage = backArrowImage
        UINavigationBar.appearance().backIndicatorImage = backArrowImage
        UINavigationBar.appearance().tintColor = .gray
        UINavigationBar.appearance().barTintColor = .white
        UINavigationBar.appearance().backgroundColor = .white
        UINavigationBar.appearance().titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.lightGray]
        UIBarButtonItem.appearance().setBackButtonTitlePositionAdjustment(
            UIOffset(horizontal: -1000.0, vertical: 0.0),
            for: .default
        )
        if #available(iOS 15.0, *) {
            UITableView.appearance().sectionHeaderTopPadding = 0
        }
    }
    
    
}

extension AppDelegate {
    func setupLogging() {
        #if DEBUG
        NetworkActivityLogger.shared.level = .debug
        NetworkActivityLogger.shared.startLogging()
        #endif
    }
}
