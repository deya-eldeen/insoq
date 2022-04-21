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
        self.categoryId = FormViewController.selectedCat.rawValue
        
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
            self.updateTextForPicker(with: pickerID, value: item)
        }
        
        self.customeListView.showListing(vc: self)
    }

}
