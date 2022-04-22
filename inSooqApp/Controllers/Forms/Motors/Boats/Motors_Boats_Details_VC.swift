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
            self.updateTextForPicker(with: pickerID, value: item)
        }
        
        self.customeListView.showListing(vc: self)
    }

}
