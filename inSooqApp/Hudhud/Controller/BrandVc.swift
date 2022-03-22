//
//  BrandVc.swift
//  inSooqApp
//
//  Created by User on 18/03/2022.
//

import UIKit

class BrandVc: UIViewController {
    
    var dataList = [GetAllCareerLevelM]()
    var dataListAllEmirate = [GetAllEmirateM]()
    var dataListAllOperator = [GetAllOperatorM]()
    var dataListSubCategoy = [SubCategoryM]()
    var dataListMotorMaker = [GetAllMotorMakerM]()
    
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var bottomBar: BottomBar!
    @IBOutlet weak var brandsTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        brandsTableView.delegate=self
        brandsTableView.dataSource=self
        bottomBar.setVC(viewController: self)
        
        if Shared.shared.category == 0{
            if Shared.shared.categoryId == 2 || Shared.shared.categoryId == 8{
                self.lblTitle.text = "Maker"
                getAllMotorMaker()
            }else if Shared.shared.categoryId == 5{
                self.lblTitle.text = "Age"
                getSubCategory()
            }else if Shared.shared.categoryId == 6{
                self.lblTitle.text = "Brand"
                getSubCategory()
            }else if Shared.shared.categoryId == 7{
                self.lblTitle.text = "Part Scrub"
                getSubCategory()
            }else if Shared.shared.categoryId == 9{
                self.lblTitle.text = "Motorcycle"
                getSubCategory()
            }
        }else if Shared.shared.category == 2{
            self.lblTitle.text = "Career level"
            getAllCareerLevelApi()
        }else if Shared.shared.category == 5{
            self.lblTitle.text = "Type"
            getSubCategory()
        }else if Shared.shared.category == 6{
            if Shared.shared.categoryIndex == 0{
                self.lblTitle.text = "Emirate"
                getAllEmirateApi()
            }else{
                self.lblTitle.text = "Operator"
                GetAllOperatorApi()
            }
        }else if Shared.shared.category == 7{
            self.lblTitle.text = "Brand"
            getSubCategory()
        }
    
    }
    
    @IBAction func back_Pressed(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    func getAllCareerLevelApi() {
        ControllerService.instance.GetAllCareerLevelApi { data, message, bool in
            if bool{
                self.dataList = data
                self.brandsTableView.reloadData()
            }
        }
    }
    func getAllEmirateApi() {
        ControllerService.instance.GetAllEmirateApi { data, message, bool in
            if bool{
                self.dataListAllEmirate = data
                self.brandsTableView.reloadData()
            }
        }
    }
    func GetAllOperatorApi() {
        ControllerService.instance.GetAllOperatorApi { data, message, bool in
            if bool{
                self.dataListAllOperator = data
                self.brandsTableView.reloadData()
            }
        }
    }
    func getSubCategory() {
        ControllerService.instance.GetSubCategoryApi { subCategory, message, bool in
            if bool{
                self.dataListSubCategoy = subCategory
                self.brandsTableView.reloadData()
            }
        }
    }
    func getAllMotorMaker() {
        ControllerService.instance.GetAllMotorMakerApi { motorMaker, message, bool in
            if bool{
                self.dataListMotorMaker = motorMaker
                self.brandsTableView.reloadData()
            }
        }
    }
    
    
}

extension BrandVc: UITableViewDataSource,UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if Shared.shared.category == 0{
            if Shared.shared.categoryId == 2 || Shared.shared.categoryId == 8{
                return dataListMotorMaker.count
            }
        }else if Shared.shared.category == 2{
            return dataList.count
        }else if Shared.shared.category == 6{
            if Shared.shared.categoryIndex == 0{
                return dataListAllEmirate.count
            }else{
                return dataListAllOperator.count
            }
        }
        return dataListSubCategoy.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell=tableView.dequeueReusableCell(withIdentifier: "BrandsTableViewCell", for: indexPath) as! BrandsTableViewCell
        if Shared.shared.category == 0{
            if Shared.shared.categoryId == 2 || Shared.shared.categoryId == 8{
                cell.brand_Type.text = dataListMotorMaker[indexPath.row].en_Text as? String ?? ""
            }else{
                cell.brand_Type.text = dataListSubCategoy[indexPath.row].en_Name as? String ?? ""
            }
        }else if Shared.shared.category == 2{
            cell.brand_Type.text = dataList[indexPath.row].en_Text as? String ?? ""
        }else if Shared.shared.category == 5 || Shared.shared.category == 7{
            cell.brand_Type.text = dataListSubCategoy[indexPath.row].en_Name as? String ?? ""
        }else if Shared.shared.category == 6{
            if Shared.shared.categoryIndex == 0{
                cell.brand_Type.text = dataListAllEmirate[indexPath.row].en_Text as? String ?? ""
            }else{
                cell.brand_Type.text = dataListAllOperator[indexPath.row].en_Text as? String ?? ""
            }
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if lblTitle.text == "Operator"{
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let controller = storyboard.instantiateViewController(withIdentifier: "SubCategoriesViewController")
            controller.modalPresentationStyle = .fullScreen
            self.present(controller, animated: true, completion: nil)
        }else{
            if Shared.shared.category == 0{
                if Shared.shared.categoryId == 2 || Shared.shared.categoryId == 8{
                    Shared.shared.makerId = dataListMotorMaker[indexPath.row].id as? Int ?? 0
                    print(dataListMotorMaker[indexPath.row].id as? Int ?? 0)
                    print("\(GetAllMotorModelByMakerIdUrl)\(Shared.shared.makerId)")
                }else{
                    Shared.shared.subCategoryId = dataListSubCategoy[indexPath.row].id as? Int ?? 0
                }
            }else if Shared.shared.category == 2{
                Shared.shared.subCategoryId = dataList[indexPath.row].id as? Int ?? 0
            }else if Shared.shared.category == 5 || Shared.shared.category == 7{
                Shared.shared.subCategoryId = dataListSubCategoy[indexPath.row].id as? Int ?? 0
            }else
            if Shared.shared.category == 6{
                if Shared.shared.categoryIndex == 0{
                    Shared.shared.EmirateId = dataListAllEmirate[indexPath.row].id as? Int ?? 0
                }
            }
            let storyboard = UIStoryboard(name: "Main2", bundle: nil)
            let controller = storyboard.instantiateViewController(withIdentifier: "SubBrandVc")
            controller.modalPresentationStyle = .fullScreen
            self.present(controller, animated: true, completion: nil)
        }
    }
}
