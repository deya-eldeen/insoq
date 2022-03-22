//
//  PlateDetailsView.swift
//  inSooqApp
//
//  Created by mohammad ahmad on 15/02/2021.
//

import UIKit

class PlateDetailsView: UIView {
    
    @IBOutlet weak var mapButton: UIButton!
    @IBOutlet weak var descriptionButton: UIButton!
    @IBOutlet weak var descHeight: NSLayoutConstraint!
    @IBOutlet weak var mapHeight: NSLayoutConstraint!
  
    @IBOutlet weak var offerButton: UIButton!

    @IBOutlet weak var contentView: UIView!
    
    @IBOutlet weak var descriptionArrow: UIImageView!
    @IBOutlet weak var mapArrow: UIImageView!

    @IBOutlet weak var descriptionView: UIView!
    @IBOutlet weak var mapView: UIView!

    @IBOutlet weak var reportAddButton: UIButton!

    //MARK:-CollectionViews
    @IBOutlet weak var similarItemslCollectionView: UICollectionView!
    @IBOutlet weak var infoCollectionView: UICollectionView!

    var _isMapExpandedView:Bool=false
    var _isDescExpandedView:Bool=false
    var _isSellerInfoExpandedView:Bool=false

    var vc:UIViewController?
    func setVC(viewController:UIViewController)
    {
        
        self.vc = viewController
        if ((viewController.isKind(of: DetailsViewController.self)) )
        {
            debugPrint("vc-JobsView:-",viewController)
        setupDataViews()
            setDesign()
            
            ///add dunction to Calculate initiial Views height

        }
        
    }
    func enableBtns(enable:Bool)
    {
        self.descriptionButton.isEnabled=enable
        self.mapButton.isEnabled=enable
        self.reportAddButton.isEnabled=enable


        
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
            mapView.animateViewHeight(controller: vc, height: 180, heightConstraint: mapHeight)
        }
        else
        {
            mapArrow.image=UIImage(systemName: "chevron.down")
            
            mapView.animateViewHeight(controller: vc, height: 0, heightConstraint: mapHeight)
           
        }
        UIView.animate(withDuration: 0.6) {
            for v in self.mapView.subviews{
                v.isHidden = !self._isMapExpandedView
            }
        }
        _isMapExpandedView = !_isMapExpandedView
        debugPrint("specHeight:-",mapHeight.constant)
        debugPrint("_isMapExpandedView:-",_isMapExpandedView)


    }

    func xibSetup() {
        
        Bundle.main.loadNibNamed("PlateDetailsView", owner: self, options: nil)
        contentView.frame = bounds
        contentView.autoresizingMask =
            [.flexibleWidth, .flexibleHeight]
        addSubview(contentView)

    }
    
    private func setDesign(){
        
        objectCornerRadius(object: offerButton, cornerRadius: offerButton.height/2)
    }
    func setupDataViews(){
        similarItemslCollectionView.delegate=self
        similarItemslCollectionView.dataSource=self
        infoCollectionView.delegate=self
        infoCollectionView.dataSource=self

        ///CollectionViews
        let infoNib = UINib(nibName: "InfoCollectionViewCell", bundle: nil)
        infoCollectionView.register(infoNib, forCellWithReuseIdentifier: "InfoCollectionViewCell")
        

        let similarNib = UINib(nibName: "PlatesCollectionViewCell", bundle: nil)
        similarItemslCollectionView.register(similarNib, forCellWithReuseIdentifier: "PlatesCollectionViewCell")
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


extension PlateDetailsView:UICollectionViewDelegateFlowLayout,UICollectionViewDataSource{
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
        let cell = similarItemslCollectionView.dequeueReusableCell(withReuseIdentifier: "PlatesCollectionViewCell", for: indexPath) as! PlatesCollectionViewCell
        let numberObject=NumbersModel(plateOrgineLabel: " Dubai Plate ", plateNumber: "G-2334", plateLocation: "", platePrice: "14000 $", plateImage:#imageLiteral(resourceName: "Plate.png"), isFavorite: false,plateDate: "just now")
        cell.setPlateData(data: numberObject)
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
           var cWidth = ((similarItemslCollectionView.frame.width)/2)
           debugPrint("Cwidth",cWidth)
           if cWidth > 120{
               debugPrint("iCwidth",cWidth)
           }
           else{
               cWidth = ((similarItemslCollectionView.frame.width)/2)
           }
           let layout = self.similarItemslCollectionView.collectionViewLayout as! UICollectionViewFlowLayout
           layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
           layout.minimumInteritemSpacing = 0
           layout.itemSize = CGSize(width: Int(cWidth), height: Int(cWidth) )
           debugPrint("itemSize.height",layout.itemSize.height)
           return layout.itemSize
           
       }
   }
   
}
