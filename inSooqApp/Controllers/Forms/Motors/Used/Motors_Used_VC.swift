//
//  UsedCars.swift
//  inSooqApp
//
//  Created by Deya on 05/04/2022.
//

import UIKit

class Motors_Used_VC: FormViewController {
    
    // Data
    var dataMakers = [MotorMaker]()
    var dataMotorModels = [MotorModel]()
    var dataMotorTrim = [MotorTrim]()
    
    // Params
    var selectedMakerID = 0
    var selectedModelNameEn = ""
    var selectedModelNameAr = ""

    // Requests
    func requestMakers() {
        ApiRequests.motorMakers { response in
            self.dataMakers = response.value ?? []
        }
    }
    func requestModels() {
        ApiRequests.motorModels(makerId: selectedMakerID) { response in
            self.dataMotorModels = response.value ?? []
        }
    }
    func requestTrims() {
        ApiRequests.motorTrims(modelNameAr: selectedModelNameAr, modelNameEn: selectedModelNameEn) { response in
            self.dataMotorTrim = response.value ?? []
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.nextViewController = ViewControllersAssembly.forms.makeViewController(with: "Motors_Used_Details_VC")
        
        // Calls
        self.requestTrims()
        self.requestMakers()
        self.requestModels()
    }
    
    override func feedStackView() {
        self.formElements = self.formElements()
        super.feedStackView()
    }
    
    @objc override func didTapPicker(picker: PickerButton) {
        
        customeListView.pickerID = picker.id
        
        switch picker.id {
            case .carBrand:
            customeListView.setData(vc:self,list: self.dataMakers)
            case .model:
            customeListView.setData(vc:self,list: self.dataMotorModels)
            case .trim:
            customeListView.setData(vc:self,list: self.dataMotorTrim)
            default: break
        }
        
        customeListView.didSelectListItem = { (item, pickerID) in
            self.updateTextForPicker(with: pickerID, value: item)
            
            switch picker.id {
            case .carBrand:
                self.selectedMakerID = item.id ?? 0
                self.requestModels()
            case .model:
                self.selectedModelNameEn = item.en_Text ?? ""
                self.selectedModelNameAr = item.ar_Text ?? ""
                self.requestTrims()
            default: break
            }
            
        }
        
        self.customeListView.showListing(vc: self)
    }

}
