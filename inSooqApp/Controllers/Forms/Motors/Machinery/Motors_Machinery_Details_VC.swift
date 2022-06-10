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
    var data_mechanical_machinery = [ListItem]()
    var data_location = [LocationModel]()
    var data_capacity = [ListItem]()
    
    // Params
    var categoryId = 0
    var subCategoryId = 0
    var typeId = 0
    var subtypeId = 0

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
    func request_mechanical_condition() {
        ApiRequests.motorMechanicalConditions { response in
            self.data_mechanical_machinery = response.value ?? []
        }
    }
    func request_capacity() {
        ApiRequests.capacities { response in
            self.data_capacity = response.value ?? []
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
        self.typeId = FormViewController.selectedTypeID
        
        print("self.categoryId",self.categoryId)
        print("self.typeId",self.typeId)
        // Calls
//        self.request_warranty()
        self.request_fuelType()
        self.request_cylinders()
        self.request_horsePower()
        self.request_condition()
        self.request_sellerType()
        self.request_mechanical_condition()
        self.request_location()
        self.request_capacity()
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
        case .mechanicalCondition:
            customeListView.setData(vc:self,list: self.data_mechanical_machinery)
        case .sellerType:
            customeListView.setData(vc:self,list: self.data_sellerType)
        case .location:
            customeListView.setData(vc:self,list: self.data_location)
        case .capacity:
            customeListView.setData(vc:self,list: self.data_capacity)
        default: break
        }
        
        customeListView.didSelectListItem = { (item, pickerID) in
            print("DIDSELECT",item.id ?? 0)
            self.updateTextForPicker(with: pickerID, value: item)
        }
        
        self.customeListView.showListing(vc: self)
    }

    override func didTapContinue() {
        
        if ( self.isValid().0 == true ) {
            
            FormViewController.motorFullSubmission = MotorFullSubmission(
                Description: getDescriptionValue(),
                Lat: String(describing: locationLatitude ?? 0.0),
                Lng: String(describing: locationLongitude ?? 0.0),
                Location: getPickerValue(id: .location),
                AdId: "0",
                CategoryId: "\(FormViewController.motorInitialSubmission?.categoryId ?? "")",
                MainPhoto: self.prepareImagesDataAndReturnMain(),
                Color: getPickerValue(id: .color),
                Kilometers: getFormValue(id: .milage),
                Doors: getPickerValue(id: .numberOfDoors),
                Warranty: getPickerValue(id: .warranty),
                Transmission: getPickerValue(id: .transmission),
                RegionalSpecs: getPickerValue(id: .regional_specs),
                BodyType: getPickerValue(id: .bodyType),
                FuelType: getPickerValue(id: .fuelType),
                NoOfCylinders: getPickerValue(id: .cylinders),
                Horsepower: getPickerValue(id: .horsePower),
                Condition: getPickerValue(id: .condition),
                SellerType: getPickerValue(id: .sellerType),
                FinalDriveSystem: getPickerValue(id: .finalDriveSystem),
                MechanicalCondition: getPickerValue(id: .mechanicalCondition),
                Price: getFormValue(id: .price),
                Capacity: getPickerValue(id: .capacity),
                EngineSize: getPickerValue(id: .engineSize),
                Age: getPickerValue(id: .age),
                Usage: getPickerValue(id: .usage),
                Length: getPickerValue(id: .length),
                Wheels: getPickerValue(id: .wheels),
                SteeringSide: getPickerValue(id: .steeringSide),
                NameOfPart: getPickerValue(id: .partName),
                PhoneNumber: getFormValue(id: .phoneNumber)
            )
            
            print("FormViewController.motorFullSubmission",FormViewController.motorFullSubmission)

        }
        
        super.didTapContinue()

    }
}

