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
    
    func requestMakers() {
        ApiRequests.motorMakers { response in
            self.dataMakers = response.value ?? []
        }
    }
    
    func requestModels() {
        ApiRequests.motorModels(makerId: 0) { response in
            self.dataMotorModels = response.value ?? []
        }
    }
    
    func requestTrims() {
        ApiRequests.motorTrims(modelNameAr: "", modelNameEn: "") { response in
            self.dataMotorTrim = response.value ?? []
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.requestTrims()
        self.requestMakers()
        self.requestModels()
        
        let strings = ["a","b","c","d"]
        
        viewPopupListOfItems.setData(vc:self,list: strings)
        viewPopupListOfItems.onItmeClick = { (index, item) in }
        self.viewPopupListOfItems.isHidden = false
        
    }
    
    override func feedStackView() {
        
        self.forElements = self.formElements()
        
        for element in forElements {
            stackView.addArrangedSubview(element)
            if type(of: element) == FormPicker.self {
                let picker = (element as! FormPicker)
            }
        }
        
    }
    
    override func viewDidLayoutSubviews() {
        
        super.viewDidLayoutSubviews()
        scrollView.contentSize = CGSize(width: self.view.frame.width, height: stackView.frame.height)
        stackView.setNeedsLayout()

    }

}


extension FormViewController: UIScrollViewDelegate {
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if scrollView.contentOffset.x != 0 {
            scrollView.contentOffset.x = 0
        }
    }
    
}

//extension FormViewController: UIPickerViewDelegate, UIPickerViewDataSource {
//
//    func numberOfComponents(in pickerView: UIPickerView) -> Int {
//        return 1
//    }
//
//    func pickerView( _ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
//        return pickerData.count
//    }
//
//    func pickerView( _ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
//     return pickerData[row]
//    }
//
//    func pickerView( pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
//        //theTextField.text = pickerData[row]
//    }
//
//}

//
//
//extension FormViewController: UITextFieldDelegate {
//
//    func textFieldDidBeginEditing(_ textField: UITextField) {
//
//        let strings:[String] = ["A","B","C"]
//

//
//
////            if index >= self.makerModel?.count ?? 0 {
////                self.stackVOtherCarBrand.isHidden = false
////                self.carBrandTextFiled.text = item
////                return
////            }
////
////
////            if let makerModel = self.makerModel {
////                let nameEn = makerModel[safe: index]!.enText  ?? ""
////
////                self.carBrandTextFiled.text = nameEn
////                self.getCarModelByMaker(maker:  nameEn + "-" )
////            }
//        }
//
//    }
//
//    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
//        self.view.endEditing(true)
//        textField.resignFirstResponder()
//        return false
//    }
//
//}
//
//extension FormViewController: UIGestureRecognizerDelegate {
//
//}
