//
//  Plate_Numbers_VC.swift
//  inSooqApp
//
//  Created by Deya on 15/04/2022.
//

import UIKit

class Plate_Numbers_VC: FormViewController {
    
    // Data
    var data_emirate = [ListItem]()
    var data_plateType = [ListItem]()
    var data_plateCode = [ListItem]()
    var data_location = [LocationModel]()
    
    // Param
    var emirate = ""
    var categoryId = 0

    // Requests
    func request_emirate() {
        ApiRequests.emirates { response in
            self.data_emirate = response.value ?? []
        }
    }
    func request_plateType() {
        ApiRequests.plateTypes(emirate: emirate) { response in
            self.data_plateType = response.value ?? []
        }
    }
    func request_plateCode() {
        
        let params = [
            "plateType": self.getPickerValue(id: .plateType)+"-",
            "emirate": self.getPickerValue(id: .emirate)+"-",
        ]
        print("params",params)
        
        let url = APIUrls.plateCodes()
        
        ApiRequests.submitGenericForm(url: url, files: [], images: [], params: params) { formResponse in
            self.data_plateCode = formResponse.value ?? []
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

        request_emirate()
        request_plateType()
        
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
            
            case .emirate:
            customeListView.setData(vc:self,list: self.data_emirate)
            case .plateType:
            customeListView.setData(vc:self,list: self.data_plateType)
            case .plateCode:
            customeListView.setData(vc:self,list: self.data_plateCode)
            case .location:
            customeListView.setData(vc:self,list: self.data_location)
            
            default: break
        }
        
        customeListView.didSelectListItem = { (item, pickerID) in
            
            print("DIDSELECT",item.id ?? 0)

            self.updateTextForPicker(with: pickerID, value: item)
            
            switch picker.id {
            case .emirate:
                self.emirate = "\(item.en_Name ?? item.en_Text ?? "")-\(item.en_Name ?? item.en_Text ?? "")"
                self.request_plateType()
            case .plateType:
                self.request_plateCode()
            default: break
            }
            
        }
        
        self.customeListView.showListing(vc: self)
    }

    override func didTapContinue() {
        
        if ( self.isValid().0 == true ) {
            
            FormViewController.numbersSubmission = NumbersSubmission(
                                                                     description: getDescriptionValue(),
                                                                     lat: String(describing: locationLatitude ?? 0.0),
                                                                     lng: String(describing: locationLongitude ?? 0.0),
                                                                     location: getPickerValue(id: .location),
                                                                     number: getFormValue(id: .plateNumber),
                                                                     price: getFormValue(id: .price),
                                                                     title: getFormValue(id: .title),
                                                                     id: "0",
                                                                     adId: "0",
                                                                     categoryId: "\(self.categoryId)",
                                                                     emirate: getPickerValue(id: .emirate),
                                                                     plateType: getPickerValue(id: .plateType),
                                                                     plateCode: getPickerValue(id: .plateCode),
                                                                     operator: "",
                                                                     code: "",
                                                                     mobileNumberPlan: "",
                                                                     phoneNumber: getFormValue(id: .phoneNumber)
                                                                     )

            print("FormViewController.numbersSubmission",FormViewController.numbersSubmission)

        }
        
        super.didTapContinue()

    }

}
