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
        ApiRequests.plateCodes { response in
            self.data_plateCode = response.value ?? []
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
        
        request_emirate()
        request_plateType()
        request_plateCode()
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
            self.updateTextForPicker(with: pickerID, value: item)
            
            switch picker.id {
            case .emirate:
                self.emirate = "\(item.en_Name ?? item.en_Text ?? "")-\(item.en_Name ?? item.en_Text ?? "")"
                self.request_plateType()
            default: break
            }
            
        }
        
        self.customeListView.showListing(vc: self)
    }

}
