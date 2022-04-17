//
//  Classified_Details_VC.swift
//  inSooqApp
//
//  Created by Deya on 15/04/2022.
//

import UIKit

enum ClassTypes {
    case personal
    case collectables
    case pets
    case none
}

class Classified_Details_VC: FormViewController {
    
    var dataMakers = [MotorMaker]()
    var dataMotorModels = [MotorModel]()
    var dataMotorTrim = [MotorTrim]()
    
    var classType = ClassTypes.none

    override func viewDidLoad() {
        
        let cat = FormViewController.selectedCat
        
        print("cat________",cat)
        
        switch cat {
        case .classified_furnitureHomeAndGarden,.classified_homeAppliances,.classified_jewelryAndWatches,.classified_sportsEquipment,.classified_musicalInstruments,.classified_gaming,.classified_camerasAndImaging:
            
            self.classType = .personal
            
        case .classified_babyItems,.classified_toys,.classified_ticketsAndVouchers,.classified_collectibles,.classified_music,.classified_freeStuff:
            
            self.classType = .collectables
            
        case .classified_pets,.classified_petAccessories:
            
            self.classType = .pets
            
        default:
            self.classType = .none
        }
        
        self.nextViewController = ViewControllersAssembly.misc.makeViewController(with: "PricesViewController")
        
        super.viewDidLoad()

        
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
