//
//  SubBrandVc.swift
//  inSooqApp
//
//  Created by Mohammad Jawher on 18/03/2022.
//

import UIKit

class SubBrandVc: UIViewController {
    
    var dataList = [GetAllEmploymentTypeM]()
    var dataListAllPlateType = [GetAllPlateTypeM]()
    var dataListSubType = [SubTypeM]()
    var dataListMotorModelByMaker = [GetAllMotorModelByMakerIdM]()
    
    
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var bottomBar: BottomBar!
    @IBOutlet weak var subBrandsTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        subBrandsTableView.delegate=self
        subBrandsTableView.dataSource=self
        bottomBar.setVC(viewController: self)
        if Shared.shared.category == 0{
            if Shared.shared.categoryId == 2 || Shared.shared.categoryId == 8{
                self.lblTitle.text = "Models"
                getAllMotorModelByMakerId()
            }else if Shared.shared.categoryId == 5{
                self.lblTitle.text = "Bike Brand"
                getSubType()
            }else if Shared.shared.categoryId == 6{
                self.lblTitle.text = "Model"
                getSubType()
            }else if Shared.shared.categoryId == 7{
                self.lblTitle.text = "Car Brand"
                getSubType()
            }else if Shared.shared.categoryId == 9{
                self.lblTitle.text = "Usage"
                getSubType()
            }
        }else if Shared.shared.category == 2{
            self.lblTitle.text = "Employment Type"
            getAllEmploymentTypeApi()
        }else if Shared.shared.category == 5{
            self.lblTitle.text = "Item"
            getSubType()
        }else if Shared.shared.category == 6{
            self.lblTitle.text = "Plate Type"
            getAllPlateTypeApi()
        }else if Shared.shared.category == 7{
            self.lblTitle.text = "Model"
            getSubType()
        }
        
    }
    
    @IBAction func back_Pressed(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    func getAllEmploymentTypeApi() {
        ControllerService.instance.GetAllEmploymentTypeApi { data, message, bool in
            if bool{
                self.dataList = data
                self.subBrandsTableView.reloadData()
            }
        }
    }
    func getAllPlateTypeApi() {
        ControllerService.instance.GetAllPlateTypeApi { data, message, bool in
            if bool{
                self.dataListAllPlateType = data
                self.subBrandsTableView.reloadData()
            }
        }
    }
    func getSubType() {
        ControllerService.instance.GetSubTypeApi { subType, message, bool in
            if bool{
                self.dataListSubType = subType
                self.subBrandsTableView.reloadData()
            }
        }
    }
    func getAllMotorModelByMakerId() {
        ControllerService.instance.GetAllMotorModelByMakerIdApi { motorModelByMakerId, message, bool in
            if bool{
                self.dataListMotorModelByMaker = motorModelByMakerId
                self.subBrandsTableView.reloadData()
            }
        }
    }
    
    
}


extension SubBrandVc: UITableViewDataSource,UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if Shared.shared.category == 0{
            if Shared.shared.categoryId == 2 || Shared.shared.categoryId == 8{
                return dataListMotorModelByMaker.count
            }
        }else if Shared.shared.category == 2{
            return dataList.count
        }else if Shared.shared.category == 6{
            return dataListAllPlateType.count
        }
        return dataListSubType.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell=tableView.dequeueReusableCell(withIdentifier: "BrandsTableViewCell", for: indexPath) as! BrandsTableViewCell
        if Shared.shared.category == 0{
            if Shared.shared.categoryId == 2 || Shared.shared.categoryId == 8{
                cell.brand_Type.text = dataListMotorModelByMaker[indexPath.row].en_Text as? String ?? ""
            }else{
                cell.brand_Type.text = dataListSubType[indexPath.row].en_Name as? String ?? ""
            }
        }else if Shared.shared.category == 2{
            cell.brand_Type.text = dataList[indexPath.row].en_Text as? String ?? ""
        }else if Shared.shared.category == 5 || Shared.shared.category == 7{
            cell.brand_Type.text = dataListSubType[indexPath.row].en_Name as? String ?? ""
        }else if Shared.shared.category == 6{
            cell.brand_Type.text = dataListAllPlateType[indexPath.row].en_Text as? String ?? ""
        }
        //        cell.brand_icon.isHidden = true
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let controller = storyboard.instantiateViewController(withIdentifier: "SubCategoriesViewController")
        controller.modalPresentationStyle = .fullScreen
        self.present(controller, animated: true, completion: nil)
    }
    
    
}
