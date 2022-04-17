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

        let adType = AdCategory(rawValue: id ?? 0) ?? .none
        
        print("DID_SELECT_ID_TypeID",id,typeID)
        print("adType",adType)
        print("catName",catName)

        var targetController: UIViewController?
        
        FormViewController.selectedCat = adType
        
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
            
        case .services_domestic,.services_autoservices,.services_moversRemovals,.services_webComputer,.services_corporateServices,.services_homeMaintenance,.services_eventEntertainment,.services_tutorsClasses,.services_others,.services_healthServices:
            
            targetController = ViewControllersAssembly.forms.makeViewController(with: "Services_VC")

        case
            .business_businessesforsale,.business_tradeLicenseforsale,.business_buildingmaterialsforsale,.business_food_beverageforsale,.business_generalItemsforsale,.business_shopsrestaurantsforsale,.business_scrapmaterials:
            
            targetController = ViewControllersAssembly.forms.makeViewController(with: "Business_VC")
            
        case
            .classified_furnitureHomeAndGarden,.classified_homeAppliances,.classified_jewelryAndWatches,.classified_sportsEquipment,.classified_musicalInstruments,.classified_gaming,.classified_camerasAndImaging,.classified_babyItems,.classified_toys,.classified_ticketsAndVouchers,.classified_collectibles,.classified_music,.classified_freeStuff,.classified_pets,.classified_petAccessories:

            targetController = ViewControllersAssembly.forms.makeViewController(with: "Classified_VC")

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
        case .none, .jobOpenning:
            print("NONE")
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

    // Motors
    case usedCars = 2
    case boats = 5
    case machinery = 6
    case parts = 7
    case exportCar = 8
    case bike = 9

    // Jobs
    case jobOpenning = 3
    case jobWanted = 4
    
    // Numbers
    case platNumbers = 17
    case mobileNumbers = 18
    
    // Electronics
    case mobiles = 19
    case tablets = 33
    case mobilesTabletsAccessories = 35
    case homeElectronics = 36
    case computersNetworking = 37
    
    //ClassifiedDetails 39 40 41 42 43 44 45
    //ClassifiedDetails 46 47 48 49 51 52
    //ClassifiedDetails 53 54 55

    
    // Classified
    case classified_furnitureHomeAndGarden = 39
    case classified_homeAppliances = 40
    case classified_jewelryAndWatches = 41
    case classified_sportsEquipment = 42
    case classified_musicalInstruments = 43
    case classified_gaming = 44
    case classified_camerasAndImaging = 45
    
    case classified_babyItems = 46
    case classified_toys = 47
    case classified_ticketsAndVouchers = 48
    case classified_collectibles = 49
    case classified_music = 51
    case classified_freeStuff = 52
    
    case classified_pets = 53
    case classified_petAccessories = 54

    // Services
    case services_domestic = 21
    case services_autoservices = 24
    case services_moversRemovals = 25
    case services_webComputer = 26
    case services_corporateServices = 27
    case services_homeMaintenance = 28
    case services_eventEntertainment = 29
    case services_tutorsClasses = 30
    case services_others = 31
    case services_healthServices = 32
    
    // Business
    case business_businessesforsale = 23
    case business_tradeLicenseforsale = 56
    case business_buildingmaterialsforsale = 57
    case business_food_beverageforsale = 58
    case business_generalItemsforsale = 59
    case business_shopsrestaurantsforsale = 60
    case business_scrapmaterials = 61
    
    case none = 0
    
}
