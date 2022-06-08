//
//  Classified_VC.swift
//  inSooqApp
//
//  Created by Deya on 15/04/2022.
//

import UIKit

class Classified_VC: FormViewController {
    
    // Data
    var dataCategory = [ListItem]()
    var dataSubcategory = [ListItem]()
    
    // Meta
    var classType = ClassTypes.none
    
    // Params
    var categoryId = 0
    var subCategoryId = 0
    
    // Requests
    func request_category() {
        ApiRequests.subcategories(categoryId: categoryId) { response in
            self.dataCategory = response.value ?? []
        }
    }
    func request_subcategories() {
        ApiRequests.subtypes(subCategoryId: subCategoryId) { response in
            self.dataSubcategory = response.value ?? []
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.nextViewController = ViewControllersAssembly.forms.makeViewController(with: "Classified_Details_VC")
        self.categoryId = FormViewController.selectedCat.rawValue
        
        request_category()
        request_subcategories()
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
            customeListView.setData(vc:self,list: self.dataCategory, hideOther: false)
            case .subcategory:
            customeListView.setData(vc:self,list: self.dataSubcategory, hideOther: false)
            default: break
        }
        
        customeListView.didSelectListItem = { (item, pickerID) in
            self.updateTextForPicker(with: pickerID, value: item)
            
            switch picker.id {
            case .category:
                self.subCategoryId = item.id ?? 0
                self.request_subcategories()
            default: break
            }
            
        }
        
        self.customeListView.showListing(vc: self)
    }

}
