//
//  Add_TitleViewController.swift
//  inSooqApp
//
//  Created by Abdullah AL-Soubani on 24/02/2021.
//

import UIKit
import DropDown
class Add_TitleViewController: UIViewController {
    // MARK: Buttons Outlets
    @IBOutlet weak var viewSummeryInfo: ViewSummeryInfoOfItem!
    @IBOutlet weak var carBrandbtn: UIButton!
    @IBOutlet weak var carModelbtn: UIButton!
    @IBOutlet weak var trimBtn: UIButton!
    
    // main samir 
    @IBOutlet weak var boatTypeBtn: UIButton!
    @IBOutlet weak var boatSubCatBtn: UIButton!
    
    // MARK: Outlets
    
    @IBOutlet private weak var bikesStackView: UIStackView!
    @IBOutlet private weak var partsStackView: UIStackView!
    @IBOutlet private weak var machineStackView: UIStackView!
    @IBOutlet private weak var boaltsStackView: UIStackView!
    @IBOutlet private weak var usedCarStackView: UIStackView!
    @IBOutlet private weak var titleTextField: UITextField!
    @IBOutlet private weak var mainTitleLable: UILabel!
    
    // MARK: UsedCar
    @IBOutlet private weak var carBrandTextFiled: UITextField!
    @IBOutlet private weak var carModelTextFiled: UITextField!
    @IBOutlet private weak var manufactureTextFiled: UITextField!
    @IBOutlet private weak var trimTextFiled: UITextField!
    
    @IBOutlet weak var stackVOtherCarBrand: UIStackView!
    @IBOutlet weak var stackVOtherCarModel: UIStackView!
    @IBOutlet weak var stackVOtherTrim: UIStackView!
    // MARK: Boalts
    @IBOutlet private weak var boatCategoryTextFiled: UITextField!
    @IBOutlet private weak var boatSubCatTextFiled: UITextField!
    @IBOutlet private weak var boatManufactureTextFiled: UITextField!
    
    // MARK: Machine
    @IBOutlet weak var machineCategoryTextFiled: UITextField!
    @IBOutlet weak var machineSubCategoryTextFiled: UITextField!
    @IBOutlet weak var machineManufactureTextFiled: UITextField!
        
    // MARK: Parts
    @IBOutlet private weak var partsCategoryTextFiled: UITextField!
    @IBOutlet private weak var partsMakeItTextFiled: UITextField!
    @IBOutlet private weak var partsinWhichPartTextFiled: UITextField!
    @IBOutlet private weak var partsyearsOfTextFiled: UITextField!

    // MARK: Bikes
    @IBOutlet private weak var bikesCategoryTextFiled: UITextField!
    @IBOutlet private weak var bikesSubCategoryTextFiled: UITextField!
    @IBOutlet private weak var bikesManufactureTextFiled: UITextField!

    
    // MARK: Properties
    var type: MotorGategorys = .usedCars
    var selectedCategory: Category?
    var param: [String: Any] = [:]
    
    //MARK: USED CARs
    var makerModel: [GetAllMotorMakerModel]?
    var modelCarModel: [GetAllMotorMakerModel]?
    var trimCarModel: [GetAllMotorMakerModel]?
    var selectedMaker: GetAllMotorMakerModel?
    var selectedCarModel: GetAllMotorMakerModel?
    var selectedTrimCar: GetAllMotorMakerModel?
    private var carBrandAdapter: DataPickerAdapter?
    private var carModelAdapter: DataPickerAdapter?
    private var manufactureAdapter: DatePickerAdapter?
    private var trimAdapter: DataPickerAdapter?

    //MARK: Boats
    var boatCatModel = [GetAllMotorMakerModel]()
    var boatSubCatModel = [GetAllMotorMakerModel]()
    var selectedBoatCat: GetAllMotorMakerModel?
    var selectedBoatSubCat: GetAllMotorMakerModel?
    private var boatCatAdapter: DataPickerAdapter?
    private var boatSubCatAdapter: DataPickerAdapter?

    // MARK: DropDowns
    var viewPopupListOfItems:ViewPopupListOfItems = .fromNib()

    
    // MARK: DataPickerAdapter
    
    // MARK: Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        title = selectedCategory?.enName
        [titleTextField,carBrandTextFiled,carModelTextFiled,manufactureTextFiled,trimTextFiled,boatCategoryTextFiled,boatSubCatTextFiled,boatManufactureTextFiled,machineCategoryTextFiled, machineSubCategoryTextFiled,  machineManufactureTextFiled, partsCategoryTextFiled,partsMakeItTextFiled,partsinWhichPartTextFiled,partsyearsOfTextFiled
         ,bikesCategoryTextFiled,bikesSubCategoryTextFiled,bikesManufactureTextFiled].forEach{
            $0?.textColor = .black
            $0?.font = UIFont.systemFont(ofSize: 14)
            $0?.borderWidth = 0
            
        }
        titleTextField.tag = 1
        partsyearsOfTextFiled.tag = 2

        viewPopupListOfItems.frame = self.view.bounds
        viewPopupListOfItems.isHidden = true
        self.view.addSubview(viewPopupListOfItems)
        
        titleTextField.addTarget(self, action: #selector(textFieldDidChange(textField: )), for: .editingChanged)
        manufactureTextFiled.addTarget(self, action: #selector(textFieldDidChange(textField: )), for: .editingChanged)

    }
    
    //MARK: UsedCar action for drop down
    @IBAction func carBrandDropDownAction(_ sender: Any) {
        var strings:[String] = []
        
        if let makerModel = self.makerModel {
            for makrs in makerModel {
                if let itemName = makrs.enText {
                    strings.append(itemName)
                }
            }
        }
        viewPopupListOfItems.setData(vc:self,list: strings)
        viewPopupListOfItems.onItemClick = { (index, item) in
            
            if index >= self.makerModel?.count ?? 0{
                self.stackVOtherCarBrand.isHidden = false
                self.carBrandTextFiled.text = item
                return
            }
            self.stackVOtherCarBrand.isHidden = true
            
            self.viewPopupListOfItems.isHidden = true
            self.carModelTextFiled.text = ""
            self.trimTextFiled.text = ""
            if let makerModel = self.makerModel {
                
                let nameEn = makerModel[safe: index]!.enText  ?? ""
                
                self.carBrandTextFiled.text = nameEn
                self.getCarModelByMaker(maker:  nameEn + "-" )
            }
        }
    
//
    }
    
    @IBAction func carModelDropDownAction(_ sender: Any) {
        var strings:[String] = []
        if let makerModel = self.modelCarModel {
            for makrs in makerModel {
                if let itemName = makrs.enText {
                    strings.append(itemName)
                }
            }
        }
        
        viewPopupListOfItems.setData(vc:self,list: strings)
    viewPopupListOfItems.onItemClick = { (index, item) in
        
        if index >= self.modelCarModel?.count ?? 0{
            self.stackVOtherCarModel.isHidden = false
            self.carModelTextFiled.text = item

            return
        }
        self.stackVOtherCarModel.isHidden = true

        
        if let makerModel = self.modelCarModel {
            let item = makerModel[index].enText  ?? ""
        self.carModelTextFiled.text = item
            self.trimTextFiled.text = ""
            self.selectedCarModel = self.modelCarModel![index]
            self.getTrim()
        }
    }
        
        
//        carModelDropDown.selectionAction = { [unowned self] (index, item) in
//            self.carModelTextFiled.text = item
//            trimTextFiled.text = ""
//            self.selectedCarModel = modelCarModel![index]
//            getTrim()
//        }
//        carModelDropDown.dataSource = strings
//        carModelDropDown.show()
    }
    
    @IBAction func trimDropDownAction(_ sender: Any) {
        var strings:[String] = []
        if let makerModel = self.trimCarModel {
            for makrs in makerModel {
                if let itemName = makrs.enText {
                    strings.append(itemName)
                }
            }
        }
        
        viewPopupListOfItems.setData(vc:self,list: strings)
    viewPopupListOfItems.onItemClick = { (index, item) in
        if index >= self.trimCarModel?.count ?? 0{
            self.stackVOtherTrim.isHidden = false
            self.trimTextFiled.text = item

            return
        }
        self.stackVOtherTrim.isHidden = true

        
        if let list = self.trimCarModel {
let item = list[0].enText  ?? ""
        self.trimTextFiled.text = item
             self.selectedTrimCar = list[safe: index]
       
        }
    }
//        trimDropDown.selectionAction = { [unowned self] (index, item) in
//            self.trimTextFiled.text = item
//            if let  trimCarModel = trimCarModel {
//                self.selectedTrimCar = trimCarModel[safe: index]
//            }
//        }
//        trimDropDown.dataSource = strings
//        trimDropDown.show()
    }
    
    @IBAction func boatCatAction(_ sender: Any) {
        
        var strings:[String] = []
        
        for makrs in self.boatCatModel {
            if let itemName = makrs.enName {
                strings.append(itemName)
            }
        }
        
        viewPopupListOfItems.setData(vc:self,list: strings)
        
        viewPopupListOfItems.onItemClickIndex = { index in
            
            if index >= self.boatCatModel.count { return }
            let item = self.boatCatModel[index].enName ?? ""

            self.boatCategoryTextFiled.text = item
            self.selectedBoatCat = self.boatCatModel[index]
            self.boatSubCatTextFiled.text = ""
            self.getBoatSubCat(id: self.selectedBoatCat?.id?.description ?? "")
        }
        
//        baotCatDropDown.selectionAction = { [unowned self] (index, item) in
//            self.boatCategoryTextFiled.text = item
//            self.selectedBoatCat = self.boatCatModel[index]
//            self.boatSubCatTextFiled.text = ""
//            getBoatSubCat(id: self.selectedBoatCat?.id?.description ?? "")
//        }
//        baotCatDropDown.dataSource = strings
//        baotCatDropDown.show()
    }

    
    @IBAction func boatSubCatAction(_ sender: Any) {
        
        var strings:[String] = []
//        if let makerModel = self.boatSubCatModel {
            for makrs in self.boatSubCatModel {
                if let itemName = makrs.enName {
                    strings.append(itemName)
                }
//            }
        }
        
        viewPopupListOfItems.setData(vc:self,list: strings)
    viewPopupListOfItems.onItemClick = { (index, item) in
        self.boatSubCatTextFiled.text = item
        
        if index >= self.boatSubCatModel.count {
        
        return
            
        }
        self.selectedBoatCat = self.boatSubCatModel[index]
     
        }
        
//        baotSupCatDropDown.selectionAction = { [unowned self] (index, item) in
//            self.boatSubCatTextFiled.text = item
//            self.selectedBoatCat = self.boatSubCatModel[index]
//        }
//        baotSupCatDropDown.dataSource = strings
//        baotSupCatDropDown.show()
    }

    
    @IBAction func boatYearAction(_ sender: Any) {
        var strings:[String] = []
        if let makerModel = self.trimCarModel {
            for makrs in makerModel {
                if let itemName = makrs.enText {
                    strings.append(itemName)
                }
            }
        }
        viewPopupListOfItems.setData(vc:self,list: strings)
    viewPopupListOfItems.onItemClick = { (index, item) in
          self.trimTextFiled.text = item
       
        }
        
//        trimDropDown.selectionAction = { [unowned self] (index, item) in
//            self.trimTextFiled.text = item
//        }
//        trimDropDown.dataSource = strings
//        trimDropDown.show()
    }
}


// MARK: - Setup

extension Add_TitleViewController {
    func setupView() {
        carBrandbtn.setTitle("", for: .normal)
        carModelbtn.setTitle("", for: .normal)
        trimBtn.setTitle("", for: .normal)
        
        boatTypeBtn.setTitle("", for: .normal)
        boatSubCatBtn.setTitle("", for: .normal)
        
        switch type {
        case .usedCars:
            usedCarStackView.isHidden = false
            usedCarsSetupAdapter()
        case .boats:
            boaltsStackView.isHidden = false
            boatSetupAdapter()
        case .machinery:
            machineStackView.isHidden = false
            machineSetupAdapter()
        case .parts:
            partsStackView.isHidden = false
            partsSetupAdapter()
        case .exportCar:
            usedCarStackView.isHidden = false
            usedCarsSetupAdapter()
        case .bike:
            bikesStackView.isHidden = false
            bikesSetupAdapter()
        }
    }
    
    func usedCarsSetupAdapter() {
        
        
//        carBrandesDropDown.dataSource = makerModel
        //carBrandAdapter = DataPickerAdapter(textField: carBrandTextFiled)
//        carModelAdapter = DataPickerAdapter(textField: carModelTextFiled)
//        manufactureAdapter = DatePickerAdapter(textField: manufactureTextFiled)
//        trimAdapter = DataPickerAdapter(textField: trimTextFiled)
//        self.carBrandAdapter?.selectionHandler = { [weak self] index in
//            guard let self = self else { return }
//            self.selectedMaker = self.makerModel?[safe: index]
//            self.getCarModelByMaker(maker: self.selectedMaker?.enText?.removeWhitespace() ?? "")
//        }
//        self.carModelAdapter?.selectionHandler = { [weak self] index in
//            guard let self = self else { return }
//            self.selectedCarModel = self.modelCarModel?[safe: index]
//            self.getTrim()
//        }
//        self.trimAdapter?.selectionHandler = { [weak self] index in
//            guard let self = self else { return }
//            self.selectedTrimCar = self.trimCarModel?[safe: index]
//        }
        getMaker()
    }
    
    func boatSetupAdapter() {
//        boatCatAdapter = DataPickerAdapter(textField: boatCategoryTextFiled)
//        boatSubCatAdapter = DataPickerAdapter(textField: boatSubCatTextFiled)
//        manufactureAdapter = DatePickerAdapter(textField: boatManufactureTextFiled)
        getBoatCat()
    }
    
    func machineSetupAdapter() {
//        boatCatAdapter = DataPickerAdapter(textField: machineCategoryTextFiled)
//        boatSubCatAdapter = DataPickerAdapter(textField: machineSubCategoryTextFiled)
//        manufactureAdapter = DatePickerAdapter(textField: machineManufactureTextFiled)
        getBoatCat()
    }
    
    func partsSetupAdapter() {
        boatCatAdapter = DataPickerAdapter(textField: partsCategoryTextFiled)
        boatSubCatAdapter = DataPickerAdapter(textField: partsMakeItTextFiled)
        manufactureAdapter = DatePickerAdapter(textField: partsyearsOfTextFiled)
        getBoatCat()
    }
    
    func bikesSetupAdapter() {
        boatCatAdapter = DataPickerAdapter(textField: bikesCategoryTextFiled)
        boatSubCatAdapter = DataPickerAdapter(textField: bikesSubCategoryTextFiled)
        manufactureAdapter = DatePickerAdapter(textField: bikesManufactureTextFiled)
        getBoatCat()
    }
}

// MARK: - Action

extension Add_TitleViewController {
    
    @IBAction func nextButtonDidTabbed(_ sender: Any) {
        switch type {
        case .usedCars, .exportCar:
            self.param = [
                "title": titleTextField.text ?? "",
                "categoryId": selectedCategory?.id ?? "",
                "maker": "\(selectedMaker?.enText ?? "")-\(selectedMaker?.arText ?? "")", // brand
                "otherMaker": "",
                "model": "\(selectedCarModel?.enText ?? "")-\(selectedCarModel?.arText ?? "")",
                "otherModel": "",
                "trim": "\(selectedTrimCar?.enText ?? "")-\(selectedTrimCar?.arText ?? "")",
                "otherTrim": "",
                "year" : manufactureTextFiled.text ?? ""
            ]
           
            if !stackVOtherCarBrand.isHidden{
                let textF = (stackVOtherCarBrand.subviews[0]
                ).subviews[0] as? UITextField
                self.param["otherMaker"] = textF?.text ?? ""
            }
            
            if !stackVOtherCarModel.isHidden{
                let textF = (stackVOtherCarModel.subviews[0]
                ).subviews[0] as? UITextField
                self.param["otherModel"] = textF?.text ?? ""
            }
            if !stackVOtherTrim.isHidden{
                let textF = (stackVOtherTrim.subviews[0]
                ).subviews[0] as? UITextField
                self.param["otherTrim"] = textF?.text ?? ""
            }
//            self.param =   ["title": "", "categoryId": 2, "otherTrim": "", "model": "Charger-تشارجير", "year": "2222", "otherMaker": "", "otherModel": "", "maker": "-", "trim": "AC7-AC7"]
//            debugPrint("self.param:\(self.param)")

            requestApis()

        default:
            self.param = [
                "title" : titleTextField.text ?? "",
                "categoryId": selectedCategory?.id ?? "",
                "subCategoryId": selectedBoatCat?.id ?? 0,
                "otherSubCategory": "",
                "subTypeId" : selectedBoatSubCat?.id ?? 0,
                "otherSubType" : "",
                "year" : boatManufactureTextFiled.text ?? ""
            ]
        }
        
    }
    
    func requestApis() {
        self.view.showLoading()
        // the first add is Done // please chack this aqurding to
        WebService.shared.AddInitialMotor(param: self.param) { response, error in
            self.view.hideLoading()
            guard let response = response, error == nil else {
                self.showFailureAlert(title: error?.localizedDescription)
                
                return
            }
            let allModel = AllSelectedModel(selectedCategory: self.selectedCategory,
                                            selectedCarModel: self.selectedCarModel,
                                            selectedTrimCar: self.selectedTrimCar,
                                            selectedBoatCat: self.selectedBoatCat,
                                            selectedBoatSubCat: self.selectedBoatSubCat)
            
            guard let id = response.id else { return }
            let controller = Assembly.add_FullSpecesViewController(allModel: allModel, addedUsesCarItemsID: id , response: response)
            self.navigationController?.pushViewController(controller, animated: true)
            
        }
    }
}

// MARK: - APIs (Car Used)

extension Add_TitleViewController {
    func getMaker() {
        self.view.showLoading()
        WebService.shared.GetAllMotorMakerModel { [weak self] response, error in
            guard let self = self else { return }
            self.view.hideLoading()
            guard let response = response, error == nil else {
                self.showFailureAlert(title: error?.localizedDescription)
                return
            }
            self.makerModel = response
//            self.carBrandAdapter?.set(items: response.compactMap {$0.enText})
        }
    }
    
    func getCarModelByMaker(maker: String) {
        self.view.showLoading()
        WebService.shared.GetAllMotorModelByMaker(maker: maker) { [weak self] response, error in
            guard let self = self else { return }
            self.view.hideLoading()
            guard let response = response, error == nil else {
                self.showFailureAlert(title: error?.localizedDescription)
                return
            }
            self.modelCarModel = response
//            self.carModelAdapter?.set(items: response.compactMap {$0.enText})
        }
    }
    
    func getTrim() {
        self.view.showLoading()
        
        WebService.shared.GetMotorTrim { [weak self] response, error in
            guard let self = self else { return }
            self.view.hideLoading()
            guard let response = response, error == nil else {
                self.showFailureAlert(title: error?.localizedDescription)
                return
            }
            self.trimCarModel = response.filter {$0.modelId == self.selectedCarModel?.id}
        }
    }
}


// MARK: - APIs (Boat)

extension Add_TitleViewController {
    func getBoatCat() {
        self.view.showLoading()
        WebService.shared.getBoatCat(id: selectedCategory?.id?.description ?? "") { [weak self] response, error in
            guard let self = self else { return }
            self.view.hideLoading()
            guard let response = response, error == nil else {
                self.showFailureAlert(title: error?.localizedDescription)
                return
            }
            self.boatCatModel = response
//            self.boatCatAdapter?.selectionHandler = { [weak self] index in
//                guard let self = self else { return }
//                self.selectedBoatCat = response[safe: index]
//                self.getBoatSubCat(id: self.selectedBoatCat?.id?.description ?? "" )
//            }
//            self.boatCatAdapter?.set(items: response.compactMap {$0.enName})
        }
    }
    
    func getBoatSubCat(id: String) {
        self.view.showLoading()
        WebService.shared.getBoatSubCat(id: id) { [weak self] response, error in
            guard let self = self else { return }
            self.view.hideLoading()
            guard let response = response, error == nil else {
                self.showFailureAlert(title: error?.localizedDescription)
                return
            }
            self.boatSubCatModel = response
            self.boatSubCatAdapter?.selectionHandler = { [weak self] index in
                guard let self = self else { return }
                self.selectedBoatCat = response[safe: index]
            }
            self.boatSubCatAdapter?.set(items: response.compactMap {$0.enName})
        }
    }
}

struct AllSelectedModel {
    var selectedCategory: Category?
    var selectedCarModel: GetAllMotorMakerModel?
    var selectedTrimCar: GetAllMotorMakerModel?
    var selectedBoatCat: GetAllMotorMakerModel?
    var selectedBoatSubCat: GetAllMotorMakerModel?
}
extension  Add_TitleViewController{
    @objc func textFieldDidChange(textField: UITextField) {

        
        if textField.tag == titleTextField.tag{
            
            self.viewSummeryInfo.lblName.text = textField.text
        }
        else if textField.tag == manufactureTextFiled.tag{
            
            self.viewSummeryInfo.lblCarYear.text = textField.text
        }
        
        
    }
}
