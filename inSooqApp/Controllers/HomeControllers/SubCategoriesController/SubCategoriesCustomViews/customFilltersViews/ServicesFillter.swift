//
//  ServicesFillter.swift
//  inSooqApp
//
//  Created by mohammad ahmad on 24/02/2021.
//

import UIKit

class ServicesFillter: UIView {

    @IBOutlet var contentView: UIView!
    //------->>
    @IBOutlet weak var serviceTypeTableView: UITableView!
    //------->>
    @IBOutlet var locationCollectionView: UICollectionView!

    @IBOutlet weak var resetButton: UIButton!
    @IBOutlet weak var cancelButton: UIButton!
    @IBOutlet weak var fillterResultButton: UIButton!
    
    //MARK: - CollectionView array
    var testFilltered:[String]=["Amman","Dubai","KSA","UAE","Maldives","Kuwait"]

    var vc:UIViewController?
    
    func setVC(viewController:UIViewController)
    {
        
        self.vc = viewController
        if ((viewController.isKind(of: SubCategoriesViewController.self)) )
        {
            debugPrint("vc:-",viewController)
            registerNib()
            setDesign()
            setGestureRecognizer()
            initFillterData()
            setDelegates()
            
        }
        
    }

    
    @objc func initFillterData(){
        serviceTypeTableView.reloadInputViews()
        
    }

    private func setGestureRecognizer(){
        resetButton.addTarget(self, action: #selector(initFillterData), for: .touchUpInside)
    }
    private func setDelegates(){
        locationCollectionView.delegate=self
        locationCollectionView.dataSource=self
        serviceTypeTableView.delegate=self
        serviceTypeTableView.dataSource=self

    }
    private func setDesign(){
      //  minPrice.delegate=self
       // maxPrice.delegate=self
        fillterResultButton.layer.cornerRadius=fillterResultButton.frame.height/2
        resetButton.layer.cornerRadius=resetButton.frame.height/2
        resetButton.layer.borderWidth=1
        resetButton.layer.borderColor=#colorLiteral(red: 1, green: 0.7098039216, blue: 0.2745098039, alpha: 1)
    }

    private func registerNib(){
        ///CollectionView
        let  locationNib = UINib(nibName: "locationCollectionViewCell", bundle: nil)
        locationCollectionView.register(locationNib, forCellWithReuseIdentifier: "locationCollectionViewCell")
        let  addLocationNib = UINib(nibName: "AddLocationCollectionViewCell", bundle: nil)
        locationCollectionView.register(addLocationNib, forCellWithReuseIdentifier: "AddLocationCollectionViewCell")
        ///tableView
        let  propertyType = UINib(nibName: "CheckBox_RadioButtonTableViewCell", bundle: nil)
        serviceTypeTableView.register(propertyType, forCellReuseIdentifier: "CheckBox_RadioButtonTableViewCell")

    }
    func xibSetup() {
        Bundle.main.loadNibNamed("ServicesFillter", owner: self, options: nil)
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
extension ServicesFillter:UITableViewDataSource,UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return  Statics.testOptionsArray.count-4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "CheckBox_RadioButtonTableViewCell", for: indexPath ) as! CheckBox_RadioButtonTableViewCell
        cell.setCheckOptions(data:Statics.testOptionsArray[indexPath.row])
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let  cell = tableView.cellForRow(at: indexPath) as! CheckBox_RadioButtonTableViewCell
        cell.selectedButton.addBorders(borderWidth: 0.5, borderColor: #colorLiteral(red: 0.3647058904, green: 0.06666667014, blue: 0.9686274529, alpha: 1))
        objectCornerRadius(object:             cell.selectedButton, cornerRadius: 3)
        
        cell.selectedButton.setImage(#imageLiteral(resourceName: "checked_checkbox"), for: .normal)
    }
    
    func tableView(_ tableView: UITableView, willDeselectRowAt indexPath: IndexPath) -> IndexPath? {
        if  let  cell = tableView.cellForRow(at: indexPath) as? CheckBox_RadioButtonTableViewCell{
        cell.selectedButton.addBorders(borderWidth: 0.5, borderColor: #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1))
        objectCornerRadius(object: cell.selectedButton, cornerRadius: 3)
            cell.selectedButton.setImage(nil, for: .normal)
            
        }
        return indexPath
        
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        40
    }
    
    
}

extension ServicesFillter:UICollectionViewDelegateFlowLayout,UICollectionViewDataSource{
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
