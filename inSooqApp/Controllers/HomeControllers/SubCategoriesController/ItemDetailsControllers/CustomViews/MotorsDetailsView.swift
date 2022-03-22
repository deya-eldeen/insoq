//
//  MotorsDetailsView.swift
//  inSooqApp
//
//  Created by mohammad ahmad on 11/02/2021.
//

import UIKit

class MotorsDetailsView: UIView , UITableViewDelegate,UITableViewDataSource{

    @IBOutlet weak var makeOfferButton: UIButton!
    
    @IBOutlet weak var mapButton: UIButton!
    @IBOutlet weak var descriptionButton: UIButton!
    @IBOutlet weak var specificationsButton: UIButton!

    @IBOutlet weak var specificationTableView: UITableView!

    @IBOutlet weak var contentView: UIView!

    @IBOutlet weak var specHeight: NSLayoutConstraint!
    @IBOutlet weak var descHeight: NSLayoutConstraint!
    @IBOutlet weak var mapHeight: NSLayoutConstraint!

    
    @IBOutlet weak var specificationsArrow: UIImageView!
    @IBOutlet weak var descriptionArrow: UIImageView!
    @IBOutlet weak var mapArrow: UIImageView!
   
    @IBOutlet weak var sellerInfoArrow: UIImageView!
    @IBOutlet weak var sellerInfoHeightConstraint: NSLayoutConstraint!
    @IBOutlet weak var reportAddButton: UIButton!
    @IBOutlet weak var toAgencyButton: UIButton!
    @IBOutlet weak var sellerInfoView: UIView!


    @IBOutlet weak var specificationsView: UIView!
    @IBOutlet weak var descriptionView: UIView!
    @IBOutlet weak var mapeView: UIView!
    
    //MARK:-CollectionViews
    @IBOutlet weak var infoCollectionView: UICollectionView!
    @IBOutlet weak var similarItemslCollectionView: UICollectionView!

    var _isSpecificationExpandedView:Bool=false
    var _isAmentitesExpandedView:Bool=false
    var _isMapExpandedView:Bool=false
    var _isDescExpandedView:Bool=false
    var _isSellerInfoExpandedView:Bool=false
    var vc:UIViewController?
    var data: AdsOfCategoryModel?
    var testItemDetailsData:[RowDataModel] = []
    func setVC(viewController:UIViewController , data: AdsOfCategoryModel)
    {
        
        self.vc = viewController
        self.data = data
        for i in  0...12 {
            var dataModel: RowDataModel?
            switch i {
            case 0:
                dataModel = RowDataModel(icon: #imageLiteral(resourceName: "services_icon"),  title: "Brand", data: data.en_Maker!.stringValue)
                break
            case 1:
                dataModel = RowDataModel(icon: #imageLiteral(resourceName: "services_icon"),  title: "Model", data: data.en_Model!.stringValue)
                break
            case 2:
                dataModel = RowDataModel(icon: #imageLiteral(resourceName: "services_icon"),  title: "Trim", data: data.en_Trim!.stringValue)
                break
            case 3:
                dataModel = RowDataModel(icon: #imageLiteral(resourceName: "services_icon"),  title: "Color", data: data.en_Color!.stringValue)
                break
            case 4:
                dataModel = RowDataModel(icon: #imageLiteral(resourceName: "services_icon"),  title: "Doors", data: data.en_Doors!.stringValue)
                break
            case 5:
                dataModel = RowDataModel(icon: #imageLiteral(resourceName: "services_icon"),  title: "Warranty", data: "\(String(describing: data.warranty))")
                break
            case 6:
                dataModel = RowDataModel(icon: #imageLiteral(resourceName: "services_icon"),  title: "Transmission", data: data.en_Transmission!.stringValue)
                break
            case 7:
                dataModel = RowDataModel(icon: #imageLiteral(resourceName: "services_icon"),  title: "Regional Specs", data: data.en_RegionalSpecs!.stringValue)
                break
            case 8:
                dataModel = RowDataModel(icon: #imageLiteral(resourceName: "services_icon"),  title: "Body Type", data: data.en_BodyType!.stringValue)
                break
            case 9:
                dataModel = RowDataModel(icon: #imageLiteral(resourceName: "services_icon"),  title: "Fuel Type", data: data.en_FuelType!.stringValue)
                break
            case 10:
                dataModel = RowDataModel(icon: #imageLiteral(resourceName: "services_icon"),  title: "No. Of Cylinders", data: data.en_NoOfCylinders!.stringValue)
                break
            case 11:
                dataModel = RowDataModel(icon: #imageLiteral(resourceName: "services_icon"),  title: "Horse Power", data: data.en_Horsepower!.stringValue)
                break
            case 12:
                dataModel = RowDataModel(icon: #imageLiteral(resourceName: "services_icon"),  title: "Steering Side", data: data.en_SteeringSide!.stringValue)
                break
            default:
                break
            }
            if let dataModel = dataModel {
                testItemDetailsData.append(dataModel)

            }

        }

        if ((viewController.isKind(of: DetailsViewController.self)) )
        {
            debugPrint("vc:-",viewController)
            setupDataViews()
            sellerInfoView.isHidden=true
            sellerInfoArrow.image=UIImage(systemName: "chevron.down")
            sellerInfoView.animateViewHeight(controller: viewController, height: 0, heightConstraint: sellerInfoHeightConstraint)
        }
    }
//    private func registerSellerInfoView(){
//        let sellerView: SellerInfoView = {
//            let view = SellerInfoView()
//            view.backgroundColor = .white
//            view.translatesAutoresizingMaskIntoConstraints = false
//            return view
//        }()
//
//        self.sellerInfoView.addSubview(sellerView)
//       // sellerInfoView.setVC(viewController: self)
//        sellerView.widthAnchor.constraint(equalTo: sellerInfoView.widthAnchor, multiplier: 1).isActive=true
//        sellerView.heightAnchor.constraint(equalTo: sellerInfoView.heightAnchor, multiplier: 1).isActive=true
//        sellerView.centerXAnchor.constraint(equalTo: sellerInfoView.centerXAnchor).isActive=true
//        sellerView.centerYAnchor.constraint(equalTo: sellerInfoView.centerYAnchor).isActive=true
//
//    }
    func enableBtns(enable:Bool)
    {
        self.specificationsButton.isEnabled=enable
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
            specificationsView.animateViewHeight(controller: vc, height: 300, heightConstraint: specHeight)
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
        }
        else
        {
            mapArrow.image=UIImage(systemName: "chevron.down")
            
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
    private func registerSellerView(){
        let infoView: SellerInfoView = {
            let view = SellerInfoView()
            // view.backgroundColor = .white
            view.translatesAutoresizingMaskIntoConstraints = false
            return view
        }()
        
        sellerInfoView.addSubview(infoView)
        infoView.tag=01
        infoView.widthAnchor.constraint(equalTo: sellerInfoView.widthAnchor, multiplier: 1).isActive=true
        infoView.heightAnchor.constraint(equalTo: sellerInfoView.heightAnchor, multiplier: 1).isActive=true
        infoView.centerXAnchor.constraint(equalTo: sellerInfoView.centerXAnchor).isActive=true
        infoView.centerYAnchor.constraint(equalTo: sellerInfoView.centerYAnchor).isActive=true
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
    

    func xibSetup() {
        
        Bundle.main.loadNibNamed("MotorsDetailsView", owner: self, options: nil)
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

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return testItemDetailsData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let dataCell:MotorsSpecificationCollectionViewCell = tableView.dequeueReusableCell(withIdentifier: "MotorsSpecificationCollectionViewCell", for: indexPath) as! MotorsSpecificationCollectionViewCell
        dataCell.setRowData(data: testItemDetailsData[indexPath.row] )
        return dataCell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
}

extension MotorsDetailsView:UICollectionViewDelegateFlowLayout,UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return testItemDetailsData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView==infoCollectionView{
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "InfoCollectionViewCell", for: indexPath) as! InfoCollectionViewCell
        cell.setInfoData(data: testItemDetailsData[indexPath.row])
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
            layout.itemSize = CGSize(width: Int((infoCollectionView.frame.width)/6.38), height: 70 )
        debugPrint("item.width",layout.itemSize.width)
            return layout.itemSize
            
        }
        else{
            var cWidth = ((similarItemslCollectionView.frame.width)/6.38)
            debugPrint("Cwidth",cWidth)
            if cWidth > 120{
                debugPrint("iCwidth",cWidth)
            }
            else{
                cWidth = ((similarItemslCollectionView.frame.width)/2.1)
            }
            let layout = self.similarItemslCollectionView.collectionViewLayout as! UICollectionViewFlowLayout
            layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
            layout.minimumInteritemSpacing = 0
            layout.itemSize = CGSize(width: Int(cWidth), height: Int(similarItemslCollectionView.frame.height-20) )
            debugPrint("itemSize.height",layout.itemSize.height)
                return layout.itemSize

        }
    }
    
}
func printAllFonts(){
    for family: String in UIFont.familyNames
           {
               debugPrint(family)
               for names: String in UIFont.fontNames(forFamilyName: family)
               {
                   debugPrint(":--> \(names)")
               }
           }

}
