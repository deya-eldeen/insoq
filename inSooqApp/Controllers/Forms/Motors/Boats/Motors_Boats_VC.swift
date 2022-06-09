//
//  Motors_Boats_VC.swift
//  inSooqApp
//
//  Created by Deya on 15/04/2022.
//

import UIKit

class Motors_Boats_VC: FormViewController {
    
    // Data
    var dataSubcategories = [ListItem]()
    var dataSubtypes = [ListItem]()
    
    // Params
    var categoryId = 0
    var subCategoryId = 0
    
    // Other Params
    var otherMaker = ""
    var otherTrim = ""
    var otherPartName = ""
    var otherModel = ""
    var otherSubCategory = ""
    var otherSubType = ""
    
    // Requests
    func requestSubcategories() {
        ApiRequests.subcategories(categoryId: categoryId) { response in
            self.dataSubcategories = response.value ?? []
        }
    }
    func requestSubtypes() {
        ApiRequests.subtypes(subCategoryId: subCategoryId) { response in
            self.dataSubtypes = response.value ?? []
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.nextViewController = ViewControllersAssembly.forms.makeViewController(with: "Motors_Boats_Details_VC") 
        self.categoryId = FormViewController.selectedCat.rawValue
        
        // Calls
        self.requestSubcategories()
        self.requestSubtypes()
    }
    
    override func feedStackView() {
        self.formElements = self.formElements()
        super.feedStackView()
    }
    
    @objc override func didTapPicker(picker: PickerButton) {
        
        customeListView.pickerID = picker.id
        
        switch picker.id {
            case .boatCategory:
            customeListView.setData(vc:self,list: self.dataSubcategories, hideOther: false)
            case .boatSubcategory:
            customeListView.setData(vc:self,list: self.dataSubtypes, hideOther: false)
            default: break
        }
        
        customeListView.didSelectListItem = { (item, pickerID) in
            print("DIDSELECT",item.id ?? 0)

            self.updateTextForPicker(with: pickerID, value: item)
            
            switch picker.id {
            case .boatCategory:
                self.subCategoryId = item.id ?? 0
                self.requestSubtypes()
            default: break
            }
            
        }
        
        self.customeListView.showListing(vc: self)
    }

    override func didTapContinue() {
        
        if ( self.isValid().0 == true ) {
            
            FormViewController.motorInitialSubmission = MotorInitialSubmission(
                categoryId: "????????????",
                maker: getPickerValue(id: .carBrand),
                otherMaker: self.otherMaker,
                model: getPickerValue(id: .model),
                otherModel: self.otherModel,
                subCategoryId: "????????????",
                otherSubCategory: self.otherSubCategory,
                subTypeId: "0",
                otherSubType: self.otherSubType,
                year: self.getFormValue(id: .year),
                title: self.getFormValue(id: .title),
                trim: getPickerValue(id: .trim),
                otherTrim: self.otherTrim,
                partName: "???",
                otherPartName: self.otherPartName
            )
            
            print("FormViewController.motorInitialSubmission",FormViewController.motorInitialSubmission)

        }
        
        super.didTapContinue()

    }
}
