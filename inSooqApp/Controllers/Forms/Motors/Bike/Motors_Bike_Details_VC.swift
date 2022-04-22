//
//  Motors_Bike_Details_VC.swift
//  inSooqApp
//
//  Created by Deya on 15/04/2022.
//

import UIKit

class Motors_Bike_Details_VC: FormViewController {
    
    // Data
    var data_engineSize = [ListItem]()
    var data_color = [ListItem]()
    var data_warranty = [ListItem]()
    var data_fuelType = [ListItem]()
    var data_cylinders = [ListItem]()
    var data_wheels = [ListItem]()
    var data_usage = [ListItem]()
    var data_sellerType = [ListItem]()
    var data_finalDriveSystem = [ListItem]()
    var data_location = [LocationModel]()
    
    // Params
    var categoryId = 0

    // Requests
    func request_engineSize() {
        ApiRequests.engineSize { response in
            self.data_engineSize = response.value ?? []
        }
    }
    func request_color() {
        ApiRequests.colors { response in
            self.data_color = response.value ?? []
        }
    }
    func request_warranty() {

    }
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
    func request_wheels() {
        ApiRequests.wheels { response in
            self.data_wheels = response.value ?? []
        }
    }
    func request_usage() {
        ApiRequests.usage(categoryId: categoryId) { response in
            self.data_usage = response.value ?? []
        }
    }
    func request_sellerType() {
        ApiRequests.sellerTypes { response in
            self.data_sellerType = response.value ?? []
        }
    }
    func request_finalDriveSystem() {
        ApiRequests.driveSystem { response in
            self.data_finalDriveSystem = response.value ?? []
        }
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
        
        self.request_engineSize()
        self.request_color()
        self.request_warranty()
        self.request_fuelType()
        self.request_cylinders()
        self.request_wheels()
        self.request_usage()
        self.request_sellerType()
        self.request_finalDriveSystem()
        self.request_location()
        
    }
    
    override func feedStackView() {
        self.formElements = self.formElements()
        super.feedStackView()
    }
    
    @objc override func didTapPicker(picker: PickerButton) {
        
        customeListView.pickerID = picker.id
        
        switch picker.id {
            case .engineSize:
            customeListView.setData(vc:self,list: self.data_engineSize)
            case .color:
            customeListView.setData(vc:self,list: self.data_color)
            case .warranty:
            customeListView.setData(vc:self,list: self.dataWarranty)
            case .fuelType:
            customeListView.setData(vc:self,list: self.data_fuelType)
            case .cylinders:
            customeListView.setData(vc:self,list: self.data_cylinders)
            case .wheels:
            customeListView.setData(vc:self,list: self.data_wheels)
            case .usage:
            customeListView.setData(vc:self,list: self.data_usage)
            case .sellerType:
            customeListView.setData(vc:self,list: self.data_sellerType)
            case .finalDriveSystem:
            customeListView.setData(vc:self,list: self.data_finalDriveSystem)
            case .location:
            customeListView.setData(vc:self,list: self.data_location)
            default: break
        }
        
        customeListView.didSelectListItem = { (item, pickerID) in
            self.updateTextForPicker(with: pickerID, value: item)
            
//            switch picker.id {
//            case .carBrand:
//                self.selectedMakerID = item.id ?? 0
//                self.requestModels()
//            case .model:
//                self.selectedModelNameEn = item.en_Text ?? ""
//                self.selectedModelNameAr = item.ar_Text ?? ""
//                self.requestTrims()
//            default: break
//            }
            
        }
        
        self.customeListView.showListing(vc: self)
    }

}
