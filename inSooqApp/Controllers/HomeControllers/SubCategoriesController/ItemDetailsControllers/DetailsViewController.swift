//
//  DetailsViewController.swift
//  inSooqApp
//
//  Created by mohammad ahmad on 11/02/2021.
//

import UIKit
import IQKeyboardManagerSwift

class DetailsViewController: UIViewController {
    @IBOutlet weak var subItemView: UIView!//in case of custom Detail View eg: Wanted Job Details - Odd Design
//    static var imagesArrayTest:ItemImagesTest=ItemImagesTest(images: [[]])
     var selectedCategory:Int=0
     var jobSubCategoryIndex:Int=0

    @IBOutlet weak var postedDate: UILabel!
    @IBOutlet weak var locationLbl: UILabel!
    @IBOutlet weak var currency: UILabel!
    @IBOutlet weak var viewOnCarButton: UIButton!
    
    @IBOutlet weak var speceView: UIView!
    @IBOutlet weak var serviceDetailsView: UIView!

    
    @IBOutlet weak var heartButton: UIButton!
    @IBOutlet weak var location_iconLabel: UILabel!
    @IBOutlet weak var shareButton: UIButton!
//    @IBOutlet weak var offerButton: UIButton!
    @IBOutlet weak var counterLbl: UILabel!
    @IBOutlet weak var itemImagesCollectionView: UICollectionView!
    @IBOutlet weak var offerViewHeight: NSLayoutConstraint!
    @IBOutlet weak var makeOfferView: UIView!
    @IBOutlet weak var backGroundView: UIView!

    @IBOutlet weak var imagesCount: UILabel!
    @IBOutlet weak var imagesView: UIView!
    @IBOutlet weak var itemType: UILabel!//Show if Item-PlateNumber/Property
    @IBOutlet weak var priceTest: UILabel!
    @IBOutlet weak var titleTest: UILabel!
    
    
    @IBOutlet weak var backView: UIView!
    @IBOutlet weak var offerView_SendOfferButton: UIButton!
    @IBOutlet weak var offerView_OfferAmountTextField: UITextField!
    @IBOutlet weak var offerView_DismissButtom: UIButton!
    
    @IBOutlet weak var bottomView: ContactView!
    var offerFlag=false
    var counter:Int=0
    var _isFavo:Bool=false
    var titleIndex=0
    
    var data: Any?
  //  var itemImagesTest:ItemImagesTest=ItemImagesTest(images: [[]])
   // var imagesIndex=0
    override func viewDidLoad() {
        super.viewDidLoad()
        //MARK:-Font to use font Icons we need the correct name of icons used in font - "\u{3c5} "
    //    self.itemImagesTest=DetailsViewController.imagesArrayTest
        bottomView.setVC(viewController: self)
        itemType.isHidden=true
        setIcons()
        
        mainData()
        
    }
    
    func mainData(){
 
    if let data = data as? JobsModel {
        currency.isHidden = true
        priceTest.isHidden = true
        titleTest.text = data.title
        locationLbl.text = data.enLocation
        postedDate.text = data.postDate
        
    }else if let data = data as? BusinessModel {
        
        priceTest.text = "\(data.price)"
        titleTest.text = data.title
        locationLbl.text = data.enLocation
        postedDate.text = data.postDate
        
    }
 
    }
    override func viewWillAppear(_ animated: Bool) {
        setCollectionViewData()
        //MARK:-Just for now switchc base on Index, later should be by Selected Category,subCategory Object and selected Item Data  ...
        registerViews(index: selectedCategory, subIndex: jobSubCategoryIndex)
        hideCardView()
    }
    override func viewDidAppear(_ animated: Bool) {
        setCardViewDesign()
        shareButton.addTarget(self, action: #selector(share(sender:)), for: .touchUpInside)
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?)
    {
        if self.isKind(of: DetailsViewController.self){
            let touch = touches.first
            if touch?.view != makeOfferView && touch?.view != backView{
                debugPrint("touchesBegan,view")
                hideCardView()
            }
        }
        if self.isKind(of: DetailsViewController.self){
            let touch = touches.first
            if touch?.view?.tag != 100{
                hideReportViewAction()
            }
        }
    }
    
//
//    @IBAction func next_Pressed(_ sender: Any) {
//        if imagesIndex > 0 && imagesIndex<itemImagesTest.images.count{
//            imagesIndex+=1
//            itemImagesCollectionView.reloadData()
//            registerViews(index: imagesIndex, subIndex: nil)
//        }
//
//    }


    @IBAction func addTofavorate_Pressed(_ sender: Any) {
        if _isFavo{
            buttonFont(object: heartButton, size: 25, style: "Regular")
            heartButton.setTitle(Statics.icons.heart_icon, for: .normal)
        }else{
            buttonFont(object: heartButton, size: 25, style: "Solid")
            heartButton.setTitle(Statics.icons.heart_icon, for: .normal)
        }
        _isFavo = !_isFavo
        
    }
//    @IBAction func makeOffer_Pressed(_ sender: Any) {
//        if !offerFlag{
//            showCardView()
//        }else{
//            hideCardView()
//        }
//        offerFlag = !offerFlag
//        debugPrint("flag:",offerFlag," height ",offerViewHeight.constant)
//
//    }
    @IBAction func back_Pressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
       // self.navigationController?.popViewController(animated: true)
    }
    @IBAction func nextAdd_Pressed(_ sender: Any) {
        if titleIndex>=0 && titleIndex<Statics.titelsTest.count-1{
            titleIndex+=1
            let index = IndexPath.init(item: titleIndex, section: 0)
            let rect = self.itemImagesCollectionView.layoutAttributesForItem(at: index)?.frame
            if rect != nil {
                self.itemImagesCollectionView.scrollRectToVisible(rect!, animated: true)
                counterLbl.text=" 0 - 10 images"
                
            }
            debugPrint("indexTitle",titleIndex)
            self.titleTest.text=Statics.titelsTest[titleIndex]
            self.priceTest.text=Statics.testPrices[titleIndex]
        }else{
            titleIndex=0
            let index = IndexPath.init(item: titleIndex, section: 0)
            let rect = self.itemImagesCollectionView.layoutAttributesForItem(at: index)?.frame
            if rect != nil {
                self.itemImagesCollectionView.scrollRectToVisible(rect!, animated: true)
                counterLbl.text=" 0 - 10 images"
            }
            self.titleTest.text=Statics.titelsTest[titleIndex]
            self.priceTest.text=Statics.testPrices[titleIndex]

        }
    }
    
    @IBAction func previousAdd_Pressed(_ sender: Any) {
        if titleIndex>=0 && titleIndex<Statics.adsArray.count-1{
            titleIndex-=1
            let index = IndexPath.init(item: titleIndex, section: 0)
            let rect = self.itemImagesCollectionView.layoutAttributesForItem(at: index)?.frame
            if rect != nil {
                self.itemImagesCollectionView.scrollRectToVisible(rect!, animated: true)
                counterLbl.text=" 0 - 10 images"
                
            }
            self.titleTest.text=Statics.titelsTest[titleIndex]
            self.priceTest.text=Statics.testPrices[titleIndex]

        }else{
            titleIndex=0
            let index = IndexPath.init(item: titleIndex, section: 0)
            let rect = self.itemImagesCollectionView.layoutAttributesForItem(at: index)?.frame
            if rect != nil {
                self.itemImagesCollectionView.scrollRectToVisible(rect!, animated: true)
                counterLbl.text=" 0 - 10 images"
            }
            self.titleTest.text=Statics.titelsTest[titleIndex]
            self.priceTest.text=Statics.testPrices[titleIndex]

        }
    }
    
    @IBAction func nextImageBtn(_ sender: Any) {
        Statics.adsArray.reverse()
        if counter < 0 {
            counter = 0
            counterLbl.text="\(counter) - 10 images"
        }
        counter += 1
        if counter < Statics.adsArray.count {
            let index = IndexPath.init(item: counter, section: 0)
            let rect = self.itemImagesCollectionView.layoutAttributesForItem(at: index)?.frame
            if rect != nil {
                self.itemImagesCollectionView.scrollRectToVisible(rect!, animated: true)
                counterLbl.text="\(counter) - 10 images"

            }
            debugPrint(rect as Any)
            debugPrint(index)
        }
    }

    @IBAction func previousImageBtn(_ sender: Any) {
        Statics.adsArray.reverse()
        if counter > Statics.adsArray.count{
            counter = Statics.adsArray.count
            counterLbl.text="\(counter) - 10 images"

        }
        counter -= 1
        if counter >= 0 {
            let index = IndexPath.init(item: counter, section: 0)
            let rect = self.itemImagesCollectionView.layoutAttributesForItem(at: index)?.frame
            if rect != nil {
                self.itemImagesCollectionView.scrollRectToVisible(rect!, animated: true)
                counterLbl.text="\(counter) - 10 images"
            }
        }
    }
    
    //MARK:-private functions
    
    @objc  func share(sender:UIView){
        ///take a screen show of screen
        UIGraphicsBeginImageContext(view.frame.size)
        view.layer.render(in: UIGraphicsGetCurrentContext()!)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        let textToShare = "Share".localized
        let link="https://samsungaci.com/product/82-qa82q800tauxtw-qled-8k-2020"
        let appLink="https://apps.apple.com/jo/app/aqua-laundry/id1545635271"
        if let myWebsite = URL(string: link) {//Enter link to your app here
            let objectsToShare = [textToShare, image ?? #imageLiteral(resourceName: "icon_itempurchased"),link, appLink,myWebsite] as [Any]
            let activityVC = UIActivityViewController(activityItems: objectsToShare, applicationActivities: nil)
            //Excluded Activities
            activityVC.excludedActivityTypes = [.airDrop,.postToFacebook,.message,.postToTwitter,.postToFlickr ,.mail]
            activityVC.popoverPresentationController?.sourceView = sender
            self.present(activityVC, animated: true, completion: nil)
        }
    }
    @objc  func validateOffer(){
        
        hideCardView()
    }
    @objc func hideReportViewAction(){
        for v in self.view.subviews{
            debugPrint("name..",v)
            if v.tag == 102 || v.tag == 101 {
                v.removeFromSuperview()
                debugPrint("Found Back View")
            }
            
        }
    }

    @objc func registerReportView(){
        registerBackView(c: self)
        let reportAdView: ReportAdView = {
            let v = ReportAdView()
            // view.backgroundColor = .white
            v.addShadowToView()
            v.translatesAutoresizingMaskIntoConstraints = false
            return v
        }()
        
        view.addSubview(reportAdView)
        reportAdView.tag=102
        reportAdView.setVC(viewController: self)
        reportAdView.cancelButton.addTarget(self, action: #selector(hideReportViewAction), for: .touchUpInside)
        reportAdView.submitButton.addTarget(self, action: #selector(hideReportViewAction), for: .touchUpInside)
        reportAdView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.8).isActive=true
        reportAdView.heightAnchor.constraint(equalToConstant: 400).isActive=true
        //(equalTo: c.view.heightAnchor, multiplier: 0.35).isActive=true
        reportAdView.centerXAnchor.constraint(equalTo:  view.centerXAnchor).isActive=true
        reportAdView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive=true
        
    }

    private func setIcons(){
        location_iconLabel.font=UIFont(name: "FontAwesome5Pro-Regular", size: 30)
        location_iconLabel.textColor=#colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
        location_iconLabel.text=Statics.icons.mapMarker_icon
        shareButton.titleLabel?.font=UIFont(name: "FontAwesome5Pro-Regular", size: 25)
        shareButton.setTitle(Statics.icons.share_icon, for: .normal)
        shareButton.tintColor=#colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
        heartButton.titleLabel?.font=UIFont(name: "FontAwesome5Pro-Regular", size: 25)
        heartButton.setTitle(Statics.icons.heart_icon, for: .normal)
        
        
    }
    
    @objc func toAgencyAction(){
        AgencyViewController.index = selectedCategory
        forcePresentViewController(viewController: self, storyBoardId: "AgencyViewController")
    }
    @objc func showCardView(){
        makeOfferView.animateViewHeight(controller: self, height: view.height/2, heightConstraint: offerViewHeight)
        UIView.animate(withDuration: 0.2) {
            for v in self.backView.subviews{
                v.isHidden=false
            }
            self.backGroundView.layer.opacity=0.4
            self.backGroundView.isHidden=false
            self.makeOfferView.isHidden=false
            DispatchQueue.main.asyncAfter(deadline: .now()+0.3) {
                self.offerView_SendOfferButton.layer.opacity=1
                self.offerView_SendOfferButton.isHidden=false
            }
            self.makeOfferView.translatesAutoresizingMaskIntoConstraints=false
            self.makeOfferView.backgroundColor=#colorLiteral(red: 0.09019608051, green: 0, blue: 0.3019607961, alpha: 1)
        }
    }
    @objc func hideCardView(){
        makeOfferView.animateViewHeight(controller: self, height: 0, heightConstraint: offerViewHeight)
        UIView.animate(withDuration: 0.2) {
            for v in self.backView.subviews{
                v.isHidden=true
            }
            self.backGroundView.layer.opacity=0
            DispatchQueue.main.asyncAfter(deadline: .now()+0.1) {
                self.offerView_SendOfferButton.isHidden=true
                self.offerView_SendOfferButton.layer.opacity=0
            }
            self.backGroundView.isHidden=true
            
        }
    }
    private func setCardViewDesign(){
        makeOfferView.roundCorner(corners: [.topLeft,.topRight], radius: 10)
        bottomBorder(object: offerView_OfferAmountTextField)
     //   objectCornerRadius(object: offerButton, cornerRadius: offerView_SendOfferButton.height/2)
        offerView_SendOfferButton.addTarget(self, action: #selector(validateOffer), for: .touchUpInside)
        offerView_SendOfferButton.layer.cornerRadius=offerView_SendOfferButton.frame.height/2
        offerView_DismissButtom.addTarget(self, action: #selector(hideCardView), for: .touchUpInside)
        
        
    }
    private func registerViews(index:Int,subIndex:Int?){
        ///    set switch  to set view base on item selected
        switch index {
        case 1:
            itemType.isHidden=false
            itemType.text="Villa"
            debugPrint("Setting propertyDetailsView")
            let propertyDetailsView: PropertyDetailsView = {
                let view = PropertyDetailsView()
                view.backgroundColor = .white
                view.translatesAutoresizingMaskIntoConstraints = false
                return view
            }()
            
            speceView.addSubview(propertyDetailsView)
            propertyDetailsView.setVC(viewController: self)
         //   propertyDetailsView.offreButton.addTarget(self, action: #selector(showCardView), for: .touchUpInside)
            propertyDetailsView.toAgencyButton.addTarget(self, action: #selector(toAgencyAction), for: .touchUpInside)
            propertyDetailsView.reportAddButton.addTarget(self, action: #selector(registerReportView), for: .touchUpInside)
            objectCornerRadius(object: propertyDetailsView.offreButton, cornerRadius: offerView_SendOfferButton.height/2)

            propertyDetailsView.widthAnchor.constraint(equalTo: speceView.widthAnchor, multiplier: 1).isActive=true
            propertyDetailsView.heightAnchor.constraint(equalTo: speceView.heightAnchor, multiplier: 1).isActive=true
            propertyDetailsView.centerXAnchor.constraint(equalTo: speceView.centerXAnchor).isActive=true
            propertyDetailsView.centerYAnchor.constraint(equalTo: speceView.centerYAnchor).isActive=true
            break
        case 2:
            
            switch subIndex {
            case 1://Wanted
                imagesView.isHidden=true
                imagesCount.isHidden=true
                debugPrint("Setting Wanted jobsDetailsView")
                let jobsDetailsView: WantedJobDetailsView = {
                    let view = WantedJobDetailsView()
                    view.backgroundColor = .white
                    view.translatesAutoresizingMaskIntoConstraints = false
                    return view
                }()
                
                speceView.addSubview(jobsDetailsView)
                jobsDetailsView.setVC(viewController: self , data: data as! JobsModel)
//                speceView.isHidden=true
//                subItemView.isHidden=false
                jobsDetailsView.widthAnchor.constraint(equalTo: speceView.widthAnchor, multiplier: 1).isActive=true
                jobsDetailsView.heightAnchor.constraint(equalTo: speceView.heightAnchor, multiplier: 1).isActive=true

                break
            default://opining
                imagesView.isHidden=true
                imagesCount.isHidden=true
                debugPrint("Setting opining jobsDetailsView")
                let jobsDetailsView: JobDetailsView = {
                    let view = JobDetailsView()
                    view.backgroundColor = .white
                    view.translatesAutoresizingMaskIntoConstraints = false
                    return view
                }()
                
                speceView.addSubview(jobsDetailsView)
           //     offerButton.setTitle("APPLAY FOR THIS JOB", for: .normal)
             //   offerButton.addTarget(self, action: #selector(goApplayAction), for: .touchUpInside)
                jobsDetailsView.applayButton.addTarget(self, action: #selector(goApplayAction), for: .touchUpInside)
                //offerButton.isEnabled=false
                jobsDetailsView.setVC(viewController: self , data: data as! JobsModel)
                jobsDetailsView.widthAnchor.constraint(equalTo: speceView.widthAnchor, multiplier: 1).isActive=true
                jobsDetailsView.heightAnchor.constraint(equalTo: speceView.heightAnchor, multiplier: 1).isActive=true

                break
            }
            break
        case 3:
            debugPrint("ServicesDetailsView")
            let servicesDetailsView: ServicesDetailsView = {
                let view = ServicesDetailsView()
                view.backgroundColor = .white
                view.translatesAutoresizingMaskIntoConstraints = false
                return view
            }()
            debugPrint("before",serviceDetailsView.subviews.count)
            for v in serviceDetailsView.subviews{
                v.isHidden=true//removeFromSuperview()
            }
            serviceDetailsView.addSubview(servicesDetailsView)
            debugPrint("after",serviceDetailsView.subviews.count)
            
            servicesDetailsView.setVC(viewController: self ,  data: data as! ServicesModel )
            servicesDetailsView.widthAnchor.constraint(equalTo: serviceDetailsView.widthAnchor, multiplier: 1).isActive=true
            servicesDetailsView.heightAnchor.constraint(equalTo: serviceDetailsView.heightAnchor, multiplier: 1).isActive=true
            break
        case 4:
            debugPrint("BusinessDetailsView")
            let businessDetailsView: BusinessDetailsView = {
                let view = BusinessDetailsView()
                view.backgroundColor = .white
                view.translatesAutoresizingMaskIntoConstraints = false
                view.similerTitle.text = "Similar Listings"

                return view
            }()
  
            businessDetailsView.specificationsButton.setTitle("Item Specifications", for: .normal)

            
            speceView.addSubview(businessDetailsView)
            businessDetailsView.setVC(viewController: self , data: data as! BusinessModel)
            businessDetailsView.widthAnchor.constraint(equalTo: speceView.widthAnchor, multiplier: 1).isActive=true
            businessDetailsView.heightAnchor.constraint(equalTo: speceView.heightAnchor, multiplier: 1).isActive=true
            break
        case 5,7:
            debugPrint("BusinessDetailsView")
            let businessDetailsView: BusinessDetailsView = {
                let view = BusinessDetailsView()
                view.backgroundColor = .white
                view.translatesAutoresizingMaskIntoConstraints = false
                view.similerTitle.text = "Similar Listings"

                return view
            }()
            if index==7{
                businessDetailsView.specificationsButton.setTitle("Business Specifications", for: .normal)

            }
            else{
                businessDetailsView.specificationsButton.setTitle("Item Specifications", for: .normal)

            }
            speceView.addSubview(businessDetailsView)
            businessDetailsView.setVC(viewController: self, data: data as! BusinessModel)
            businessDetailsView.widthAnchor.constraint(equalTo: speceView.widthAnchor, multiplier: 1).isActive=true
            businessDetailsView.heightAnchor.constraint(equalTo: speceView.heightAnchor, multiplier: 1).isActive=true
            break
        case 6:
            itemType.isHidden=false
            imagesView.isHidden=true
            imagesCount.isHidden=true
            viewOnCarButton.isHidden=false
            viewOnCarButton.isEnabled=true
            debugPrint("PlateDetailsView",itemType.isHidden)
            let plateDetailsView: PlateDetailsView = {
                let view = PlateDetailsView()
                view.backgroundColor = .white
                view.translatesAutoresizingMaskIntoConstraints = false
                return view
            }()
            
            speceView.addSubview(plateDetailsView)
            plateDetailsView.setVC(viewController: self)
            plateDetailsView.offerButton.addTarget(self, action: #selector(showCardView), for: .touchUpInside)
            self.viewOnCarButton.addTarget(self, action: #selector(viewOnCarAction), for: .touchUpInside)
            plateDetailsView.reportAddButton.addTarget(self, action: #selector(registerReportView), for: .touchUpInside)
            objectCornerRadius(object: plateDetailsView.offerButton, cornerRadius: offerView_SendOfferButton.height/2)

            plateDetailsView.widthAnchor.constraint(equalTo: speceView.widthAnchor, multiplier: 1).isActive=true
            plateDetailsView.heightAnchor.constraint(equalTo: speceView.heightAnchor, multiplier: 1).isActive=true
            break
        default:
            debugPrint("Setting motorsDetailsView")
            let motorsDetailsView: MotorsDetailsView = {
                let view = MotorsDetailsView()
                view.backgroundColor = .white
                view.translatesAutoresizingMaskIntoConstraints = false
                return view
            }()
            
            speceView.addSubview(motorsDetailsView)
            
            if data != nil  {
                motorsDetailsView.setVC(viewController: self , data: data as! AdsOfCategoryModel)
                motorsDetailsView.makeOfferButton.addTarget(self, action: #selector(showCardView), for: .touchUpInside)
                motorsDetailsView.toAgencyButton.addTarget(self, action: #selector(toAgencyAction), for: .touchUpInside)
                motorsDetailsView.reportAddButton.addTarget(self, action: #selector(registerReportView), for: .touchUpInside)
                objectCornerRadius(object: motorsDetailsView.makeOfferButton, cornerRadius: offerView_SendOfferButton.height/2)
                motorsDetailsView.widthAnchor.constraint(equalTo: speceView.widthAnchor, multiplier: 1).isActive = true
                motorsDetailsView.heightAnchor.constraint(equalTo: speceView.heightAnchor, multiplier: 1).isActive = true
                
            }

            break
        }
    }
    private func setCollectionViewData(){
        itemImagesCollectionView.delegate=self
        itemImagesCollectionView.dataSource=self
        
        
        let imagesNib = UINib(nibName: "SilderImagesCollectionViewCell", bundle: nil)
        
        itemImagesCollectionView.register(imagesNib, forCellWithReuseIdentifier: "SilderImagesCollectionViewCell")
        
        
    }
    @objc func viewOnCarAction(){
        forcePresentViewController(viewController: self, storyBoardId: "ViewPlateViewController")
    }
    @objc func goApplayAction(){
        forcePresentViewController(viewController: self, storyBoardId: "ApplayForJobViewController")
        
    }
}

extension DetailsViewController:UICollectionViewDelegateFlowLayout,UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if let data = data as? AdsOfCategoryModel{
            return data.pictures?.count ?? 0
        } else if let data = data as? BusinessModel{
            return data.pictures.count
        }else if (data as? JobsModel) != nil{
            return 1
        }else{
            return 0
        }
      //  return itemImagesTest.images[self.imagesIndex].count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SilderImagesCollectionViewCell", for: indexPath) as! SilderImagesCollectionViewCell
        
       // cell.setSlider(image: itemImagesTest[imagesIndex].images[indexPath.row])
        if let data = data as? AdsOfCategoryModel{
            cell.setSlider(pics: data.pictures ?? [] , index: indexPath.row)
        }else if (data as? JobsModel) != nil{
            if let image = UIImage(named: "default_image"){
                cell.setSlider(image: image)
            }
        }else if let data = data as? BusinessModel{
            if data.pictures.isEmpty{
                if let image = UIImage(named: "default_image"){
                    cell.setSlider(image: image)
                }
            }else{
                cell.setSlider(pics: data.pictures  , index: indexPath.row)
            }
        } else if let image = UIImage(named: "default_image"){
            cell.setSlider(image: image)
        }
        return cell
        
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let layout = self.itemImagesCollectionView.collectionViewLayout as! UICollectionViewFlowLayout
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        layout.minimumInteritemSpacing = 0
        layout.itemSize = CGSize(width: Int((itemImagesCollectionView.width)), height: Int(itemImagesCollectionView.height) )
        
        return layout.itemSize
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    
}
