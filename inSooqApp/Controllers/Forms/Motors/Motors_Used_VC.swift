//
//  UsedCars.swift
//  inSooqApp
//
//  Created by Deya on 05/04/2022.
//

import UIKit
import Foundation

class Motors_Used_VC: FormViewController {
    
    var dataMakers = [MotorMaker]()
    var dataMotorModels = [MotorModel]()
    var dataMotorTrim = [MotorTrim]()
    
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
        
        self.requestTrims()
        self.requestMakers()
        self.requestModels()
    }
    
    // Feed Logic
    override func feedStackView() {
        self.formElements = self.formElements()
        for element in formElements {
            stackView.addArrangedSubview(element)
            if type(of: element) == FormPicker.self {
                let picker = (element as! FormPicker)
                picker.button.addTarget(self, action: #selector(self.didTapPicker(picker:)), for: .touchUpInside)
            }
            if type(of: element) == FormContinueButton.self {
                let button = (element as! FormContinueButton)
                button.addTarget(self, action: #selector(self.didTapContinue), for: .touchUpInside)
            }
        }
    }
    
    @objc func didTapContinue() {
        
        print("didTapContinue")
        
        let controller: Motors_Used_Details_VC = ViewControllersAssembly.forms.makeViewController()
        navigationController?.pushViewController(controller, animated: true)
        
        // Validation
        
        // Agree to terms
        //if(self.userAgrees == false) { self.showAlert(title: "", body: self.userShouldAgreeError); return }
            
        // See if all fields are filled
        // ...
        
        
    }
    
    // Selection Logic
    @objc func didTapPicker(picker: PickerButton) {
        
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
        }
        
        self.customeListView.showListing(vc: self)
    }

}
