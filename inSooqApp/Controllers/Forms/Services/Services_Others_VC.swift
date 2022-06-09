//
//  Services_Details_VC.swift
//  inSooqApp
//
//  Created by Deya on 15/04/2022.
//

import UIKit

class Services_Others_VC: FormViewController {
    
    var dataMakers = [MotorMaker]()
    var dataMotorModels = [MotorModel]()
    var dataMotorTrim = [MotorTrim]()
    
    // Params
    var categoryId = 0
    var subCategoryId = 0
    var typeId = 0
    var subtypeId = 0

    var selectedMakerID = 0
    var selectedModelNameEn = ""
    var selectedModelNameAr = ""

    var OtherSubCategory = ""
    
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
        self.nextViewController = ViewControllersAssembly.misc.makeViewController(with: "PricesViewController")
        self.leadsToPrices = true
        
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
            print("DIDSELECT",item.id ?? 0)

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
    
    override func didTapContinue() {
        
        if ( self.isValid().0 == true ) {
            
            FormViewController.servicesSubmission = ServicesSubmission (
                Description: getDescriptionValue(),
                Lat: String(describing: locationLatitude ?? 0.0),
                Lng: String(describing: locationLongitude ?? 0.0),
                Location: getPickerValue(id: .location),
                Title: getFormValue(id: .title),
                SubCategoryId: "??????",
                OtherSubCategory: self.OtherSubCategory,
                PhoneNumber: getFormValue(id: .phoneNumber),
                Id: "0",
                AdId: "0",
                CategoryId: "\(self.selectedMakerID)"
            )
            
            print("FormViewController.servicesSubmission",FormViewController.servicesSubmission)

        }
        
        super.didTapContinue()

    }

}
