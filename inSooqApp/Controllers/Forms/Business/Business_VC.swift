//
//  Business_VC.swift
//  inSooqApp
//
//  Created by Deya on 15/04/2022.
//

import UIKit

class Business_VC: FormViewController {
    
    // Data
    var dataCategory = [ListItem]()
    var dataSubcategory = [ListItem]()
    var dataLocation = [LocationModel]()
    
    // Params
    var categoryId = 0
    var subCategoryId = 0
    
    // Requests
    func requestCategory() {
        ApiRequests.subcategories(categoryId: categoryId) { response in
            self.dataCategory = response.value ?? []
        }
    }
    func requestSubcategory() {
        ApiRequests.subtypes(subCategoryId: subCategoryId) { response in
            self.dataSubcategory = response.value ?? []
        }
    }
    func requestLocation() {
        ApiRequests.locations { response in
            self.dataLocation = response.value ?? []
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.nextViewController = ViewControllersAssembly.misc.makeViewController(with: "PricesViewController")
        self.leadsToPrices = true
        
        self.categoryId = FormViewController.selectedCat.rawValue
        
        requestCategory()
        requestSubcategory()
        requestLocation()
        
    }
    
    override func feedStackView() {
        self.formElements = self.formElements()
        super.feedStackView()
    }
    
    // Selection Logic
    @objc override func didTapPicker(picker: PickerButton) {
        
        customeListView.pickerID = picker.id
        
        switch picker.id {
            case .category:
            customeListView.setData(vc:self,list: self.dataCategory)
            case .subcategory:
            customeListView.setData(vc:self,list: self.dataSubcategory)
            case .location:
            customeListView.setData(vc:self,list: self.dataLocation)
            default: break
        }
        
        customeListView.didSelectListItem = { (item, pickerID) in
            self.updateTextForPicker(with: pickerID, value: item)
            
            switch picker.id {
            case .category:
                self.subCategoryId = item.id ?? 0
                self.requestSubcategory()
            default: break
            }
            
        }
        
        self.customeListView.showListing(vc: self)
    }

}
