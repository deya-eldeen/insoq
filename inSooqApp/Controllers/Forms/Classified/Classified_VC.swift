//
//  Classified_VC.swift
//  inSooqApp
//
//  Created by Deya on 15/04/2022.
//

import UIKit

class Classified_VC: FormViewController {
    
    var dataMakers = [MotorMaker]()
    var dataMotorModels = [MotorModel]()
    var dataMotorTrim = [MotorTrim]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.nextViewController = ViewControllersAssembly.forms.makeViewController(with: "Classified_Details_VC")
    }
    
    override func feedStackView() {
        self.formElements = self.formElements()
        super.feedStackView()
    }
    
    // Selection Logic
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
            
//            switch picker.id {
//            case .carBrand:
//            case .model:
//            default: break
//            }
            
        }
        
        self.customeListView.showListing(vc: self)
    }

}
