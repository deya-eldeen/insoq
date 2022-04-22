//
//  Mobiles_Tablets_Accessories_VC.swift
//  inSooqApp
//
//  Created by Deya on 15/04/2022.
//

import UIKit

class Mobiles_Tablets_Accessories_VC: FormViewController {
    
    // Data
    var data_brand = [ListItem]()
    var data_model = [ListItem]()
    var data_age = [ListItem]()
    var data_usage = [ListItem]()
    var data_color = [ListItem]()
//    var data_warranty = [ListItem]()
    var data_location = [LocationModel]()
    
    // Params
    var categoryId = 0
    var typeId = 0
    var subCategoryId = 0
    
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
            customeListView.setData(vc:self,list: self.data_brand)
            case .model:
            customeListView.setData(vc:self,list: self.data_model)
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
            
            switch picker.id {
            case .brand:
                self.subCategoryId = item.id ?? 0
                self.request_model()
            default: break
            }
            
        }
        
        self.customeListView.showListing(vc: self)
    }


}
