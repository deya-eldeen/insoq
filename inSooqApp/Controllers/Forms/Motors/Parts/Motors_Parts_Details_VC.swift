//
//  Motor_Parts_Details_VC.swift
//  inSooqApp
//
//  Created by Deya on 15/04/2022.
//

import UIKit

class Motors_Parts_Details_VC: FormViewController {
    
    // Data
    var dataAge = [ListItem]()
    var dataCondition = [ListItem]()
    var dataLocation = [LocationModel]()
    
    // Params
    var categoryId = 0
    var subCategoryId = 0
    var typeId = 0
    var subtypeId = 0

    // Requests
    func requestAge() {
        ApiRequests.ageByCatID(categoryId: categoryId) { response in
            self.dataAge = response.value ?? []
        }
    }
    func requestCondition() {
        ApiRequests.conditions(categoryId: categoryId) { response in
            self.dataCondition = response.value ?? []
        }
    }
    func requestLocations() {
        ApiRequests.locations { response in
            self.dataLocation = response.value ?? []
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
        self.requestAge()
        self.requestCondition()
        self.requestLocations()
    }
    
    override func feedStackView() {
        self.formElements = self.formElements()
        super.feedStackView()
    }
    
    @objc override func didTapPicker(picker: PickerButton) {
        
        customeListView.pickerID = picker.id
        
        switch picker.id {
            case .age:
            customeListView.setData(vc:self,list: self.dataAge)
            case .condition:
            customeListView.setData(vc:self,list: self.dataCondition)
            case .location:
            customeListView.setData(vc:self,list: self.dataLocation)
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
