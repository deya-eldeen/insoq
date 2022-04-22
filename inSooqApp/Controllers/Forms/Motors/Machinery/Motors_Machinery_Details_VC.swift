//
//  Motors_Machinery_Details_VC.swift
//  inSooqApp
//
//  Created by Deya on 15/04/2022.
//

import UIKit

class Motors_Machinery_Details_VC: FormViewController {
    
    // Data
    //var data_warranty = [ListItem]()
    var data_fuelType = [ListItem]()
    var data_cylinders = [ListItem]()
    var data_horsePower = [ListItem]()
    var data_condition = [ListItem]()
    var data_sellerType = [ListItem]()
    var data_machinery = [ListItem]()
    var data_location = [LocationModel]()
    
    // Params
    var categoryId = 0

    // Requests
    func request_fuelType() {
        ApiRequests.fuelType { response in
            self.data_fuelType = response.value ?? []
        }
    }
    func request_cylinders() {
        ApiRequests.noOfCylinders { response in
            self.data_cylinders = response.value ?? []
        }
    }
    func request_horsePower() {
        ApiRequests.horsePower(categoryId: categoryId) { response in
            self.data_horsePower = response.value ?? []
        }
    }
    func request_condition() {
        ApiRequests.conditions(categoryId: categoryId) { response in
            self.data_condition = response.value ?? []
        }
    }
    func request_sellerType() {
        ApiRequests.sellerTypes { response in
            self.data_sellerType = response.value ?? []
        }
    }
    func request_machinery() {
//        ApiRequests.noOfCylinders { response in
//            self.data_cylinders = response.value ?? []
//        }
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
        
        // Calls
//        self.request_warranty()
        self.request_fuelType()
        self.request_cylinders()
        self.request_horsePower()
        self.request_condition()
        self.request_sellerType()
        self.request_machinery()
        self.request_location()
    }
    
    override func feedStackView() {
        self.formElements = self.formElements()
        super.feedStackView()
    }
    
    @objc override func didTapPicker(picker: PickerButton) {
        
        customeListView.pickerID = picker.id
        
        switch picker.id {
        case .warranty:
            customeListView.setData(vc:self,list: self.dataWarranty)
        case .fuelType:
            customeListView.setData(vc:self,list: self.data_fuelType)
        case .cylinders:
            customeListView.setData(vc:self,list: self.data_cylinders)
        case .horsePower:
            customeListView.setData(vc:self,list: self.data_horsePower)
        case .condition:
            customeListView.setData(vc:self,list: self.data_condition)
        case .sellerType:
            customeListView.setData(vc:self,list: self.data_sellerType)
        case .machinery:
            customeListView.setData(vc:self,list: self.data_machinery)
        case .location:
            customeListView.setData(vc:self,list: self.data_location)
        default: break
        }
        
        customeListView.didSelectListItem = { (item, pickerID) in
            self.updateTextForPicker(with: pickerID, value: item)
        }
        
        self.customeListView.showListing(vc: self)
    }

}

