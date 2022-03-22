//
//  ItemsSubCategoryVC.swift
//  inSooqApp
//
//  Created by Alawadi on 20/02/2022.
//

import UIKit

class ItemsSubCategoryVC: UIViewController {

    @IBOutlet weak var mTitle: UILabel!
    @IBOutlet weak var mTable: UITableView!
    
    var endPointSub: String = EndPoint.GetAllEmploymentType.path
    var mList: [CategoriesModelsNew] = []
    var mSubTypesList: [SubTypesModel] = []
    var who = -1
    var categoryValue = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        mTable.delegate = self
        mTable.dataSource = self
        switch who{
        case -1:
            getAllCarerLevel()
            break
        case 1:
            getSubTypes()
            break
        default:
            break
        }
        

    }
    
    @IBAction func backBtn(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    

    func getSubTypes(){
        WebService.shared.getSubTypes(endPoint: self.endPointSub) { [weak self] response, error in
            guard let self = self else { return }
//                debugPrint("\(model.categoyID) model.categoyID")
            guard let response = response, error == nil else {
                debugPrint("error:\(error?.localizedDescription)")

                self.showFailureAlert(title: error?.localizedDescription)
                return
            }
            
            self.mSubTypesList = response
            self.mTable.reloadData()
            
        }
    }
    func getAllCarerLevel(){
        WebService.shared.GetAllCareerLevel(endPoint: self.endPointSub) { [weak self] response, error in
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


extension ItemsSubCategoryVC: UITableViewDelegate , UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        switch who{
        case -1:
            return mList.count
        case 1:
            return mSubTypesList.count
        default:
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell=tableView.dequeueReusableCell(withIdentifier: "BrandsTableViewCell", for: indexPath) as! BrandsTableViewCell
        
        switch who{
        case -1:
            let item  = mList[indexPath.row]
            cell.brand_Type.text = item.en_Text
            break
        case 1:
            let item  = mSubTypesList[indexPath.row]
            cell.brand_Type.text = item.enName
            break
        default:
            break
        }
        
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        SubCategoriesViewController.isUsedCard = false
        switch who{
        case -1:
            SubCategoriesViewController.careerLevel = categoryValue
            SubCategoriesViewController.employmentType =  mList[indexPath.row].en_Text
            break
        case 1:

            break
        default:
            break
        }
        forcePresentViewController(viewController: self, storyBoardId: "SubCategoriesViewController")
    }
    
}
