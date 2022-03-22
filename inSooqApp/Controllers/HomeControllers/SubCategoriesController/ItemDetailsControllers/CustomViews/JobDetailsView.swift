//
//  JobDetailsView.swift
//  inSooqApp
//
//  Created by mohammad ahmad on 14/02/2021.
//

import UIKit

class JobDetailsView: UIView {

    

    @IBOutlet weak var imgContact: UIImageView!
    @IBOutlet weak var locationLbl: UILabel!
    @IBOutlet weak var descLbl: UILabel!
    @IBOutlet weak var applayButton: UIButton!
    @IBOutlet weak var advertiser: UILabel!
    @IBOutlet weak var advertiserDate: UILabel!
    
    @IBOutlet weak var mapButton: UIButton!
    @IBOutlet weak var descriptionButton: UIButton!
    @IBOutlet weak var descHeight: NSLayoutConstraint!
    @IBOutlet weak var mapHeight: NSLayoutConstraint!

    @IBOutlet weak var smsView: UIView!
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

    var _isExpandedView:Bool!
    var _isMapExpandedView:Bool=false
    var _isDescExpandedView:Bool=false
    var vc:UIViewController?
    var data: JobsModel?
    func setVC(viewController:UIViewController , data: JobsModel)
    {
        self.data = data
        self.vc = viewController
        if ((viewController.isKind(of: DetailsViewController.self)) )
        {
            debugPrint("vc-JobsView:-",viewController)
            _isExpandedView=true
            setupDataViews()
            setDesign()
            ///add dunction to Calculate initiial Views height

        }
        descLbl.text = data.welcomeDescription
        locationLbl.text = data.enLocation
        
        
    }
    func enableBtns(enable:Bool)
    {
        self.descriptionButton.isEnabled=enable
        self.mapButton.isEnabled=enable
        
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
        
        objectShadow(object: locationInfoView, cornerRadius: 5)
        objectCornerRadius(object: contactlabel, cornerRadius: 5)
        addLeftBorder(object: phoneView, xPoint: 0, yPoint: 0)
        addLeftBorder(object: smsView, xPoint: 0, yPoint: 0)

        contactlabel.clipsToBounds=true
    }

    func xibSetup() {
        
        Bundle.main.loadNibNamed("JobDetailsView", owner: self, options: nil)
        contentView.frame = bounds
        contentView.autoresizingMask =
            [.flexibleWidth, .flexibleHeight]
        addSubview(contentView)

    }
    func setupDataViews(){
        infoCollectionView.delegate=self
        infoCollectionView.dataSource=self
        similarItemslCollectionView.delegate=self
        similarItemslCollectionView.dataSource=self
        ///CollectionViews
        let infoNib = UINib(nibName: "InfoCollectionViewCell", bundle: nil)
        infoCollectionView.register(infoNib, forCellWithReuseIdentifier: "InfoCollectionViewCell")
      
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
}

extension JobDetailsView:UICollectionViewDelegateFlowLayout,UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == infoCollectionView{
            return 5
        }else {
            return 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView==infoCollectionView{
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "InfoCollectionViewCell", for: indexPath) as! InfoCollectionViewCell
//        cell.setJobInfo(data: Statics.testItemDetailsData[indexPath.row])
            var rowData: RowDataModel?
            switch indexPath.row{
            case 0:
                rowData = RowDataModel(icon: UIImage(named: "car_mileage")!, title: "Job Type", data: self.data?.enJobType ?? "undefined")
                break
            case 1:
                rowData = RowDataModel(icon: UIImage(named: "car_mileage")!, title: "Career Level", data: self.data?.enCareerLevel ?? "undefined")
                break
            case 2:
                rowData = RowDataModel(icon:UIImage(named: "car_mileage")!, title: "Employment Type", data: self.data?.enEmploymentType ?? "undefined")
                break
            case 3:
                rowData = RowDataModel(icon: UIImage(named: "car_mileage")!, title: "Min Work Experience", data: self.data?.enMinWorkExperience ?? "undefined")
                break
            case 4:
                rowData = RowDataModel(icon: UIImage(named: "car_mileage")!, title: "Education Level", data: self.data?.enMinEducationLevel ?? "undefined")
                break
            default:
                rowData = RowDataModel(icon: UIImage(named: "car_mileage")!, title: "", data: "")
                break
            }
    
            if let rowData = rowData{
                cell.setOpenningJob(data: rowData)
            }
        return cell
        }
        else{
            let cell = similarItemslCollectionView.dequeueReusableCell(withReuseIdentifier: "JobsCollectionViewCell", for: indexPath) as! JobsCollectionViewCell
            if let data = data {
                let jobObject:JobModel=JobModel(jobImage: #imageLiteral(resourceName: "sms_icon"), jobTitle: data.title, companyName: data.companyName ?? "", jobType: data.enJobType, jobSalary: "\(String(describing: data.expectedMonthlySalary))$", jobDate: data.postDate, isFavorite: data.isFavorite)
                cell.setJobData(data: jobObject)
            }
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
        layout.itemSize = CGSize(width: Int((infoCollectionView.frame.width)), height: 70 )
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
