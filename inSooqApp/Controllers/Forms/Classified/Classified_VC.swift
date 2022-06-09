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
    var typeId = 0
    var subtypeId = 0

    // Others
    var otherSubCategory = ""
    var otherSubType = ""
    
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
        self.typeId = FormViewController.selectedTypeID
        
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
            
            print("DIDSELECT",item.id ?? 0)

            self.updateTextForPicker(with: pickerID, value: item)
            
            switch picker.id {
            case .category:
                self.subCategoryId = item.id ?? 0
                self.request_subcategories()
                
                if(item.id == 0) {
                    self.otherSubCategory = (item.en_Name ?? item.en_Text ?? "")
                }
            case .subcategory:
                self.subtypeId = item.id ?? 0
                if(item.id == 0) {
                    self.otherSubType = (item.en_Name ?? item.en_Text ?? "")
                }
            default: break
            }
            
        }
        
        self.customeListView.showListing(vc: self)
    }

    override func didTapContinue() {
        
        if ( self.isValid().0 == true ) {
            
            FormViewController.classifiedInitialSubmission = ClassifiedInitialSubmission (
                title: getFormValue(id: .title),
                categoryId: "\(self.categoryId)",
                subCategoryId: "\(self.subCategoryId)",
                otherSubCategory: self.otherSubCategory,
                subTypeId: "\(self.subtypeId)",
                otherSubType: self.otherSubType)

            print("FormViewController.classifiedInitialSubmission",FormViewController.classifiedInitialSubmission)

        }
        
        super.didTapContinue()

    }
    
}
