//
//  Mobile_Numbers_VC.swift
//  inSooqApp
//
//  Created by Deya on 15/04/2022.
//

import UIKit

class Mobile_Numbers_VC: FormViewController {
    
    // Data
    var data_operator = [ListItem]()
    var data_code = [ListItem]()
    var data_mobilePlan = [ListItem]()
    var data_locations = [LocationModel]()

    // Params
    var operatorName = ""
    var operatorID = 0
    var operatorValue = ""

    var categoryId = 0

    // Requests
    func request_operator () {
        ApiRequests.operators { response in
            self.data_operator = response.value ?? []
        }
    }
    func request_code () {
        ApiRequests.numberCodes(operatorID: operatorID) { response in
            self.data_code = response.value ?? []
        }
    }
    func request_mobilePlan () {
        ApiRequests.numberPlans { response in
            self.data_mobilePlan = response.value ?? []
        }
    }
    func request_locations () {
        ApiRequests.locations { response in
            self.data_locations = response.value ?? []
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.nextViewController = ViewControllersAssembly.misc.makeViewController(with: "PricesViewController")
        self.leadsToPrices = true
        
        self.categoryId = FormViewController.selectedCat.rawValue

        self.request_operator()
        self.request_code()
        self.request_mobilePlan()
        self.request_locations()
        
    }
    
    override func feedStackView() {
        self.formElements = self.formElements()
        super.feedStackView()
    }
    
    // Selection Logic
    @objc override func didTapPicker(picker: PickerButton) {
        
        customeListView.pickerID = picker.id
        
        switch picker.id {
            case .operator:
            customeListView.setData(vc:self,list: self.data_operator)
            case .code:
            customeListView.setData(vc:self,list: self.data_code)
            case .mobilePlan:
            customeListView.setData(vc:self,list: self.data_mobilePlan)
            case .location:
            customeListView.setData(vc:self,list: self.data_locations)
            default: break
        }
        
        customeListView.didSelectListItem = { (item, pickerID) in
            
            print("DIDSELECT____",item)

            switch picker.id {
            case .operator:
                self.operatorID = item.id ?? 0
                self.request_code()
            case .code:
                self.operatorValue = item.value ?? ""
                
            default: break
            }
            
            self.updateTextForPicker(with: pickerID, value: item)
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
                                                                     number: getFormValue(id: .simNumber),
                                                                     price: getFormValue(id: .price),
                                                                     title: getFormValue(id: .title),
                                                                     id: "0",
                                                                     adId: "0",
                                                                     categoryId: "\(self.categoryId)",
                                                                     emirate: "",
                                                                     plateType: "",
                                                                     plateCode: "",
                                                                     operator: getPickerValue(id: .operator),
                                                                     code: "\(self.operatorValue)",
                                                                     mobileNumberPlan: getPickerValue(id: .mobilePlan),
                                                                     phoneNumber: getFormValue(id: .phoneNumber)
                                                                     )

            
            print("FormViewController.numbersSubmission",FormViewController.numbersSubmission)

        }
        
        super.didTapContinue()

    }
    
}
