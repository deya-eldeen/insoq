//
//  Business_MobilesFillter.swift
//  inSooqApp
//
//  Created by mohammad ahmad on 25/02/2021.
//

import UIKit
import ZMSwiftRangeSlider

class BusinessMobilesFillter: UIView {
    @IBOutlet var contentView: UIView!
    //Sliders
    @IBOutlet weak var maxPrice: UITextField!
    @IBOutlet weak var minPrice: UITextField!
    @IBOutlet weak var priceSlider: RangeSlider!
    @IBOutlet weak var fillterResultButton: UIButton!
    @IBOutlet weak var resetButton: UIButton!
    @IBOutlet weak var cancelButton: UIButton!
    @IBOutlet weak var serviceTypeTableView: UITableView!

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
            sliderData()
            setDelegates()
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
    }
    @objc func initFillterData(){
        priceSlider.setRangeValues(Array(0...100000))
        priceSlider.setMinAndMaxRange(0, maxRange: 100000)
          }
    private func setDelegates(){
        serviceTypeTableView.delegate=self
        serviceTypeTableView.dataSource=self

    }

    
    private func setDesign(){
        serviceTypeTableView.reloadInputViews()
        fillterResultButton.layer.cornerRadius=fillterResultButton.frame.height/2
        resetButton.layer.cornerRadius=resetButton.frame.height/2
        resetButton.layer.borderWidth=1
        resetButton.layer.borderColor=#colorLiteral(red: 1, green: 0.7098039216, blue: 0.2745098039, alpha: 1)
        bottomBorder(object: minPrice)
        bottomBorder(object: maxPrice)
    }
    private func setGestureRecognizer(){
        resetButton.addTarget(self, action: #selector(initFillterData), for: .touchUpInside)
    }

    private func registerNib(){
        let  propertyType = UINib(nibName: "CheckBox_RadioButtonTableViewCell", bundle: nil)
        serviceTypeTableView.register(propertyType, forCellReuseIdentifier: "CheckBox_RadioButtonTableViewCell")
    }
    
    func xibSetup() {
        Bundle.main.loadNibNamed("BusinessMobilesFillter", owner: self, options: nil)
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


extension BusinessMobilesFillter:UITableViewDataSource,UITableViewDelegate{
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
