//
//  HeaderView.swift
//  geek
//
//  Created by VasHouse on 12/15/19.
//  Copyright © 2019 vashouse. All rights reserved.
//

import UIKit

class BottomView: UIView {
    
    @IBOutlet weak var newMessageView: UIView!
    @IBOutlet weak var homeIcon: UILabel!
    @IBOutlet weak var chatIcon: UILabel!
    @IBOutlet weak var notificationIcon: UILabel!
    @IBOutlet weak var ProfileIcon: UILabel!

    @IBOutlet weak var addBtn: UIButton!
    @IBOutlet weak var homeBtn: UIButton!
    @IBOutlet weak var chatBtn: UIButton!
    @IBOutlet weak var notificationBtn: UIButton!
    @IBOutlet weak var ProfileBtn: UIButton!
    
    @IBOutlet var contentView: UIView!
    var icons=FontAwesomeIcons()
    var vc:UIViewController?
    func setVC(viewController:UIViewController)
    {
        
        self.vc = viewController
        
        //MARK:-Main Tabs-
        //Home Tab-1
        //Chat Tab-2
        //Favorate Tab-3
        //Listing Tab-4

        
        if ((viewController.isKind(of: HomeViewController.self)) )
        {
            if let vcMainControllor:HomeViewController = vc as? HomeViewController{
                Statics.tabBarFlag=0
                initBtns()
                addTargets(vc:vcMainControllor)
                enableBtns(enable: true)
            }
            
        }

        if ((viewController.isKind(of: ChatViewController.self)) )
        {
            if let vcMainControllor:ChatViewController = vc as? ChatViewController{
                Statics.tabBarFlag=2
                initBtns()
                addTargets(vc:vcMainControllor)
                enableBtns(enable: true)
            }
        }
        
        if ((viewController.isKind(of:AccountViewController.self)) )
        {
            if let vcMainControllor:AccountViewController = vc as? AccountViewController{
                Statics.tabBarFlag=4
                initBtns()
                addTargets(vc:vcMainControllor)
                enableBtns(enable: true)
            }
        }

        if ((viewController.isKind(of: NotificationsViewController.self)) )
        {
            if let vcMainControllor:NotificationsViewController = vc as? NotificationsViewController{
                Statics.tabBarFlag=3
                initBtns()
                addTargets(vc:vcMainControllor)
                enableBtns(enable: true)
            }
        }
 //       if ((viewController.isKind(of: AddViewController.self)) )
//        {
//            if let vcMainControllor:AddViewController = vc as? AddViewController{
//                Statics.tabBarFlag=5
//                initBtns()
//                addTargets(vc:vcMainControllor)
//                enableBtns(enable: true)
//            }
//        }
        //MARK:-Sub Tabs

//        else if ((viewController.isKind(of: SubCategoriesViewController.self)) )
//        {
//            if let vcMainControllor:SubCategoriesViewController = vc as? SubCategoriesViewController{
//                Statics.tabBarFlag=0
//                initBtns()
//                addTargets(vc:vcMainControllor)
//                enableBtns(enable: true)
//            }
//        }
        

//        if ((viewController.isKind(of: DetailsViewController.self)) )
//        {
//            if let vcMainControllor:DetailsViewController = vc as? DetailsViewController{
//                Statics.tabBarFlag=1
//                initBtns()
//                addTargets(vc:vcMainControllor)
//                enableBtns(enable: true)
//            }
//        }
        
        
//        if ((viewController.isKind(of: FAQViewController.self)) )
//        {
//            if let vcMainControllor:FAQViewController = vc as? FAQViewController{
//                Statics.tabBarFlag=4
//                initBtns()
//                addTargets(vc:vcMainControllor)
//                enableBtns(enable: true)
//            }
//        }
//        if ((viewController.isKind(of: MyAdsViewController.self)) )
//        {
//            if let vcMainControllor:MyAdsViewController = vc as? MyAdsViewController{
//                Statics.tabBarFlag=4
//                initBtns()
//                addTargets(vc:vcMainControllor)
//                enableBtns(enable: true)
//            }
//        }
//        if ((viewController.isKind(of: GetMoreViewsViewController.self)) )
//        {
//            if let vcMainControllor:GetMoreViewsViewController = vc as? GetMoreViewsViewController{
//                Statics.tabBarFlag=4
//                initBtns()
//                addTargets(vc:vcMainControllor)
//                enableBtns(enable: true)
//            }
//        }
        //...continue-->>rest of the list Buttons
        //Add Tab-5
//        if ((viewController.isKind(of: Add_CategoryViewController.self)) )
//        {
//            if let vcMainControllor:Add_CategoryViewController = vc as? Add_CategoryViewController{
//                Statics.tabBarFlag=5
//                initBtns()
//                addTargets(vc:vcMainControllor)
//                enableBtns(enable: true)
//            }
//        }
//        if ((viewController.isKind(of: Add_TitleViewController.self)) )
//        {
//            if let vcMainControllor:Add_TitleViewController = vc as? Add_TitleViewController{
//                Statics.tabBarFlag=5
//                initBtns()
//                addTargets(vc:vcMainControllor)
//                enableBtns(enable: true)
//            }
//        }
//        if ((viewController.isKind(of: Add_BrandViewController.self)) )
//        {
//            if let vcMainControllor:Add_BrandViewController = vc as? Add_BrandViewController{
//                Statics.tabBarFlag=5
//                initBtns()
//                addTargets(vc:vcMainControllor)
//                enableBtns(enable: true)
//            }
//        }
//        if ((viewController.isKind(of: Add_FullSpecesViewController.self)) )
//        {
//            if let vcMainControllor:Add_FullSpecesViewController = vc as? Add_FullSpecesViewController{
//                Statics.tabBarFlag=5
//                initBtns()
//                addTargets(vc:vcMainControllor)
//                enableBtns(enable: true)
//            }
//        }
        
        
        
    }
    private func addTargets(vc:UIViewController){
        homeBtn.addTarget(self, action: #selector(homeTapped(sender:)), for: .touchUpInside)
        chatBtn.addTarget(self, action: #selector(chatTapped(sender:)), for: .touchUpInside)
        notificationBtn.addTarget(self, action: #selector(notificationTapped(sender:)), for: .touchUpInside)
        ProfileBtn.addTarget(self, action: #selector(ProfileTapped(sender:)), for: .touchUpInside)
        addBtn.addTarget(self, action: #selector(addTapped(sender:)), for: .touchUpInside)
    }
    
    @objc func homeTapped(sender: UIButton) {
        guard let vc = self.vc else {
            return
        }
        Statics.tabBarFlag=0
        if ((vc.isKind(of: HomeViewController.self))){
            if let vcMainControllor:HomeViewController = vc as? HomeViewController{
                debugPrint("you're already in same VC",vcMainControllor)
                vcMainControllor.reloadInputViews()
            }
        }
        else if ((vc.isKind(of: AccountViewController.self))){
            clearViewData(controller: vc)
                    newRoot(NavId: "MainNav")
        }
        else if ((vc.isKind(of: NotificationsViewController.self))){
                    newRoot(NavId: "MainNav")
        }
        else if ((vc.isKind(of: ChatViewController.self))){
                    newRoot(NavId: "MainNav")
        }
        debugPrint("VC Stack-",vc.navigationController?.viewControllers)
        initBtns()
    }
    @objc func chatTapped(sender: UIButton) {
        
        debugPrint("VC Stack - chatTapped")
        guard let vc = self.vc else {
            return
        }
        
        if ((vc.isKind(of: ChatViewController.self)) )
        {
            debugPrint("Do nothing same VC")
        }else{
        forcePresentViewController(viewController: vc, storyBoardId: "ChatViewController")
        Statics.tabBarFlag=2
        debugPrint("VC Stack-",vc.navigationController?.viewControllers)

            initBtns()
            
        }
    }
    @objc func notificationTapped(sender: UIButton) {
        //   view.endEditing(true)
        debugPrint("VC Stack- notificationTapped")
        guard let vc = self.vc else {
            return
        }
        
        if ((vc.isKind(of: NotificationsViewController.self)) )
        {
            debugPrint("Do nothing same VC")
        }else{
        forcePresentViewController(viewController: vc, storyBoardId: "NotificationsViewController")
        debugPrint("VC Stack-",vc.navigationController?.viewControllers)
        Statics.tabBarFlag=3
            initBtns()
            
        }
    }
    @objc func ProfileTapped(sender: UIButton) {
        //   view.endEditing(true)
        debugPrint("VC Stack ProfileTapped")
        guard let vc = self.vc else {
            return
        }
        if ((vc.isKind(of: AccountViewController.self)) )
        {
            debugPrint("Do nothing same VC")
        }else{
        forcePresentViewController(viewController: vc, storyBoardId: "AccountViewController")
        debugPrint("VC Stack-",vc.navigationController?.viewControllers)
        Statics.tabBarFlag=4
            initBtns()
        }
    }
    
    @objc func addTapped(sender: UIButton) {
        //   view.endEditing(true)
        debugPrint("VC Stack ProfileTapped")
        guard let vc = self.vc else {
            return
        }
        debugPrint("vc",vc)
        forcePresentViewController(viewController: vc, storyBoardId: "AddViewControllerNav")
        debugPrint("VC Stack-",vc.navigationController?.viewControllers)

    }
    
    
    func xibSetup() {
        
        Bundle.main.loadNibNamed("BottomView", owner: self, options: nil)
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
    
    
    
    @objc func homeMultipleTap(_ sender: UIButton, event: UIEvent) {
        let touch: UITouch = event.allTouches!.first!
        if (touch.tapCount == 2) {
            self.vc?.navigationController?.popToRootViewController(animated: false)
        }
    }
    
    @objc func tabBarButtonTap(_ sender: UIButton, event: UIEvent) {
        let touch: UITouch = event.allTouches!.first!
        if (touch.tapCount == 1) {
            
            let mainStoryboard = UIStoryboard(name: "Main", bundle: nil)
            let tabController = mainStoryboard.instantiateViewController(identifier: "HomeMapViewController")//AddViewController
            
            self.vc?.navigationController?.pushViewController(tabController, animated: false)
            
        }
    }
    
    func toAddVc()
    {
        
        let mainStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let toOrderServiceVC = mainStoryboard.instantiateViewController(identifier: "AddServiceViewController")
        self.vc?.navigationController?.pushViewController(toOrderServiceVC, animated: true)
    }
    
    var homeContainerView:UIView? = nil
    var viewOfViewControllor:UIView? = nil
    private var myAlertView : UIView?
    private var mybackGroundView : UIView?
    
    
    func enableBtns(enable:Bool)
    {
        self.homeBtn.isEnabled=enable
        self.chatBtn.isEnabled=enable
        self.notificationBtn.isEnabled=enable
        self.ProfileBtn.isEnabled=enable
        self.addBtn.isEnabled=enable
    }
    
    //    func showIndecator(){
    //        if API._NewMessage {
    //
    //            newMessageView.backgroundColor = #colorLiteral(red: 0.935754478, green: 0.1985729933, blue: 0.1010571197, alpha: 1)
    //        }else{
    //            newMessageView.backgroundColor = .none
    //        }
    //        if API._NewNotificaion {
    //            newNotificationView.backgroundColor = #colorLiteral(red: 0.935754478, green: 0.1985729933, blue: 0.1010571197, alpha: 1)
    //        }else{
    //            newNotificationView.backgroundColor = .none
    //        }
    //    }
    
    func initBtns(){
        //        guard let vc = self.vc else {
        //            return
        //        }
        labelFont(object: homeIcon, style: "Regular", size: 20)
        homeIcon.text=icons.tab_Home_icon
        labelFont(object: chatIcon, style: "Regular", size: 20)
        chatIcon.text=icons.tab_Chat_icon
        labelFont(object: notificationIcon, style: "Regular", size: 20)
        notificationIcon.text=icons.bell_icon
        labelFont(object: ProfileIcon, style: "Regular", size: 20)
        ProfileIcon.text=icons.person_icon
        
        newMessageView.layer.cornerRadius = newMessageView.frame.height/2
        addBtn.layer.cornerRadius=addBtn.frame.height/2
        
        
        switch Statics.tabBarFlag{
        case 2:
            debugPrint("VC_ChatVC")
            labelFont(object: chatIcon, style: "Solid", size: 25)
            chatIcon.textColor=#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
            notificationIcon.textColor=#colorLiteral(red: 0.6666666865, green: 0.6666666865, blue: 0.6666666865, alpha: 1)
            ProfileIcon.textColor=#colorLiteral(red: 0.6666666865, green: 0.6666666865, blue: 0.6666666865, alpha: 1)
            homeIcon.textColor=#colorLiteral(red: 0.6666666865, green: 0.6666666865, blue: 0.6666666865, alpha: 1)
            break
        case 3:
            debugPrint("VC_Favorites")
            // newNotificationView.backgroundColor = .none
            // API._NewNotificaion=false
            labelFont(object: notificationIcon, style: "Solid", size: 25)
            notificationIcon.textColor=#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
            chatIcon.textColor=#colorLiteral(red: 0.6666666865, green: 0.6666666865, blue: 0.6666666865, alpha: 1)
            ProfileIcon.textColor=#colorLiteral(red: 0.6666666865, green: 0.6666666865, blue: 0.6666666865, alpha: 1)
            homeIcon.textColor=#colorLiteral(red: 0.6666666865, green: 0.6666666865, blue: 0.6666666865, alpha: 1)
            
            break
        case 4:
            debugPrint("VC_list")
            labelFont(object: ProfileIcon, style: "Solid", size: 25)
            ProfileIcon.textColor=#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
            chatIcon.textColor=#colorLiteral(red: 0.6666666865, green: 0.6666666865, blue: 0.6666666865, alpha: 1)
            notificationIcon.textColor=#colorLiteral(red: 0.6666666865, green: 0.6666666865, blue: 0.6666666865, alpha: 1)
            homeIcon.textColor=#colorLiteral(red: 0.6666666865, green: 0.6666666865, blue: 0.6666666865, alpha: 1)
            
            break
        default:
            debugPrint("VC_Home")
            labelFont(object: homeIcon, style: "Solid", size: 25)
            homeIcon.textColor=#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
            chatIcon.textColor=#colorLiteral(red: 0.6666666865, green: 0.6666666865, blue: 0.6666666865, alpha: 1)
            notificationIcon.textColor=#colorLiteral(red: 0.6666666865, green: 0.6666666865, blue: 0.6666666865, alpha: 1)
            ProfileIcon.textColor=#colorLiteral(red: 0.6666666865, green: 0.6666666865, blue: 0.6666666865, alpha: 1)
            break
        }
    }
}
