//
//  ItemsCategoryVC.swift
//  inSooqApp
//
//  Created by Alawadi on 20/02/2022.
//

import UIKit

class ItemsCategoryVC: UIViewController {

    @IBOutlet weak var mTitle: UILabel!
    @IBOutlet weak var mTable: UITableView!
    var endPoint: String = EndPoint.GetAllCareerLevel.path
    var endPointSub: String = EndPoint.GetAllEmploymentType.path
    
    var who = -1 // jobs = -1 , Calssified = 1
    var mList: [CategoriesModelsNew] = []
    var mSubCatsList: [SubCategoriesModel] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        mTable.delegate = self
        mTable.dataSource = self
        switch who{
        case -1:
            getCareerLevels()
            break
        case 1:
            getSubCats()
            break
        default:
            break
        }


    }
    
    @IBAction func backBtn(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }


    func getSubCats(){
        WebService.shared.getSubCategories(endPoint: self.endPoint) { [weak self] response, error in
            guard let self = self else { return }
//                debugPrint("\(model.categoyID) model.categoyID")
            guard let response = response, error == nil else {
                debugPrint("error:\(error?.localizedDescription)")
                self.showFailureAlert(title: error?.localizedDescription)
                return
            }
            
            self.mSubCatsList = response
            self.mTable.reloadData()
        }
    }
    func getCareerLevels(){
        WebService.shared.GetAllCareerLevel(endPoint: self.endPoint) { [weak self] response, error in
            guard let self = self else { return }
//                debugPrint("\(model.categoyID) model.categoyID")
            guard let response = response, error == nil else {
                debugPrint("error:\(error?.localizedDescription)")

                self.showFailureAlert(title: error?.localizedDescription)
                return
            }
            
            self.mList = response
            self.mTable.reloadData()
            
        }
    }
}

extension ItemsCategoryVC: UITableViewDelegate , UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch who{
        case -1:
            return mList.count
        case 1:
            return mSubCatsList.count
        default:
            return 0
        }
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell=tableView.dequeueReusableCell(withIdentifier: "BrandsTableViewCell", for: indexPath) as! BrandsTableViewCell
        
        
        switch who{
        case -1: // Jobs
            let item  = mList[indexPath.row]
            cell.brand_Type.text = item.en_Text
            break
        case 1: // classified
            let item  = mSubCatsList[indexPath.row]
            cell.brand_Type.text = item.enName
        default:
            break
        }
        
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        switch who{
        case -1:
            presentSubCategoryVC(viewController: self, endPoint: endPointSub, who: who)
            break
        case 1:
            let item  = mSubCatsList[indexPath.row]
            endPointSub = EndPoint.GetSubTypeBySubCat(id: "\(item.id)").path
            presentSubCategoryVC(viewController: self, endPoint: endPointSub , who: who)
        default:
            break
        }
    }
    
}
