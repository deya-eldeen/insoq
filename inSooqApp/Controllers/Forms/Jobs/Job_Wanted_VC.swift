//
//  File.swift
//  inSooqApp
//
//  Created by Deya on 15/04/2022.
//

import UIKit

class Job_Wanted_VC: FormViewController {
    
    // Data
    var dataTypes = [ListItem]()

    var otherJobType = ""
    
    // Requests
    func requestTypes() {
        ApiRequests.jobTypes { response in
            self.dataTypes = response.value ?? []
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.nextViewController = ViewControllersAssembly.forms.makeViewController(with: "Job_Wanted_Details_VC")
        
        // Calls
        requestTypes()
    }
    
    override func feedStackView() {
        self.formElements = self.formElements()
        super.feedStackView()
    }
    
    // Selection Logic
    @objc override func didTapPicker(picker: PickerButton) {
        
        customeListView.pickerID = picker.id
        
        switch picker.id {
            case .jobType:
            customeListView.setData(vc:self,list: self.dataTypes, hideOther: false)
            default: break
        }
        
        customeListView.didSelectListItem = { (item, pickerID) in
            
            print("DIDSELECT",item.id ?? 0)

            self.updateTextForPicker(with: pickerID, value: item)
        }
        
        self.customeListView.showListing(vc: self)
    }

    override func didTapContinue() {
        
        if ( self.isValid().0 == true ) {
                    
//        Description: getDescriptionValue(),
//        Lat: String(describing: locationLatitude ?? 0.0),
//        Lng: String(describing: locationLongitude ?? 0.0),
//        Location: getPickerValue(id: .location),
//        PhoneNumber: getFormValue(id: .phoneNumber),
//        Price: getFormValue(id: .price),
//        AdId: "0",
//        CategoryId: "??",
//        MainPhoto: self.prepareImagesDataAndReturnMain(),
//        Age: getPickerValue(id: .age),
//        Usage: getPickerValue(id: .usage),
//        Condition: getPickerValue(id: .condition),
//        Brand: getPickerValue(id: .brand)
            
            FormViewController.jobInitialSubmission = JobInitialSubmission(
                title: getFormValue(id: .title),
                jobTitle: getFormValue(id: .title),
                jobType: getPickerValue(id: .jobType),
                otherJobType: self.otherJobType,
                phoneNumber: getFormValue(id: .phoneNumber)
            )

            print("FormViewController.classifiedFullSubmission",FormViewController.classifiedInitialSubmission)

        }
        
        super.didTapContinue()

    }
    
}
