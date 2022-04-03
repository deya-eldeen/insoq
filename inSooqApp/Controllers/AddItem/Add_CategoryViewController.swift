//
//  SelectSubCategoryViewController.swift
//  inSooqApp
//
//  Created by mohammad ahmad on 24/02/2021.
//

import UIKit

enum MotorGategorys: Int, CaseIterable {
    
    case usedCars = 2
    case boats = 5
    case machinery = 6
    case parts = 7
    case exportCar = 8
    case bike = 9
    
    var id: Int {
        switch self {
        case .usedCars:
            return 2
        case .boats:
            return 5
        case .machinery:
            return 6
        case .parts:
            return 7
        case .exportCar:
            return 8
        case .bike:
            return 9
        }
    }
}

class Add_CategoryViewController: UIViewController {
    
    @IBOutlet weak var iconImage: UIImageView!
    @IBOutlet weak var subCategoriesTableView: UITableView!
    @IBOutlet weak var titleLable: UILabel!
    @IBOutlet weak var shadowView: UIView!
    @IBOutlet weak var bottomBar: BottomBar!
    
    var modelOfCategory: CategoriesModel?
    var model = [Category]()
    var selectedType: MotorGategorys?
    
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
        
        selectedType = MotorGategorys.allCases.first{$0.rawValue == model[indexPath.row].id} ?? .usedCars
   
        if let catID = Int(modelOfCategory?.categoyID ?? "-1"){
            switch catID {
            case 1:
                break
            case 2:
                break
            default:
                break
            }
        }
        
        switch selectedType{
        case .boats:
            goToBoats(category: model[indexPath.row])
            return
  
        default:
            break
        }
        
        let controller = Assembly.Add_TitleViewController(type: selectedType ?? .usedCars, model: model[indexPath.row])
        navigationController?.pushViewController(controller, animated: true)
        
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
