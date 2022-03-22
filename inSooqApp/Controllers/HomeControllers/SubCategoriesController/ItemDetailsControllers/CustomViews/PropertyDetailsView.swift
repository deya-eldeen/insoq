//
//  PropertyDetailsView.swift
//  inSooqApp
//
//  Created by mohammad ahmad on 14/02/2021.
//

import UIKit

class PropertyDetailsView: UIView , UITableViewDelegate,UITableViewDataSource{

    @IBOutlet weak var mapImage: UIImageView!
    @IBOutlet weak var mapButton: UIButton!
    @IBOutlet weak var descriptionButton: UIButton!
    @IBOutlet weak var specificationsButton: UIButton!
    @IBOutlet weak var amenitiesButton: UIButton!

    @IBOutlet weak var specHeight: NSLayoutConstraint!
    @IBOutlet weak var amenitiesHeight: NSLayoutConstraint!
    @IBOutlet weak var descHeight: NSLayoutConstraint!
    @IBOutlet weak var mapHeight: NSLayoutConstraint!

    @IBOutlet weak var contentView: UIView!
    
    @IBOutlet weak var specificationsArrow: UIImageView!
    @IBOutlet weak var ameniteisArrow: UIImageView!
    @IBOutlet weak var descriptionArrow: UIImageView!
    @IBOutlet weak var mapArrow: UIImageView!
    
    @IBOutlet weak var specificationsView: UIView!
    @IBOutlet weak var amentitesView: UIView!
    @IBOutlet weak var descriptionView: UIView!
    @IBOutlet weak var mapeView: UIView!
    
    @IBOutlet weak var offreButton: UIButton!

     @IBOutlet weak var sellerInfoArrow: UIImageView!
     @IBOutlet weak var sellerInfoHeightConstraint: NSLayoutConstraint!
     @IBOutlet weak var reportAddButton: UIButton!
     @IBOutlet weak var toAgencyButton: UIButton!
     @IBOutlet weak var sellerInfoView: UIView!
    
    @IBOutlet weak var specificationTableView: UITableView!
    //MARK:-CollectionViews
    @IBOutlet weak var infoCollectionView: UICollectionView!
    @IBOutlet weak var similarItemslCollectionView: UICollectionView!
    @IBOutlet weak var amenitiesCollectionView: UICollectionView!
    var amenitiesImages:[UIImage]=[UIImage(named: "swimmer")!,UIImage(named: "Ac")!,UIImage(named: "balcony")!,UIImage(named: "cabin")!,UIImage(named: "playground")!,UIImage(named: "parking")!,UIImage(named: "park")!,UIImage(named: "maid")!,UIImage(named: "security")!,UIImage(named: "gym")!,UIImage(named: "spa")!]
  
    var amenitesTitles:[String]=["Swimming pool","Central AC","Balcony","Built-in wardrobes","Kid’s play area","Covered parking","Park view","Maids room","24/7 security","Gym","Spa & Sauna"]
    
    var _isSpecificationExpandedView:Bool=false
    var _isAmentitesExpandedView:Bool=false
    var _isMapExpandedView:Bool=false
    var _isDescExpandedView:Bool=false
    var _isSellerInfoExpandedView:Bool=false

    var vc:UIViewController?
    func setVC(viewController:UIViewController)
    {
        
        self.vc = viewController
        if ((viewController.isKind(of: DetailsViewController.self)) )
        {
            debugPrint("vc:-",viewController)
            setDesign()
            let height = CGFloat((Int(amenitiesCollectionView.frame.width/4))*3)+10
            amenitiesHeight.constant=height

            setupDataViews()
            ///add dunction to Calculate initiial Views height

        }
        
    }
    func enableBtns(enable:Bool)
    {
        self.specificationsButton.isEnabled=enable
        self.amenitiesButton.isEnabled=enable
        self.descriptionButton.isEnabled=enable
        self.mapButton.isEnabled=enable
        self.toAgencyButton.isEnabled=enable
        self.reportAddButton.isEnabled=enable

        
    }
    @IBAction func specification_Pressed(_ sender: Any) {
        printAllFonts()
        guard let vc = self.vc else {
            return }
        if _isSpecificationExpandedView{
            ///function to calculate Height and set height here ...for now only 600 to see the deferance
            specificationsView.animateViewHeight(controller: vc, height: 600, heightConstraint: specHeight)
            specificationsArrow.image=UIImage(systemName: "chevron.up")
        }
        else{
            specificationsView.animateViewHeight(controller: vc, height: 0, heightConstraint: specHeight)
            specificationsArrow.image=UIImage(systemName: "chevron.down")
        }
        _isSpecificationExpandedView = !_isSpecificationExpandedView
        debugPrint("expandViewPressed:-",_isSpecificationExpandedView)
        debugPrint("specHeight:-",specHeight.constant)

    }
    
    @IBAction func amenties_Pressed(_ sender: Any) {
        printAllFonts()
        guard let vc = self.vc else {
            return
        }
        if _isAmentitesExpandedView{
            let height = CGFloat((Int(amenitiesCollectionView.frame.width/4))*3)+10
            debugPrint("heithg",height)
            amentitesView.animateViewHeight(controller: vc, height: height, heightConstraint: amenitiesHeight)
            ameniteisArrow.image=UIImage(systemName: "chevron.up")
        }
        else{
            amentitesView.animateViewHeight(controller: vc, height: 0, heightConstraint: amenitiesHeight)
            ameniteisArrow.image=UIImage(systemName: "chevron.down")
        }
        _isAmentitesExpandedView = !_isAmentitesExpandedView
        debugPrint("amenties_Pressed:-",_isAmentitesExpandedView)
        debugPrint("specHeight:-",amenitiesHeight.constant)

    }
    @IBAction func description_Pressed(_ sender: Any) {

        guard let vc = self.vc else {
            return
        }
        if _isDescExpandedView{
            descriptionArrow.image=UIImage(systemName: "chevron.up")
                //height-->set height = to Descriptionlabel.Contentsize
            descriptionView.animateViewHeight(controller: vc, height: 200, heightConstraint: descHeight)

        }
        else{
            descriptionArrow.image=UIImage(systemName: "chevron.down")
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
            mapArrow.image=UIImage(systemName: "chevron.up")
            mapeView.animateViewHeight(controller: vc, height: 200, heightConstraint: mapHeight)
            mapImage.isHidden=false
        }
        else
        {
            mapArrow.image=UIImage(systemName: "chevron.down")
            mapImage.isHidden=true
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
    
    @IBAction func sellerInfo_Pressed(_ sender: Any) {
        guard let vc = self.vc else {
            return
        }
        if  !_isSellerInfoExpandedView{
//            registerSellerView()
            sellerInfoView.isHidden=false
            sellerInfoArrow.image=UIImage(systemName: "chevron.up")
            sellerInfoView.animateViewHeight(controller: vc, height: 200, heightConstraint: sellerInfoHeightConstraint)
        }else{
            sellerInfoView.isHidden=true
            sellerInfoArrow.image=UIImage(systemName: "chevron.down")
            sellerInfoView.animateViewHeight(controller: vc, height: 5, heightConstraint: sellerInfoHeightConstraint)
        }
        _isSellerInfoExpandedView = !_isSellerInfoExpandedView
    }

    func xibSetup() {
        
        Bundle.main.loadNibNamed("PropertyDetailsView", owner: self, options: nil)
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

    private func setDesign(){
        
        objectShadow(object: specificationsView, cornerRadius: 5)
        objectShadow(object: amentitesView, cornerRadius: 5)
        objectShadow(object: specificationsView, cornerRadius: 5)
        
    }
    private func setupDataViews(){
        specificationTableView.delegate=self
        specificationTableView.dataSource=self
        
        infoCollectionView.delegate=self
        infoCollectionView.dataSource=self
        similarItemslCollectionView.delegate=self
        similarItemslCollectionView.dataSource=self
        amenitiesCollectionView.delegate=self
        amenitiesCollectionView.dataSource=self
        
        ///tableViews
        let rowsNib = UINib(nibName: "MotorsSpecificationCollectionViewCell", bundle: nil)
        specificationTableView.register(rowsNib, forCellReuseIdentifier: "MotorsSpecificationCollectionViewCell")
        
        ///CollectionViews
        let infoNib = UINib(nibName: "InfoCollectionViewCell", bundle: nil)
        infoCollectionView.register(infoNib, forCellWithReuseIdentifier: "InfoCollectionViewCell")
        
        let similarNib = UINib(nibName: "ItemsSliderCollectionViewCell", bundle: nil)
        similarItemslCollectionView.register(similarNib, forCellWithReuseIdentifier: "ItemsSliderCollectionViewCell")
        
        let aminiteNib = UINib(nibName: "AmenitiesCollectionViewCell", bundle: nil)
        amenitiesCollectionView.register(aminiteNib, forCellWithReuseIdentifier: "AmenitiesCollectionViewCell")
        
    }
//    private func initCollectionView() {
//       }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Statics.testItemDetailsData.count
    
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let dataCell:MotorsSpecificationCollectionViewCell = tableView.dequeueReusableCell(withIdentifier: "MotorsSpecificationCollectionViewCell", for: indexPath) as! MotorsSpecificationCollectionViewCell
        dataCell.setRowData(data: Statics.testItemDetailsData[indexPath.row] )
            return dataCell
            
        

    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
       
    }
    
}

extension PropertyDetailsView:UICollectionViewDelegateFlowLayout,UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == amenitiesCollectionView{
            return amenitesTitles.count
        }else{
            return Statics.testItemDetailsData.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView==infoCollectionView{
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "InfoCollectionViewCell", for: indexPath) as! InfoCollectionViewCell
        cell.setInfoData(data: Statics.testItemDetailsData[indexPath.row])
        return cell
        }
        else if collectionView==amenitiesCollectionView{
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "AmenitiesCollectionViewCell", for: indexPath) as! AmenitiesCollectionViewCell
            cell.setAminiteData(image: amenitiesImages[indexPath.row], title:  amenitesTitles[indexPath.row])
            return cell
        }
        else{
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ItemsSliderCollectionViewCell", for: indexPath) as! ItemsSliderCollectionViewCell
            cell.setItemData(image: Statics.adsArray[indexPath.row], name: Statics.categoyModel[indexPath.row].categoryName, price: Statics.categoyModel[indexPath.row].categoyID)
            return cell

        }
        
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
        }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
            return 0
        
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets.zero
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
        if collectionView==amenitiesCollectionView{
            let layout = self.amenitiesCollectionView.collectionViewLayout as! UICollectionViewFlowLayout
            layout.sectionInset = UIEdgeInsets(top: 0, left:0, bottom: 0, right: 0)
            layout.minimumInteritemSpacing = 0
            let wi:Int=Int(amenitiesCollectionView.frame.height)/4
            layout.itemSize = CGSize(width: wi+20, height: wi+20)
            debugPrint("item.width",layout.itemSize.width)
            debugPrint("item.height",layout.itemSize.height)
                return layout.itemSize
                
            }
        else{
            var cWidth = ((similarItemslCollectionView.frame.width)/6.38)
            debugPrint("Cwidth",cWidth)
            if cWidth > 120{
                debugPrint("iCwidth",cWidth)
            }
            else{
                cWidth = ((similarItemslCollectionView.frame.width)/3.2)
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
