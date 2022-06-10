//
//  Motors_Export_Details_VC.swift
//  inSooqApp
//
//  Created by Deya on 15/04/2022.
//

import UIKit

class Motors_Export_Details_VC: FormViewController {
    
    // Data
    var data_regionalSpec = [ListItem]()
    var data_color = [ListItem]()
    var data_numberOfDoors = [ListItem]()
//    var data_warranty = [ListItem]()
    var data_transmission = [ListItem]()
    var data_bodyType = [ListItem]()
    var data_fuelType = [ListItem]()
    var data_cylinders = [ListItem]()
    var data_steeringSide = [ListItem]()
    var data_horsePower = [ListItem]()
    var data_location = [LocationModel]()

    // Params
    var categoryId = 0
    var subCategoryId = 0
    var typeId = 0
    var subtypeId = 0
    
    // Requests
    func request_regionalSpec() {
        ApiRequests.motorRegionalSpecs { response in
            self.data_regionalSpec = response.value ?? []
        }
    }
    func request_color() {
        ApiRequests.colors { response in
            self.data_color = response.value ?? []
        }
    }
    func request_numberOfDoors() {
        ApiRequests.doors { response in
            self.data_numberOfDoors = response.value ?? []
        }
    }
    func request_transmission() {
        ApiRequests.transmissions { response in
            self.data_transmission = response.value ?? []
        }
    }
    func request_bodyType() {
        ApiRequests.bodyType { response in
            self.data_bodyType = response.value ?? []
        }
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
    func request_steeringSide() {
        ApiRequests.steeringSide { response in
            self.data_steeringSide = response.value ?? []
        }
    }
    func request_horsePower(categoryId: Int) {
        ApiRequests.horsePower(categoryId: categoryId) { response in
            self.data_horsePower = response.value ?? []
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
        self.request_regionalSpec()
        self.request_color()
        self.request_numberOfDoors()
        self.request_transmission()
        self.request_bodyType()
        self.request_fuelType()
        self.request_cylinders()
        self.request_steeringSide()
        self.request_horsePower(categoryId: self.categoryId)
        self.request_location()
        
    }
    
    override func feedStackView() {
        self.formElements = self.formElements()
        super.feedStackView()
    }
    
    // Selection Logic
    @objc override func didTapPicker(picker: PickerButton) {
        
        customeListView.pickerID = picker.id
        
        switch picker.id {
            case .regional_specs:
            customeListView.setData(vc:self,list: self.data_regionalSpec)
            case .color:
            customeListView.setData(vc:self,list: self.data_color)
            case .numberOfDoors:
            customeListView.setData(vc:self,list: self.data_numberOfDoors)
            case .warranty:
            customeListView.setData(vc:self,list: self.dataWarranty)
            case .transmission:
            customeListView.setData(vc:self,list: self.data_transmission)
            case .bodyType:
            customeListView.setData(vc:self,list: self.data_bodyType)
            case .fuelType:
            customeListView.setData(vc:self,list: self.data_fuelType)
            case .cylinders:
            customeListView.setData(vc:self,list: self.data_cylinders)
            case .steeringSide:
            customeListView.setData(vc:self,list: self.data_steeringSide)
            case .horsePower:
            customeListView.setData(vc:self,list: self.data_horsePower)
            case .location:
            customeListView.setData(vc:self,list: self.data_location)
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
