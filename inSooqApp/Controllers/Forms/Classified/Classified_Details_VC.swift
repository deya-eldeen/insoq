//
//  Classified_Details_VC.swift
//  inSooqApp
//
//  Created by Deya on 15/04/2022.
//

import UIKit

enum ClassTypes {
    case personal
    case collectables
    case pets
    case none
}

class Classified_Details_VC: FormViewController {
    
    // Data
    var dataAge = [ListItem]()
    var dataUsage = [ListItem]()
    var dataCondition = [ListItem]()
    var dataBrand = [ListItem]()
    var dataLocation = [LocationModel]()
    
    // META
    var classType = ClassTypes.none

    // Params
    var categoryId = 0
    var typeId = 0
    var subCategoryId = 0
    
    // Requests
    func requestAge() {
        ApiRequests.age(typeId: typeId) { response in
            self.dataAge = response.value ?? []
        }
    }
    func requestUsage() {
        ApiRequests.usage(typeId: typeId) { response in
            self.dataUsage = response.value ?? []
        }
    }
    func requestCondition() {
        ApiRequests.conditions(categoryId: categoryId) { response in
            self.dataCondition = response.value ?? []
        }
    }
    func requestBrand() {
//        ApiRequests.conditions(categoryId: categoryId) { response in
//            self.dataCondition = response.value ?? []
//        }
    }
    func requestLocation() {
        ApiRequests.locations { response in
            self.dataLocation = response.value ?? []
        }
    }
    
    override func viewDidLoad() {
        
        let cat = FormViewController.selectedCat
        
        print("cat________",cat)
        
        switch cat {
        case .classified_furnitureHomeAndGarden,.classified_homeAppliances,.classified_jewelryAndWatches,.classified_sportsEquipment,.classified_musicalInstruments,.classified_gaming,.classified_camerasAndImaging:
            self.classType = .personal
        case .classified_babyItems,.classified_toys,.classified_ticketsAndVouchers,.classified_collectibles,.classified_music,.classified_freeStuff:
            self.classType = .collectables
        case .classified_pets,.classified_petAccessories,.classified_books:
            self.classType = .pets
        default:
            self.classType = .none
        }
        
        self.nextViewController = ViewControllersAssembly.misc.makeViewController(with: "PricesViewController")
        self.leadsToPrices = true
        
        self.categoryId = FormViewController.selectedCat.rawValue
        self.typeId = FormViewController.selectedTypeID
        
        requestAge()
        requestUsage()
        requestCondition()
        requestBrand()
        requestLocation()
            
        super.viewDidLoad()

    }
    
    override func feedStackView() {
        self.formElements = self.formElements()
        super.feedStackView()
    }
    
    // Selection Logic
    @objc override func didTapPicker(picker: PickerButton) {
        
        customeListView.pickerID = picker.id
        
        switch picker.id {
            case .age:
            customeListView.setData(vc:self,list: self.dataAge)
            case .usage:
            customeListView.setData(vc:self,list: self.dataUsage)
            case .condition:
            customeListView.setData(vc:self,list: self.dataCondition)
            case .brand:
            customeListView.setData(vc:self,list: self.dataBrand)
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
                        
            FormViewController.classifiedFullSubmission = ClassifiedFullSubmission (
                                           Description: getDescriptionValue(),
                                           Lat: String(describing: locationLatitude ?? 0.0),
                                           Lng: String(describing: locationLongitude ?? 0.0),
                                           Location: getPickerValue(id: .location),
                                           PhoneNumber: getFormValue(id: .phoneNumber),
                                           Price: getFormValue(id: .price),
                                           AdId: "0",
                                           CategoryId: "??",
                                           MainPhoto: self.prepareImagesDataAndReturnMain(),
                                           Age: getPickerValue(id: .age),
                                           Usage: getPickerValue(id: .usage),
                                           Condition: getPickerValue(id: .condition),
                                           Brand: getPickerValue(id: .brand)
                                        )

            print("FormViewController.classifiedFullSubmission",FormViewController.classifiedInitialSubmission)

        }
        
        super.didTapContinue()

    }

}
