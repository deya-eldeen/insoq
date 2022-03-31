//
//  MotorsFillter.swift
//  inSooqApp
//
//  Created by mohammad ahmad on 22/02/2021.
//

import UIKit
import ZMSwiftRangeSlider
import DropDown

class MotorsFillter: UIView,UITextFieldDelegate{
    @IBOutlet var contentView: UIView!
    //Sliders
    @IBOutlet weak var maxPrice: UITextField!
    @IBOutlet weak var minPrice: UITextField!
    @IBOutlet weak var priceSlider: RangeSlider!
    
    @IBOutlet weak var maxYear: UITextField!
    @IBOutlet weak var minYear: UITextField!
    @IBOutlet weak var yearSlider: RangeSlider!
    
    @IBOutlet weak var maxMile: UITextField!
    @IBOutlet weak var minMile: UITextField!
    @IBOutlet weak var mileageSlider: RangeSlider!
    //------->
    @IBOutlet weak var resetButton: UIButton!
    @IBOutlet weak var cancelButton: UIButton!
    @IBOutlet var locationCollectionView: UICollectionView!
    var now=Date()
    //DropDown Lists
    @IBOutlet weak var brandButton: UIButton!
    @IBOutlet weak var modelButton: NiceButton!
    
    @IBOutlet weak var fillterResultButton: UIButton!
    //MARK: - DropDown's
    var testFilltered:[String]=["Amman","Dubai","KSA","UAE","Maldives","Kuwait"]

    let brandDropDown = DropDown()
    let modelDropDown = DropDown()
    
    lazy var dropDowns: [DropDown] = {
        return [
            self.brandDropDown,
            self.modelDropDown,
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
            initFillterData()
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
        brandButton.addTarget(self, action: #selector(brandAction), for: .touchUpInside)
        modelButton.addTarget(self, action: #selector(modelAction), for: .touchUpInside)
        ///Price
        priceSlider.setValueChangedCallback { (minValue, maxValue) in
            debugPrint("priceSlider min value:\(minValue)")
            debugPrint("priceSlider max value:\(maxValue)")
        }
        priceSlider.setMinValueDisplayTextGetter { (minValue) -> String? in
            self.minPrice.text="\(minValue)"
            return ""
        }
        priceSlider.setMaxValueDisplayTextGetter { (maxValue) -> String? in
            self.maxPrice.text="\(maxValue)"
            return ""
        }
        ///Years
        yearSlider.setValueChangedCallback { (minValue, maxValue) in
            debugPrint("priceSlider min value:\(minValue)")
            debugPrint("priceSlider max value:\(maxValue)")
        }
        yearSlider.setMinValueDisplayTextGetter { (minValue) -> String? in
            if minValue>9
            {
                self.minYear.text="20\(minValue)"
            }else{
                self.minYear.text="200\(minValue)"

            }
            return ""
        }
        yearSlider.setMaxValueDisplayTextGetter { (maxValue) -> String? in
            self.maxYear.text="20\(maxValue)"
            return ""
        }
        ///Mileag
        mileageSlider.setValueChangedCallback { (minValue, maxValue) in
            debugPrint("priceSlider min value:\(minValue)")
            debugPrint("priceSlider max value:\(maxValue)")
        }
        mileageSlider.setMinValueDisplayTextGetter { (minValue) -> String? in
            self.minMile.text="\(minValue)"
            return ""
        }
        mileageSlider.setMaxValueDisplayTextGetter { (maxValue) -> String? in
            
            self.maxMile.text="\(maxValue)"
            return ""
        }

    }
    @objc func initFillterData(){
        priceSlider.setRangeValues(Array(0...100000))
        priceSlider.setMinAndMaxRange(0, maxRange: 100000)
      
        // Locale.current.calendar.
        let maxYear=getCurrentYear()
        yearSlider.setRangeValues(Array(0...maxYear+2))
        yearSlider.setMinAndMaxRange(0, maxRange: maxYear+2)
        
        mileageSlider.setRangeValues(Array(0...200000))
        mileageSlider.setMinAndMaxRange(0, maxRange: 200000)
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
        bottomBorder(object: minPrice)
        bottomBorder(object: maxPrice)
        bottomBorder(object: minYear)
        bottomBorder(object: maxYear)
        bottomBorder(object: minMile)
        bottomBorder(object: maxMile)
    }
    @objc func brandAction (){
        brandDropDown.show()
    }
    @objc func modelAction (){
        modelDropDown.show()
    }
    private func setupBrandDropDown() {
        brandDropDown.anchorView = brandButton
        modelDropDown.anchorView = modelButton

        brandDropDown.bottomOffset = CGPoint(x: 0, y: brandButton.bounds.height)
        modelDropDown.bottomOffset = CGPoint(x: 0, y: brandButton.bounds.height)

        brandDropDown.dataSource = [
            "BMW",
            "KIA",
            "Honda",
            "Brand-A",
            "Brand-B",
            "BMW",
            "KIA",
            "Honda",
            "Brand-A",
            "Brand-B",
            "KIA",
            "Honda",
            "Brand-A",
            "Brand-B",
            "BMW",
            "KIA",
            "Honda",
            "Brand-A",
            "Brand-B",
            "Brand-C"
        ]
        
        modelDropDown.dataSource = [
            "i 3",
            "i 8",
            "x 5",
            "x 6",
            "230 i",
            ]
        
        // Action triggered on selection
        brandDropDown.selectionAction = { [weak self] (index, item) in
            self?.brandButton.setTitle(" \(item)", for: .normal)
        }
        // Action triggered on selection
        modelDropDown.selectionAction = { [weak self] (index, item) in
            self?.modelButton.setTitle(" \(item)", for: .normal)
        }
    }
    private func registerNib(){
        
        let  locationNib = UINib(nibName: "locationCollectionViewCell", bundle: nil)
        locationCollectionView.register(locationNib, forCellWithReuseIdentifier: "locationCollectionViewCell")
        let  addLocationNib = UINib(nibName: "AddLocationCollectionViewCell", bundle: nil)
        locationCollectionView.register(addLocationNib, forCellWithReuseIdentifier: "AddLocationCollectionViewCell")


    }
    func xibSetup() {
        
        Bundle.main.loadNibNamed("MotorsFillter", owner: self, options: nil)
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
   //MARK:-Text field Delegate
    ///in case to adjust slider
    func textFieldDidBeginEditing(_ textField: UITextField) {
 
    }
    func textFieldDidEndEditing(_ textField: UITextField) {
        debugPrint("End Editing",textField)
        if textField == minPrice {
            if checkPriceRange(price: minPrice.text!){
            let minValue:Int=Int(minPrice.text!)!
            priceSlider.setMinAndMaxRange(minValue, maxRange: 100000)
            }
        }
        if textField == maxPrice {
            if checkPriceRange(price: maxPrice.text!){
            let maxValue:Int=Int(maxPrice.text!)!
            priceSlider.setMinAndMaxRange(0, maxRange: maxValue)
            }
        }
    }
    func checkPriceRange(price :String)->Bool{
        if Int(price)! >= 0 || Int(price)! <= 10000000{
            return true
        }
        return false
    }
    func getCurrentYear()->Int
    {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "YY"
        let thisYear = dateFormatter.string(from: now)
        maxYear.text=thisYear
        return Int(thisYear)!
    }
}

extension MotorsFillter:UICollectionViewDelegateFlowLayout,UICollectionViewDataSource{
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
        showAlertDeprecated(controller: vc, message: "Showing Locations Popuo soon", seconds: 1)
    }

}
