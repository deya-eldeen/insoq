//
//  PropertyFillterView.swift
//  inSooqApp
//
//  Created by mohammad ahmad on 24/02/2021.
//

import UIKit
import  ZMSwiftRangeSlider

class PropertyFillterView: UIView {

    @IBOutlet var contentView: UIView!
    //Sliders
    @IBOutlet weak var maxPrice: UITextField!
    @IBOutlet weak var minPrice: UITextField!
    @IBOutlet weak var priceSlider: RangeSlider!
    @IBOutlet weak var propertyTypeCollectionView: UICollectionView!

    @IBOutlet weak var maxRange: UITextField!
    @IBOutlet weak var minRange: UITextField!
    @IBOutlet weak var areaRangeSlider: RangeSlider!
    //------->>
    @IBOutlet weak var bedRoom_minusButton: UIButton!
    @IBOutlet weak var bedRoom_plusButton: UIButton!
    @IBOutlet weak var bathRoom_minusButton: UIButton!
    
    @IBOutlet weak var bathRoom_plusButtons: UIButton!
    @IBOutlet weak var bedroomNumberLabel: UILabel!
    var bedroomsCount:Int=0
    @IBOutlet weak var bathroomNumberLabel: UILabel!
    var bathroomsCount:Int=0
    
    //------->>
    @IBOutlet weak var resetButton: UIButton!
    @IBOutlet weak var cancelButton: UIButton!
    @IBOutlet var locationCollectionView: UICollectionView!

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
            sliderData()
            
        }
        
    }

    
    func sliderData(){
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

        ///Area Range -SQ.
        areaRangeSlider.setValueChangedCallback { (minValue, maxValue) in
            debugPrint("priceSlider min value:\(minValue)")
            debugPrint("priceSlider max value:\(maxValue)")
        }
        areaRangeSlider.setMinValueDisplayTextGetter { (minValue) -> String? in
            self.minRange.text="\(minValue)"
            return ""
        }
        areaRangeSlider.setMaxValueDisplayTextGetter { (maxValue) -> String? in
            
            self.maxRange.text="\(maxValue)"
            return ""
        }

    }
    @objc func initFillterData(){
        priceSlider.setRangeValues(Array(0...100000))
        priceSlider.setMinAndMaxRange(0, maxRange: 100000)
      
        
        areaRangeSlider.setRangeValues(Array(0...2000))
        areaRangeSlider.setMinAndMaxRange(0, maxRange: 2000)
    }
    @objc func bedroomsMinusAction(){
        if bedroomsCount>0{
            bedroomsCount-=1
        }
        else if bedroomsCount == 0{
            bedroomsCount=0
        }
        bedroomNumberLabel.text="\(bedroomsCount)"
        
    }
    @objc func bedroomsPlusAction(){
        if bedroomsCount>=0{
            bedroomsCount+=1
        }
        bedroomNumberLabel.text="\(bedroomsCount)"

    }
    @objc func bathroomsMinusAction(){
        if bathroomsCount>0{
            bathroomsCount-=1
        }
        else if bathroomsCount == 0{
            bathroomsCount=0
        }
        bathroomNumberLabel.text="\(bathroomsCount)"
    }
    @objc func bathroomsPlusAction(){
        if bathroomsCount>=0{
            bathroomsCount+=1
        }
        bathroomNumberLabel.text="\(bathroomsCount)"

    }
    private func setGestureRecognizer(){
        resetButton.addTarget(self, action: #selector(initFillterData), for: .touchUpInside)
        bedRoom_plusButton.addTarget(self, action: #selector(bedroomsPlusAction), for: .touchUpInside)
        bedRoom_minusButton.addTarget(self, action: #selector(bedroomsMinusAction), for: .touchUpInside)
        bathRoom_minusButton.addTarget(self, action: #selector(bathroomsMinusAction), for: .touchUpInside)
        bathRoom_plusButtons.addTarget(self, action: #selector(bathroomsPlusAction), for: .touchUpInside)

        
    }
    private func setDelegates(){
        locationCollectionView.delegate=self
        locationCollectionView.dataSource=self
        propertyTypeCollectionView.delegate=self
        propertyTypeCollectionView.dataSource=self


    }
    private func setDesign(){
      //  minPrice.delegate=self
       // maxPrice.delegate=self
        fillterResultButton.layer.cornerRadius=fillterResultButton.frame.height/2
        bedRoom_minusButton.layer.cornerRadius=bedRoom_minusButton.frame.height/2
        bedRoom_plusButton.layer.cornerRadius=bedRoom_plusButton.frame.height/2
        bathRoom_plusButtons.layer.cornerRadius=bathRoom_plusButtons.frame.height/2
        bathRoom_minusButton.layer.cornerRadius=bathRoom_minusButton.frame.height/2
        resetButton.layer.cornerRadius=resetButton.frame.height/2
        resetButton.layer.borderWidth=1
        resetButton.layer.borderColor=#colorLiteral(red: 1, green: 0.7098039216, blue: 0.2745098039, alpha: 1)
        bedroomNumberLabel.text="0"
        bathroomNumberLabel.text="0"
        bottomBorder(object: minPrice)
        bottomBorder(object: maxPrice)
        bottomBorder(object: minRange)
        bottomBorder(object: maxRange)
    }

    private func registerNib(){
        ///CollectionView
        let  locationNib = UINib(nibName: "locationCollectionViewCell", bundle: nil)
        locationCollectionView.register(locationNib, forCellWithReuseIdentifier: "locationCollectionViewCell")
        let  addLocationNib = UINib(nibName: "AddLocationCollectionViewCell", bundle: nil)
        locationCollectionView.register(addLocationNib, forCellWithReuseIdentifier: "AddLocationCollectionViewCell")

        let  proTypeNib = UINib(nibName: "PropertyTypeCollectionViewCell", bundle: nil)
        propertyTypeCollectionView.register(proTypeNib, forCellWithReuseIdentifier: "PropertyTypeCollectionViewCell")

    }
    func xibSetup() {
        Bundle.main.loadNibNamed("PropertyFillterView", owner: self, options: nil)
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

}

extension PropertyFillterView:UICollectionViewDelegateFlowLayout,UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return testFilltered.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == propertyTypeCollectionView{
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PropertyTypeCollectionViewCell", for: indexPath) as! PropertyTypeCollectionViewCell
            cell.setCategoriesData(data: Statics.favoModel[indexPath.row])

            return cell

        }else{
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
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
//            var size = (testFilltered[indexPath.row] as NSString).size(withAttributes: nil)
//        size = CGSize(width: size.width+50, height: size.height+40)
//            return size
        if collectionView == propertyTypeCollectionView{
            let layout = self.propertyTypeCollectionView.collectionViewLayout as! UICollectionViewFlowLayout
            layout.sectionInset = UIEdgeInsets(top: 5, left: 0, bottom: 5, right: 0)
            layout.minimumInteritemSpacing = 0
            layout.itemSize = CGSize(width: Int((propertyTypeCollectionView.frame.width-10)/5), height: 60 )
            debugPrint("MyFavoCells:=",layout.itemSize.height,layout.itemSize.width)
            return layout.itemSize
            
        }
        else{
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
