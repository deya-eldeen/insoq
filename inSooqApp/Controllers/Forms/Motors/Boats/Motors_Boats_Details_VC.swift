//
//  Motors_Boats_Details_VC.swift
//  inSooqApp
//
//  Created by Deya on 16/04/2022.
//

import UIKit

class Motors_Boats_Details_VC: FormViewController {
    
    // Data
    var dataHorsePower = [ListItem]()
    var dataAge = [ListItem]()
    var dataUsage = [ListItem]()
    var dataCondition = [ListItem]()
    var dataLength = [ListItem]()
    var dataLocation = [LocationModel]()

    // Params
    var categoryId = 0
    var subCategoryId = 0
    var typeId = 0
    var subtypeId = 0

    // Requests
    func request_warranty() {
        //self.data_warranty = self.dataWarranty
    }
    func requestHorsePower() {
        ApiRequests.horsePower(categoryId: categoryId) { response in
            self.dataHorsePower = response.value ?? []
        }
    }
    func requestAge() {
        ApiRequests.ageByCatID(categoryId: categoryId) { response in
            self.dataAge = response.value ?? []
        }
    }
    func requestUsage() {
        ApiRequests.usage(categoryId: categoryId) { response in
            self.dataUsage = response.value ?? []
        }
    }
    func requestCondition() {
        ApiRequests.conditions(categoryId: categoryId) { response in
            self.dataCondition = response.value ?? []
        }
    }
    func requestLength() {
        ApiRequests.lengths(categoryId: categoryId) { response in
            self.dataLength = response.value ?? []
        }
    }
    func request_location() {
        ApiRequests.locations { response in
            self.dataLocation = response.value ?? []
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.nextViewController = ViewControllersAssembly.misc.makeViewController(with: "PricesViewController")
        self.leadsToPrices = true
        self.categoryId = FormViewController.selectedCat.rawValue
        
        self.requestHorsePower()
        self.requestAge()
        self.requestUsage()
        self.requestCondition()
        self.requestLength()
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
            case .horsePower:
            customeListView.setData(vc:self,list: self.dataHorsePower)
            case .age:
            customeListView.setData(vc:self,list: self.dataAge)
            case .usage:
            customeListView.setData(vc:self,list: self.dataUsage)
            case .condition:
            customeListView.setData(vc:self,list: self.dataCondition)
            case .length:
            customeListView.setData(vc:self,list: self.dataLength)
            case .location:
            customeListView.setData(vc: self, list: self.dataLocation)
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
