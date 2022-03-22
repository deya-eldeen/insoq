//
//  WantedJobFillter.swift
//  inSooqApp
//
//  Created by mohammad ahmad on 08/04/2021.
//

import UIKit
import DropDown

class WantedJobFillter: UIView {
    @IBOutlet var contentView: UIView!
    
    //------->
    @IBOutlet weak var resetButton: UIButton!
    @IBOutlet weak var cancelButton: UIButton!
    @IBOutlet weak var locationViewHconstraint: NSLayoutConstraint!
    @IBOutlet var locationCollectionView: UICollectionView!
    var now=Date()
    //DropDown Lists
    @IBOutlet weak var jobTypeButton: NiceButton!
    @IBOutlet weak var jobExpButton: NiceButton!
    @IBOutlet weak var jobEduLvlButton: NiceButton!
    @IBOutlet weak var jobComitButton: NiceButton!
    @IBOutlet weak var neighborhoodtButton: NiceButton!

    @IBOutlet weak var fillterResultButton: UIButton!
    //MARK: - DropDown's
    var testFilltered:[String]=["Amman","Dubai","KSA","UAE","Maldives","Kuwait"]

    let jobTypeDropDown = DropDown()
    let jobExpDropDown = DropDown()
    let jobComitDromDown=DropDown()
    
    lazy var dropDowns: [DropDown] = {
        return [
            self.jobTypeDropDown,
            self.jobExpDropDown,
            self.jobComitDromDown
        ]
    }()
    
    var vc:UIViewController?
    func setVC(viewController:UIViewController)
    {
        
        self.vc = viewController
        if ((viewController.isKind(of: SubCategoriesViewController.self)) )
        {
            debugPrint("vc:-",viewController)
            registerNib()
            setDesign()
            setupBrandDropDown()
            sliderData()
        }
        
    }
//    func enableBtns(enable:Bool)
//    {
//        self.specificationsButton.isEnabled=enable
//        self.descriptionButton.isEnabled=enable
//        self.mapButton.isEnabled=enable
//
//    }

    func sliderData(){
        resetButton.addTarget(self, action: #selector(initFillterData), for: .touchUpInside)
        jobTypeButton.addTarget(self, action: #selector(jobTypeAction), for: .touchUpInside)
        jobExpButton.addTarget(self, action: #selector(jobExpAction), for: .touchUpInside)
        jobComitButton.addTarget(self, action: #selector(jobComitAction), for: .touchUpInside)
    }
    
    @objc func initFillterData(){
        jobTypeButton.setTitle("Select", for: .normal)
        jobExpButton.setTitle("Select", for: .normal)
        jobEduLvlButton.setTitle("Select", for: .normal)
        jobComitButton.setTitle("Select", for: .normal)
        neighborhoodtButton.setTitle("Select", for: .normal)
    }
    
    private func setDesign(){
        locationCollectionView.delegate=self
        locationCollectionView.dataSource=self
      //  minPrice.delegate=self
       // maxPrice.delegate=self
        fillterResultButton.layer.cornerRadius=fillterResultButton.frame.height/2
        resetButton.layer.cornerRadius=resetButton.frame.height/2
        resetButton.layer.borderWidth=1
        resetButton.layer.borderColor=#colorLiteral(red: 1, green: 0.7098039216, blue: 0.2745098039, alpha: 1)
        bottomBorder(object: jobExpButton)
        bottomBorder(object: jobTypeButton)
        bottomBorder(object: jobEduLvlButton)
        bottomBorder(object: jobComitButton)
        bottomBorder(object: neighborhoodtButton)
    }
    @objc func jobTypeAction (){
        jobTypeDropDown.show()
    }
    @objc func jobExpAction (){
        jobExpDropDown.show()
    }
    @objc func jobComitAction (){
        jobComitDromDown.show()
    }
    private func setupBrandDropDown() {
        jobTypeDropDown.anchorView = jobTypeButton
        jobExpDropDown.anchorView = jobExpButton
        jobComitDromDown.anchorView = jobComitButton

        jobTypeDropDown.bottomOffset = CGPoint(x: 0, y: jobTypeButton.bounds.height)
        jobExpDropDown.bottomOffset = CGPoint(x: 0, y: jobExpButton.bounds.height)
        jobComitDromDown.bottomOffset = CGPoint(x: 0, y: jobComitButton.bounds.height)

        jobTypeDropDown.dataSource = [
            "Full Time",
            "Part Time",
            "Remote",
            "Contract",
            "Other",
        ]
        
        jobExpDropDown.dataSource = [
            "Entery Level",
            "Associate",
            "Mid-Senior Level",
            "Director",
            "Executive",
            "Internship"
            ]
        jobComitDromDown.dataSource = [
            "Entery Level",
            "Associate",
            "Mid-Senior Level",
            "Director",
            "Executive",
            "Internship"
            ]

        // Action triggered on selection
        jobTypeDropDown.selectionAction = { [weak self] (index, item) in
            self?.jobTypeButton.setTitle(" \(item)", for: .normal)
        }
        // Action triggered on selection
        jobExpDropDown.selectionAction = { [weak self] (index, item) in
            self?.jobExpButton.setTitle(" \(item)", for: .normal)
        }
        // Action triggered on selection
        jobComitDromDown.selectionAction = { [weak self] (index, item) in
            self?.jobComitButton.setTitle(" \(item)", for: .normal)
        }
    }
    private func registerNib(){
        
        let  locationNib = UINib(nibName: "locationCollectionViewCell", bundle: nil)
        locationCollectionView.register(locationNib, forCellWithReuseIdentifier: "locationCollectionViewCell")
        let  addLocationNib = UINib(nibName: "AddLocationCollectionViewCell", bundle: nil)
        locationCollectionView.register(addLocationNib, forCellWithReuseIdentifier: "AddLocationCollectionViewCell")


    }
    func xibSetup() {
        
        Bundle.main.loadNibNamed("WantedJobFillter", owner: self, options: nil)
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

extension WantedJobFillter:UICollectionViewDelegateFlowLayout,UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return testFilltered.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch indexPath.row {
        case testFilltered.count-1:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "AddLocationCollectionViewCell", for: indexPath) as! AddLocationCollectionViewCell
            cell.addButton.tag=indexPath.row
            cell.addButton.addTarget(self, action: #selector(addLocation(Sender:)), for: .touchUpInside)

            return cell

        default:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "locationCollectionViewCell", for: indexPath) as! locationCollectionViewCell
            cell.setlocations(title: testFilltered[indexPath.row])
            cell.cancelButton.tag=indexPath.row
            cell.cancelButton.addTarget(self, action: #selector(deleteLocation(Sender:)), for: .touchUpInside)
            return cell

        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
//            var size = (testFilltered[indexPath.row] as NSString).size(withAttributes: nil)
//        size = CGSize(width: size.width+50, height: size.height+40)
//            return size
        switch indexPath.row {
        case testFilltered.count-1:
            let layout = self.locationCollectionView.collectionViewLayout as! UICollectionViewFlowLayout
            layout.sectionInset = UIEdgeInsets(top: 5, left: 0, bottom: 5, right: 0)
            layout.minimumInteritemSpacing = 0
            layout.itemSize = CGSize(width: Int(50), height: Int(50) )
            return layout.itemSize

        default:
            let layout = self.locationCollectionView.collectionViewLayout as! UICollectionViewFlowLayout
            layout.sectionInset = UIEdgeInsets(top: 5, left: 0, bottom: 5, right: 0)
            layout.minimumInteritemSpacing = 0
            layout.itemSize = CGSize(width: Int((locationCollectionView.width)/2), height: Int(50) )
            return layout.itemSize

        }
    }
    @objc func deleteLocation(Sender:UIButton){
        let index:Int=Sender.tag
        testFilltered.remove(at: index)
        locationCollectionView.reloadData()
    }
    @objc func addLocation(Sender:UIButton){
        guard let vc = self.vc else {
            return
        }
        //Show location popup
        debugPrint("Add pressed")
        showAlert(controller: vc, message: "Showing Locations Popuo soon", seconds: 1)
    }

}
