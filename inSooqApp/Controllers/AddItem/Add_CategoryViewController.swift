//
//  SelectSubCategoryViewController.swift
//  inSooqApp
//
//  Created by mohammad ahmad on 24/02/2021.
//

import UIKit



class Add_CategoryViewController: UIViewController {
    
    @IBOutlet weak var iconImage: UIImageView!
    @IBOutlet weak var subCategoriesTableView: UITableView!
    @IBOutlet weak var titleLable: UILabel!
    @IBOutlet weak var shadowView: UIView!
    @IBOutlet weak var bottomBar: BottomBar!
    
    var modelOfCategory: CategoriesModel?
    var model = [Category]()
//    var selectedType: MotorGategorys?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bottomBar.setVC(viewController: self)
        setDesign()
        getSubCategory()
        setDelegate()
    }
    
    //MARK: - Functions
    private func setDesign() {
        title = modelOfCategory?.categoryName
        iconImage.image = modelOfCategory?.categoryImage
        titleLable.text = String(format: "%@ it is...", modelOfCategory?.categoryName ?? "")
        objectShadow(object: shadowView, cornerRadius: 10)
    }
    
    private func setDelegate() {
        subCategoriesTableView.delegate = self
        subCategoriesTableView.dataSource = self
    }
    
}

//MARK: - TableView
extension Add_CategoryViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return model.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let subCategoryData:SubCategoriesTableViewCell = tableView.dequeueReusableCell(withIdentifier: "SubCategoriesTableViewCell", for: indexPath) as! SubCategoriesTableViewCell
        
        subCategoryData.setSubCategoryDataModel(model: model[indexPath.row])
        
        return subCategoryData
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if let cell = tableView.cellForRow(at: indexPath) as? SubCategoriesTableViewCell {
            cell.contentView.backgroundColor = #colorLiteral(red: 1, green: 0, blue: 0.4509803922, alpha: 1)
            cell.subName.textColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        }
           
        let id = model[indexPath.row].id
        let typeID = model[indexPath.row].typeID
        let catName = model[indexPath.row].enName

        let adType = AdCategory(rawValue: id ?? 0)
        
        print("DID_SELECT_ID_TypeID",id,typeID)
        print("adType",adType)
        print("catName",catName)

        var targetController: UIViewController?
        
        FormViewController.selectedCatID = id ?? 0
        
        switch adType {
        case .usedCars:
            targetController = ViewControllersAssembly.forms.makeViewController(with: "Motors_Used_VC")
        case .boats:
            targetController = ViewControllersAssembly.forms.makeViewController(with: "Motors_Boats_VC")
        case .machinery:
            targetController = ViewControllersAssembly.forms.makeViewController(with: "Motors_Machinery_VC")
        case .parts:
            targetController = ViewControllersAssembly.forms.makeViewController(with: "Motors_Parts_VC")
        case .exportCar:
            targetController = ViewControllersAssembly.forms.makeViewController(with: "Motors_Export_VC")
        case .bike:
            targetController = ViewControllersAssembly.forms.makeViewController(with: "Motors_Bike_VC")
        case .jobWanted:
            targetController = ViewControllersAssembly.forms.makeViewController(with: "Job_Wanted_VC")
        case .domestic:
            targetController = ViewControllersAssembly.forms.makeViewController(with: "Services_VC")
        case .autoService:
            targetController = ViewControllersAssembly.forms.makeViewController(with: "Services_VC")
        case .moversRemovals:
            targetController = ViewControllersAssembly.forms.makeViewController(with: "Services_VC")
        case .webComputer:
            targetController = ViewControllersAssembly.forms.makeViewController(with: "Services_VC")
        case .corporateServices:
            targetController = ViewControllersAssembly.forms.makeViewController(with: "Services_VC")
        case .homeMaintenance:
            targetController = ViewControllersAssembly.forms.makeViewController(with: "Services_VC")
        case .eventEntertainment:
            targetController = ViewControllersAssembly.forms.makeViewController(with: "Services_VC")
        case .tutorsClasses:
            targetController = ViewControllersAssembly.forms.makeViewController(with: "Services_VC")
        case .healthServices:
            targetController = ViewControllersAssembly.forms.makeViewController(with: "Services_VC")
        case .serviceOthers:
            targetController = ViewControllersAssembly.forms.makeViewController(with: "Services_Others_VC")
        case .platNumbers:
            targetController = ViewControllersAssembly.forms.makeViewController(with: "Plate_Numbers_VC")
        case .mobileNumbers:
            targetController = ViewControllersAssembly.forms.makeViewController(with: "Mobile_Numbers_VC")
        case .mobiles:
            targetController = ViewControllersAssembly.forms.makeViewController(with: "Mobiles_VC")
        case .tablets:
            targetController = ViewControllersAssembly.forms.makeViewController(with: "Tablets_VC")
        case .mobilesTabletsAccessories:
            targetController = ViewControllersAssembly.forms.makeViewController(with: "Mobiles_Tablets_Accessories_VC")
        case .homeElectronics:
            targetController = ViewControllersAssembly.forms.makeViewController(with: "Home_Electronics_VC")
        case .computersNetworking:
            targetController = ViewControllersAssembly.forms.makeViewController(with: "Computers_Networking_VC")
        case .none:
            print("NONE")
        case .business:
            print("business")
        case .classified:
            print("classified")
        }
        
        if let tc = targetController {
            tc.title = catName
            navigationController?.pushViewController(tc, animated: true)
        }
                
    }
    
    func tableView(_ tableView: UITableView, willDeselectRowAt indexPath: IndexPath) -> IndexPath? {
        if let cell = tableView.cellForRow(at: indexPath) as? SubCategoriesTableViewCell {
            cell.contentView.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
            cell.subName.textColor=#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
            
        }
        return indexPath
    }
    
    func goToBoats(category: Category){
        let mainStoryboard = UIStoryboard(name: "addStory", bundle: nil)
        
        let vc = mainStoryboard.instantiateViewController(identifier: "AddBoatsVC") as! AddBoatsVC
        vc.modalPresentationStyle = .fullScreen
        vc.categoryId = Int(modelOfCategory?.categoyID ?? "-1") ?? -1
        vc.subCategoryId = category.id ?? -1
        
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
}


// MARK: - APIs

extension Add_CategoryViewController {
    
    func getSubCategory() {
        view.showLoading()
        WebService.shared.CategoriesGetByTypeId(id: modelOfCategory?.categoyID ?? "") { [weak self] response, error in
            guard let self = self else { return }
            self.view.hideLoading()
            
            guard let response = response, error == nil else {
                self.showFailureAlert(title: error?.localizedDescription)
                return
            }
            self.model = response
            self.subCategoriesTableView.reloadData()
        }
    }
    
}



enum AdCategory: Int {

    case usedCars = 2
    case boats = 5
    case machinery = 6
    case parts = 7
    case exportCar = 8
    case bike = 9
    
    case jobWanted = 4
    
    case domestic = 21
    case autoService = 24
    case moversRemovals = 25
    case webComputer = 26
    case corporateServices = 27
    case homeMaintenance = 28
    case eventEntertainment = 29
    case tutorsClasses = 30
    case healthServices = 31
    case serviceOthers = 32
    
    case platNumbers = 17
    case mobileNumbers = 18
    
    case mobiles = 19
    case tablets = 33
    case mobilesTabletsAccessories = 35
    case homeElectronics = 36
    case computersNetworking = 37
    
    case business = 1001
    case classified = 1000
    
}
