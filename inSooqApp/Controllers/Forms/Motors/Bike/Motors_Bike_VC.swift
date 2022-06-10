//
//  Motors_Bike_VC.swift
//  inSooqApp
//
//  Created by Deya on 15/04/2022.
//

import UIKit

class Motors_Bike_VC: FormViewController {
    
    // Data
    var data_category = [ListItem]()
    var data_subcategory = [ListItem]()

    // Params
    var categoryId = 0
    var subCategoryId = 0
    var typeId = 0
    var subtypeId = 0
    
    // Other Params
    var otherMaker = ""
    var otherTrim = ""
    var otherPartName = ""
    var otherModel = ""
    var otherSubCategory = ""
    var otherSubType = ""
    
    // Requests
    func requestCategories() {
        ApiRequests.subcategories(categoryId: categoryId) { response in
            self.data_category = response.value ?? []
        }
    }
    func requestSubcategories() {
        ApiRequests.subtypes(subCategoryId: subCategoryId) { response in
            self.data_subcategory = response.value ?? []
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.nextViewController = ViewControllersAssembly.forms.makeViewController(with: "Motors_Bike_Details_VC")
        self.categoryId = FormViewController.selectedCat.rawValue
        self.typeId = FormViewController.selectedTypeID
        
        print("self.categoryId",self.categoryId)
        print("self.typeId",self.typeId)
        self.requestCategories()
        self.requestSubcategories()
    }
    
    override func feedStackView() {
        self.formElements = self.formElements()
        super.feedStackView()
    }
    
    @objc override func didTapPicker(picker: PickerButton) {
        
        customeListView.pickerID = picker.id
        
        switch picker.id {
            case .bikeCategory:
            customeListView.setData(vc:self,list: self.data_category, hideOther: false)
            case .bikeSubcategory:
            customeListView.setData(vc:self,list: self.data_subcategory, hideOther: false)
            default: break
        }
        
        customeListView.didSelectListItem = { (item, pickerID) in
            print("DIDSELECT",item.id ?? 0)

            self.updateTextForPicker(with: pickerID, value: item)
            
            switch picker.id {
            case .bikeCategory:
                self.subCategoryId = item.id ?? 0
                self.requestSubcategories()
            default: break
            }
            
        }
        
        self.customeListView.showListing(vc: self)
    }

    override func didTapContinue() {
        
        if ( self.isValid().0 == true ) {
            
            FormViewController.motorInitialSubmission = MotorInitialSubmission(
                categoryId: "\(self.categoryId)",
                maker: getPickerValue(id: .carBrand),
                otherMaker: self.otherMaker,
                model: getPickerValue(id: .model),
                otherModel: self.otherModel,
                subCategoryId: "\(self.subCategoryId)",
                otherSubCategory: self.otherSubCategory,
                subTypeId: "\(self.subtypeId)",
                otherSubType: self.otherSubType,
                year: self.getFormValue(id: .year),
                title: self.getFormValue(id: .title),
                trim: getPickerValue(id: .trim),
                otherTrim: self.otherTrim,
                partName:  self.getPickerValue(id: .partName),
                otherPartName: self.otherPartName
            )
            
            print("FormViewController.motorInitialSubmission",FormViewController.motorInitialSubmission)

        }
        
        super.didTapContinue()

    }
}
