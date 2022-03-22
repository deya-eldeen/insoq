//
//  AccountViewController.swift
//  inSooqApp
//
//  Created by mohammad ahmad on 04/04/2021.
//

import UIKit

class AccountViewController: UIViewController {
    @IBOutlet weak var mainNavBar: MainNavView!
    @IBOutlet weak var bottomView: BottomView!
    @IBOutlet weak var userName: UILabel!
    @IBOutlet weak var scrollView: UIScrollView!
    
    
    @IBOutlet weak var countryButton: UIButton!
    @IBOutlet weak var languageButton: UIButton!
    @IBOutlet weak var userImage: UIImageView!
    @IBOutlet weak var profileIcon: UILabel!
    @IBOutlet weak var adsIcon: UILabel!
    @IBOutlet weak var savedSearchesIcon: UILabel!
    @IBOutlet weak var favoritesIcons: UILabel!
    @IBOutlet weak var jobsIcon: UILabel!
    @IBOutlet weak var logOutIcon: UILabel!
    @IBOutlet weak var advertisingIcon: UILabel!
    
    @IBOutlet weak var countryFlagImg: UIImageView!
    
    @IBOutlet weak var insouqAppIcon: UILabel!
    @IBOutlet weak var listingViewHConstraint: NSLayoutConstraint!
    @IBOutlet weak var listingView: UIView!

    @IBOutlet var stackViews: [UIStackView]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mainNavBar.setVC(viewController: self)
        bottomView.setVC(viewController: self)
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        countryButton.setTitle(Statics.appCountry, for: .normal)
        
        languageButton.setTitle(Statics.appLanguage, for: .normal)
    }
    override func viewDidLayoutSubviews() {
        CATransaction.begin()
        CATransaction.setDisableActions(true)
        setDesign()
        
        CATransaction.commit()
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?)
    {
        
        if self.isKind(of: AccountViewController.self){
            let touch = touches.first
            if touch?.view?.tag != 103{
                hideReportViewAction()
                
            }
        }
        
    }
    
    @objc func hideReportViewAction(){
        for v in self.view.subviews{
            debugPrint("name..",v)
            if v.tag == 103 || v.tag == 101 {
                v.removeFromSuperview()
                debugPrint("Found Back View")
            }
            
        }
    }
    
    
    
    @IBAction func myProfile_Pressed(_ sender: Any) {
        performSegue(withIdentifier: "toMyProfileSegue", sender: nil)
    }
    
    @IBAction func myAds_Pressed(_ sender: Any) {
        performSegue(withIdentifier: "toMyAdsSegue", sender: nil)
    }
    
    @IBAction func savedSearch_Pressed(_ sender: Any) {
        performSegue(withIdentifier: "toSavedSearchesSegue", sender: nil)
    }
    
    @IBAction func myFavorites_Pressed(_ sender: Any) {
        performSegue(withIdentifier: "toMyFavoritesSegue", sender: nil)
    }
    
    @IBAction func myJobs_Pressed(_ sender: Any) {
        performSegue(withIdentifier: "toJobDashboardSegue", sender: nil)
    }
    @IBAction func language_Pressed(_ sender: Any) {
        registerLanguageView(viewType: 2)
    }
    @IBAction func country_Pressed(_ sender: Any) {
        registerLanguageView(viewType: 1)
    }
    
    
    @IBAction func advertising_Pressed(_ sender: Any) {
        debugPrint("advertising pressed...")
        forcePresentViewController(viewController: self, storyBoardId: "AdvertisingViewController")
    }
    @IBAction func listing_Pressed(_ sender: Any) {
        if listingView.isHidden{
            listingView.animateViewHeight(controller: self, height: 360, heightConstraint: listingViewHConstraint)
            scrollView.setContentOffset(CGPoint(x: 0, y: CGFloat.greatestFiniteMagnitude), animated: false)

        }else{
            listingView.animateViewHeight(controller: self, height: 0, heightConstraint: listingViewHConstraint)
            
        }
        listingView.isHidden = !listingView.isHidden
    }
    @IBAction func logout_Pressed(_ sender: Any) {
        removeViewDataFromMemory(controller: self, vcToClear: AccountViewController.self)
        //clearViewData(controller: self)
        newRoot(NavId: "RegistrationNav")
    }
    //MARK: listing Buttons...
    
    @IBAction func support_Pressed(_ sender: Any) {
        debugPrint("support_Pressed")
        Terms_PrivacyViewController._hideBottomView=false
        Terms_PrivacyViewController.index=3
        forcePresentViewController(viewController: self, storyBoardId: "Terms_PrivacyViewController")
        
    }
    
    @IBAction func fqa_Pressed(_ sender: Any) {
        debugPrint("fqa_Pressed")
        //  Statics.tabBarFlag=0
        forcePresentViewController(viewController: self, storyBoardId: "FAQViewController")
        
        //performSegue(withIdentifier: "toFQASegue", sender: nil)
        
        
    }
    
    @IBAction func terms_Pressed(_ sender: Any) {
        Terms_PrivacyViewController._hideBottomView=false
        Terms_PrivacyViewController.index=0
        forcePresentViewController(viewController: self, storyBoardId: "Terms_PrivacyViewController")
        
    }
    
    @IBAction func privacy_Pressed(_ sender: Any) {
        Terms_PrivacyViewController._hideBottomView=false
        Terms_PrivacyViewController.index=1
        forcePresentViewController(viewController: self, storyBoardId: "Terms_PrivacyViewController")
        
    }
    
    @IBAction func about_Pressed(_ sender: Any) {
        Terms_PrivacyViewController._hideBottomView=false
        Terms_PrivacyViewController.index=2
        forcePresentViewController(viewController: self, storyBoardId: "Terms_PrivacyViewController")
    }
    
    
    @IBAction func howItWorks_Pressed(_ sender: Any) {
        forcePresentViewController(viewController: self, storyBoardId: "HowItWorksViewController")
        
    }
    
    @IBAction func sellingGuidlines_Pressed(_ sender: Any) {
        forcePresentViewController(viewController: self, storyBoardId: "GuidlinesViewController")
        
    }
    
    @IBAction func contact_Pressed(_ sender: Any) {
        forcePresentViewController(viewController: self, storyBoardId: "ContactViewController")
    }
    
    
    //MARK:-Private Methods-
    @objc func reloadData(){
        self.reloadInputViews()
        languageButton.setTitle(Statics.appLanguage, for: .normal)
        countryButton.setTitle(Statics.appCountry, for: .normal)
        hideReportViewAction()
    }
    func registerLanguageView(viewType:Int){
        registerBackView(c: self)
        let languageView: LanguageView = {
            let v = LanguageView()
            // view.backgroundColor = .white
            v.addShadowToView()
            v.translatesAutoresizingMaskIntoConstraints = false
            return v
        }()
        
        view.addSubview(languageView)
        languageView.tag=103
        languageView.setVC(viewController: self, viewTag: viewType)
        languageView.setLanguage_Button.addTarget(self, action: #selector(reloadData), for: .touchUpInside)
        languageView.cancelButton.addTarget(self, action: #selector(hideReportViewAction), for: .touchUpInside)
        languageView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.8).isActive=true
        switch viewType{
        case 1:
            languageView.heightAnchor.constraint(equalToConstant: 310).isActive=true
            break
            
        default:
            languageView.heightAnchor.constraint(equalToConstant: 195).isActive=true
            
        }
        //(equalTo: c.view.heightAnchor, multiplier: 0.35).isActive=true
        languageView.centerXAnchor.constraint(equalTo:  view.centerXAnchor).isActive=true
        languageView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive=true
    }
    
    private func setDesign(){
        view.layoutIfNeeded()
        
        if let icons=Statics.icons as? FontAwesomeIcons{
            debugPrint("")
            profileIcon.text = icons.person_icon
            profileIcon.font = UIFont(name: "FontAwesome5Pro-Regular", size: 25)
            profileIcon.textColor=#colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 1)
            
            adsIcon.text = icons.list_icon
            adsIcon.font = UIFont(name: "FontAwesome5Pro-Regular", size: 25)
            adsIcon.textColor=#colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 1)
            
            savedSearchesIcon.text = icons.savedSearches_icon
            savedSearchesIcon.font = UIFont(name: "FontAwesome5Pro-Regular", size: 25)
            savedSearchesIcon.textColor=#colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 1)
            
            favoritesIcons.text = icons.heart_icon
            favoritesIcons.font = UIFont(name: "FontAwesome5Pro-Regular", size: 25)
            favoritesIcons.textColor=#colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 1)
            
            jobsIcon.text = icons.bag_icon
            jobsIcon.font = UIFont(name: "FontAwesome5Pro-Regular", size: 25)
            jobsIcon.textColor=#colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 1)
            
            advertisingIcon.text = icons.ads_icon
            advertisingIcon.font = UIFont(name: "FontAwesome5Pro-Regular", size: 25)
            advertisingIcon.textColor=#colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 1)
            
            insouqAppIcon.text = icons.list_icon
            insouqAppIcon.font = UIFont(name: "FontAwesome5Pro-Regular", size: 25)
            insouqAppIcon.textColor=#colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 1)

            logOutIcon.text = icons.logout_icon
            logOutIcon.font = UIFont(name: "FontAwesome5Pro-Regular", size: 25)
            logOutIcon.textColor=#colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 1)
        }
        for s in stackViews{
            //topBorder(object: s, addedValue: 1)
            bottomBorder(object: s)
        }
        objectCornerRadius(object: userImage, cornerRadius: userImage.width/2)
        view.setNeedsLayout()
        
    }
}
