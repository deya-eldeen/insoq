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
    var emirate = ""
    var operatorName = ""

    // Requests
    func request_operator () {
        ApiRequests.operators { response in
            self.data_operator = response.value ?? []
        }
    }
    func request_code () {
        ApiRequests.numberCodes(operatorName: operatorName) { response in
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
            self.updateTextForPicker(with: pickerID, value: item)
        }
        
        self.customeListView.showListing(vc: self)
    }

}
