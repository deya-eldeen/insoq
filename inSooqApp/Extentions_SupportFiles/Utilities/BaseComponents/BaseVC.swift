////
////  BaseVC.swift
////  orood
////
////  Created by Deya AlDeen on 15/07/2021.
////
//
//import UIKit
////import SFSafeSymbols
//import Defaults
//
//enum FilterTarget {
//    case companies
//    case stores
//    case offers
//    case items
//}
//
//
//class BaseVC: UIViewController, NibInitializable {
//
//    // Inter Ads
//    var interstitial:GADInterstitial?
//
//    // Native Ads
//    var adLoader: GADAdLoader!
//    static var nativeAds = [GADUnifiedNativeAd]()
//    
//    var bannerRequest = GADRequest()
//    
//    static var bannerRequestsArray : [GADRequest] = []
//    
//    static var screenSearchFor : FilterTarget = .offers
//    static var filterModel = FilterModel(query: "", citiesIDs: [0], regionsIDs: [0], categoriesIDs: [0], subcategoriesIDs: [0])
//    
//    override var prefersHomeIndicatorAutoHidden: Bool { return true }
//    
//    var exitBarButton: UIBarButtonItem?
//    var listBarButton: UIBarButtonItem?
//    var cityBarButton: UIBarButtonItem?
//    var ratingBarButton: UIBarButtonItem?
//    var filterBatButton: UIBarButtonItem?
//    var callBarButton: UIBarButtonItem?
//
//    @IBOutlet weak var tableView: UITableView!
//    @IBOutlet weak var collectionView: UICollectionView!
//    @IBOutlet weak var bannerView: GADBannerView!
//
//    var tabUnderlines = [UIView]()
//    var searchBar: SearchBar!
//    var stateView: TableState?
//    
//    var addedStateSubviews = 0
//
//    
//    // MARK: Search bar
//    
//    var buttonBarItemWidth: CGFloat = 72
//    var numberOfUIBarButtonItems = 0
//
//    func loadNativeAdvertisment() {
//        print("loadNativeAdvertisment___")
//        let multipleAdsOptions = GADMultipleAdsAdLoaderOptions()
//        multipleAdsOptions.numberOfAds = Constants.numberOfAdsToLoadPerRequest
//        
//        adLoader = GADAdLoader(adUnitID: Constants.nativeAdUnitID, rootViewController: self,adTypes: [.unifiedNative], options: [multipleAdsOptions])
//        adLoader.delegate = self
//        
////        let queue = DispatchQueue.global(qos: .utility) //(label: "com.orood.google.native", attributes: .concurrent)
//
//        DispatchQueue.global(qos: .utility).async {
//            let gadReq = GADRequest()
//            print("gadReq",gadReq.requestAgent)
//            self.adLoader.load(gadReq)
//        }
////        queue.async {
////
////        }
//    }
//    
//    func loadAdvertisment() {
//        print("loadAdvertisment")
//
//        if(Constants.isAdsEnabled == false) {
//            return
//        }
//        
//        if let bannerView = bannerView {
//            bannerView.adSize = kGADAdSizeBanner
//            bannerView.adUnitID = Constants.adUnitID
//            bannerView.delegate = self
//            bannerView.rootViewController = self
//            
//            DispatchQueue.global(qos: .utility).async {
//                let gadReq = GADRequest()
//                self.bannerRequest = gadReq
//                BaseVC.bannerRequestsArray.append(gadReq)
//                DispatchQueue.main.async {
//                    bannerView.load(self.bannerRequest)
//                }
//            }
//
//        }
//        
//    }
//    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        loadAdvertisment()
//        loadNativeAdvertisment()
//    }
//    
//    func scrollToBottom(dateCount: Int) {
//        DispatchQueue.main.async {
//            var targetIndex = dateCount - 1
//            if(targetIndex < 0) {targetIndex = 0}
//            let indexPath = IndexPath(row: targetIndex, section: 0)
//            
//            let rows = self.tableView.numberOfRows(inSection: 0)
//            if(rows > 0) {
//                self.tableView.scrollToRow(at: indexPath, at: .bottom, animated: false)
//            }
//            
//        }
//    }
//    
//    func scrollToTop(dateCount: Int) {
//        DispatchQueue.main.async {
//            var targetIndex = 0
//            let indexPath = IndexPath(row: targetIndex, section: 0)
//            let rows = self.tableView.numberOfRows(inSection: 0)
//            if(rows > 0) {
//                self.tableView.scrollToRow(at: indexPath, at: .bottom, animated: false)
//            }
//            
//        }
//    }
//    
//    func setupNavBarAppearance() {
//        if #available(iOS 13.0, *) {
//            let appearance = UINavigationBarAppearance()
//            
//            appearance.configureWithOpaqueBackground()
//            appearance.backgroundColor = AppColors.theme_red
//
//            let font : FontConvertible.Font = FontFamily.Roboto.bold.font(size: 20)
//            let attributes: [NSAttributedString.Key: AnyObject] = [
//                NSAttributedString.Key.font: font,
//                NSAttributedString.Key.foregroundColor: UIColor.white
//            ]
//            
//            appearance.titleTextAttributes = attributes
//            
//            if let navbar = self.navigationController?.navigationBar {
//                navbar.standardAppearance = appearance
//                navbar.scrollEdgeAppearance = navbar.standardAppearance
//            }
//            
//        } else {
//            // Fallback on earlier versions
//        }
//
//    }
//    
//    func refreshSearchBar() {
//        if(searchBar != nil) {
//            
//            let currentCityID = Defaults[.currentCity]?.id ?? 0
//            
//            if (currentCityID == 0) {
//                self.searchBar.placeholder = "\("search_in".localized) \("all_cities".localized)"
//            } else {
//                self.searchBar.placeholder = "\("search_in".localized) \(Defaults[.currentCity]?.name ?? "")"
//            }
//            
//        }
//    }
//    
//    func addSearchBar(){
//        searchBar = SearchBar()
//        searchBar.applyTheme(
//            themeColor: AppColors.white.withAlphaComponent(0.9),
//            textBGColor: AppColors.white.withAlphaComponent(0.4)
//        )
//        refreshSearchBar()
//        
//        if (numberOfUIBarButtonItems == 0) {
//            numberOfUIBarButtonItems = 1
//        }
//        
//        let targetWidth = self.view.frame.width - ( buttonBarItemWidth * CGFloat(self.numberOfUIBarButtonItems) )
//        
//        let frame = CGRect(x: 0, y: 0, width: targetWidth, height: 44)
//        let titleView = UIView(frame: frame)
//        searchBar.backgroundImage = UIImage()
//        searchBar.frame = frame
//        searchBar.delegate = self
//        searchBar.enablesReturnKeyAutomatically = false 
//        titleView.addSubview(searchBar)
//        navigationItem.titleView = titleView
//        
//    }
//    
//    // MARK: Navigation Buttons
//    
//    
//    let misc_chevron_image = UIImage(named: "misc_chevron")
//    let misc_filter_image = UIImage(named: "misc_filter")
//    let misc_list_image = UIImage(named: "misc_list")
//    let misc_location_image = UIImage(named: "misc_location")
//    let misc_star_image = UIImage(named: "misc_star")
//    let misc_call_image = UIImage(named: "misc_call")
//    let misc_add_image = UIImage(named: "misc_add")
//
//    func addDismissChevron(withColor: UIColor = AppColors.white){
//        let chevron = misc_chevron_image //UIImage(systemName: SFSymbol.chevronDown.rawValue)?.withRenderingMode(.alwaysTemplate)
//        exitBarButton = UIBarButtonItem(image: chevron, style: .done,target: self, action: #selector(dismissView))
//        exitBarButton?.tintColor = withColor
//        navigationItem.rightBarButtonItem = exitBarButton
//    }
//    
//    func addListButton(){
//        numberOfUIBarButtonItems += 1
//        let listImage = misc_list_image
//        listBarButton = UIBarButtonItem(image: listImage, style: .done,target: self, action: #selector(revealSlideMenu))
//        listBarButton?.tintColor = AppColors.white
//        navigationItem.leftBarButtonItem = listBarButton
//    }
//    
//    func addAddItemButton(){
//        numberOfUIBarButtonItems += 1
//        listBarButton = UIBarButtonItem(image: misc_add_image, style: .done,target: self, action: #selector(didTapAddItem))
//        listBarButton?.tintColor = AppColors.white
//        navigationItem.rightBarButtonItem = listBarButton
//    }
//    
//    func addCityButton(){
//        numberOfUIBarButtonItems += 1
//        let iconImage = misc_location_image //UIImage(systemName: SFSymbol.mappinAndEllipse.rawValue)?.withRenderingMode(.alwaysTemplate)
//        cityBarButton = UIBarButtonItem(image: iconImage, style: .done,target: self, action: #selector(revealCityPicker))
//        cityBarButton?.tintColor = AppColors.white
//        navigationItem.rightBarButtonItem = cityBarButton
//    }
//    
//    func addCityButtonWithFilter(){
//        numberOfUIBarButtonItems += 1
//        let iconImage = misc_filter_image //UIImage(systemName: SFSymbol.lineHorizontal3DecreaseCircleFill.rawValue)?.withRenderingMode(.alwaysTemplate)
//        filterBatButton = UIBarButtonItem(image: iconImage, style: .done,target: self, action: #selector(revealFilter))
//        filterBatButton?.tintColor = AppColors.white
//        
//        numberOfUIBarButtonItems += 1
//        let iconImage2 = misc_location_image //UIImage(systemName: SFSymbol.mappinAndEllipse.rawValue)?.withRenderingMode(.alwaysTemplate)
//        cityBarButton = UIBarButtonItem(image: iconImage2, style: .done,target: self, action: #selector(revealCityPicker))
//        cityBarButton?.tintColor = AppColors.white
//        navigationItem.rightBarButtonItems = [cityBarButton!,filterBatButton!]
//    }
//    
//    func addRatingButtonWithCall(){
//        numberOfUIBarButtonItems += 1
//        let starImage = misc_star_image //UIImage(systemName: SFSymbol.starFill.rawValue)?.withRenderingMode(.alwaysTemplate)
//        ratingBarButton = UIBarButtonItem(image: starImage, style: .done,target: self, action: #selector(revealRatingScreen))
//        ratingBarButton?.tintColor = AppColors.white
//        
//        numberOfUIBarButtonItems += 1
//        let callImage = misc_call_image //UIImage(systemName: SFSymbol.phone.rawValue)?.withRenderingMode(.alwaysTemplate)
//        callBarButton = UIBarButtonItem(image: callImage, style: .done,target: self, action: #selector(openCallSheet))
//        callBarButton?.tintColor = AppColors.white
//        navigationItem.rightBarButtonItems = [callBarButton!, ratingBarButton!]
//    }
//    
//    var tel1 = ""
//    var tel2 = ""
//    
//    @objc func openCallSheet() {
//        
//        let phonePrefix = "tel://"
//        
//        let url:NSURL = NSURL(string: phonePrefix+CompanyInformationVC.telephone1)!
//        let url2:NSURL = NSURL(string: phonePrefix+CompanyInformationVC.telephone2)!
//
//        let sheetTitle = "choose_numbers".localized
//        let sheetMessage = ""
//        let sheetMessageNoNumbers = "no_numbers_to_call".localized
//        
//        let sheetNumber1 = "number_1".localized
//        let sheetNumber2 = "number_2".localized
//
//        let alert = UIAlertController(title: sheetTitle, message: sheetMessage, preferredStyle: .alert)
//        
//        if UIApplication.shared.canOpenURL(url as URL) {
//            let firstNumberAction = UIAlertAction(title: sheetNumber1, style: .default, handler: { _ in
//                 UIApplication.shared.openURL(url as URL)
//            })
//            alert.addAction(firstNumberAction)
//        }
//
//        if UIApplication.shared.canOpenURL(url2 as URL) {
//            let secondNumberAction = UIAlertAction(title: sheetNumber2, style: .default, handler: { _ in
//                 UIApplication.shared.openURL(url2 as URL)
//            })
//            alert.addAction(secondNumberAction)
//        }
//        
//        if alert.actions.count == 0 {
//            alert.title = sheetMessageNoNumbers
//            alert.message = ""
//            alert.addAction(UIAlertAction(title: "ok".localized, style: .default, handler: nil))
//        } else {
//            alert.addAction(UIAlertAction(title: "cancel".localized, style: .destructive, handler: nil))
//        }
//        
//        self.present(alert, animated: true, completion: nil)
//    }
//    
//    @objc func dismissView(){
//        print("dismissView")
//        self.dismiss(animated: true, completion: nil)
//    }
//    
//    var targetStoreID = 0
//    
//    @objc func didTapAddItem() {
//        print("didTapAddItem")
//        let storeVC = StoreVC()
//        storeVC.id = targetStoreID
//        storeVC.isEditingOrder = true
//        self.navigationController?.pushViewController(storeVC, animated: true)
//    }
//    
//    @objc func revealSlideMenu(){
//        let slideMenuVC = SlideMenuVC()
//        slideMenuVC.delegate = self
//        slideMenuVC.modalTransitionStyle = .crossDissolve
//        slideMenuVC.modalPresentationStyle = .overFullScreen
//        self.present(slideMenuVC, animated: true, completion: nil)
//    }
//    
//    var rating_company_id = 0
//    @objc func revealRatingScreen() {
//        guard (Defaults[.session] != nil) else { _ = self.shouldShowLoginForGuests() ;return }
//        
//        let ratingVC = RatingVC.initFromXib()
//        ratingVC.company_id = rating_company_id
//        let customNavigation = CustomNavigation(rootViewController: ratingVC)
//        
//        customNavigation.navStyle = .translucent
//        self.present(customNavigation, animated: true, completion: nil)
//    }
//    
//    @objc func revealCityPicker(){
//        let vc = CityPickerVC.initFromXib()
//        vc.delegate = self
//        let customNavigation = CustomNavigation(rootViewController: vc)
//        customNavigation.navStyle = .translucent
//        self.present(customNavigation, animated: true, completion: nil)
//    }
//    
//    @objc func revealFilter(){
//        let vc = FilterVC.initFromXib()
//        //vc.delegate = self
//        let customNavigation = CustomNavigation(rootViewController: vc)
//        customNavigation.navStyle = .translucent
//        self.present(customNavigation, animated: true, completion: nil)
//    }
//    
//    func prepareTableView(vc: UIViewController, withCellsIDs: [String]){
//        for cellID in withCellsIDs {
//            self.tableView.register(id: cellID)
//        }
//        self.tableView.tableFooterView = UIView()
//        self.tableView.flashScrollIndicators()
//        self.tableView.keyboardDismissMode = .onDrag
//        self.tableView.delegate = vc as? UITableViewDelegate
//        self.tableView.dataSource = vc as? UITableViewDataSource
//        //self.tableView.bounces = true
//    }
//    
//    func prepareCollectionView(withCellsIDs: [String], targetCollectionView: UICollectionView ) {
//        for cellID in withCellsIDs {
//            targetCollectionView.register(id: cellID)
//        }
//        targetCollectionView.flashScrollIndicators()
//        targetCollectionView.keyboardDismissMode = .onDrag
//    }
//    
//    func prepareCollectionView(withCellsIDs: [String]){
//        for cellID in withCellsIDs {
//            self.collectionView.register(id: cellID)
//        }
////        self.collectionView.tableFooterView = UIView()
//        self.collectionView.flashScrollIndicators()
//        self.collectionView.keyboardDismissMode = .onDrag
//    }
//    
//    //@available(iOS 11, *)
//    override var childForHomeIndicatorAutoHidden: UIViewController? {
//        return nil
//    }
//    
//    deinit {
//        print("---> ", #file, "+++> ", #function)
//    }
//    
//}
//
//extension BaseVC: SlideMenuDelegate {
//    
//    func didTapMain() {
//        let tabbar = TabBarVC.initFromXib()
//        tabbar.modalTransitionStyle = .crossDissolve
//        tabbar.modalPresentationStyle = .fullScreen
//        tabbar.selectedIndex = 2
//        UIApplication.shared.windows.first?.rootViewController = tabbar
//        UIApplication.shared.windows.first?.makeKeyAndVisible()
//    }
//    
//    func didTapMyOrders() {
//        presentFullScreen(viewController: OrdersVC.initFromXib())
//    }
//    
//    func didTapSettings() {
//        presentFullScreen(viewController: SettingsVC.initFromXib())
//    }
//    
//    func didTapNotificationsSettings() {
//        presentFullScreen(viewController: NotificationsSettingsVC.initFromXib())
//    }
//    
//    func didTapAboutUs() {
//        presentFullScreen(viewController: AboutVC.initFromXib())
//    }
//    
//    func didTapContactUs() {
//        presentFullScreen(viewController: ContactVC.initFromXib())
//    }
//    
//    func didTapLogin() {
//        AppDelegate().logOut()
//    }
//    
//    func presentFullScreen(viewController: UIViewController){
//        let targetNVC = UINavigationController(rootViewController: viewController)
//        targetNVC.modalPresentationStyle = .fullScreen
//        self.present(targetNVC, animated: false, completion: nil)
//    }
//    
//    func addStateSubview() {
//        self.addedStateSubviews += 1
//        if(self.addedStateSubviews > 1) {
//            return
//        }
//        self.stateView = TableState.init (
//            frame: .init(x: 0, y: 0, width: self.view.frame.width*0.8, height: self.view.frame.width*0.8),
//            title: "empty_table".localized,
//            subtitle: "",
//            buttonTitle: "",
//            buttonImage: nil
//        )
//        stateView?.center = self.view.center
//        self.view.addSubview(stateView ?? UIView())
//        self.stateView?.isHidden = true
//    }
//    
//    func addInterestsStateSubview() {
//        self.addedStateSubviews += 1
//        if(self.addedStateSubviews > 1) {
//            return
//        }
//        
//        self.stateView = TableState.init (
//            frame: .init(x: 0, y: 0, width: self.view.frame.width*0.8, height: self.view.frame.width*0.8),
//            title: "interests_title".localized,
//            subtitle: "",
//            buttonTitle: "go_to_companies".localized,
//            buttonImage: nil,
//            forInterestTab: true
//        )
//        stateView?.center = self.view.center
//        self.view.addSubview(stateView ?? UIView())
//        self.stateView?.isHidden = true
//    }
//    
//    func setStateViewVisibility(itemCount: Int) {
//        print("setStateViewVisibility",itemCount)
//        self.stateView?.isHidden = (itemCount > 0)
//    }
//    
//}
//
//extension BaseVC {
//    func highlighSelectedTab(index: Int){
//        for (loopIndex, buttonUnderline) in self.tabUnderlines.enumerated() {
//            buttonUnderline.isHidden = !(loopIndex == index)
//        }
//    }
//}
//
//extension BaseVC: UISearchBarDelegate {
//    
//    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
//        print("searchBarTextDidChange \(searchBar.text ?? "")")
//        
//        let query = searchBar.text ?? ""
//        NotificationCenter.default.post(name: Notification.Name("didTapSearch"), object: ["query":"\(query)"])
//    }
//
//    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
//        NotificationCenter.default.post(name: Notification.Name("didTapSearch"), object: ["query":""])
//        self.searchBar.endEditing(true)
//    }
//    
//    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
//        print("searchBarSearchButtonClicked \(searchBar.text ?? "")")
//        self.searchBar.endEditing(true)
//    }
//    
//}
//
//extension BaseVC: CityPickerDelegate {
//    func didChangeCity() {
//        
//        print("didChangeCity_________________")
//        self.refreshSearchBar()
//        NotificationCenter.default.post(name: Notification.Name("cityDidChange"), object: nil)
//    }
//}
//
//extension BaseVC: GADAdLoaderDelegate {
//    
//    func adLoader(_ adLoader: GADAdLoader, didFailToReceiveAdWithError error: GADRequestError) {
//        print("999_native_ad_did_fail")
//    }
//    
//    func adLoaderDidFinishLoading(_ adLoader: GADAdLoader) {
//        print("999_adLoader_has_finished loading ads, and a new request can be sent.")
//    }
//    
//}
//
//extension BaseVC: GADUnifiedNativeAdLoaderDelegate {
//    
//    func adLoader(_ adLoader: GADAdLoader, didReceive nativeAd: GADUnifiedNativeAd) {
//        print("999_native_ad",nativeAd.body)
//        NotificationCenter.default.post(name: .init("didLoadNativeAd"), object: nil)
//        
//        let arrayContainsAdWithBody = BaseVC.nativeAds.contains(where: { gadnativeAd in return (gadnativeAd.body == nativeAd.body)})
//        if(!arrayContainsAdWithBody) {
//            print("should_add",nativeAd)
//            BaseVC.nativeAds.append(nativeAd)
//        } else {
//            print("should_not_add",nativeAd)
//        }
//        
//        print("all_native_ads",BaseVC.nativeAds.compactMap { $0.body }.count)
//        
//    }
//    
//}
//
//extension BaseVC: GADBannerViewDelegate {
//    
//    func bannerViewDidReceiveAd(_ bannerView: GADBannerView) {
//      print("bannerViewDidReceiveAd")
//        
//        //bannerView.alpha = 1
////
////        bannerView.alpha = 0
////        UIView.animate(withDuration: 0.16, animations: {
////
////        })
////
//    }
//
//    func bannerView(_ bannerView: GADBannerView, didFailToReceiveAdWithError error: Error) {
//      print("bannerView:didFailToReceiveAdWithError: \(error.localizedDescription)")
//    }
//
//    func bannerViewDidRecordImpression(_ bannerView: GADBannerView) {
//      print("bannerViewDidRecordImpression")
//    }
//
//    func bannerViewWillPresentScreen(_ bannerView: GADBannerView) {
//      print("bannerViewWillPresentScreen")
//    }
//
//    func bannerViewWillDismissScreen(_ bannerView: GADBannerView) {
//      print("bannerViewWillDIsmissScreen")
//    }
//
//    func bannerViewDidDismissScreen(_ bannerView: GADBannerView) {
//      print("bannerViewDidDismissScreen")
//    }
//    
//}
//
//extension BaseVC {
//    
//    //Interstitial func
//    func createAndLoadInterstitial()->GADInterstitial {
//        let interstitial = GADInterstitial(adUnitID: Constants.adUnitIntersetial)
//        interstitial.delegate = self
//        interstitial.load(GADRequest())
//        return interstitial
//    }
//    
//}
//
//extension BaseVC: GADInterstitialDelegate {
//    func interstitialDidReceiveAd(_ ad: GADInterstitial) {
//        print("interstitialDidReceiveAd", ad)
//        
//        if let fullScreenAd = self.interstitial, fullScreenAd.isReady {
//           let root = UIApplication.shared.windows.first?.rootViewController
//           fullScreenAd.present(fromRootViewController: root!)
//           //isLoaded = false
//        }
//        
//    }
//}
