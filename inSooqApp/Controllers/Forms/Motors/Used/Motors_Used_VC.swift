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

    // Params
    var categoryId = 0
    var subCategoryId = 0
    var typeId = 0
    var subtypeId = 0
    
    // Other Params
    var otherMaker = ""
    var otherModel = ""
    var otherTrim = ""

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
        
        self.categoryId = FormViewController.selectedCat.rawValue
        self.typeId = FormViewController.selectedTypeID
        
        print("self.categoryId",self.categoryId)
        print("self.typeId",self.typeId)
        
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
            customeListView.setData(vc:self,list: self.dataMakers, hideOther: false)
            case .model:
            customeListView.setData(vc:self,list: self.dataMotorModels, hideOther: false)
            case .trim:
            customeListView.setData(vc:self,list: self.dataMotorTrim, hideOther: false)
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
            
            FormViewController.motorInitialSubmission = MotorInitialSubmission(
                categoryId: "\(self.categoryId)",
                maker: getPickerValue(id: .carBrand),
                otherMaker: self.otherMaker,
                model: getPickerValue(id: .model),
                otherModel: self.otherModel,
                subCategoryId: "\(self.subCategoryId)",
                otherSubCategory: "",//self.otherSubCategory,
                subTypeId: "\(self.subtypeId)",
                otherSubType: "",//self.otherSubType,
                year: self.getFormValue(id: .year),
                title: self.getFormValue(id: .title),
                trim: getPickerValue(id: .trim),
                otherTrim: self.otherTrim,
                partName:  self.getPickerValue(id: .partName),
                otherPartName: ""//self.otherPartName
            )
            
            print("FormViewController.motorInitialSubmission",FormViewController.motorInitialSubmission)

        }
        
        super.didTapContinue()

    }

}
