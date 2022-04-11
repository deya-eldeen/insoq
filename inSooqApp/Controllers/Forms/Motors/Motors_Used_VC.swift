//
//  UsedCars.swift
//  inSooqApp
//
//  Created by Deya on 05/04/2022.
//

import UIKit
import Foundation
import DropDown
import PhotosUI

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
    }
    
    // Selection Logic
    @objc func didTapPicker(picker: PickerButton) {
        
        viewPopupListOfItems.pickerID = picker.id
        
        var strings = [String]()
        switch picker.id {
            case .carBrand:
            strings = self.dataMakers.compactMap { $0.en_Text }
            case .model:
            strings = self.dataMotorModels.compactMap { $0.en_Text }
            case .trim:
            strings = self.dataMotorTrim.compactMap { $0.en_Text }
            default: break
        }
        
        viewPopupListOfItems.setData(vc:self,list: strings)

        viewPopupListOfItems.didSelectListItem = { (item, pickerID) in
            self.updateTextForPicker(with: pickerID, value: item)
        }
        
        self.viewPopupListOfItems.showListing()
    }

}
