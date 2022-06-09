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
    var typeID = 0

    // Params
    var OtherSubCategoryName = ""
    
    // Requests
    func requestCategory() {
        ApiRequests.subcategories(categoryId: categoryId) { response in
            print("requestCategory", response.value)
            self.dataCategory = response.value ?? []
        }
    }
    func requestSubcategory() {
        ApiRequests.subtypes(subCategoryId: subCategoryId) { response in
            print("requestSubcategory", response.value)
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
            customeListView.setData(vc:self,list: self.dataSubcategory, hideOther: false)
            case .location:
            customeListView.setData(vc:self,list: self.dataLocation)
            default: break
        }
        
        customeListView.didSelectListItem = { (item, pickerID) in
            
            print("DIDSELECT",item.id ?? 0)

            self.updateTextForPicker(with: pickerID, value: item)
            
            switch picker.id {
            case .category:
                self.subCategoryId = item.id ?? 0
                self.requestSubcategory()
            case .subcategory:
                self.typeID = item.id ?? 0
                if(item.id == 0) {
                    self.OtherSubCategoryName = (item.en_Name ?? item.en_Text ?? "")
                }
            default: break
            }
            
        }
        
        self.customeListView.showListing(vc: self)
    }

    override func didTapContinue() {
        
        if ( self.isValid().0 == true ) {
            
            FormViewController.businessSubmission = BusinessSubmission(
                Description: "",
                Lat: String(describing: locationLatitude ?? 0.0),
                Lng: String(describing: locationLongitude ?? 0.0),
                Location: getPickerValue(id: .location),
                Title: getFormValue(id: .title),
                MainPhoto: self.prepareImagesDataAndReturnMain(),
                SubCategoryId: "\(self.subCategoryId)",
                OtherSubCategoryName: "\(OtherSubCategoryName)",
                PhoneNumber: getFormValue(id: .phoneNumber),
                Price: getFormValue(id: .price),
                Id: "0",
                AdId: "0",
                CategoryId: "\(self.categoryId)"
            )
            
            print("FormViewController.businessSubmission",FormViewController.businessSubmission)
            
        }
        
        super.didTapContinue()

    }
    
}
