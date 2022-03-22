//
//  TopNavigationbar.swift
//  inSooqApp
//
//  Created by mohammad ahmad on 08/02/2021.
//

import UIKit

class TopNavigationbar: UIView {

    @IBOutlet weak var contentView: UIView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var backButton: UIButton!
    
    var vc:UIViewController?
    func setVC(viewController:UIViewController)
    {
        
        self.vc = viewController
        debugPrint("vc:",vc)
        if ((viewController.isKind(of: BrandsViewController.self)) )
        {
            if let vcMainControllor:BrandsViewController = vc as? BrandsViewController{
                titleLabel.text="Brands"
                setDesign()
                enableBtns(enable: true)
            }
        }
        if ((viewController.isKind(of: SubCategoriesViewController.self)) )
        {
            if let vcMainControllor:SubCategoriesViewController = vc as? SubCategoriesViewController{
                titleLabel.text="Subcategory"
                setDesign()
                enableBtns(enable: true)
            }
        }
        //we've added Report button
//        if ((viewController.isKind(of: DetailsViewController.self)) )
//        {
//            if let vcMainControllor:DetailsViewController = vc as? DetailsViewController{
//                titleLabel.text=" Home"
//                setDesign()
//                enableBtns(enable: true)
//            }
//        }
    //MARK:-Account.
        if ((viewController.isKind(of: MyProfileViewController.self)) )
        {
            if let vcMainControllor:MyProfileViewController = vc as? MyProfileViewController{
                titleLabel.text="My Profile"
                setDesign()
                enableBtns(enable: true)
            }
        }
        if ((viewController.isKind(of: MyAdsViewController.self)) )
        {
            if let vcMainControllor:MyAdsViewController = vc as? MyAdsViewController{
                titleLabel.text="My Ads"
                setDesign()
                enableBtns(enable: true)
            }
        }
        if ((viewController.isKind(of: GetMoreViewsViewController.self)) )
        {
            if let vcMainControllor:GetMoreViewsViewController = vc as? GetMoreViewsViewController{
                titleLabel.text="Get More Views"
                setDesign()
                enableBtns(enable: true)
            }
        }
        if ((viewController.isKind(of: StatisticsViewController.self)) )
        {
            if let vcMainControllor:StatisticsViewController = vc as? StatisticsViewController{
                titleLabel.text="Ad Statistics"
                setDesign()
                enableBtns(enable: true)
            }
        }
        if ((viewController.isKind(of: EditAdViewController.self)) )
        {
            if let vcMainControllor:EditAdViewController = vc as? EditAdViewController{
                titleLabel.text="Ad Edit"
                setDesign()
                enableBtns(enable: true)
            }
        }
        if ((viewController.isKind(of: SavedSearchesViewController.self)) )
        {
            if let vcMainControllor:SavedSearchesViewController = vc as? SavedSearchesViewController{
                titleLabel.text="Saved Searches"
                setDesign()
                enableBtns(enable: true)
            }
        }
        if ((viewController.isKind(of: MyFavoritesViewController.self)) )
        {
            if let vcMainControllor:MyFavoritesViewController = vc as? MyFavoritesViewController{
                titleLabel.text="My Favorites"
                setDesign()
                enableBtns(enable: true)
            }
        }
        if ((viewController.isKind(of: JobDashBoardViewController.self)) )
        {
            if let vcMainControllor:JobDashBoardViewController = vc as? JobDashBoardViewController{
                titleLabel.text="Job Dashboard"
                setDesign()
                enableBtns(enable: true)
            }
        }
        if ((viewController.isKind(of: CompanyProfileViewController.self)) )
        {
            if let vcMainControllor:CompanyProfileViewController = vc as? CompanyProfileViewController{
                titleLabel.text="Company Profile"
                setDesign()
                enableBtns(enable: true)
            }
        }
//MARK: List-
        if ((viewController.isKind(of: GuidlinesViewController.self)) )
        {
            if let vcMainControllor:GuidlinesViewController = vc as? GuidlinesViewController{
                titleLabel.text="Selling Guidlines"
                setDesign()
                enableBtns(enable: true)
            }
        }
        if ((viewController.isKind(of: FAQViewController.self)) )
        {
            if let vcMainControllor:FAQViewController = vc as? FAQViewController{
                titleLabel.text="Help Center"
                setDesign()
                enableBtns(enable: true)
            }
        }
        if ((viewController.isKind(of: Terms_PrivacyViewController.self)) )
        {
            if let vcMainControllor:Terms_PrivacyViewController = vc as? Terms_PrivacyViewController{
                setDesign()
                enableBtns(enable: true)
            }
        }
        
        if ((viewController.isKind(of: HowItWorksViewController.self)) )
        {
            if let vcMainControllor:HowItWorksViewController = vc as? HowItWorksViewController{
                titleLabel.text="How It Works"
                setDesign()
                enableBtns(enable: true)
            }
        }
        if ((viewController.isKind(of: ContactViewController.self)) )
        {
            if let vcMainControllor:ContactViewController = vc as? ContactViewController{
                titleLabel.text="Contact Us"
                setDesign()
                enableBtns(enable: true)
            }
        }
    }
    func setDesign(){
        setGradientBackground(view: contentView, colorTop: #colorLiteral(red: 0.5490196078, green: 0.3882352941, blue: 0.9058823529, alpha: 1), colorBottom: #colorLiteral(red: 0.3411764706, green: 0.2745098039, blue: 0.9882352941, alpha: 1))
        
    }
    func enableBtns(enable: Bool){
        backButton.isEnabled=enable
        
    }
    
    @IBAction func back_Pressed(_ sender: Any) {
        guard let vc=self.vc else { return }
        debugPrint("back_Pressed")
        vc.dismiss(animated: true) {
          //  clearViewData(controller: vc)
            debugPrint("vc :- ")
        }
    }
    func xibSetup() {
        
        Bundle.main.loadNibNamed("TopNavigationbar", owner: self, options: nil)
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
    
    

}
