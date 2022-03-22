//
//  WantedJobDetailsView.swift
//  inSooqApp
//
//  Created by mohammad ahmad on 11/04/2021.
//

import UIKit

class WantedJobDetailsView: UIView,UITableViewDelegate,UITableViewDataSource{
    @IBOutlet weak var locationIcon: UILabel!
    @IBOutlet weak var jobTitle: UILabel!
    @IBOutlet weak var companyname: UILabel!
    @IBOutlet weak var jobLocation: UILabel!
    @IBOutlet weak var dateDate: UILabel!
    
    @IBOutlet weak var locationLbl: UILabel!
    @IBOutlet weak var desc: UILabel!
    @IBOutlet weak var favoButton: UIButton!
    @IBOutlet weak var shareButton: UIButton!
    @IBOutlet weak var specificationTableView: UITableView!
    @IBOutlet weak var specificationsView: UIView!
    @IBOutlet weak var specificationsArrow: UIImageView!
    @IBOutlet weak var specificationsButton: UIButton!
    @IBOutlet weak var specHeight: NSLayoutConstraint!
    
    @IBOutlet weak var mapButton: UIButton!
    @IBOutlet weak var descriptionButton: UIButton!
    @IBOutlet weak var descHeight: NSLayoutConstraint!
    @IBOutlet weak var mapHeight: NSLayoutConstraint!

    @IBOutlet weak var phoneView: UIView!

    @IBOutlet weak var locationInfoView: UIView!
    @IBOutlet weak var contactlabel: UILabel!
    @IBOutlet weak var contentView: UIView!
    
    @IBOutlet weak var descriptionArrow: UIImageView!
    @IBOutlet weak var mapArrow: UIImageView!

    @IBOutlet weak var descriptionView: UIView!
    @IBOutlet weak var mapView: UIView!

    //MARK:-CollectionViews
    @IBOutlet weak var infoCollectionView: UICollectionView!
    @IBOutlet weak var similarItemslCollectionView: UICollectionView!
    var _isSpecificationExpandedView:Bool=false
    var _isFavo:Bool=true
    var _isExpandedView:Bool!
    var _isMapExpandedView:Bool=false
    var _isDescExpandedView:Bool=false
    var vc:UIViewController?
    func setVC(viewController:UIViewController , data: JobsModel)
    {
        
        self.vc = viewController
        if ((viewController.isKind(of: DetailsViewController.self)) )
        {
            debugPrint("vc-JobsView:-",viewController)
            _isExpandedView=true
            setupDataViews()
            setIcons()
            setDesign()
            ///add dunction to Calculate initiial Views height

        }
        desc.text = data.welcomeDescription
        locationLbl.text = data.enLocation
    }
    func enableBtns(enable:Bool)
    {
        self.specificationsButton.isEnabled=enable
        self.descriptionButton.isEnabled=enable
        self.mapButton.isEnabled=enable
    }
    
    private func setIcons(){
        locationIcon.font=UIFont(name: "FontAwesome5Pro-Regular", size: 30)
        locationIcon.textColor=#colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
        locationIcon.text=Statics.icons.mapMarker_icon
        locationIcon.textAlignment = .center
        shareButton.titleLabel?.font=UIFont(name: "FontAwesome5Pro-Regular", size: 25)
        shareButton.setTitle(Statics.icons.share_icon, for: .normal)
        shareButton.tintColor=#colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
        favoButton.titleLabel?.font=UIFont(name: "FontAwesome5Pro-Regular", size: 25)
        favoButton.setTitle(Statics.icons.heart_icon, for: .normal)
    }
    
    @IBAction func favo_Pressed(_ sender: Any)    {
        if _isFavo{
            buttonFont(object: favoButton, size: 25, style: "Regular")
            favoButton.setTitle(Statics.icons.heart_icon, for: .normal)
            favoButton.setTitleColor(#colorLiteral(red: 1, green: 0.262745098, blue: 0.2235294118, alpha: 1), for: .normal)
        }else{
            buttonFont(object: favoButton, size: 25, style: "Solid")
            favoButton.setTitle(Statics.icons.heart_icon, for: .normal)
            favoButton.setTitleColor(#colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1), for: .normal)
        }
        _isFavo = !_isFavo
        
    }

    
    @IBAction func specification_Pressed(_ sender: Any) {
        printAllFonts()
        guard let vc = self.vc else {
            return }
        if _isSpecificationExpandedView{
            ///function to calculate Height and set height here ...for now only 600 to see the deferance
            specificationsView.animateViewHeight(controller: vc, height: 300, heightConstraint: specHeight)
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
            mapView.animateViewHeight(controller: vc, height: 550, heightConstraint: mapHeight)

        }
        else
        {
            mapArrow.image=UIImage(systemName: "chevron.compact.down")
            
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

    private func setDesign(){
        objectShadow(object: specificationsView, cornerRadius: 5)
        objectShadow(object: locationInfoView, cornerRadius: 5)
        objectCornerRadius(object: contactlabel, cornerRadius: 5)
        addLeftBorder(object: phoneView, xPoint: 0, yPoint: 0)

        contactlabel.clipsToBounds=true
    }

    func xibSetup() {
        
        Bundle.main.loadNibNamed("WantedJobDetailsView", owner: self, options: nil)
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
      
        let  WantedJobsXib = UINib(nibName: "WantedJobsCollectionViewCell", bundle: nil)
        similarItemslCollectionView.register(WantedJobsXib, forCellWithReuseIdentifier: "WantedJobsCollectionViewCell")

        let similarNib = UINib(nibName: "JobsCollectionViewCell", bundle: nil)
        similarItemslCollectionView.register(similarNib, forCellWithReuseIdentifier: "JobsCollectionViewCell")
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
        return Statics.testItemDetailsData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let dataCell:MotorsSpecificationCollectionViewCell = tableView.dequeueReusableCell(withIdentifier: "MotorsSpecificationCollectionViewCell", for: indexPath) as! MotorsSpecificationCollectionViewCell
        dataCell.rowIcon.isHidden=true
        dataCell.setRowData(data: Statics.testItemDetailsData[indexPath.row] )
        return dataCell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }

}

extension WantedJobDetailsView:UICollectionViewDelegateFlowLayout,UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return Statics.testItemDetailsData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView==infoCollectionView{
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "InfoCollectionViewCell", for: indexPath) as! InfoCollectionViewCell
        cell.setJobInfo(data: Statics.testItemDetailsData[indexPath.row])
        return cell
        }
        else{
            let cell = similarItemslCollectionView.dequeueReusableCell(withReuseIdentifier: "WantedJobsCollectionViewCell", for: indexPath) as! WantedJobsCollectionViewCell
            let jobObject:WantedJobModel=WantedJobModel(jobTitle: "Manager", jobLocation: "UAE", jobPositions: "Project", jobType: "Full Time", jobExperiance: "6+ years", jobDate: "posted 3 days ago", isFavorite: false)
            cell.setJobData(data: jobObject)
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
        layout.itemSize = CGSize(width: Int((infoCollectionView.frame.width)/2), height: 70 )
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

