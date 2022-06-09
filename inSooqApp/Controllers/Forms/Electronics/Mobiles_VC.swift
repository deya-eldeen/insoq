//
//  Mobiles_VC.swift
//  inSooqApp
//
//  Created by Deya on 15/04/2022.
//

import UIKit

class Mobiles_VC: FormViewController {
        
    // Data
    var data_brand = [ListItem]()
    var data_model = [ListItem]()
    var data_version = [ListItem]()
    var data_ram = [ListItem]()
    var data_storage = [ListItem]()
    var data_age = [ListItem]()
    var data_usage = [ListItem]()
    var data_color = [ListItem]()
//    var data_warranty = [ListItem]()
    var data_location = [LocationModel]()
    
    // Params
    var categoryId = 0
    var typeId = 0
    var subCategoryId = 0
    var subTypeID = 0
    
    // Other Params
    var OtherSubCategory = ""
    var OtherSubType = ""
    
    // Request
    func request_brand() {
        ApiRequests.subcategories(categoryId: categoryId) { response in
            self.data_brand = response.value ?? []
        }
    }
    func request_model() {
        ApiRequests.subtypes(subCategoryId: subCategoryId) { response in
            self.data_model = response.value ?? []
        }
    }
    func request_version() {
        ApiRequests.mobileVersions { response in
            self.data_version = response.value ?? []
        }
    }
    func request_ram() {
        ApiRequests.ram { response in
            self.data_ram = response.value ?? []
        }
    }
    func request_storage() {
        ApiRequests.storage { response in
            self.data_storage = response.value ?? []
        }
    }
    func request_age() {
        ApiRequests.age(typeId: typeId) { response in
            self.data_age = response.value ?? []
        }
    }
    func request_usage() {
        ApiRequests.usage(typeId: typeId) { response in
            self.data_usage = response.value ?? []
        }
    }
    func request_color() {
        ApiRequests.colors { response in
            self.data_color = response.value ?? []
        }
    }
    func request_warranty() {
        //
    }
    func request_location() {
        ApiRequests.locations { response in
            self.data_location = response.value ?? []
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.nextViewController = ViewControllersAssembly.misc.makeViewController(with: "PricesViewController")
        self.leadsToPrices = true
        
        self.categoryId = FormViewController.selectedCat.rawValue
        self.typeId = FormViewController.selectedTypeID
        
        print("self.categoryId",self.categoryId)
        
        request_brand()
        request_model()
        request_version()
        request_ram()
        request_storage()
        request_age()
        request_usage()
        request_color()
        request_warranty()
        request_location()
        
    }
    
    override func feedStackView() {
        self.formElements = self.formElements()
        super.feedStackView()
    }
    
    // Selection Logic
    @objc override func didTapPicker(picker: PickerButton) {
        
        customeListView.pickerID = picker.id
        
        switch picker.id {
            
            case .brand:
            customeListView.setData(vc:self,list: self.data_brand, hideOther: false)
            case .model:
            customeListView.setData(vc:self,list: self.data_model, hideOther: false)
            case .version:
            customeListView.setData(vc:self,list: self.data_version)
            case .ram:
            customeListView.setData(vc:self,list: self.data_ram)
            case .storage:
            customeListView.setData(vc:self,list: self.data_storage)
            case .age:
            customeListView.setData(vc:self,list: self.data_age)
            case .usage:
            customeListView.setData(vc:self,list: self.data_usage)
            case .color:
            customeListView.setData(vc:self,list: self.data_color)
            case .warranty:
            customeListView.setData(vc:self,list: self.dataWarranty)
            case .location:
            customeListView.setData(vc:self, list: self.data_location)
            
            default: break
        }
        
        customeListView.didSelectListItem = { (item, pickerID) in
            self.updateTextForPicker(with: pickerID, value: item)
            
            print("DIDSELECT",item.id ?? 0)
            
            switch picker.id {
            case .brand:
                self.subCategoryId = item.id ?? 0
                self.request_model()
                if(item.id == 0) {
                    self.OtherSubCategory = (item.en_Name ?? item.en_Text ?? "")
                    print("didSelectListItem_subCategoryId",self.subCategoryId)
                }
            case .model:
                self.subTypeID = item.id ?? 0
                if(item.id == 0) {
                    self.OtherSubType = (item.en_Name ?? item.en_Text ?? "")
                    print("didSelectListItem_subTypeId",self.subTypeID)
                }

            default: break
            }
            
        }
        
        self.customeListView.showListing(vc: self)
    }
    
    override func didTapContinue() {
        
        if ( self.isValid().0 == true ) {
            
            FormViewController.electronicsSubmission = ElectronicsSubmission (
                Age: getPickerValue(id: .age),
                Color: getPickerValue(id: .color),
                Description: getDescriptionValue(),
                Lat: String(describing: locationLatitude ?? 0.0),
                Lng: String(describing: locationLongitude ?? 0.0),
                Location: getPickerValue(id: .location),
                Price: getFormValue(id: .price),
                Title: getFormValue(id: .title),
                Usage: getPickerValue(id: .usage),
                Warranty: getPickerValue(id: .warranty),
                MainPhoto: self.prepareImagesDataAndReturnMain(),
                SubCategoryId: "\(self.subCategoryId)",
                OtherSubCategory: self.OtherSubCategory,
                SubTypeId: "\(self.subTypeID)",
                OtherSubType: self.OtherSubType,
                PhoneNumber: getFormValue(id: .phoneNumber),
                Version: getPickerValue(id: .version),
                Ram: getPickerValue(id: .ram),
                Storage: getPickerValue(id: .storage),
                Id: "0",
                AdId: "0",
                CategoryId: "\(self.categoryId)"
            )
            
            print("FormViewController.electronicsSubmission",FormViewController.electronicsSubmission)
            
        }
        
        super.didTapContinue()

    }

}
