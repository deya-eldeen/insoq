//
//  AddBoatsVC.swift
//  inSooqApp
//
//  Created by Alawadi on 05/03/2022.
//

import UIKit

class AddBoatsVC: UIViewController {

    @IBOutlet weak var edtOtherSubCategory: UITextField!
    @IBOutlet weak var edtOtherBrand: UITextField!
    
    
    @IBOutlet weak var mScroll: UIScrollView!
    
    @IBOutlet weak var mStack: UIStackView!
    
    @IBOutlet weak var pageTitle: UILabel!
    
    @IBOutlet weak var edtTitle: UITextField!
    
    @IBOutlet weak var btnTypeCategory: NiceButton!
    
    @IBOutlet weak var btnTypeSubCategory: NiceButton!
    
    @IBOutlet weak var edtYear: UITextField!
    
    @IBOutlet weak var btnContinue: UIButton!
    
    var makerList: [SubCategoriesModel]?
    var modelList: [SubTypesModel]?
    
    var categoryId = -1
    var subCategoryId = -1
    var otherSubCategory = ""
    var subTypeId = -1
    var otherSubType = ""
    
    
    
    var viewPopupListOfItems:ViewPopupListOfItems = .fromNib()
    override func viewDidLoad() {
        super.viewDidLoad()
        viewPopupListOfItems.frame = self.view.bounds
        viewPopupListOfItems.isHidden = true
        self.view.addSubview(viewPopupListOfItems)
        title = "Sell an Item"
        getCategory()

    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        mScroll.contentSize = CGSize(width: mStack.width, height: mStack.height + 400)
    }


    @IBAction func completeNow(_ sender: Any) {
    }
    
    @IBAction func showTypeSubCategory(_ sender: Any) {
        var strings:[String] = []
        strings.append("Choose the sub category")
        if let modelList = self.modelList {
            for makrs in modelList {
                strings.append(makrs.enName)
            }
        }
            viewPopupListOfItems.setData(vc:self,list: strings)
            viewPopupListOfItems.onItemClick = { (index, item) in
                if index == 0 {
                    self.btnTypeSubCategory.setTitle(item, for: .normal)
                    return
                }
            if index > self.modelList?.count ?? 0{
                self.edtOtherSubCategory.isHidden = false
                self.btnTypeSubCategory.setTitle(item, for: .normal)
                return
            }
            self.edtOtherSubCategory.isHidden = true

            self.viewPopupListOfItems.isHidden = true
            if let makerModel = self.modelList {
                
            self.btnTypeSubCategory.setTitle(makerModel[safe: index - 1]!.enName, for: .normal)
            }
        }
    }
    
    
    @IBAction func shotTypeCategory(_ sender: Any) {
        var strings:[String] = []
        strings.append("Choose the category")
        if let makerModel = self.makerList {
            for makrs in makerModel {
                strings.append(makrs.enName)
            }
        }
        
            viewPopupListOfItems.setData(vc:self,list: strings)
            viewPopupListOfItems.onItemClick = { (index, item) in
                if index == 0 {
                    self.btnTypeCategory.setTitle(item, for: .normal)
                    return
                }
            if index > self.makerList?.count ?? 0{
                self.edtOtherBrand.isHidden = false
                self.btnTypeCategory.setTitle(item, for: .normal)
                return
            }
            self.edtOtherBrand.isHidden = true

            self.viewPopupListOfItems.isHidden = true
            self.btnTypeSubCategory.setTitle("Choose sub category", for: .normal)
            if let makerModel = self.makerList {
                
                let idVal = makerModel[safe: index - 1]!.id

                self.btnTypeCategory.setTitle(makerModel[safe: index - 1]!.enName, for: .normal)
                self.getSubCategory(subID: idVal)
            }
        }
    }
    
    
    
    
    func getCategory() {
        self.view.showLoading()
        WebService.shared.getSubCategoriesByCatID(catID: "\(subCategoryId)") { [weak self] response, error in
            guard let self = self else { return }
            self.view.hideLoading()
//                debugPrint("\(model.categoyID) model.categoyID")
            guard let response = response, error == nil else {
                debugPrint("error:\(error?.localizedDescription)")

                self.showFailureAlert(title: error?.localizedDescription)
                return
            }
            self.makerList = response
            
        }
    }
    
    func getSubCategory(subID: Int) {
        self.view.showLoading()
        WebService.shared.getSubTypes(endPoint: EndPoint.GetSubTypeBySubCat(id: "\(subID)").path, completion: { [weak self] response, error in
            guard let self = self else { return }
            self.view.hideLoading()
//                debugPrint("\(model.categoyID) model.categoyID")
            guard let response = response, error == nil else {
                debugPrint("error:\(error?.localizedDescription)")

                self.showFailureAlert(title: error?.localizedDescription)
                return
            }
            self.modelList = response
        })
        
    }
}
