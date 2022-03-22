//
//  BusinessDetailsView.swift
//  inSooqApp
//
//  Created by mohammad ahmad on 15/02/2021.
//

import UIKit

class BusinessDetailsView: UIView  , UITableViewDelegate,UITableViewDataSource{
    @IBOutlet weak var usrName: UILabel!
    @IBOutlet weak var offerButton: UIButton!
    
    @IBOutlet weak var memberSinceLbl: UILabel!
    @IBOutlet weak var usrImg: UIImageView!
    @IBOutlet weak var descLbl: UILabel!
    @IBOutlet weak var mapImage: UIImageView!
    @IBOutlet weak var similerTitle: UILabel!
    @IBOutlet weak var mapButton: UIButton!
    @IBOutlet weak var descriptionButton: UIButton!
    @IBOutlet weak var specificationsButton: UIButton!

    @IBOutlet weak var smsView: UIView!
    @IBOutlet weak var phoneView: UIView!
    @IBOutlet weak var locationInfoView: UIView!
    @IBOutlet weak var specHeight: NSLayoutConstraint!
    @IBOutlet weak var descHeight: NSLayoutConstraint!
    @IBOutlet weak var mapHeight: NSLayoutConstraint!

    @IBOutlet weak var contentView: UIView!
    
    @IBOutlet weak var specificationsArrow: UIImageView!
    @IBOutlet weak var descriptionArrow: UIImageView!
    @IBOutlet weak var mapArrow: UIImageView!
    
    @IBOutlet weak var specificationsView: UIView!
    @IBOutlet weak var descriptionView: UIView!
    @IBOutlet weak var mapeView: UIView!
    
    @IBOutlet weak var specificationTableView: UITableView!
    //MARK:-CollectionViews

    @IBOutlet weak var contactLabel: UILabel!
    @IBOutlet weak var similarItemslCollectionView: UICollectionView!
    @IBOutlet weak var infoCollectionView: UICollectionView!

    var _isSpecificationExpandedView:Bool=false
    var _isAmentitesExpandedView:Bool=false
    var _isMapExpandedView:Bool=false
    var _isDescExpandedView:Bool=false
    var vc:UIViewController?
    var data: BusinessModel?
    func setVC(viewController:UIViewController , data: BusinessModel)
    {
        self.vc = viewController
        if ((viewController.isKind(of: DetailsViewController.self)) )
        {
            debugPrint("vc:-",viewController)
            setupDataViews()
            setDesign()
            ///add dunction to Calculate initiial Views height

        }
        
        descLbl.text = data.welcomeDescription
        self.data = data
        specHeight.constant = self.specificationTableView.height
        
    }
    

    func enableBtns(enable:Bool)
    {
        self.specificationsButton.isEnabled=enable
        self.descriptionButton.isEnabled=enable
        self.mapButton.isEnabled=enable
        
    }
    @IBAction func specification_Pressed(_ sender: Any) {
        printAllFonts()
        guard let vc = self.vc else {
            return }
        if _isSpecificationExpandedView{
            ///function to calculate Height and set height here ...for now only 600 to see the deferance
            specificationsView.animateViewHeight(controller: vc, height: 600, heightConstraint: specHeight)
            specificationsArrow.image=UIImage(systemName: "chevron.compact.up")
        }
        else{
            specificationsView.animateViewHeight(controller: vc, height: 0, heightConstraint: specHeight)
            specificationsArrow.image=UIImage(systemName: "chevron.compact.down")
        }
        _isSpecificationExpandedView = !_isSpecificationExpandedView
        debugPrint("expandViewPressed:-",_isSpecificationExpandedView)
        debugPrint("specHeight:-",specHeight.constant)

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
            locationInfoView.isHidden=false
            mapImage.isHidden=false

        }
        else
        {
            mapArrow.image=UIImage(systemName: "chevron.compact.down")
            
            mapeView.animateViewHeight(controller: vc, height: 0, heightConstraint: mapHeight)
            locationInfoView.isHidden=true
            mapImage.isHidden=true
           
        }
//        UIView.animate(withDuration: 0.6) {
//            for v in self.mapeView.subviews{
//                v.isHidden = !self._isMapExpandedView
//            }
//        }
        _isMapExpandedView = !_isMapExpandedView
        debugPrint("specHeight:-",mapHeight.constant)
        debugPrint("_isMapExpandedView:-",_isMapExpandedView)


    }
    
    func xibSetup() {
        
        Bundle.main.loadNibNamed("BusinessDetailsView", owner: self, options: nil)
        contentView.frame = bounds
        contentView.autoresizingMask =
            [.flexibleWidth, .flexibleHeight]
        addSubview(contentView)

    }
    func setupDataViews(){
        specificationTableView.delegate=self
        specificationTableView.dataSource=self

        infoCollectionView.delegate=self
        infoCollectionView.dataSource=self
        similarItemslCollectionView.delegate=self
        similarItemslCollectionView.dataSource=self
        ///tableViews
        let rowsNib = UINib(nibName: "MotorsSpecificationCollectionViewCell", bundle: nil)
        specificationTableView.register(rowsNib, forCellReuseIdentifier: "MotorsSpecificationCollectionViewCell")
            

        ///CollectionViews
        let infoNib = UINib(nibName: "InfoCollectionViewCell", bundle: nil)
        infoCollectionView.register(infoNib, forCellWithReuseIdentifier: "InfoCollectionViewCell")
        
        let similarNib = UINib(nibName: "ItemsSliderCollectionViewCell", bundle: nil)
        similarItemslCollectionView.register(similarNib, forCellWithReuseIdentifier: "ItemsSliderCollectionViewCell")
    }
    
    private func setDesign(){
        
        objectShadow(object: specificationsView, cornerRadius: 5)
        objectCornerRadius(object: contactLabel, cornerRadius: 5)
//        addLeftBorder(object: phoneView, xPoint: 0, yPoint: 0)
//        addLeftBorder(object: smsView, xPoint: 0, yPoint: 0)

         contactLabel.clipsToBounds=true
        objectShadow(object: locationInfoView, cornerRadius: 5)
        objectCornerRadius(object: offerButton, cornerRadius: offerButton.height/2)
        
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
        dataCell.setRowData(data: RowDataModel(icon: #imageLiteral(resourceName: "services_icon"),  title: "Category" , data: data?.categoryEnName ?? "") )
        return dataCell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
}

extension BusinessDetailsView:UICollectionViewDelegateFlowLayout,UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return Statics.testItemDetailsData.count
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
         return  cell
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
