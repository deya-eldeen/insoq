//
//  BottomBar.swift
//  inSooqApp
//
//  Created by mohammad ahmad on 09/02/2021.
//

import UIKit

class BottomBar: UIView {
    
    @IBOutlet weak var newMessageView: UIView!
    
    @IBOutlet weak var homeIcon: UILabel!
    @IBOutlet weak var chatIcon: UILabel!
    @IBOutlet weak var addIcon: UILabel!
    @IBOutlet weak var notificationIcon: UILabel!
    @IBOutlet weak var profileIcon: UILabel!
    
    @IBOutlet weak var addBtn: UIButton!
    @IBOutlet weak var homeBtn: UIButton!
    @IBOutlet weak var chatBtn: UIButton!
    @IBOutlet weak var notificationBtn: UIButton!
    @IBOutlet weak var profileBtn: UIButton!
    
    @IBOutlet weak var backView: UIView!
    @IBOutlet var contentView: UIView!
    var icons=FontAwesomeIcons()
    var vc:UIViewController?
    func setVC(viewController:UIViewController)
    {
        
        //MARK:-Main Tabs
        self.vc = viewController
        if ((viewController.isKind(of: SubCategoriesViewController.self)) )
        {
            if let vcMainControllor:SubCategoriesViewController = vc as? SubCategoriesViewController{
                Statics.tabBarFlag=1
                initBtns()
                addTargets(vc:vcMainControllor)
                enableBtns(enable: true)
            }
        }
        if ((viewController.isKind(of: AddViewController.self)) )
        {
            if let vcMainControllor:AddViewController = vc as? AddViewController{
                Statics.tabBarFlag=5
                initBtns()
                addTargets(vc:vcMainControllor)
                enableBtns(enable: true)
            }
        }
        if ((viewController.isKind(of: AgencyViewController.self)) )
        {
            if let vcMainControllor:AgencyViewController = vc as? AgencyViewController{
                Statics.tabBarFlag=5
                initBtns()
                addTargets(vc:vcMainControllor)
                enableBtns(enable: true)
            }
        }

        //MARK: Nofication Tab
        if ((viewController.isKind(of: NotificationsViewController.self)) )
        {
            if let vcMainControllor:NotificationsViewController = vc as? NotificationsViewController{
                Statics.tabBarFlag=3
                initBtns()
                addTargets(vc:vcMainControllor)
                enableBtns(enable: true)
            }
        }
        //MARK:-Sub Tabs
       
        //MARK:Home Tab-4
        if ((viewController.isKind(of: DetailsViewController.self)) )
        {
            if let vcMainControllor:DetailsViewController = vc as? DetailsViewController{
                Statics.tabBarFlag=1
                initBtns()
                addTargets(vc:vcMainControllor)
                enableBtns(enable: true)
            }
        }
        if ((viewController.isKind(of: MotorsBrandsViewController.self)) )
        {
            if let vcMainControllor:MotorsBrandsViewController = vc as? MotorsBrandsViewController{
                Statics.tabBarFlag=1
                initBtns()
                addTargets(vc:vcMainControllor)
                enableBtns(enable: true)
            }
        }
        if ((viewController.isKind(of: BrandVc.self)) )
        {
            if let vcMainControllor:BrandVc = vc as? BrandVc{
                Statics.tabBarFlag=1
                initBtns()
                addTargets(vc:vcMainControllor)
                enableBtns(enable: true)
            }
        }
        if ((viewController.isKind(of: SubBrandVc.self)) )
        {
            if let vcMainControllor:SubBrandVc = vc as? SubBrandVc{
                Statics.tabBarFlag=1
                initBtns()
                addTargets(vc:vcMainControllor)
                enableBtns(enable: true)
            }
        }
        if ((viewController.isKind(of: ApplayForJobViewController.self)) )
        {
            if let vcMainControllor:ApplayForJobViewController = vc as? ApplayForJobViewController{
                Statics.tabBarFlag=1
                initBtns()
                addTargets(vc:vcMainControllor)
                enableBtns(enable: true)
            }
        }
        
        
        //MARK:Chat Tab-2
        
        //MARK: Favorate Tab-3
   
        //MARK: Profile Tab-4
        
        if ((viewController.isKind(of: MyAdsViewController.self)) )
        {
            if let vcMainControllor:MyAdsViewController = vc as? MyAdsViewController{
                Statics.tabBarFlag=4
                initBtns()
                addTargets(vc:vcMainControllor)
                enableBtns(enable: true)
            }
        }
        if ((viewController.isKind(of: MyFavoritesViewController.self)) )
        {
            if let vcMainControllor:MyFavoritesViewController = vc as? MyFavoritesViewController{
                Statics.tabBarFlag=4
                initBtns()
                addTargets(vc:vcMainControllor)
                enableBtns(enable: true)
            }
        }
        
        if ((viewController.isKind(of: MyProfileViewController.self)) )
        {
            if let vcMainControllor:MyProfileViewController = vc as? MyProfileViewController{
                Statics.tabBarFlag=4
                initBtns()
                addTargets(vc:vcMainControllor)
                enableBtns(enable: true)
            }
        }
        if ((viewController.isKind(of: GetMoreViewsViewController.self)) )
        {
            if let vcMainControllor:GetMoreViewsViewController = vc as? GetMoreViewsViewController{
                Statics.tabBarFlag=4
                initBtns()
                addTargets(vc:vcMainControllor)
                enableBtns(enable: true)
            }
        }
        if ((viewController.isKind(of: StatisticsViewController.self)) )
        {
            if let vcMainControllor:StatisticsViewController = vc as? StatisticsViewController{
                Statics.tabBarFlag=4
                initBtns()
                addTargets(vc:vcMainControllor)
                enableBtns(enable: true)
            }
        }
        if ((viewController.isKind(of: SavedSearchesViewController.self)) )
        {
            if let vcMainControllor:SavedSearchesViewController = vc as? SavedSearchesViewController{
                Statics.tabBarFlag=4
                initBtns()
                addTargets(vc:vcMainControllor)
                enableBtns(enable: true)
            }
        }
        if ((viewController.isKind(of: JobDashBoardViewController.self)) )
        {
            if let vcMainControllor:JobDashBoardViewController = vc as? JobDashBoardViewController{
                Statics.tabBarFlag=4
                initBtns()
                addTargets(vc:vcMainControllor)
                enableBtns(enable: true)
            }
        }
        if ((viewController.isKind(of: CompanyProfileViewController.self)) )
        {
            if let vcMainControllor:CompanyProfileViewController = vc as? CompanyProfileViewController{
                Statics.tabBarFlag=4
                initBtns()
                addTargets(vc:vcMainControllor)
                enableBtns(enable: true)
            }
        }
        if ((viewController.isKind(of: EditAdViewController.self)) )
        {
            if let vcMainControllor:EditAdViewController = vc as? EditAdViewController{
                Statics.tabBarFlag=4
                initBtns()
                addTargets(vc:vcMainControllor)
                enableBtns(enable: true)
            }
        }
        
        if ((viewController.isKind(of: FAQViewController.self)) )
        {
            if let vcMainControllor:FAQViewController = vc as? FAQViewController{
                Statics.tabBarFlag=4
                initBtns()
                addTargets(vc:vcMainControllor)
                enableBtns(enable: true)
            }
        }
        if ((viewController.isKind(of: Terms_PrivacyViewController.self)) )
        {
            if let vcMainControllor:Terms_PrivacyViewController = vc as? Terms_PrivacyViewController{
                Statics.tabBarFlag=4
                initBtns()
                addTargets(vc:vcMainControllor)
                enableBtns(enable: true)
            }
        }
        
        if ((viewController.isKind(of: GuidlinesViewController.self)) )
        {
            if let vcMainControllor:GuidlinesViewController = vc as? GuidlinesViewController{
                Statics.tabBarFlag=4
                initBtns()
                addTargets(vc:vcMainControllor)
                enableBtns(enable: true)
            }
        }
        if ((viewController.isKind(of: HowItWorksViewController.self)) )
        {
            if let vcMainControllor:HowItWorksViewController = vc as? HowItWorksViewController{
                Statics.tabBarFlag=4
                initBtns()
                addTargets(vc:vcMainControllor)
                enableBtns(enable: true)
            }
        }
        if ((viewController.isKind(of: ContactViewController.self)) )
        {
            if let vcMainControllor:ContactViewController = vc as? ContactViewController{
                Statics.tabBarFlag=4
                initBtns()
                addTargets(vc:vcMainControllor)
                enableBtns(enable: true)
            }
        }
        if ((viewController.isKind(of: AdvertisingViewController.self)) )
        {
            if let vcMainControllor:AdvertisingViewController = vc as? AdvertisingViewController{
                Statics.tabBarFlag=4
                initBtns()
                addTargets(vc:vcMainControllor)
                enableBtns(enable: true)
            }
        }
        
        
        
        //Add Tab-5
        if ((viewController.isKind(of: Add_CategoryViewController.self)) )
        {
            if let vcMainControllor:Add_CategoryViewController = vc as? Add_CategoryViewController{
                Statics.tabBarFlag=5
                initBtns()
                addTargets(vc:vcMainControllor)
                enableBtns(enable: true)
            }
        }
        if ((viewController.isKind(of: Add_TitleViewController.self)) )
        {
            if let vcMainControllor:Add_TitleViewController = vc as? Add_TitleViewController{
                Statics.tabBarFlag=5
                initBtns()
                addTargets(vc:vcMainControllor)
                enableBtns(enable: true)
            }
        }
        if ((viewController.isKind(of: Add_BrandViewController.self)) )
        {
            if let vcMainControllor:Add_BrandViewController = vc as? Add_BrandViewController{
                Statics.tabBarFlag=5
                initBtns()
                addTargets(vc:vcMainControllor)
                enableBtns(enable: true)
            }
        }
        if ((viewController.isKind(of: Add_FullSpecesViewController.self)) )
        {
            if let vcMainControllor:Add_FullSpecesViewController = vc as? Add_FullSpecesViewController{
                Statics.tabBarFlag=5
                initBtns()
                addTargets(vc:vcMainControllor)
                enableBtns(enable: true)
            }
        }
        if ((viewController.isKind(of: AdPackageViewController.self)) )
        {
            if let vcMainControllor:AdPackageViewController = vc as? AdPackageViewController{
                Statics.tabBarFlag=5
                initBtns()
                addTargets(vc:vcMainControllor)
                enableBtns(enable: true)
            }
        }
        if ((viewController.isKind(of: CardDetailsViewController.self)) )
        {
            if let vcMainControllor:CardDetailsViewController = vc as? CardDetailsViewController{
                Statics.tabBarFlag=5
                initBtns()
                addTargets(vc:vcMainControllor)
                enableBtns(enable: true)
            }
        }
        
    }
    private func addTargets(vc:UIViewController){
        homeBtn.addTarget(self, action: #selector(homeTapped(sender:)), for: .touchUpInside)
        chatBtn.addTarget(self, action: #selector(chatTapped(sender:)), for: .touchUpInside)
        notificationBtn.addTarget(self, action: #selector(notificationTapped(sender:)), for: .touchUpInside)
        profileBtn.addTarget(self, action: #selector(listTapped(sender:)), for: .touchUpInside)
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
        else if ((vc.isKind(of: NotificationsViewController.self))){
            if let vcMainControllor:NotificationsViewController = vc as? NotificationsViewController{
                vcMainControllor.dismiss(animated: true) {
                    clearViewData(controller: vcMainControllor)
                }
            }
        }
        else{
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
        forcePresentViewController(viewController: vc, storyBoardId: "ChatViewController")
        Statics.tabBarFlag=2
        debugPrint("VC Stack-",vc.navigationController?.viewControllers)
        
        initBtns()
        //(ofTouch: 0, in: self.categoriesCollectionView)
    }
    @objc func notificationTapped(sender: UIButton) {
        //   view.endEditing(true)
        debugPrint("VC Stack- notificationTapped")
        guard let vc = self.vc else {
            return
        }
        forcePresentViewController(viewController: vc, storyBoardId: "NotificationsViewController")
        debugPrint("VC Stack-",vc.navigationController?.viewControllers)
        Statics.tabBarFlag=3
        initBtns()
        //(ofTouch: 0, in: self.categoriesCollectionView)
    }
    @objc func listTapped(sender: UIButton) {
        //   view.endEditing(true)
        debugPrint("VC Stack listTapped")
        guard let vc = self.vc else {
            return
        }
        forcePresentViewController(viewController: vc, storyBoardId: "AccountViewController")
        debugPrint("VC Stack-",vc.navigationController?.viewControllers)
        Statics.tabBarFlag=4
        initBtns()
        //(ofTouch: 0, in: self.categoriesCollectionView)
    }
    
    @objc func addTapped(sender: UIButton) {
        //   view.endEditing(true)
        debugPrint("listTapped")
        guard let vc = self.vc else {
            return
        }
        debugPrint("vcs",vc.navigationController?.viewControllers)
        if ((vc.isKind(of: AddViewController.self)) || (vc.isKind(of: Add_TitleViewController.self)) || (vc.isKind(of: Add_BrandViewController.self)) || (vc.isKind(of: AdPackageViewController.self)) || (vc.isKind(of: CardDetailsViewController.self)) || (vc.isKind(of: Add_CategoryViewController.self)) || (vc.isKind(of: Add_FullSpecesViewController.self)))
        {
            debugPrint("Can't do any thing")
        }else{
            
            forcePresentViewController(viewController: vc, storyBoardId: "AddViewController")
            debugPrint("VC Stack-",vc.navigationController?.viewControllers)
        }
        //(ofTouch: 0, in: self.categoriesCollectionView)
    }
    
    
    func xibSetup() {
        
        Bundle.main.loadNibNamed("BottomBar", owner: self, options: nil)
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
    
    func enableBtns(enable:Bool)
    {
        self.homeBtn.isEnabled=enable
        self.chatBtn.isEnabled=enable
        self.notificationBtn.isEnabled=enable
        self.profileBtn.isEnabled=enable
        self.addBtn.isEnabled=enable
    }
    
    private func objectShadow(object  :AnyObject,cornerRadius:CGFloat)
    {
        object.layer?.cornerRadius=cornerRadius
        object.layer.shadowColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        object.layer.shadowRadius = 2
        object.layer.shadowOffset = CGSize(width: 0, height: 0)
        object.layer.shadowOpacity = 0.3
        object.layer.rasterizationScale = UIScreen.main.scale
        object.layer.shouldRasterize = true
        
    }
    
    
    func initBtns(){
        objectShadow(object: backView, cornerRadius: 0)
        labelFont(object: homeIcon, style: "Regular", size: 20)
        homeIcon.text=icons.tab_Home_icon
        labelFont(object: chatIcon, style: "Regular", size: 20)
        chatIcon.text=icons.tab_Chat_icon
        labelFont(object: notificationIcon, style: "Regular", size: 20)
        notificationIcon.text=icons.bell_icon
        labelFont(object: profileIcon, style: "Regular", size: 20)
        profileIcon.text=icons.person_icon
        labelFont(object: addIcon, style: "Regular", size: 30)
        addIcon.text=icons.plus_icon
        addIcon.textColor=#colorLiteral(red: 0.3411764706, green: 0.2745098039, blue: 0.9882352941, alpha: 1)
        
        newMessageView.layer.cornerRadius = newMessageView.frame.height/2
        addBtn.layer.cornerRadius=addBtn.frame.height/2
        
        
        switch Statics.tabBarFlag{
        case 2:
            debugPrint("VC_ChatVC")
            labelFont(object: chatIcon, style: "Solid", size: 25)
            chatIcon.textColor=#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
            notificationIcon.textColor=#colorLiteral(red: 0.6666666865, green: 0.6666666865, blue: 0.6666666865, alpha: 1)
            profileIcon.textColor=#colorLiteral(red: 0.6666666865, green: 0.6666666865, blue: 0.6666666865, alpha: 1)
            homeIcon.textColor=#colorLiteral(red: 0.6666666865, green: 0.6666666865, blue: 0.6666666865, alpha: 1)
            break
        case 3:
            debugPrint("VC_Person")
            // newNotificationView.backgroundColor = .none
            // API._NewNotificaion=false
            labelFont(object: notificationIcon, style: "Solid", size: 25)
            notificationIcon.textColor=#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
            chatIcon.textColor=#colorLiteral(red: 0.6666666865, green: 0.6666666865, blue: 0.6666666865, alpha: 1)
            profileIcon.textColor=#colorLiteral(red: 0.6666666865, green: 0.6666666865, blue: 0.6666666865, alpha: 1)
            homeIcon.textColor=#colorLiteral(red: 0.6666666865, green: 0.6666666865, blue: 0.6666666865, alpha: 1)
            
            break
        case 4:
            debugPrint("VC_list")
            labelFont(object: profileIcon, style: "Solid", size: 25)
            profileIcon.textColor=#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
            chatIcon.textColor=#colorLiteral(red: 0.6666666865, green: 0.6666666865, blue: 0.6666666865, alpha: 1)
            notificationIcon.textColor=#colorLiteral(red: 0.6666666865, green: 0.6666666865, blue: 0.6666666865, alpha: 1)
            homeIcon.textColor=#colorLiteral(red: 0.6666666865, green: 0.6666666865, blue: 0.6666666865, alpha: 1)
            
            break
        case 5:
            debugPrint("VC_list")
            profileIcon.textColor=#colorLiteral(red: 0.6666666865, green: 0.6666666865, blue: 0.6666666865, alpha: 1)
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
            profileIcon.textColor=#colorLiteral(red: 0.6666666865, green: 0.6666666865, blue: 0.6666666865, alpha: 1)
            break
        }
    }
}
