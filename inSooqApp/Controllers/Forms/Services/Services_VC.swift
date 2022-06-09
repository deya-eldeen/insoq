//
//  Services_VC.swift
//  inSooqApp
//
//  Created by Deya on 15/04/2022.
//

import UIKit

class Services_VC: FormViewController {
    
    // Data
    var dataCategory = [ListItem]()
//    var dataSubcategory = [ListItem]()
    var dataLocation = [LocationModel]()
    
    // Params
    var categoryId = 0
    var subTypeID = 0
    
    var subcategoryID = 0

    // Other Params
    var OtherSubCategory = ""
    
    // Requests
    func requestCategory() {
        ApiRequests.subcategories(categoryId: categoryId) { response in
            self.dataCategory = response.value ?? []
        }
    }
//    func requestSubcategory() {
//        ApiRequests.subtypes(subCategoryId: subCategoryId) { response in
//            self.dataSubcategory = response.value ?? []
//        }
//    }
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
        //requestSubcategory()
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
            customeListView.setData(vc:self,list: self.dataCategory, hideOther: false)
//            case .subcategory:
//            customeListView.setData(vc:self,list: self.dataSubcategory)
            case .location:
            customeListView.setData(vc:self,list: self.dataLocation)
            default: break
        }
        
        customeListView.didSelectListItem = { (item, pickerID) in
            print("DIDSELECT",item.id ?? 0)

            self.updateTextForPicker(with: pickerID, value: item)
            
            switch picker.id {
            case .category:
                self.subcategoryID = item.id ?? 0
            default:
                break
            }
            
        }
        
        self.customeListView.showListing(vc: self)
    }
    
    override func didTapContinue() {
        
        if ( self.isValid().0 == true ) {
            
            FormViewController.servicesSubmission = ServicesSubmission (
                Description: getDescriptionValue(),
                Lat: String(describing: locationLatitude ?? 0.0),
                Lng: String(describing: locationLongitude ?? 0.0),
                Location: getPickerValue(id: .location),
                Title: getFormValue(id: .title),
                SubCategoryId: "\(self.subcategoryID)",
                OtherSubCategory: self.OtherSubCategory,
                PhoneNumber: getFormValue(id: .phoneNumber),
                Id: "0",
                AdId: "0",
                CategoryId: "\(self.categoryId)"
            )
            
            print("FormViewController.servicesSubmission",FormViewController.servicesSubmission)
            
        }
        
        super.didTapContinue()

    }

}
