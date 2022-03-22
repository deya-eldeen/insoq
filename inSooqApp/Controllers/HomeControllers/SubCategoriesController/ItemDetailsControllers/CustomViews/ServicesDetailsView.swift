//
//  ServicesDetailsView.swift
//  inSooqApp
//
//  Created by mohammad ahmad on 14/02/2021.
//

import UIKit

class ServicesDetailsView: UIView , UITableViewDelegate,UITableViewDataSource{
    @IBOutlet weak var userImg: UIImageView!
    
    @IBOutlet weak var memberSince: UILabel!
    @IBOutlet weak var userNameLbl: UILabel!
    @IBOutlet weak var contactButton: UIButton!
    @IBOutlet weak var descLbl: UILabel!
    
    @IBOutlet weak var serviceTitle: UILabel!
    @IBOutlet weak var locationIcon: UILabel!
    @IBOutlet weak var location: UILabel!
    @IBOutlet weak var date: UILabel!
    @IBOutlet weak var heartButton: UIButton!
    @IBOutlet weak var shareButton: UIButton!
    @IBOutlet weak var starsView: FloatRatingView!
    @IBOutlet weak var starsDetails: UILabel!
    
    @IBOutlet weak var mapButton: UIButton!
    @IBOutlet weak var descriptionButton: UIButton!
    @IBOutlet weak var servicesButton: UIButton!
    
    @IBOutlet weak var smsView: UIView!
    @IBOutlet weak var phoneView: UIView!
    @IBOutlet weak var contactLabel: UILabel!
    @IBOutlet weak var mapInnerVIew: UIView!
    
    @IBOutlet weak var servicesHeight: NSLayoutConstraint!
    @IBOutlet weak var descHeight: NSLayoutConstraint!
    @IBOutlet weak var mapHeight: NSLayoutConstraint!
    
    @IBOutlet weak var contentView: UIView!
    
    @IBOutlet weak var servicesArrow: UIImageView!
    @IBOutlet weak var descriptionArrow: UIImageView!
    @IBOutlet weak var mapArrow: UIImageView!
    
    @IBOutlet weak var servicesView: UIView!
    @IBOutlet weak var descriptionView: UIView!
    @IBOutlet weak var mapeView: UIView!
    
    @IBOutlet weak var servicesTableView: UITableView!
    //MARK:-CollectionViews
    @IBOutlet weak var similarItemslCollectionView: UICollectionView!
    @IBOutlet weak var infoCollectionView: UICollectionView!
    
    
    
    @IBOutlet weak var addRateView: FloatRatingView!
    
    
    var _isServicesExpandedView:Bool=false
    var _isAmentitesExpandedView:Bool=false
    var _isMapExpandedView:Bool=false
    var _isDescExpandedView:Bool=false
    var rateValu:Double=0
    var vc:UIViewController?
    
    
    var serviceType = ""
    func setVC(viewController:UIViewController , data: ServicesModel)
    {
        
        self.vc = viewController
        if ((viewController.isKind(of: DetailsViewController.self)) )
        {
            debugPrint("vc:-",viewController)
            setupDataViews()
            setDesign()
            setIcons()
            ///add dunction to Calculate initiial Views height
            
            serviceTitle.text = data.title
            date.text = data.postDate
            location.text = data.enLocation
            descLbl.text = data.welcomeDescription
            
            serviceType = data.serviceTypeEnName
            
        }
        
    }
    private func setIcons(){
        locationIcon.font=UIFont(name: "FontAwesome5Pro-Regular", size: 30)
        locationIcon.textColor=#colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
        locationIcon.text=Statics.icons.mapMarker_icon
        location.textAlignment = .center
        shareButton.titleLabel?.font=UIFont(name: "FontAwesome5Pro-Regular", size: 25)
        shareButton.setTitle(Statics.icons.share_icon, for: .normal)
        shareButton.tintColor=#colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
        heartButton.titleLabel?.font=UIFont(name: "FontAwesome5Pro-Regular", size: 25)
        heartButton.setTitle(Statics.icons.heart_icon, for: .normal)
    }
    
    func enableBtns(enable:Bool)
    {
        self.servicesButton.isEnabled=enable
        self.descriptionButton.isEnabled=enable
        self.mapButton.isEnabled=enable
        
    }
    @IBAction func services_Pressed(_ sender: Any) {
        printAllFonts()
        guard let vc = self.vc else {
            return }
        if _isServicesExpandedView{
            ///function to calculate Height and set height here ...for now only 600 to see the deferance
            servicesView.animateViewHeight(controller: vc, height: 600, heightConstraint: servicesHeight)
            servicesArrow.image=UIImage(systemName: "chevron.compact.up")
        }
        else{
            servicesView.animateViewHeight(controller: vc, height: 0, heightConstraint: servicesHeight)
            servicesArrow.image=UIImage(systemName: "chevron.compact.down")
        }
        _isServicesExpandedView = !_isServicesExpandedView
        debugPrint("expandViewPressed:-",_isServicesExpandedView)
        debugPrint("specHeight:-",servicesHeight.constant)
        
    }
    
    @IBAction func description_Pressed(_ sender: Any) {
        
        guard let vc = self.vc else {
            return
        }
        if _isDescExpandedView{
            descriptionArrow.image=UIImage(systemName: "chevron.compact.up")
            //height-->set height = to Descriptionlabel.Contentsize
            descriptionView.animateViewHeight(controller: vc, height: 200, heightConstraint: descHeight)
            
        }
        else{
            descriptionArrow.image=UIImage(systemName: "chevron.compact.down")
            descriptionView.animateViewHeight(controller: vc, height: 0, heightConstraint: descHeight)
        }
        _isDescExpandedView = !_isDescExpandedView
        debugPrint("expandViewPressed:-",_isDescExpandedView)
        debugPrint("specHeight:-",descHeight.constant)
        
    }
    
    
    @IBAction func MapLocation_Pressed(_ sender: Any) {
        
        guard let vc = self.vc else {
            return
        }
        if _isMapExpandedView{
            mapArrow.image=UIImage(systemName: "chevron.compact.up")
            mapeView.animateViewHeight(controller: vc, height: 550, heightConstraint: mapHeight)
        }
        else
        {
            mapArrow.image=UIImage(systemName: "chevron.compact.down")
            
            mapeView.animateViewHeight(controller: vc, height: 0, heightConstraint: mapHeight)
            
        }
        UIView.animate(withDuration: 0.6) {
            for v in self.mapeView.subviews{
                v.isHidden = !self._isMapExpandedView
            }
        }
        _isMapExpandedView = !_isMapExpandedView
        debugPrint("specHeight:-",mapHeight.constant)
        debugPrint("_isMapExpandedView:-",_isMapExpandedView)
    }
    
    func xibSetup() {
        
        Bundle.main.loadNibNamed("ServicesDetailsView", owner: self, options: nil)
        contentView.frame = bounds
        contentView.autoresizingMask =
            [.flexibleWidth, .flexibleHeight]
        addSubview(contentView)
        
    }
    private func setDesign(){
        
        objectShadow(object: mapInnerVIew, cornerRadius: 5)
        objectShadow(object: servicesView, cornerRadius: 5)
        addLeftBorder(object: phoneView, xPoint: 0, yPoint: 0)
        addLeftBorder(object: smsView, xPoint: 0, yPoint: 0)
        
        objectCornerRadius(object: contactLabel, cornerRadius: 5)
        contactLabel.clipsToBounds=true
    }
    private func setupDataViews(){
        
        addRateView.delegate = self
        addRateView.contentMode = UIView.ContentMode.scaleAspectFit
        addRateView.type = .floatRatings
        
        starsView.contentMode = UIView.ContentMode.scaleAspectFit
        starsView.type = .floatRatings
        
        //--------------------
        servicesTableView.delegate=self
        servicesTableView.dataSource=self
        similarItemslCollectionView.delegate=self
        similarItemslCollectionView.dataSource=self
        infoCollectionView.delegate=self
        infoCollectionView.dataSource=self
        servicesTableView.isUserInteractionEnabled=false
        ///tableViews
        let rowsNib = UINib(nibName: "MotorsSpecificationCollectionViewCell", bundle: nil)
        servicesTableView.register(rowsNib, forCellReuseIdentifier: "MotorsSpecificationCollectionViewCell")
        
        ///CollectionViews
        let infoNib = UINib(nibName: "InfoCollectionViewCell", bundle: nil)
        infoCollectionView.register(infoNib, forCellWithReuseIdentifier: "InfoCollectionViewCell")
        
        let similarNib = UINib(nibName: "ItemsSliderCollectionViewCell", bundle: nil)
        similarItemslCollectionView.register(similarNib, forCellWithReuseIdentifier: "ItemsSliderCollectionViewCell")
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        xibSetup()
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        xibSetup()
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let dataCell:MotorsSpecificationCollectionViewCell = tableView.dequeueReusableCell(withIdentifier: "MotorsSpecificationCollectionViewCell", for: indexPath) as! MotorsSpecificationCollectionViewCell
        
        dataCell.setServicesRowData(data:  RowDataModel(icon: UIImage(named: "car_mileage")!, title: "Service Type", data: serviceType) )
        return dataCell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
    
}

//extension ServicesDetailsView:UICollectionViewDelegateFlowLayout,UICollectionViewDataSource{
//    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        return Statics.testItemDetailsData.count
//    }
//
//    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//
//        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ItemsSliderCollectionViewCell", for: indexPath) as! ItemsSliderCollectionViewCell
//        cell.setItemData(image: Statics.adsArray[indexPath.row], name: Statics.categoyModel[indexPath.row].categoryName, price: Statics.categoyModel[indexPath.row].categoyID)
//        return cell
//    }
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
//        return 0
//    }
//
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//
//        var cWidth = ((similarItemslCollectionView.frame.width)/3.2)
//        debugPrint("Cwidth",cWidth)
//        if cWidth > 120{
//            debugPrint("iCwidth",cWidth)
//        }
//        else{
//            cWidth = ((similarItemslCollectionView.frame.width)/2.2)
//        }
//        let layout = self.similarItemslCollectionView.collectionViewLayout as! UICollectionViewFlowLayout
//        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
//        layout.minimumInteritemSpacing = 0
//        layout.itemSize = CGSize(width: Int(cWidth), height: Int(similarItemslCollectionView.frame.height-30) )
//        debugPrint("itemSize.height",layout.itemSize.height)
//        return layout.itemSize
//
//
//    }
//
//}
extension ServicesDetailsView:UICollectionViewDelegateFlowLayout,UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        return Statics.testItemDetailsData.count
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView==infoCollectionView{
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "InfoCollectionViewCell", for: indexPath) as! InfoCollectionViewCell
            cell.setInfoData(data: Statics.testItemDetailsData[indexPath.row])
            return cell
        }
        else{
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ItemsSliderCollectionViewCell", for: indexPath) as! ItemsSliderCollectionViewCell
            cell.setItemData(image: Statics.adsArray[indexPath.row], name: Statics.categoyModel[indexPath.row].categoryName, price: Statics.categoyModel[indexPath.row].categoyID)
            return cell
            
        }
        
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        if collectionView == infoCollectionView
        {return 0}else{ return 0 }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView==infoCollectionView{
            let layout = self.infoCollectionView.collectionViewLayout as! UICollectionViewFlowLayout
            layout.sectionInset = UIEdgeInsets(top: 5, left: 0, bottom: 5, right: 0)
            layout.minimumInteritemSpacing = 0
            layout.itemSize = CGSize(width: Int((infoCollectionView.frame.width)/3), height: 70 )
            debugPrint("item.width",layout.itemSize.width)
            return layout.itemSize
            
        }
        else{
            var cWidth = ((similarItemslCollectionView.frame.width)/3.2)
            debugPrint("Cwidth",cWidth)
            if cWidth > 120{
                debugPrint("iCwidth",cWidth)
            }
            else{
                cWidth = ((similarItemslCollectionView.frame.width)/2.2)
            }
            let layout = self.similarItemslCollectionView.collectionViewLayout as! UICollectionViewFlowLayout
            layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
            layout.minimumInteritemSpacing = 0
            layout.itemSize = CGSize(width: Int(cWidth), height: Int(similarItemslCollectionView.frame.height-30) )
            debugPrint("itemSize.height",layout.itemSize.height)
            return layout.itemSize
            
        }
    }
    
}

extension ServicesDetailsView: FloatRatingViewDelegate {
    
    // MARK: FloatRatingViewDelegate
    
    func floatRatingView(_ ratingView: FloatRatingView, didUpdate rating: Double) {
        self.rateValu = rating
        print("rating",rating)
        
        
    }
}
